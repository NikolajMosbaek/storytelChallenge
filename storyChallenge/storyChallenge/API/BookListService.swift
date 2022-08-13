//
//  BookListService.swift
//  storyChallenge
//
//  Created by Nikolaj Simonsen on 07/08/2022.
//

import Combine
import Foundation

protocol BookListServiceDepedencies {
	func get(page: Int, completionHandler: @escaping(Books?, Error?) -> Void)
}
class BookListService {
	private let dependency: BookListServiceDepedencies
	
	init(dependency: BookListServiceDepedencies) {
		self.dependency = dependency
	}
	
	func getList(page: Int) -> AnyPublisher<Books, Error> {
		Future<Books, Error> { handler in
			self.dependency.get(page: page) { books, error in
				if let error = error {
					handler(.failure(error))
				} else if let books = books {
					handler(.success(books))
				} 
			}
		}.eraseToAnyPublisher()
	}
}

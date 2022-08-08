//
//  BookListService.swift
//  storyChallenge
//
//  Created by Nikolaj Simonsen on 07/08/2022.
//

import Combine
import Foundation

class BookListService {
	private let store = BookListStore()
	
	func getList(page: Int = 0) -> AnyPublisher<Books, Error> {
		Future<Books, Error> { handler in
			self.store.get(page: page) { books, error in
				if let error = error {
					handler(.failure(error))
				} else if let books = books {
					handler(.success(books))
				} 
			}
		}.eraseToAnyPublisher()
	}
}

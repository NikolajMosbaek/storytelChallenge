//
//  BookListStoreMock.swift
//  storyChallengeTests
//
//  Created by Nikolaj Simonsen on 13/08/2022.
//

import Foundation

class BookListStoreMock: BookListServiceDepedencies {
	var stub: Data
	init(stub: Data) {
		self.stub = stub
	}
	
	func get(page: Int, completionHandler: @escaping (Books?, Error?) -> Void) {
		if let books = try? JSONDecoder().decode(Books.self, from: self.stub) {
			completionHandler(books, nil)
		} else {
			completionHandler(nil, nil)
		}
	}
}

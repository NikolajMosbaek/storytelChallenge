//
//  Books.swift
//  storyChallenge
//
//  Created by Nikolaj Simonsen on 07/08/2022.
//

import Foundation

struct Books: Codable {
	var query: String
	var filter: String
	var nextPageToken: String
	var totalCount: Int
	var items: [Book]
	
	mutating func addData(_ books: Books) {
		self.query = books.query
		self.filter = books.filter
		self.nextPageToken = books.nextPageToken
		self.totalCount = books.totalCount
		self.items.append(contentsOf: books.items)
	}
}

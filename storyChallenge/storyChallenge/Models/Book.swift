//
//  Book.swift
//  storyChallenge
//
//  Created by Nikolaj Simonsen on 07/08/2022.
//

import Foundation

struct Book: Identifiable, Codable, Hashable {
	static func == (lhs: Book, rhs: Book) -> Bool {
		lhs.id == rhs.id
	}
		
	func hash(into hasher: inout Hasher) {
		hasher.combine(id)
	}
	
	var id: String
	var deepLink: String
	var title: String
	var bookId: Int
	var shareUrl: String
	var language: String
	var authors: [Author]
	var narrators: [Narrator]
	var formats: [Format]
	var averageRating: Float
	var seriesInfo: SeriesInfo?
	var decoratedTitle: String
	var kidsBook: Bool
	var resultType: String
}

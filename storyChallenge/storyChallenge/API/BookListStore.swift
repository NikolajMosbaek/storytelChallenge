//
//  BookListStore.swift
//  storyChallenge
//
//  Created by Nikolaj Simonsen on 07/08/2022.
//

import Foundation

class BookListStore {
	private let baseURL = URL(string: "https://api.storytel.net/search/client?query=harry&searchFor=books&store=STHP-SE")!
	
	func get(page: Int, completionHandler: @escaping(Books?, Error?) -> Void) {
		// TODO: Add page
		let task = URLSession.shared.dataTask(with: baseURL) { data, response, error in
			
			if let error = error {
				completionHandler(nil, error)
				return
			}
			
			guard let data = data else {
				return
			}

			let books = try? JSONDecoder().decode(Books.self, from: data)
			completionHandler(books, nil)
		}
		task.resume()
	}
}

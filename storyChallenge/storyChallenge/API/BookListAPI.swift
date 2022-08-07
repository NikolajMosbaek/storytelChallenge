//
//  BookListAPI.swift
//  storyChallenge
//
//  Created by Nikolaj Simonsen on 07/08/2022.
//

import Combine
import Foundation

class BookListAPI {
	private let baseURL = URL(string: "https://api.storytel.net/search/client?query=harry&searchFor=books&store=STHP-SE")!
	
	func get(page: Int = 0, completionHandler: @escaping(Books?) -> Void, errorHandler: @escaping(Error) -> Void) {
		let task = URLSession.shared.dataTask(with: baseURL) { data, response, error in
			
			if let error = error {
				errorHandler(error)
				return
			}
			
			guard let data = data else {
				return
			}

			let books = try? JSONDecoder().decode(Books.self, from: data)
			completionHandler(books)
		}
		task.resume()
	}
}

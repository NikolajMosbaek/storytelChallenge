//
//  BookListStore.swift
//  storyChallenge
//
//  Created by Nikolaj Simonsen on 07/08/2022.
///


import Foundation

class BookListStore: BookListServiceDepedencies {
	func get(page: Int, completionHandler: @escaping(Books?, Error?) -> Void) {
		let task = URLSession.shared.dataTask(with: getURL(page: String(page))) { data, response, error in
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
	
	private func getURL(page: String) -> URL {
		var components = URLComponents()
		components.scheme = "https"
		components.host = "api.storytel.net"
		components.path = "/search/client"
		components.queryItems = [
			URLQueryItem(name: "query", value: "harry"),
			URLQueryItem(name: "searchFor", value: "books"),
			URLQueryItem(name: "store", value: "STHP-SE"),
			URLQueryItem(name: "page", value: page)
		]
		
		return components.url!
	}
}

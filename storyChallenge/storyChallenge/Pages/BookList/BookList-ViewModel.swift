//
//  BookList-ViewModel.swift
//  storyChallenge
//
//  Created by Nikolaj Simonsen on 07/08/2022.
//

import Combine
import Foundation

extension BookListViewController {
	class ViewModel {
		
		var books: Books?
		let service = BookListService()
		var cancellables: Set<AnyCancellable> = []
		
		func getBooks() {
			service
				.getList()
				.sink(receiveCompletion: { _ in }, receiveValue: { books in
					self.books = books
					print("Found \(books.items.count) books")
				})
				.store(in: &self.cancellables)
		}
	}
}

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
		
		@Published private(set) var books: Books = Books(query: "", filter: "", nextPageToken: "", totalCount: 0, items: [])
		
		let service = BookListService()
		var cancellables: Set<AnyCancellable> = []
		
		private var getIsOngoing = false
		
		func getBooks() {
			guard !getIsOngoing else {
				return
			}
			
			getIsOngoing = true
			
			print("Getting page \(books.nextPageToken)")
			service
				.getList(page: Int(books.nextPageToken) ?? 0)
				.sink(receiveCompletion: { [weak self] _ in
					self?.getIsOngoing = false
				}, receiveValue: { [weak self] books in
					self?.books.addData(books)
				})
				.store(in: &self.cancellables)
		}
	}
}

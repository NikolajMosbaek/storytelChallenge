//
//  BookListViewController+DiffableDataSource.swift
//  storyChallenge
//
//  Created by Nikolaj Simonsen on 10/08/2022.
//

import Foundation
import UIKit

extension BookListViewController: UITableViewDelegate {
	enum Section: CaseIterable {
		case main
	}
	
	func makeDataSource() -> UITableViewDiffableDataSource<Section, Book> {
		self.tableView.delegate = self
		
		return UITableViewDiffableDataSource(tableView: self.tableView, cellProvider: { tableView, indexPath, book in
			let cell = tableView.dequeueReusableCell(withIdentifier: BookListCell.reuseIdentifier, for: indexPath) as! BookListCell
			cell.set(dependencies: BookListCellDependencies(
				imageURL: URL(string: book.formats.first!.cover.url)!,
				bookTitle: book.title,
				authors: book.authors.map { $0.name },
				narrators: book.narrators.map { $0.name })
			)
			
			return cell
		})
	}
	
	func update(with books: Books, animate: Bool = true) {
		var snapshot = NSDiffableDataSourceSnapshot<Section, Book>()
		snapshot.appendSections(Section.allCases)
		snapshot.appendItems(books.items, toSection: .main)
		
		dataSource.apply(snapshot, animatingDifferences: animate)
	}
	
	func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
		guard indexPath.row >= viewModel.books.items.count - 2 else {
			return
		}

		viewModel.getBooks()
	}
}

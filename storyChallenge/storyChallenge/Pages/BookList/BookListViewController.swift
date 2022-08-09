//
//  ViewController.swift
//  storyChallenge
//
//  Created by Nikolaj Simonsen on 07/08/2022.
//

import Combine
import UIKit

class BookListViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
	private let viewModel = ViewModel()

	private var cancellables: Set<AnyCancellable> = []
	
	private lazy var tableView: UITableView = {
		let tableView = UITableView()
		tableView.register(BookListCell.self, forCellReuseIdentifier: BookListCell.reuseIdentifier)
		tableView.rowHeight = 100
		tableView.tableHeaderView = BookListHeader(query: "Harry")
		tableView.tableFooterView = spinner
		tableView.translatesAutoresizingMaskIntoConstraints = false
		tableView.delegate = self
		tableView.dataSource = self
		return tableView
	}()
	private lazy var spinner: UIView = {
		let view = UIView()
		view.frame.size.height = 50
		
		let spinner = UIActivityIndicatorView(style: UIActivityIndicatorView.Style.medium)
		spinner.startAnimating()
		spinner.translatesAutoresizingMaskIntoConstraints = false
		view.addSubview(spinner)
		
		NSLayoutConstraint.activate([
			spinner.centerXAnchor.constraint(equalTo: view.centerXAnchor),
			spinner.centerYAnchor.constraint(equalTo: view.centerYAnchor)
		])
		
		return view
	}()
	
	override func viewDidLoad() {
		super.viewDidLoad()

		self.view.backgroundColor = .white
		
		viewModel.$books
			.sink { [weak self] books in
				print("Found \(books.items.count) books - Yay!!")
				DispatchQueue.main.async {
					self?.tableView.reloadData()
				}
			}
			.store(in: &cancellables)
		
		view.addSubview(tableView)
		NSLayoutConstraint.activate([
			tableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
			tableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
			tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
			tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor)
		])
		
		viewModel.getBooks()
	}
	
	func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
		let cell = tableView.dequeueReusableCell(withIdentifier: BookListCell.reuseIdentifier)! as! BookListCell
		if viewModel.books.items.indices.contains(indexPath.row) {
			let book = viewModel.books.items[indexPath.row]
			cell.set(dependencies: BookListCellDependencies(imageURL: URL(string: book.formats.first!.cover.url)!, bookTitle: book.title, authors: book.authors.map {$0.name}, narrators: book.narrators.map { $0.name }))
		}
		return cell
	}
	
	func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
		return viewModel.books.items.count
	}
	
	func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
		guard indexPath.row >= viewModel.books.items.count - 2 else {
			return
		}
		
		viewModel.getBooks()
	}
}


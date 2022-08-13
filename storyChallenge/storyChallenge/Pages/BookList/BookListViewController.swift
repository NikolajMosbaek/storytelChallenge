//
//  ViewController.swift
//  storyChallenge
//
//  Created by Nikolaj Simonsen on 07/08/2022.
//

import Combine
import UIKit

class BookListViewController: UIViewController {
	let viewModel = ViewModel()
	lazy var dataSource = makeDataSource()

	private var cancellables: Set<AnyCancellable> = []
	
	lazy var tableView: UITableView = {
		let tableView = UITableView()
		tableView.register(BookListCell.self, forCellReuseIdentifier: BookListCell.reuseIdentifier)
		tableView.rowHeight = 100
		tableView.tableHeaderView = BookListHeader(query: "Harry")
		tableView.tableFooterView = spinner
		tableView.allowsSelection = false
		tableView.translatesAutoresizingMaskIntoConstraints = false
		
		
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
				DispatchQueue.main.async {
					self?.update(with: books)
				}
			}
			.store(in: &cancellables)
		
		tableView.dataSource = dataSource
		view.addSubview(tableView)
		NSLayoutConstraint.activate([
			tableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
			tableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
			tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
			tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor)
		])
		
		viewModel.getBooks()
	}
}

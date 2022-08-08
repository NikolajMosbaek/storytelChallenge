//
//  ViewController.swift
//  storyChallenge
//
//  Created by Nikolaj Simonsen on 07/08/2022.
//

import UIKit

class BookListViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, BookListCellData {
	var imageURL: URL {
		return URL(string: "google.com")!
	}
	var bookTitle: String {
		return "Hello"
	}
	var authors: [String] {
		return ["A", "B", "C"]
	}
	var narrators: [String] {
		return ["D", "E", "F"]
	}
	

	private let viewModel = ViewModel()
	
	private lazy var tableView: UITableView = {
		let tableView = UITableView()
		tableView.register(BookListCell.self, forCellReuseIdentifier: BookListCell.reuseIdentifier)
		tableView.rowHeight = 100
		tableView.translatesAutoresizingMaskIntoConstraints = false
		tableView.delegate = self
		tableView.dataSource = self
		return tableView
	}()
	
	override func viewDidLoad() {
		super.viewDidLoad()
		
		view.addSubview(tableView)
		NSLayoutConstraint.activate([
			tableView.topAnchor.constraint(equalTo: view.topAnchor),
			tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
			tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
			tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor)
		])
		
		viewModel.getBooks()
	}
	
	func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
		let cell = tableView.dequeueReusableCell(withIdentifier: BookListCell.reuseIdentifier)! as! BookListCell
		cell.data = self
		return cell
	}
	
	func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
		return viewModel.books?.items.count ?? 0
	}
}


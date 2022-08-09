//
//  BookListHeader.swift
//  storyChallenge
//
//  Created by Nikolaj Simonsen on 09/08/2022.
//

import UIKit

class BookListHeader: UIView {

	private lazy var queryLabel: UILabel = {
		let header = UILabel()
		header.textColor = .darkText
		header.font = .systemFont(ofSize: 20)
		header.translatesAutoresizingMaskIntoConstraints = false
		return header
	}()

	init(query: String) {
		super.init(frame: .zero)
		self.backgroundColor = .lightGray
		self.frame.size.height = 200
		
		addHeader(query)
	}
	
	required init?(coder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}
	
	private func addHeader(_ query: String) {
		queryLabel.text = "Query: \(query)"
		self.addSubview(queryLabel)
		
		NSLayoutConstraint.activate([
			queryLabel.centerXAnchor.constraint(equalTo: self.centerXAnchor),
			queryLabel.centerYAnchor.constraint(equalTo: self.centerYAnchor),
			
			queryLabel.leadingAnchor.constraint(greaterThanOrEqualTo: self.leadingAnchor),
			queryLabel.trailingAnchor.constraint(lessThanOrEqualTo: self.trailingAnchor),
		])
	}
}

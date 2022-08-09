//
//  BookListCell.swift
//  storyChallenge
//
//  Created by Nikolaj Simonsen on 07/08/2022.
//

import UIKit

struct BookListCellDependencies {
	var imageURL: URL
	var bookTitle: String
	var authors: [String]
	var narrators: [String]
}

class BookListCell: UITableViewCell {
	
	static let reuseIdentifier = "BookListCell"
	
	private var dependencies: BookListCellDependencies!
	private let margine: CGFloat = 8
	private let padding: CGFloat = 4
	
	private lazy var image: UIImageView = {
		let imageView = UIImageView()
		imageView.contentMode = .scaleAspectFit
		imageView.translatesAutoresizingMaskIntoConstraints = false
		return imageView
	}()
	private lazy var titleLabel: UILabel = {
		let titleLabel = UILabel()
		titleLabel.font = .boldSystemFont(ofSize: 16)
		titleLabel.translatesAutoresizingMaskIntoConstraints = false
		return titleLabel
	}()
	private lazy var authorLable: UILabel = {
		let authorLabel = UILabel()
		authorLabel.font = .systemFont(ofSize: 14)
		authorLabel.textColor = .lightGray
		authorLabel.translatesAutoresizingMaskIntoConstraints = false
		return authorLabel
	}()
	private lazy var narratorLabel: UILabel = {
		let narratorLabel = UILabel()
		narratorLabel.font = .systemFont(ofSize: 14)
		narratorLabel.textColor = .lightGray
		narratorLabel.translatesAutoresizingMaskIntoConstraints = false
		return narratorLabel
	}()
	
	override func prepareForReuse() {
		super.prepareForReuse()
		
		self.image.image = nil
		self.titleLabel.text = ""
		self.authorLable.text = ""
		self.narratorLabel.text = ""
	}
	
	func set(dependencies: BookListCellDependencies) {
		self.dependencies = dependencies
		addImage(dependencies.imageURL)
		addTitle(dependencies.bookTitle)
		addNarrators(dependencies.narrators)
		addAuthors(dependencies.authors)
	}
	
	private func addImage(_ imageURL: URL) {
		image.loadFrom(url: imageURL)
		self.addSubview(image)

		NSLayoutConstraint.activate([
			image.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: margine),
			image.topAnchor.constraint(equalTo: self.topAnchor, constant: margine),
			image.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -margine),
			image.widthAnchor.constraint(equalTo: image.heightAnchor)
		])
	}
	
	private func addTitle(_ title: String) {
		titleLabel.text = title
		self.addSubview(titleLabel)
		
		NSLayoutConstraint.activate([
			titleLabel.leadingAnchor.constraint(equalTo: image.trailingAnchor, constant: padding),
			titleLabel.topAnchor.constraint(equalTo: image.topAnchor, constant: padding),
			titleLabel.trailingAnchor.constraint(lessThanOrEqualTo: self.trailingAnchor, constant: -margine)
		])
	}
	
	private func addNarrators(_ narrators: [String]) {
		narratorLabel.text = "with \(narrators.joined(separator: ", "))"
		self.addSubview(narratorLabel)
		
		NSLayoutConstraint.activate([
			narratorLabel.leadingAnchor.constraint(equalTo: image.trailingAnchor, constant: padding),
			narratorLabel.bottomAnchor.constraint(equalTo: image.bottomAnchor, constant: -padding),
			narratorLabel.trailingAnchor.constraint(lessThanOrEqualTo: self.trailingAnchor, constant: -margine)
		])
	}

	private func addAuthors(_ authors: [String]) {
		authorLable.text = "by \(authors.joined(separator: ", "))"
		self.addSubview(authorLable)
		
		NSLayoutConstraint.activate([
			authorLable.leadingAnchor.constraint(equalTo: image.trailingAnchor, constant: padding),
			authorLable.bottomAnchor.constraint(equalTo: narratorLabel.topAnchor, constant: -padding),
			authorLable.trailingAnchor.constraint(lessThanOrEqualTo: self.trailingAnchor, constant: -margine)
		])
	}
}

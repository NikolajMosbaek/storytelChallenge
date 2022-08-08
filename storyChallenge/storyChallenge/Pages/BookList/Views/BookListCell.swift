//
//  BookListCell.swift
//  storyChallenge
//
//  Created by Nikolaj Simonsen on 07/08/2022.
//

import UIKit

protocol BookListCellData {
	var imageURL: URL { get }
	var bookTitle: String { get }
	var authors: [String] { get }
	var narrators: [String] { get }
}

class BookListCell: UITableViewCell {
	
	static let reuseIdentifier = "BookListCell"
	
	var data: BookListCellData?
	
	private lazy var image: UIImageView? = {
		let imageView = UIImageView()
		imageView.backgroundColor = .gray
		imageView.translatesAutoresizingMaskIntoConstraints = false
		return imageView
	}()
	private lazy var titleLabel: UILabel = {
		let titleLabel = UILabel()
		titleLabel.translatesAutoresizingMaskIntoConstraints = false
		return titleLabel
	}()
	private lazy var authorLable: UILabel = {
		let authorLabel = UILabel()
		authorLabel.translatesAutoresizingMaskIntoConstraints = false
		return authorLabel
	}()
	private lazy var narratorLabel: UILabel = {
		let narratorLabel = UILabel()
		narratorLabel.translatesAutoresizingMaskIntoConstraints = false
		return narratorLabel
	}()
	
	override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
		super.init(style: style, reuseIdentifier: reuseIdentifier)
		
		addImage(URL(string: "google.com")!)
	}
	
	required init?(coder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}
	
	override func prepareForReuse() {
		super.prepareForReuse()
		
		addImage(URL(string: "google.com")!)
	}
	
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
	
	func addImage(_ imageURL: URL) {
		guard let image = image else {
			return
		}
		
		self.addSubview(image)

		let padding: CGFloat = 8
		NSLayoutConstraint.activate([
			image.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: padding),
			image.topAnchor.constraint(equalTo: self.topAnchor, constant: padding),
			image.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -padding),
			image.widthAnchor.constraint(equalTo: image.heightAnchor)
		])
	}

}

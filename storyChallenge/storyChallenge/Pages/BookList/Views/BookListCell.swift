//
//  BookListCell.swift
//  storyChallenge
//
//  Created by Nikolaj Simonsen on 07/08/2022.
//

import UIKit

class BookListCell: UITableViewCell {
	
	private lazy var image: UIImageView? = {
		return UIImageView()
	}()
	private lazy var titleLabel: UILabel = {
		return UILabel()
	}()
	private lazy var authorLable: UILabel = {
		return UILabel()
	}()

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}

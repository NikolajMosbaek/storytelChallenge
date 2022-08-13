//
//  LoadableImageView.swift
//  storyChallenge
//
//  Created by Nikolaj Simonsen on 13/08/2022.
//

import UIKit

class LoadableImageView: UIImageView {
	private var url: URL?
	private let imageService = ImageService()
	
	func setImage(url: URL) {
		self.url = url
		
		imageService.loadFrom(url: url) { image, loadURL in
			if loadURL == self.url {
				self.image = image
			}
		}
	}
}

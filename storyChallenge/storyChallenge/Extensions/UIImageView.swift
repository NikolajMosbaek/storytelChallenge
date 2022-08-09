//
//  UIImageView.swift
//  storyChallenge
//
//  Created by Nikolaj Simonsen on 09/08/2022.
//

import Foundation
import UIKit

extension UIImageView {
	func loadFrom(url: URL) {
		DispatchQueue.main.async { [weak self] in
			if let imageData = try? Data(contentsOf: url) {
				if let loadedImage = UIImage(data: imageData) {
					self?.image = loadedImage
				}
			}
		}
	}
}

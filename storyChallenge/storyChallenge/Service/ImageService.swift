//
//  ImageService.swift
//  storyChallenge
//
//  Created by Nikolaj Simonsen on 09/08/2022.
//

import Foundation
import UIKit

class ImageService {
	func loadFrom(url: URL, onCompletion: @escaping (UIImage?, URL) -> Void) {
		DispatchQueue.global(qos: .userInteractive).async {
			if let imageData = try? Data(contentsOf: url) {
				if let loadedImage = UIImage(data: imageData) {
					DispatchQueue.main.async {
						onCompletion(loadedImage, url)
					}
				}
			}
		}
	}
}

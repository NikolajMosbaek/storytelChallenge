//
//  Format.swift
//  storyChallenge
//
//  Created by Nikolaj Simonsen on 07/08/2022.
//

import Foundation

struct Format: Identifiable, Codable {
	var id: String
	var type: String
	var releaseDate: String
	var cover: Cover
	var released: Bool
	var lockedContent: Bool
	var isReleased: Bool
	var isLockedContent: Bool
}

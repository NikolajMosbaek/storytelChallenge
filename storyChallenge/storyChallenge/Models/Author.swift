//
//  Author.swift
//  storyChallenge
//
//  Created by Nikolaj Simonsen on 07/08/2022.
//

import Foundation

struct Author: Identifiable, Codable {
	var id: String
	var name: String
	var deepLink: String
}

//
//  SeriesInfo.swift
//  storyChallenge
//
//  Created by Nikolaj Simonsen on 07/08/2022.
//

import Foundation

struct SeriesInfo: Identifiable, Codable {
	var id: String
	var name: String
	var orderInSeries: Int
	var deepLink: String
}

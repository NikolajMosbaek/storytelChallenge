//
//  XCTestCase+Helpers.swift
//  storyChallengeTests
//
//  Created by Nikolaj Simonsen on 13/08/2022.
//

import Foundation
import XCTest

extension XCTestCase {
	func loadStub(name: String, fileExtension: String) -> Data {
		let bundle = Bundle(for: type(of: self))
		let url = bundle.url(forResource: name, withExtension: fileExtension)
		return try! Data(contentsOf: url!)
	}
}


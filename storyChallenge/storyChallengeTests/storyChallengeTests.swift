//
//  storyChallengeTests.swift
//  storyChallengeTests
//
//  Created by Nikolaj Simonsen on 07/08/2022.
//

import Combine
import XCTest
@testable import storyChallenge

class storyChallengeTests: XCTestCase {
	private var cancellables: Set<AnyCancellable> = []

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
	
	
	func testBookListVM() throws {
		let service = BookListService()
		service
			.getList(page: 0)
			.sink { completion in
				switch completion {
				case .failure(let error):
					break
					
				case .finished:
					break
				}
			} receiveValue: { books in
				
			}
			.store(in: &cancellables)

	}

}

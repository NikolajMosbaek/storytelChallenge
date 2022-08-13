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
 
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
	
	
	
	func testBookListService() {
		let expectation = self.expectation(description: "Did receive books")
		let service = BookListService(dependency: BookListStoreMock(stub: self.loadStub(name: "booklist", fileExtension: "json")))
		service
			.getList(page: 0)
			.sink(receiveCompletion: { _ in
				
			}, receiveValue: { books in
				expectation.fulfill()
			})
			.store(in: &self.cancellables)
		
		waitForExpectations(timeout: 10)
	}

}

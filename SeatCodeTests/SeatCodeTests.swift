//
//  SeatCodeTests.swift
//  SeatCodeTests
//
//  Created by Diego on 26/5/22.
//

import XCTest
@testable import SeatCode

class SeatCodeTests: XCTestCase {

    let mock = CharactersVM()

    ///We test that favorites are being saved and unsaved..
    ///Tests all saving functionality
    func testSaving() throws {
        let isSaved = mock.saved(id: 10)
        mock.toggleSave(id: 10)
        XCTAssertNotEqual(isSaved, mock.saved(id: 10))
        mock.toggleSave(id: 10)
        XCTAssertEqual(isSaved, mock.saved(id: 10))
    }

}

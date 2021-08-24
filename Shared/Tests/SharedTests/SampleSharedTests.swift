//
// This source file is part of the Apodini Example open source project
//
// SPDX-FileCopyrightText: 2018-2021 Paul Schmiedmayer and project authors (see CONTRIBUTORS.md) <paul.schmiedmayer@tum.de>
//
// SPDX-License-Identifier: MIT
//

import XCTest
@testable import Shared


final class SharedTests: XCTestCase {
    func testContact() {
        let emma = Contact(name: "Emma Stone", birthday: Date(timeIntervalSince1970: 594777600))
        
        XCTAssertEqual(emma.name, "Emma Stone")
        XCTAssertEqual(emma.birthday, Date(timeIntervalSince1970: 594777600))
    }
}

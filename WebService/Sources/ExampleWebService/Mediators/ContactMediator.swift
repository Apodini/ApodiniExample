//
// This source file is part of the Apodini Example open source project
//
// SPDX-FileCopyrightText: 2018-2021 Paul Schmiedmayer and project authors (see CONTRIBUTORS.md) <paul.schmiedmayer@tum.de>
//
// SPDX-License-Identifier: MIT
//

import Apodini
import Foundation
import Shared

struct ContactMediator: Decodable, Content {
    var name: String?
    var birthday: Date?

    func update(to contact: Contact) {
        name.map {
            contact.name = $0
        }
        birthday.map {
            contact.birthday = $0
        }
    }
}

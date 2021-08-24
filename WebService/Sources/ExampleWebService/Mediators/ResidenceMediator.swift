//
// This source file is part of the Apodini Example open source project
//
// SPDX-FileCopyrightText: 2018-2021 Paul Schmiedmayer and project authors (see CONTRIBUTORS.md) <paul.schmiedmayer@tum.de>
//
// SPDX-License-Identifier: MIT
//

import Apodini
import Shared

struct ResidenceMediator: Decodable, Content {
    var address: String?
    var postalCode: String?
    var country: String?

    func update(to residence: Residence) {
        address.map {
            residence.address = $0
        }
        postalCode.map {
            residence.postalCode = $0
        }
        country.map {
            residence.country = $0
        }
    }
}

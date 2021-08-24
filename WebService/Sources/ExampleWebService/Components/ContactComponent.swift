//
// This source file is part of the Apodini Example open source project
//
// SPDX-FileCopyrightText: 2018-2021 Paul Schmiedmayer and project authors (see CONTRIBUTORS.md) <paul.schmiedmayer@tum.de>
//
// SPDX-License-Identifier: MIT
//

import Apodini
import Shared

struct ContactComponent: Component {
    @PathParameter
    var contactId: Contact.IDValue

    var content: some Component {
        Group("contacts") {
            CreateContact()
                .operation(.create)

            GetContacts()

            Group($contactId) {
                GetContact(contactId: $contactId)

                UpdateContact(contactId: $contactId)
                    .operation(.update)

                DeleteContact(contactId: $contactId)
                    .operation(.delete)
            }
        }
    }
}

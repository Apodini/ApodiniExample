//
// This source file is part of the Apodini Example open source project
//
// SPDX-FileCopyrightText: 2018-2021 Paul Schmiedmayer and project authors (see CONTRIBUTORS.md) <paul.schmiedmayer@tum.de>
//
// SPDX-License-Identifier: MIT
//

import Apodini
import FluentKit
import Shared

struct GetContact: Handler {
    @Environment(\.databaseModel)
    var databaseModel: DatabaseModel

    @Binding
    var contactId: Contact.IDValue

    @Throws(.notFound, reason: "The contact could not be found")
    var notFound: ApodiniError

    func handle() throws -> EventLoopFuture<Contact> {
        databaseModel
            .readContact(contactId)
            .unwrap(orError: notFound)
    }
}

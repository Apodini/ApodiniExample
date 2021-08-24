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

struct DeleteContact: Handler {
    @Environment(\.databaseModel)
    var databaseModel: DatabaseModel

    @Binding
    var contactId: Contact.IDValue

    @Throws(.notFound, reason: "The specified contact could not be found")
    var notFound: ApodiniError

    func handle() throws -> EventLoopFuture<Status> {
        databaseModel
            .deleteContact(contactId)
            .flatMapErrorThrowing { _ in
                throw notFound
            }
            .transform(to: .ok)
    }
}

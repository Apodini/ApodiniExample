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

struct GetResidence: Handler {
    @Environment(\.databaseModel)
    var databaseModel: DatabaseModel

    @Binding
    var residenceId: Residence.IDValue

    @Throws(.notFound, reason: "The residence could not be found")
    var notFound: ApodiniError

    func handle() throws -> EventLoopFuture<Residence> {
        databaseModel
            .readResidence(residenceId)
            .unwrap(orError: notFound)
    }
}

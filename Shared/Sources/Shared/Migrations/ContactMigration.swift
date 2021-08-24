//
// This source file is part of the Apodini Example open source project
//
// SPDX-FileCopyrightText: 2018-2021 Paul Schmiedmayer and project authors (see CONTRIBUTORS.md) <paul.schmiedmayer@tum.de>
//
// SPDX-License-Identifier: MIT
//

import FluentKit


public struct ContactMigration: Migration {
    public init() {}
    
    
    public func prepare(on database: Database) -> EventLoopFuture<Void> {
        database.schema(Contact.schema)
            .id()
            .field("createdAt", .datetime, .required)
            .field("name", .string, .required)
            .field("birthday", .date, .required)
            .create()
    }
    
    public func revert(on database: Database) -> EventLoopFuture<Void> {
        database.schema(Contact.schema).delete()
    }
}

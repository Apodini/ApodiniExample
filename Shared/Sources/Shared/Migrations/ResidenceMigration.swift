//
// This source file is part of the Apodini Example open source project
//
// SPDX-FileCopyrightText: 2018-2021 Paul Schmiedmayer and project authors (see CONTRIBUTORS.md) <paul.schmiedmayer@tum.de>
//
// SPDX-License-Identifier: MIT
//

import FluentKit

public struct ResidenceMigration: Migration {
    public init() {}
    
    
    public func prepare(on database: Database) -> EventLoopFuture<Void> {
        database.schema(Residence.schema)
            .id()
            .field("createdAt", .datetime, .required)
            .field("address", .string, .required)
            .field("postalCode", .string, .required)
            .field("country", .string, .required)
            .field("contact_id", .uuid)
            .foreignKey("contact_id", references: Contact.schema, .id, onDelete: .cascade)
            .create()
    }
    
    public func revert(on database: Database) -> EventLoopFuture<Void> {
        database.schema(Residence.schema).delete()
    }
}

//
// This source file is part of the Apodini Example open source project
//
// SPDX-FileCopyrightText: 2018-2021 Paul Schmiedmayer and project authors (see CONTRIBUTORS.md) <paul.schmiedmayer@tum.de>
//
// SPDX-License-Identifier: MIT
//

import FluentKit
import Foundation


// MARK: Residence
public final class Residence: Model {
    public static let schema = "residencies"
    
    
    @ID
    public var id: UUID?
    
    @Timestamp(key: "createdAt", on: .create)
    public var createdAt: Date?
    
    @Field(key: "address")
    public var address: String
    
    @Field(key: "postalCode")
    public var postalCode: String
    
    @Field(key: "country")
    public var country: String
    
    @Parent(key: "contact_id")
    public var contact: Contact
    
    
    public init() { }
    
    public init(id: UUID? = nil, address: String, postalCode: String, country: String, contact: Contact.IDValue) {
        self.id = id
        self.address = address
        self.postalCode = postalCode
        self.country = country
        self.$contact.id = contact
    }
}

// MARK: Residence: Equatable
extension Residence: Equatable {
    public static func == (lhs: Residence, rhs: Residence) -> Bool {
        lhs.id == rhs.id
    }
}


// MARK: Residence: Comparable
extension Residence: Comparable {
    public static func < (lhs: Residence, rhs: Residence) -> Bool {
        lhs.country < rhs.country
    }
}

// MARK: Residence: Hashable
extension Residence: Hashable {
    public func hash(into hasher: inout Hasher) {
        hasher.combine(id)
    }
}

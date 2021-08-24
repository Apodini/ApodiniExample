//
// This source file is part of the Apodini Example open source project
//
// SPDX-FileCopyrightText: 2018-2021 Paul Schmiedmayer and project authors (see CONTRIBUTORS.md) <paul.schmiedmayer@tum.de>
//
// SPDX-License-Identifier: MIT
//

import Combine
import Foundation
import Model

class EditResidenceViewModel: ObservableObject {
    @Published var address: String = ""
    
    @Published var postalCode: String = ""
    
    @Published var country: String = ""
    
    @Published var loaded = false
    
    var contact: Contact
    
    var id: Residence.IDValue?
    
    private weak var model: Model?
    
    init(_ model: Model, contact: Contact, id: Residence.IDValue?) {
        self.model = model
        self.contact = contact
        self.id = id
    }
    
    func updateStates() {
        guard let id = id, let residence = model?.residence(id), !loaded else {
            return
        }
        
        self.address = residence.address
        self.postalCode = residence.postalCode
        self.country = residence.country
        
        self.loaded = true
    }
    
    func save() -> AnyPublisher<Void, Error> {
        guard let contactID = contact.id, let model = model else {
            return Fail(error: ServiceError.saveFailed(Residence.self)).eraseToAnyPublisher()
        }
        
        let residence = Residence(
            id: self.id,
            address: self.address,
            postalCode: self.postalCode,
            country: self.country,
            contact: contactID
        )
        
        return model.save(residence)
            .map {
                self.updateStates()
            }
            .eraseToAnyPublisher()
    }
}

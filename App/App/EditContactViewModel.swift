//
// This source file is part of the Apodini Example open source project
//
// SPDX-FileCopyrightText: 2018-2021 Paul Schmiedmayer and project authors (see CONTRIBUTORS.md) <paul.schmiedmayer@tum.de>
//
// SPDX-License-Identifier: MIT
//

import Foundation
import Model
import Combine

class EditContactViewModel: ObservableObject {
    @Published var name: String = ""
    
    @Published var birthday = Date()
    
    @Published var showDeleteAlert = false
    
    @Published var loaded = false
    
    var id: Contact.IDValue?
    
    private weak var model: Model?
    
    init(_ model: Model, id: Contact.IDValue?) {
        self.model = model
        self.id = id
    }
    
    func updateStates() {
        guard let id = id, let contact = model?.contact(id), !loaded else {
            return
        }
        
        self.name = contact.name
        self.birthday = contact.birthday
        
        self.loaded = true
    }
    
    func save() -> AnyPublisher<Void, Error> {
        guard let model = model else {
            return Fail(error: ServiceError.saveFailed(Contact.self)).eraseToAnyPublisher()
        }
        
        let contact = Contact(id: self.id, name: self.name, birthday: self.birthday)
        
        return model.save(contact)
            .map {
                self.updateStates()
            }
            .eraseToAnyPublisher()
    }
    
    func delete() -> AnyPublisher<Void, Error> {
        guard let model = model, let id = id else {
            return Fail(error: ServiceError.deleteFailed(Contact.self)).eraseToAnyPublisher()
        }
        
        return model.delete(contact: id)
            .map {
                self.updateStates()
            }
            .eraseToAnyPublisher()
    }
}

//
// This source file is part of the Apodini Example open source project
//
// SPDX-FileCopyrightText: 2018-2021 Paul Schmiedmayer and project authors (see CONTRIBUTORS.md) <paul.schmiedmayer@tum.de>
//
// SPDX-License-Identifier: MIT
//

import Model
import SwiftUI

struct ContentView: View {
    @EnvironmentObject private var model: Model
    
    @State private var presentAddContact = false
    
    var body: some View {
        NavigationView {
            ScrollView {
                LazyVGrid(columns: [GridItem(.adaptive(minimum: 140), spacing: 10)]) {
                    ForEach(model.contacts) { contact in
                        if let contactId = contact.id {
                            NavigationLink(destination: ContactDetailsView(id: contactId)) {
                                ContactCell(id: contactId).padding()
                            }
                        }
                    }
                }
            }
            .navigationBarTitle("Your Contacts")
            .toolbar {
                ToolbarItem(placement: .primaryAction) {
                    Button(action: { self.presentAddContact.toggle() }) {
                        Image(systemName: "plus")
                    }
                }
            }
            .sheet(isPresented: $presentAddContact) {
                EditContact(self.model, id: nil)
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    private static let model: Model = MockModel()
    
    static var previews: some View {
        ForEach(ColorScheme.allCases, id: \.self) { colorScheme in
            ContentView().colorScheme(colorScheme)
        }.environmentObject(model)
    }
}

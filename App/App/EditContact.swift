//
// This source file is part of the Apodini Example open source project
//
// SPDX-FileCopyrightText: 2018-2021 Paul Schmiedmayer and project authors (see CONTRIBUTORS.md) <paul.schmiedmayer@tum.de>
//
// SPDX-License-Identifier: MIT
//

import Combine
import Model
import SwiftUI


struct EditContact: View {
    @Environment(\.presentationMode) private var presentationMode
    
    @ObservedObject private var viewModel: EditContactViewModel
    
    @State private var loadingCancellable: AnyCancellable?
    
    
    var navigationTitle: String {
        viewModel.id == nil ? "Create New Contact" : "Edit Contact"
    }
    
    var body: some View {
        NavigationView {
            self.form
                .onAppear(perform: viewModel.updateStates)
                .navigationBarTitle(navigationTitle, displayMode: .inline)
                .toolbar {
                    ToolbarItem(placement: .primaryAction) {
                        Button(action: {
                            self.save()
                            self.presentationMode.wrappedValue.dismiss()
                        }) {
                            Text("Save")
                                .bold()
                        }
                    }
                }
        }
    }
    
    private var form: some View {
        Form {
            Section(header: Text("Name")) {
                TextField("Name", text: $viewModel.name)
            }
            
            Section(header: Text("Birthday")) {
                DatePicker(
                    "Birthday",
                    selection: $viewModel.birthday,
                    in: ...Date(),
                    displayedComponents: [.date]
                )
            }
            
            if viewModel.id != nil {
                Button(action: {
                    self.delete()
                    self.presentationMode.wrappedValue.dismiss()
                }) {
                    HStack {
                        Spacer()
                        Text("Delete")
                            .foregroundColor(.red)
                            .bold()
                        Spacer()
                    }
                }
            }
        }
    }
    
    
    init(_ model: Model, id: Contact.ID) {
        viewModel = EditContactViewModel(model, id: id)
    }
    
    
    private func save() {
        loadingCancellable = viewModel.save().sink { _ in }
    }
    
    private func delete() {
        loadingCancellable = viewModel.delete().sink { _ in }
    }
}

struct EditContact_Previews: PreviewProvider {
    private static let model: Model = MockModel()
    
    static var previews: some View {
        EditContact(model, id: model.contacts[0].id)
            .environmentObject(model)
    }
}

//
// This source file is part of the Apodini Example open source project
//
// SPDX-FileCopyrightText: 2018-2021 Paul Schmiedmayer and project authors (see CONTRIBUTORS.md) <paul.schmiedmayer@tum.de>
//
// SPDX-License-Identifier: MIT
//

import SwiftUI
import Model

struct ResidenceCell: View {
    @EnvironmentObject private var model: Model
    
    var id: Residence.IDValue
    
    var body: some View {
        model.residence(id).map { residence in
            ZStack(alignment: .top) {
                RoundedRectangle(cornerRadius: 20)
                    .foregroundColor(Color(uiColor: .systemGray6))
                    .shadow(radius: 5)
                HStack(spacing: 10) {
                    Image(systemName: "house.fill")
                        .font(.system(size: 30))
                        .foregroundColor(.pink)
                    VStack(alignment: .leading, spacing: 5) {
                        Text(residence.country)
                            .bold()
                            .multilineTextAlignment(.leading)
                            .font(.system(.headline, design: .rounded))
                        Text(residence.address)
                            .multilineTextAlignment(.leading)
                            .font(.system(.subheadline, design: .rounded))
                    }
                    Spacer()
                    Text(residence.postalCode)
                        .font(.system(size: 20, weight: .heavy, design: .serif))
                }.padding()
            }
        }
    }
}

struct ResidenceCell_Previews: PreviewProvider {
    private static let model: Model = MockModel()
    
    private static var contactsID: UUID {
        guard let contactsID = model.contacts[0].id else {
            fatalError("Clould not load a contact with an id from the MockModel")
        }
        return contactsID
    }
    
    static var previews: some View {
        ForEach(ColorScheme.allCases, id: \.hashValue) { colorScheme in
            ResidenceCell(id: contactsID)
                .colorScheme(colorScheme)
        }.environmentObject(model)
        .previewLayout(.sizeThatFits)
    }
}

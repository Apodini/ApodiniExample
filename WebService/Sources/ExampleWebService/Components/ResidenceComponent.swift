//
// This source file is part of the Apodini Example open source project
//
// SPDX-FileCopyrightText: 2018-2021 Paul Schmiedmayer and project authors (see CONTRIBUTORS.md) <paul.schmiedmayer@tum.de>
//
// SPDX-License-Identifier: MIT
//

import Apodini
import Shared

struct ResidenceComponent: Component {
    @PathParameter
    var residenceId: Residence.IDValue

    var content: some Component {
        Group("residencies") {
            CreateResidence()
                .operation(.create)

            GetResidencies()

            Group($residenceId) {
                GetResidence(residenceId: $residenceId)

                DeleteResidence(residenceId: $residenceId)
                    .operation(.delete)
            }
        }
    }
}

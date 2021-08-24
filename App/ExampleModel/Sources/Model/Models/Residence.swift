//
// This source file is part of the Apodini Example open source project
//
// SPDX-FileCopyrightText: 2018-2021 Paul Schmiedmayer and project authors (see CONTRIBUTORS.md) <paul.schmiedmayer@tum.de>
//
// SPDX-License-Identifier: MIT
//

import Foundation
import Shared


extension Residence: LocalFileStorable { }

extension Residence: Restful {
    static let route: URL = RestfulModel.baseURL.appendingPathComponent("residencies")
}

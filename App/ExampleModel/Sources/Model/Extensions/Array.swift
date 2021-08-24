//
// This source file is part of the Apodini Example open source project
//
// SPDX-FileCopyrightText: 2018-2021 Paul Schmiedmayer and project authors (see CONTRIBUTORS.md) <paul.schmiedmayer@tum.de>
//
// SPDX-License-Identifier: MIT
//

import Foundation


// MARK: Array + Replace and Sort
extension Array where Element: Identifiable & Codable & Comparable {
    /// Replaces all instances in the Array that have the same `id ` as `element`, appends the `element` and sorts the `Array`
    /// - Parameter element: The `element` that is used to perform the `replaceAndSort` operation
    public mutating func replaceAndSort(_ element: Element) {
        removeAll(where: { $0.id == element.id })
        append(element)
        sort()
    }
}

//
// This source file is part of the Apodini Example open source project
//
// SPDX-FileCopyrightText: 2018-2021 Paul Schmiedmayer and project authors (see CONTRIBUTORS.md) <paul.schmiedmayer@tum.de>
//
// SPDX-License-Identifier: MIT
//

import Foundation
import Model
import SwiftUI


@main
struct ExampleApp: App {
    @StateObject var model: Model = {
        if ProcessInfo.processInfo.arguments.contains("AppUITests") || ProcessInfo.processInfo.environment["XCODE_RUNNING_FOR_PREVIEWS"] == "1" {
            return LocalStorageModel()
        } else {
            return RestfulModel()
        }
    }()
    
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(model)
        }
    }
}

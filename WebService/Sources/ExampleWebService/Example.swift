//
// This source file is part of the Apodini Example open source project
//
// SPDX-FileCopyrightText: 2018-2021 Paul Schmiedmayer and project authors (see CONTRIBUTORS.md) <paul.schmiedmayer@tum.de>
//
// SPDX-License-Identifier: MIT
//

import Apodini
import ApodiniDatabase
import ApodiniOpenAPI
import ApodiniREST
import ArgumentParser
import FluentSQLiteDriver
import Shared


public struct Example: WebService {
    @Option(help: "The port the web service of binding to")
    var port: Int = 80
    @Option(help: "The path the database file should be saved in")
    var databasePath: String = "./example.sqlite"
    
    
    public var configuration: Configuration {
        // Exposed interfaces, in this case a RESTful API and an OpenAPI documentation generated with it
        REST {
            OpenAPI()
        }
        
        // Defines on which hostname and port the webservice should be bound to, configurable via CLI-arguments, else defaults
        HTTPConfiguration(port: port)
        
        // Setup of example database (in this case SQlite) and add migrations to create the respective tables
        DatabaseConfiguration(.sqlite(.file(databasePath)), as: .sqlite)
            .addMigrations(ContactMigration())
            .addMigrations(ResidenceMigration())
    }

    public var content: some Component {
        ContactComponent()
        ResidenceComponent()
    }
    
    
    public init() {}
}

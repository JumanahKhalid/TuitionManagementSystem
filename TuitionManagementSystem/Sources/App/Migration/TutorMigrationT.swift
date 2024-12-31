//
//  File.swift
//  
//
//  Created by Ghalia Mohammed Al Muaddi on 09/08/1445 AH.
//

import Foundation
import Fluent
import Vapor
import FluentPostgresDriver


struct TutorMigrationT : Migration {
    
    
   
    func prepare(on database: Database) -> EventLoopFuture<Void> {
        database.schema("TutorsT")
            .id()
            .field("name", .string)
            .field("skils", .string)
            .field("experience", .string).create()
    }
    
    func revert(on database: Database)  -> EventLoopFuture<Void> {
        database.schema("TutorsT").delete()
    }
}

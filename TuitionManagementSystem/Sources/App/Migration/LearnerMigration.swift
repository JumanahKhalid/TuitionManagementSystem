
//
//  LearnerMigration.swift
//
//
//  Created by mariyam yasin on 10/08/1445 AH.
//

import Foundation
import Fluent
import Vapor
import FluentPostgresDriver


struct LearnerMigration : Migration {
    
    
   
    func prepare(on database: Database) -> EventLoopFuture<Void> {
        database.schema("Learner")
            .id()
            .field("name", .string)
            .field("age", .int)
            .field("hobbies", .string).create()
    }
    
    func revert(on database: Database)  -> EventLoopFuture<Void> {
        database.schema("Learner").delete()
    }
}


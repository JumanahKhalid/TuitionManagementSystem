//
//  SwiftUIView.swift
//
//
//  Created by mariyam yasin on 11/08/1445 AH.
//


import Fluent

struct CreateLearnerWorkshop: Migration {
    func prepare(on database: Database) -> EventLoopFuture<Void> {
        return database.schema("LearnerWorkshops")
            .id()
            .field("learner_id", .uuid, .required, .references("Learner", "id"))
            .field("workshop_id", .uuid, .required, .references("Workshops", "id"))
            .field("status", .string, .required)
            .create()
    }

    func revert(on database: Database) -> EventLoopFuture<Void> {
        return database.schema("LearnerWorkshops").delete()
    }
}


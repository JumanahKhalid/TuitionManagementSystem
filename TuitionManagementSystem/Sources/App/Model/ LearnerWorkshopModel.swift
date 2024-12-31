//
//  SwiftUIView.swift
//
//
//  Created by mariyam yasin on 11/08/1445 AH.
//


import Foundation
import Vapor
import Fluent
import FluentPostgresDriver


enum LearnerWorkshopStatus: String, Codable {
    case accepted
    case pending
}

// Example of a pivot model.
final class LearnerWorkshopModel: Model, Content {
    static let schema = "LearnerWorkshops"
    
    @ID(key: .id)
    var id: UUID?
    
    @Parent(key: "learner_id")
    var learner: LearenrModel
    
    @Parent(key: "workshop_id")
    var workshop: WorkShopModel
    
    @Field(key: "status")
    var status: LearnerWorkshopStatus
    
    init() {}
    
    init(id: UUID? = nil, learner: LearenrModel, workshop: WorkShopModel, status: LearnerWorkshopStatus) throws {
        self.id = id
        self.$learner.id = try learner.requireID()
        self.$workshop.id = try workshop.requireID()
        self.status = status
    }
}

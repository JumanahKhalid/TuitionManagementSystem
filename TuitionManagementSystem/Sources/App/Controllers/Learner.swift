//
//  File 2.swift
//
//
//  Created by Ghalia Mohammed Al Muaddi on 05/08/1445 AH.
//

import Vapor
import Fluent
import FluentPostgresDriver

struct Learner : RouteCollection {
    func boot(routes: Vapor.RoutesBuilder) throws {
        
        let Learner = routes.grouped("Learner")
        Learner.get(use: index)
        
        Learner.post(use: create)
        
        Learner.put(":id" , use : update)
        
        Learner.delete(":id" , use:delete)
        
        Learner.get(":id" , use : getLearnerByID)
        
        
    
    }
    
    
    func index(req: Request) async throws -> [LearenrModel] {
            try await LearenrModel.query(on: req.db).all()
        }
    
        func create(req: Request) async throws -> LearenrModel {
            let Learner = try req.content.decode(LearenrModel.self)
            try await Learner.save(on: req.db)
            return Learner
        }
    
     //Update
        func update(req: Request) async throws -> LearenrModel {
            guard let learner = try await LearenrModel.find(req.parameters.get("id"), on: req.db) else {
                throw Abort(.notFound)
            }
            let updatedLearner = try req.content.decode(LearenrModel.self)
            learner.name = updatedLearner.name
            learner.age = updatedLearner.age
            learner.hobbies = updatedLearner.hobbies
            try await learner.save(on: req.db)
            return learner
        }
    
    //Delete
     func delete(req: Request) async throws -> LearenrModel {
         guard let learner = try await LearenrModel.find(req.parameters.get("id"), on: req.db) else {
             throw Abort(.notFound)
         }
         try await learner.delete(on: req.db)
         return learner
     }
 
 

 func getLearnerByID (req : Request) async throws -> LearenrModel {
     guard let LearnerID = try await LearenrModel.find(req.parameters.get("id") , on : req.db) else { throw Abort(.notFound)}
     return LearnerID
 }
    
  
}




////    func show(req: Request) async throws -> Learner {
////        guard let learner = try await Learner.find(req.parameters.get("id"), on: req.db) else {
////            throw Abort(.notFound)
////        }
////        return todo
////    }



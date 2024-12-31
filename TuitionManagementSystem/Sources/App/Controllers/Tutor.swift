//
//  File 2.swift
//  
//
//  Created by Ghalia Mohammed Al Muaddi on 05/08/1445 AH.
//

import Foundation
import Vapor

struct Tutor : RouteCollection {
    func boot(routes: Vapor.RoutesBuilder) throws {
        
        let Tutor = routes.grouped("Tutor")
        Tutor.get(use : index)
        
        Tutor.post(use : create)

        Tutor.put(":id" , use : update)

        Tutor.delete(":id" , use : delete)
        
        Tutor.get(":id" , use : getTutorByID)
    }
    
    func index (req : Request) async throws -> [TutorModel]  {
        let Tutor = try await TutorModel.query(on: req.db).all()
        return Tutor
    }
    
    func create (req : Request) async throws -> TutorModel {
   
        let NewTutor = try req.content.decode(TutorModel.self)
               try await NewTutor.save(on: req.db)
        return NewTutor
    }
    
        func update (req : Request) async throws -> TutorModel {
      
        guard let TutorUsingId = try await TutorModel.find(req.parameters.get("id"), on: req.db) else { throw Abort(.notFound)}
        
        let UpdatedElements = try  req.content.decode(TutorModel.self)
        
      //  TutorUsingId.name = UpdatedElements.name
      //  TutorUsingId.skils = UpdatedElements.skils
      // TutorUsingId.experience = UpdatedElements.experience
        
        return TutorUsingId
    }
    
    func delete (req : Request) async throws -> TutorModel {
        
        guard let TutorById = try await TutorModel.find(req.parameters.get("id"), on: req.db) else { throw Abort(.notFound)}
            
        try await TutorById.delete(on: req.db)
        
       return TutorById
    }
    
    func getTutorByID (req : Request) async throws -> TutorModel {
      
        guard let TutorByID = try await TutorModel.find(req.parameters.get("id"), on : req.db) else { throw Abort(.notFound)}
        
      return TutorByID   
    }
}

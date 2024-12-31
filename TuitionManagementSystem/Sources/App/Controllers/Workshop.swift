//
//  File 2.swift
//  
//
//  Created by Ghalia Mohammed Al Muaddi on 05/08/1445 AH.
//


import Foundation
import Vapor

struct Workshop : RouteCollection {
    func boot(routes: Vapor.RoutesBuilder) throws {
        let Workshop = routes.grouped("Workshop")
        
        //Read All workshops
        Workshop.get(use : index)
        
        //Create All workshops
        Workshop.post(use : create)
        
        //Update One workshop using ID
        Workshop.put(":id" , use : update)
        
        //Delate One workshop using ID
        Workshop.delete(":id" , use : delete)
        
        //Read One workshop using ID
        Workshop.get(":id" , use : getWorkshopByID)
    }
    
    func index (req : Request) async throws -> [WorkShopModel] {
        
        let Workshops = try await WorkShopModel.query(on: req.db).all()
        
        return Workshops
    }
    
    
    func create (req : Request) async throws -> WorkShopModel {
        
        let NewWorkShop = try req.content.decode(WorkShopModel.self)
               try await NewWorkShop.save(on: req.db)
        return NewWorkShop
 
    }

    func update (req : Request) async throws -> WorkShopModel {
//         let id = req.parameters.get("id")!
//                return "update with \(id)"
        
        guard let WorkshopUsingId = try await WorkShopModel.find(req.parameters.get("id"), on: req.db) else { throw Abort(.notFound)}
        
        let UpdatedInput = try  req.content.decode(WorkShopModel.self)
        
      //  WorkshopUsingId.name = UpdatedInput.name
      //  WorkshopUsingId.location = UpdatedInput.location
      //  WorkshopUsingId.type = UpdatedInput.type
        
        WorkshopUsingId.date = UpdatedInput.date
        
     //  WorkshopUsingId.tutor = UpdatedInput.tutor

     //  Return it after updated
        return WorkshopUsingId
    }}
    
    func delete (req : Request) async throws -> WorkShopModel {
//        let id = req.parameters.get("id")!
//        return "delete with \(id)"
        
        guard let WorkshopById = try await WorkShopModel.find(req.parameters.get("id"), on: req.db) else { throw Abort(.notFound)}
            
        try await WorkshopById.delete(on: req.db)
        
       return WorkshopById
        }
        

    func getWorkshopByID (req : Request) async throws -> WorkShopModel {
//        let id = req.parameters.get("id")!
//        return "Get Workshop with ID \(id)"
        
        guard let WorkshopByID = try await WorkShopModel.find(req.parameters.get("id"), on : req.db) else { throw Abort(.notFound)}
        
      return WorkshopByID
    }


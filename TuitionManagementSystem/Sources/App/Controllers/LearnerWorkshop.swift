
//  File.swift
//  
//
//  Created by Ghalia Mohammed Al Muaddi on 15/08/1445 AH.
//


import Foundation
import Vapor

struct LearnerWorkshopController: RouteCollection {
    func boot(routes: RoutesBuilder) throws {
        let learnerWorkshops = routes.grouped("learnerworkshops")
        learnerWorkshops.post(use: create)
        learnerWorkshops.get(use: getAll)
        learnerWorkshops.get(":id", use: getById)
        learnerWorkshops.delete(":id", use: delete)
    }

    // POST /learner-workshops
    func create(req: Request) throws -> EventLoopFuture<LearnerWorkshopModel> {
        let learnerWorkshop = try req.content.decode(LearnerWorkshopModel.self)
        return learnerWorkshop.save(on: req.db).map { learnerWorkshop }
    }

    // GET /learner-workshops
    func getAll(req: Request) throws -> EventLoopFuture<[LearnerWorkshopModel]> {
        return LearnerWorkshopModel.query(on: req.db).all()
    }

    // GET /learner-workshops/:id
    func getById(req: Request) throws -> EventLoopFuture<LearnerWorkshopModel> {
        guard let learnerWorkshopID = req.parameters.get("id", as: UUID.self) else {
            throw Abort(.badRequest)
        }
        return LearnerWorkshopModel.find(learnerWorkshopID, on: req.db)
            .unwrap(or: Abort(.notFound))
    }

    // DELETE /learner-workshops/:id
    func delete(req: Request) throws -> EventLoopFuture<HTTPStatus> {
        guard let learnerWorkshopID = req.parameters.get("id", as: UUID.self) else {
            throw Abort(.badRequest)
        }
        return LearnerWorkshopModel.find(learnerWorkshopID, on: req.db)
            .unwrap(or: Abort(.notFound))
            .flatMap { learnerWorkshop in
                return learnerWorkshop.delete(on: req.db).transform(to: .noContent)
            }
    }
}

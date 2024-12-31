//
//  SwiftUIView.swift
//
//
//  Created by mariyam yasin on 10/08/1445 AH.
//

import Foundation
import Vapor
import Fluent
import FluentPostgresDriver

final class LearenrModel: Model,Content{
  
    static let schema = "Learner"

      
    @ID(key: .id)
       var id: UUID?

     
    @Field(key: "name")
       var name: String

    @Field(key: "age")
       var age: Int
    
    @Field(key: "hobbies")
       var hobbies: String
    
    
  
    // Example of a siblings relation.
    @Siblings(through: LearnerWorkshopModel.self, from: \.$learner , to: \.$workshop)
        public var workshop: [WorkShopModel]
    
  
    
   

    
    init() { }


    init(id : UUID , name : String , age : Int , hobbies : String){
       
           self.id = id
           self.name = name
           self.age = age
           self.hobbies = name


       }
}

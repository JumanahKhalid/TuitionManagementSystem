
import Vapor
import Fluent
import FluentPostgresDriver
// configures your application
public func configure(_ app: Application) async throws {
    // uncomment to serve files from /Public folder
    // app.middleware.use(FileMiddleware(publicDirectory: app.directory.publicDirectory))
    
    
    app.databases.use(.postgres(configuration:
                                    SQLPostgresConfiguration(hostname: "localhost", username: "postgres", password: "",
                                                             database: "tuitiondb" ,
                                                             tls: .prefer(try .init(configuration: .clientDefault)))) , as : .psql)
    
    //    try app.register(collection: file())
    //    try routes(app)
    //    app.migrations.add(MyMigration())
    
    
    // register routes
    
    try routes(app)
    //Learner
    try app.register(collection: Learner())
    app.migrations.add(LearnerMigration())
    // TUTOR
    try app.register(collection: Tutor())
    app.migrations.add(TutorMigrationT())
    //WorkShop
    try app.register(collection: Workshop())
    app.migrations.add(WorkshopMigration())
    //LearnerWorkShop
    try app.register(collection: LearnerWorkshopController())
    app.migrations.add(CreateLearnerWorkshop())
}

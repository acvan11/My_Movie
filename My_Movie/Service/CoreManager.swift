//
//  CoreManager.swift
//  My_Movie
//
//  Created by Sky on 10/11/19.
//  Copyright © 2019 Sky. All rights reserved.
//

import Foundation
import CoreData

let core = CoreManager.shared

final class CoreManager {
    static let shared = CoreManager()
    private init() {}
    
    var context: NSManagedObjectContext {
        return persistentContainer.viewContext
    }
    
    lazy var persistentContainer: NSPersistentContainer = {
        var container = NSPersistentContainer(name: "My_Movie")
        
        container.loadPersistentStores(completionHandler: { (storeDescrip, err) in
            if let error = err {
                fatalError(error.localizedDescription)
            }
        })
        return container
    }()
    
    //MARK: Save
    func save(_ movie: Movie) {
        let entity = NSEntityDescription.entity(forEntityName: "CoreMovie", in: context)!
        let core = CoreMovie(entity: entity, insertInto: context)
        
        //KVC - Key Value Coding - access object property by String
        core.setValue(movie.id, forKey: "id")
        core.setValue(movie.popularity, forKey: "popularity")
        core.setValue(movie.poster, forKey: "poster")
        core.setValue(movie.title, forKey: "title")
        core.setValue(movie.year, forKey: "year")
        core.setValue(movie.overview, forKey: "overview")
    
        print("Saved Movie To Core")
        saveContext()
    }
    

        //MARK: Delete
        func delete(_ movie: Movie) {
        
            let fetchRequest = NSFetchRequest<CoreMovie>(entityName: "CoreMovie")
            let predicate = NSPredicate(format: "id==%@", movie.id)
            print("delete line 3")
            fetchRequest.predicate = predicate
            
            var movieResult = [CoreMovie]()
            
            do {
                movieResult = try context.fetch(fetchRequest)
                
                guard let core = movieResult.first else { return }
                context.delete(core)
                print("Deleted Movie From Core: )")
                
            } catch {
                print("Couldn't Fetch Movie: \(error.localizedDescription)")
            }
            
            saveContext()
        }
        
        //MARK: Load
        func load() -> [Movie] {
            
            let fetchRequest = NSFetchRequest<CoreMovie>(entityName: "CoreMovie")
            
            var movies = [Movie]()
            
            do {
                
                let coreMovies = try context.fetch(fetchRequest)
                for core in coreMovies {
                    movies.append(Movie(from: core))
                }
                
            } catch {
                print("Couldn't Fetch Fact: \(error.localizedDescription)")
            }
            
            return movies
        }
        
        
        
        //MARK: Helpers
        
        private func saveContext() {
            do {
                try context.save()
            } catch {
                fatalError(error.localizedDescription)
            }
        }
        
    }

    

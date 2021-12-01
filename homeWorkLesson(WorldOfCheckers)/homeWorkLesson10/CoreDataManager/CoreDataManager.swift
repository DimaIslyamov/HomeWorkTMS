//
//  CoreDataManager.swift
//  homeWorkLesson10
//
//  Created by Moobat on 25.11.21.
//

import UIKit
import CoreData

class CoreDataManager {
    static let shatred = CoreDataManager()
    
    lazy var persistentContainer: NSPersistentContainer = {
        let container = NSPersistentContainer(name: "CoreDataResultModel")
        container.loadPersistentStores(completionHandler: { (storeDescription, error) in
            
            if let error = error as NSError? {
                fatalError("Unresolved error \(error), \(error.userInfo)")
            }
        })
        return container
    }()
    
    
    func saveContext () {
        let context = persistentContainer.viewContext
        if context.hasChanges {
            do {
                try context.save()
                print("saved")
            } catch {
                let nserror = error as NSError
                fatalError("Unresolved error \(nserror), \(nserror.userInfo)")
            }
        }
    }
    
    
    func saveGame(by game: Game_mDB) {
        let gameDB = GameDB(context: persistentContainer.viewContext)
        gameDB.gameDate = game.gameDate
        game.players?.forEach({ (player) in
            let playerDataBase = PlayerDB(context: persistentContainer.viewContext)
            playerDataBase.convert(by: player)
            gameDB.addToPlayerDB(playerDataBase)
        })
        persistentContainer.viewContext.insert(gameDB)
        saveContext()
    }
    
    
    func getGame() -> [Game_mDB] {
        var array: [Game_mDB] = []
        do {
            let games = try persistentContainer.viewContext.fetch(GameDB.fetchRequest())
            games.forEach { (game) in
                guard let game = game as? GameDB else { return }
                array.append(Game_mDB(from: game))
            }
        } catch (let done) {
            print(done)
        }
        return array
    }
    
    
    func deletAllData() {
        do {
            let games = try persistentContainer.viewContext.fetch(GameDB.fetchRequest())
            games.forEach { (game) in
                guard let game = game as? GameDB else { return }
                persistentContainer.viewContext.delete(game)
                saveContext()
            }
        } catch (let done) {
            print(done)
        }
    }
}

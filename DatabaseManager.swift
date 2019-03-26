//
//  DatabaseManager.swift
//  CoreDataDemo
//
//  Created by trinh.hoang.hai on 3/26/19.
//  Copyright © 2019 trinh.hoang.hai. All rights reserved.
//

import Foundation
import UIKit
import CoreData

final class DatabaseManager {

    private struct Constant {
        static let person = "Person"
        static let cat = "Cat"
    }

    private class func getManagerContext() -> NSManagedObjectContext? {
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else {
            return nil
        }
        let managedContext = appDelegate.persistentContainer.viewContext
        return managedContext
    }

    class func insertPerson(person: Persons) -> Bool {
        if checkData(person: person) == nil {
            do {
                guard let managedContext = getManagerContext() else { return Bool() }
                guard let trackEntity = NSEntityDescription.entity(forEntityName: Constant.person, in: managedContext) else { return false }
                let trackObject = NSManagedObject(entity: trackEntity, insertInto: getManagerContext())
                trackObject.setValue(person.id, forKey: "id")
                trackObject.setValue(person.name, forKey: "name")
                try managedContext.save()
                return true
            } catch {
                return false
            }
        }
        return false
    }

    class func getPersons() -> [Persons] {
        let managedContext = getManagerContext()
        var tmpPersonList = [Persons]()
        let request = NSFetchRequest<NSManagedObject>(entityName: Constant.person)
        var tmpFetch = [NSManagedObject]()
        if let tmpManagedContext = managedContext {
            do {
                tmpFetch = try tmpManagedContext.fetch(request)
                for index in tmpFetch {
                    let tmpId = index.value(forKey: "id") as? String ?? ""
                    let tmpName = index.value(forKey: "name") as? String ?? ""

                    let tmpPerson = Persons(id: tmpId,
                                           name: tmpName)
                    tmpPersonList.append(tmpPerson)
                }
            } catch let error {
                print(error.localizedDescription)
            }
        }
        return tmpPersonList
    }

    class func cleanAllCoreData() {
        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: Constant.person)
        let deleteRequest = NSBatchDeleteRequest(fetchRequest: fetchRequest)
        if let managedContext = getManagerContext() {
            do {
                try managedContext.execute(deleteRequest)
            } catch let error {
                print(error.localizedDescription)
            }
        }
    }

    class func deletePerson(person: Persons) -> Bool {
        if let tmpData = checkData(person: person),
            let managedContext = getManagerContext() {
            do {
                managedContext.delete(tmpData)
                try managedContext.save()
                return true
            } catch {
                return false
            }
        }
        return false
    }

    class func checkData(person: Persons) -> NSManagedObject? {
        let managedContext = getManagerContext()
        if let tmpManagedContext = managedContext {
            let request = NSFetchRequest<NSManagedObject>(entityName: Constant.person)
            var tmpFetch = [NSManagedObject]()
            do {
                tmpFetch = try tmpManagedContext.fetch(request)
                for index in tmpFetch {
                    let tmpId = index.value(forKey: "id") as? String ?? ""
                    if tmpId == person.id {
                        return index
                    }
                }
            } catch {
                return nil
            }
        }
        return nil
    }

    class func checkData(cat: Cat) -> NSManagedObject? {
        let managedContext = getManagerContext()
        if let tmpManagedContext = managedContext {
            let request = NSFetchRequest<NSManagedObject>(entityName: Constant.cat)
            var tmpFetch = [NSManagedObject]()
            do {
                tmpFetch = try tmpManagedContext.fetch(request)
                for index in tmpFetch {
                    let tmpTitle = index.value(forKey: "id") as? String ?? ""
                    if tmpTitle == cat.id {
                        return index
                    }
                }
            } catch {
                return nil
            }
        }
        return nil
    }
}

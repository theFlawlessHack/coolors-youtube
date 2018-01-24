//
//  CDHandler.swift
//  coolors
//
//  Created by Jessica Joseph on 1/23/18.
//  Copyright © 2018 Jessica Joseph. All rights reserved.
//

import CoreData
import UIKit

class CDHandler: NSObject {
    
    private class func getContext() -> NSManagedObjectContext {
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        return appDelegate.persistentContainer.viewContext
    }
    
    class func saveObject(username:String, color:String) -> Bool {
        let context = getContext()
        let entity = NSEntityDescription.entity(forEntityName: "User", in: context)
        let managedObject = NSManagedObject(entity: entity!, insertInto: context)
        
        managedObject.setValue(username, forKey: "username")
        managedObject.setValue(color, forKey: "color")
        
        do {
            try context.save()
            return true
        } catch {
            return false
        }
    }
    
    class func fetchObject() -> [User]? {
        let context = getContext()
        var users: [User]? = nil
        
        do {
            users = try context.fetch(User.fetchRequest())
            return users
        } catch {
            return users
        }
    }
    
}

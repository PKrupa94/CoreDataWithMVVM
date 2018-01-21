//
//  DataModel.swift
//  PMVVM
//
//  Created by krupa on 1/20/18.
//  Copyright © 2018 sa. All rights reserved.
//

import Foundation
import UIKit
import CoreData

let appDelegate = UIApplication.shared.delegate as! AppDelegate

class DataModel{

   class func saveUserModel(userInfo:User){
        let manageContext = appDelegate.persistentContainer.viewContext
        let entity = NSEntityDescription.entity(forEntityName: "Person", in: manageContext)
        let user = NSManagedObject(entity: entity!, insertInto: manageContext)
        user.setValue(userInfo.firstName, forKey: "firstName")
        user.setValue(userInfo.lastName, forKey: "lastName")
        user.setValue(userInfo.email, forKey: "email")
        user.setValue(userInfo.password, forKey: "password")
        do {
            try manageContext.save()
        } catch let error as NSError {
            print("Error while save data\(error)")
        }
    }
    
    class func fetchUserInfo() -> [NSManagedObject]{
        let manageContext = appDelegate.persistentContainer.viewContext
        var person:[NSManagedObject]!
        let fetchRequest = NSFetchRequest<NSManagedObject>(entityName: "Person")
        do {
         person = try manageContext.fetch(fetchRequest)
        } catch let error as NSError {
            print("Error while FetchData\(error.localizedDescription)")
        }
        return person
    }
    
    class func deleteData(manageObject:NSManagedObject){
        let context = appDelegate.persistentContainer.viewContext
        context.delete(manageObject)
        do{
            try context.save()
        }catch let error as NSError{
            print("Error\(error.localizedDescription)")
        }
    }
}

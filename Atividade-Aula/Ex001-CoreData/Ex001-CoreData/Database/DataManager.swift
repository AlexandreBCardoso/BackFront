//
//  DataManager.swift
//  Ex001-CoreData
//
//  Created by Alexandre Cardoso on 17/03/21.
//

import Foundation
import UIKit
import CoreData

class DataManager: NSObject {
	
	private var arrayInformation: [NSManagedObject]?
	
	lazy var persistentContainer: NSPersistentContainer = {
		let container = NSPersistentContainer(name: "Ex001_CoreData")
		container.loadPersistentStores(completionHandler: { (storeDescription, error) in
			if let error = error as NSError? {
				fatalError("Unresolved error \(error), \(error.userInfo)")
			}
		})
		return container
	}()
	
	
	// MARK: - Function
	func countInformation() -> Int {
		self.arrayInformation?.count ?? 0
	}
	
	func dataInformation(key: String, indexPath: IndexPath) -> String {
		
		if key == "age" {
			let age: Int64 = (self.arrayInformation?[indexPath.row].value(forKey: "age") as? Int64) ?? 0
			return String(age)
		} else {
			return (self.arrayInformation?[indexPath.row].value(forKey: "name") as? String) ?? ""
		}
		
	}
	
	
	// MARK: - Function CoreData
	func loadData(completion: (Bool) -> Void) {
		let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "Pessoa")
		let context      = self.persistentContainer.viewContext
		
		do {
			let result = try context.fetch(fetchRequest)
			self.arrayInformation = result as? [NSManagedObject]
			completion(true)
			
		} catch let error {
			print(error.localizedDescription)
			completion(false)
		}
	}
	
	func saveAndAddInformation(name: String, age: Int64, completion: (Bool) -> Void) {
		let context = self.persistentContainer.viewContext
		guard let entity = NSEntityDescription.entity(forEntityName: "Pessoa", in: context) else {
			return completion(false)
		}
		let pessoa = NSManagedObject(entity: entity, insertInto: context)
		
		pessoa.setValue(name, forKey: "name")
		pessoa.setValue(age, forKey: "age")
		
		do {
			try context.save()
			completion(true)
			
		} catch let error {
			print(error.localizedDescription)
			completion(false)
		}
	}
	
	func deletePerson(name: String, completion: (Bool) -> Void) {
		let context = self.persistentContainer.viewContext
		let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "Pessoa")
		
//		fetchRequest.predicate = NSPredicate(format: "name == %@", name)
//		fetchRequest.predicate = NSPredicate(format: "name == %@ AND age == %@", argumentArray: [name, "28"])
		fetchRequest.predicate = NSPredicate(format: "name CONTAINS[c] 'A'")
		
		// Delete
		do {
			let result = try context.fetch(fetchRequest)
			guard let objectDelete = result.last as? NSManagedObject else {
				return completion(false)
			}
			context.delete(objectDelete)
			
		} catch let error {
			print(error.localizedDescription)
			completion(false)
		}
		
		// Save
		do {
			try context.save()
			completion(true)
		} catch let error {
			print(error.localizedDescription)
			completion(false)
		}
		
	}
	
	
}

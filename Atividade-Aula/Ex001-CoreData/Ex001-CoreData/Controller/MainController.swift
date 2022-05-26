//
//  MainController.swift
//  Ex001-CoreData
//
//  Created by Alexandre Cardoso on 17/03/21.
//

import Foundation

class MainController {
	
	var users: [User] = [User]()
	
	func getCount() -> Int? {
		return self.users.count
	}
	
	func addUser(user: User) {
		self.users.append(user)
	}
	
	func getUser(indexPath: IndexPath) -> User? {
		return self.users[indexPath.row]
	}
	
	
	
}

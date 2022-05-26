//
//  Utils.swift
//  NotificationCenterTabbar
//
//  Created by Alexandre Cardoso on 28/03/21.
//

import Foundation
import UIKit

class Utils {
	
	class func saveUserDefaults(value: Any, key: String) {
		UserDefaults.standard.setValue(value, forKey: key)
	}
	
	class func getUserDefaults(key: String) -> Any? {
		return UserDefaults.standard.object(forKey: key)
	}
}

//
//  UIColor+Extension.swift
//  NotificationCenterTabbar
//
//  Created by Alexandre Cardoso on 28/03/21.
//

import Foundation
import UIKit

enum ColorType: Int {
	case blueIce = 0
	case dark = 1
}

extension UIColor {
	
	@nonobjc class var dark: UIColor {
		return UIColor(red: 21.0 / 255.00, green: 29.0 / 255.0, blue: 44.0 / 255.0, alpha: 1.0)
	}
	
	@nonobjc class var blueIce: UIColor {
		return UIColor(red: 0/255, green: 242/255, blue: 242/255, alpha: 1.0)
	}
	
	@nonobjc class var corDeFundoView: UIColor {
		guard let info: Int = (Utils.getUserDefaults(key: "colorSelected")) as? Int
		else { return .green }
		
		switch info {
			case ColorType.blueIce.rawValue:
				return blueIce
			case ColorType.dark.rawValue:
				return dark
			default:
				return .green
		}
		
	}
	
}

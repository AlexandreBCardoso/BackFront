//
//  Tela02ViewController.swift
//  Delegate-Protocols
//
//  Created by Alexandre Cardoso on 24/03/21.
//

import UIKit

protocol Tela02Protocol: class {
	func cliqueMacbook()
	func cliqueImac()
}

enum NameNotification: String {
	case macbookNotification = "mackbook"
	case imacNotification = "imac"
}

class Tela02ViewController: UIViewController {
	
	weak private var delegate: Tela02Protocol?
	
	// Opcional
	func delegate(delegate: Tela02Protocol?) {
		self.delegate = delegate
	}
	

    override func viewDidLoad() {
        super.viewDidLoad()
    }
	
    
	@IBAction func tappedMacbookButton(_ sender: UIButton) {
		self.delegate?.cliqueMacbook()
		
		NotificationCenter.default.post(name: Notification.Name(NameNotification.macbookNotification.rawValue), object: nil)
		
		self.dismiss(animated: true, completion: nil)
	}
	
	@IBAction func tappedImacButton(_ sender: UIButton) {
		self.delegate?.cliqueImac()
		
		NotificationCenter.default.post(name: Notification.Name(NameNotification.imacNotification.rawValue), object: nil)
		
		self.dismiss(animated: true, completion: nil)
	}
	
}

//
//  Tela01ViewController.swift
//  Delegate-Protocols
//
//  Created by Alexandre Cardoso on 24/03/21.
//

import UIKit

class Tela01ViewController: UIViewController {
	
	@IBOutlet weak var imagemView: UIImageView!
	@IBOutlet weak var textoLabel: UILabel!
	
	let imac = Notification.Name(NameNotification.imacNotification.rawValue)
	let macbook = Notification.Name(NameNotification.macbookNotification.rawValue)
	
	
	override func viewDidLoad() {
		super.viewDidLoad()
		configImageView()
		createObservers()
	}
	
//	override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
//		if segue.identifier == "segueTela02" {
//			let tela02VC = segue.destination as! Tela02ViewController
//			tela02VC.delegate(delegate: self)
//		}
//	}
	
	func createObservers() {
		
		// imac
		NotificationCenter.default.addObserver(self, selector: #selector(self.updateLogo(notification:)),
															name: self.imac, object: nil)
		NotificationCenter.default.addObserver(self, selector: #selector(self.updateDescription(notification:)),
															name: self.imac, object: nil)
		NotificationCenter.default.addObserver(self, selector: #selector(self.updateBackgroundView(notification:)),
															name: self.imac, object: nil)
		
		// imac
		NotificationCenter.default.addObserver(self, selector: #selector(self.updateLogo(notification:)),
															name: self.macbook, object: nil)
		NotificationCenter.default.addObserver(self, selector: #selector(self.updateDescription(notification:)),
															name: self.macbook, object: nil)
		NotificationCenter.default.addObserver(self, selector: #selector(self.updateBackgroundView(notification:)),
															name: self.macbook, object: nil)
		
	}
	
	@objc
	func updateLogo(notification: NSNotification) {
		let isValid: Bool = (notification.name == self.imac)
		let image = isValid ? UIImage(named: "iconImac1") : UIImage(named: "iconMacbook2")
		self.imagemView.image = image
	}
	
	@objc
	func updateDescription(notification: NSNotification) {
		let isValid: Bool = (notification.name == self.imac)
		self.textoLabel.text = isValid ? "iMac Top" : "Macbook Pro"
	}
	
	@objc
	func updateBackgroundView(notification: NSNotification) {
		let isValid: Bool = (notification.name == self.imac)
		self.view.backgroundColor = isValid ? UIColor.cyan : UIColor.magenta
	}
	
	private func configImageView() {
		self.imagemView.image = UIImage(named: "iconApple")
	}
	
	@IBAction func tappedClickButton(_ sender: UIButton) {
		performSegue(withIdentifier: "segueTela02", sender: nil)
	}
	
	
}


extension Tela01ViewController: Tela02Protocol {
	
	func cliqueMacbook() {
		self.imagemView.image = UIImage(named: "iconMacbook2")
		self.textoLabel.text = "Macbook M1"
	}
	
	func cliqueImac() {
		self.imagemView.image = UIImage(named: "iconImac1")
		self.textoLabel.text = "IMac Toppen!"
	}
	
}

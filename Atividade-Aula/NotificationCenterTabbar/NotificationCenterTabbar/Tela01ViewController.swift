//
//  Tela01ViewController.swift
//  NotificationCenterTabbar
//
//  Created by Alexandre Cardoso on 24/03/21.
//

import UIKit

class Tela01ViewController: UIViewController {
	
	@IBOutlet weak var text1TextField: UITextField!
	@IBOutlet weak var text2TextField: UITextField!
	
	
	override func viewDidLoad() {
		super.viewDidLoad()
		
		self.text1TextField.delegate = self
		self.text2TextField.delegate = self
		
		self.configObserver()
		self.configColorBackground()
	}
	
	func configObserver() {
		NotificationCenter.default.addObserver(self, selector: #selector(self.alterarBackground),
															name: .alterarParaAzul, object: nil)
		
		NotificationCenter.default.addObserver(self, selector: #selector(self.configColorBackground),
															name: .trocarCorDeFundo, object: nil)
		
		NotificationCenter.default.addObserver(self, selector: #selector(self.alterarTelaWhite),
															name: UIResponder.keyboardWillShowNotification, object: nil)
		
		NotificationCenter.default.addObserver(self, selector: #selector(self.alterarTelaBlack),
															name: UIResponder.keyboardWillHideNotification, object: nil)
	}
	
	@objc
	func alterarBackground() {
		self.view.backgroundColor = .blue
		self.tabBarController?.tabBar.tintColor = .red
	}
	
	@objc
	func alterarTelaWhite() {
		self.view.backgroundColor = .white
	}
	
	@objc
	func alterarTelaBlack() {
		self.view.backgroundColor = .black
	}
	
	@objc
	func configColorBackground() {
		self.view.backgroundColor = .corDeFundoView
	}
	
	@IBAction func didAction(_ sender: UISwitch) {
		
		if sender.isOn {
			Utils.saveUserDefaults(value: 0, key: "colorSelected")
		} else {
			Utils.saveUserDefaults(value: 1, key: "colorSelected")
		}
		
		NotificationCenter.default.post(name: .trocarCorDeFundo, object: nil)
	}
	
}


// MARK: - Extension
extension Tela01ViewController: UITextFieldDelegate {
	
	func textFieldShouldReturn(_ textField: UITextField) -> Bool {
		textField.resignFirstResponder()
		return true
	}
}

//
//  ViewController.swift
//  ViewTextField
//
//  Created by Alexandre Cardoso on 24/03/21.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate {
	
	@IBOutlet weak var cpfTextField: UITextField!
	@IBOutlet weak var nomeTextField: UITextField!
	@IBOutlet weak var completoTextField: UITextField!
	@IBOutlet weak var emailTextField: UITextField!
	
	
	override func viewDidLoad() {
		super.viewDidLoad()
		
		self.cpfTextField.delegate = self
		
		self.nomeTextField.text = "Pedro"
		self.nomeTextField.isEnabled = true
		
		// Listen
		// Listen for keyboard events
		NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillChange(notification:)),
															name: UIResponder.keyboardWillShowNotification, object: nil)
		NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillChange(notification:)),
															name: UIResponder.keyboardWillHideNotification, object: nil)
		NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillChange(notification:)),
															name: UIResponder.keyboardWillChangeFrameNotification, object: nil)
	}
	
	deinit {
		 // Stop listening for keyboard hide/show events
		 NotificationCenter.default.removeObserver(self, name: UIResponder.keyboardWillShowNotification, object: nil)
		 NotificationCenter.default.removeObserver(self, name: UIResponder.keyboardWillHideNotification, object: nil)
		 NotificationCenter.default.removeObserver(self, name: UIResponder.keyboardWillChangeFrameNotification, object: nil)
	}
	
	func hideKeyboard() {
		cpfTextField.resignFirstResponder()
	}
	
	@objc func keyboardWillChange(notification: Notification) {

		 guard let keyboardRect = (notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue)?.cgRectValue
		else {
			  return
		 }
		 
		 if notification.name == UIResponder.keyboardWillShowNotification ||
			  notification.name == UIResponder.keyboardWillChangeFrameNotification {
			  
			  view.frame.origin.y = -keyboardRect.height
		 } else {
			  view.frame.origin.y = 0
		 }
	}
	
	func textFieldShouldReturn(_ textField: UITextField) -> Bool {
		print("Clique Return")
		hideKeyboard()
		return true
	}

	@IBAction func tappedSalvarButton(_ sender: UIButton) {
		print("Clique Salvar")
		hideKeyboard()
	}
	
}


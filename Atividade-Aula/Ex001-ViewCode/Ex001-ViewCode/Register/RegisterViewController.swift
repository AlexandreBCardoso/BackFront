//
//  RegisterViewController.swift
//  Ex001-ViewCode
//
//  Created by Alexandre Cardoso on 29/03/21.
//

import UIKit

class RegisterViewController: UIViewController {
	
	var registerScreen: RegisterScreen?
	
	override func loadView() {
		self.registerScreen = RegisterScreen()
		self.registerScreen?.delegate(delegate: self)
		self.view = registerScreen

	}
	
	override func viewDidLoad() {
		super.viewDidLoad()
		self.view.backgroundColor = .cyan
		self.navigationController?.setNavigationBarHidden(false, animated: true)
	}
	
}


extension RegisterViewController: RegisterScreenProtocol {
	
	func actionVoltar() {
		self.navigationController?.popViewController(animated: true)
	}
	
}

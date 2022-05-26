//
//  ViewController.swift
//  AutoLayout_1
//
//  Created by Alexandre Cardoso on 13/01/21.
//

import UIKit

class ViewController: UIViewController {
	
	@IBOutlet weak var tfUsername: UITextField!
	@IBOutlet weak var tfPassword: UITextField!
	
	override func viewDidLoad() {
		super.viewDidLoad()
		
		// Configuração do TextField-Username
		self.tfUsername.layer.borderWidth = 1
		self.tfUsername.layer.borderColor = UIColor.white.cgColor
		self.tfUsername.layer.cornerRadius = 6
		
		// Configuração do TextField-Password
		self.tfPassword.layer.borderWidth = 1
		self.tfPassword.layer.borderColor = UIColor.white.cgColor
		self.tfPassword.layer.cornerRadius = 6
		
	}


}


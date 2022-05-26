//
//  Tela03ViewController.swift
//  NotificationCenterTabbar
//
//  Created by Alexandre Cardoso on 24/03/21.
//

import UIKit

class Tela03ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
	@IBAction func tappedAlterarButton(_ sender: UIButton) {
		NotificationCenter.default.post(name: .alterarParaAzul, object: nil)
		self.view.backgroundColor = .blue
	}
	
	@IBAction func tappedAction(_ sender: UISwitch) {
		if sender.isOn {
			Utils.saveUserDefaults(value: 0, key: "colorSelected")
		} else {
			Utils.saveUserDefaults(value: 1, key: "colorSelected")
		}
		
		NotificationCenter.default.post(name: .trocarCorDeFundo, object: nil)
	}
	
}

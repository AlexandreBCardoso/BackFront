//
//  PinkViewController.swift
//  Navigation-Controller
//
//  Created by Alexandre Cardoso on 09/02/21.
//

import UIKit

class PinkViewController: UIViewController {
	
	override func viewDidLoad() {
		super.viewDidLoad()
		
		title = "Pink Screen"
		
		
		self.navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Add", style: .plain, target: self, action: #selector(addTapped))
		
	}
	
	@objc func addTapped() {
		print("tap addTapped")
		
		
		self.navigationItem.leftBarButtonItem = UIBarButtonItem(barButtonSystemItem: .cancel, target: self, action: #selector(cancelTapped))
		
	}
	
	@objc func cancelTapped() {
		print("cancelTapped")
		
		self.navigationItem.rightBarButtonItem?.isEnabled = false
	}
	
	
}

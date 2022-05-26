//
//  ViewController.swift
//  CardViewAnimation
//
//  Created by Alexandre Cardoso on 21/02/21.
//

import UIKit

class ViewController: UIViewController {
	
	@IBOutlet weak var containerView: UIView!
		

	override func viewDidLoad() {
		super.viewDidLoad()
		// Do any additional setup after loading the view.
		
		self.containerView.layer.cornerRadius = 50
	}


}


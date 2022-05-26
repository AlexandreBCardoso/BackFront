//
//  ViewController.swift
//  TabBar
//
//  Created by Alexandre Cardoso on 14/02/21.
//

import UIKit

class ViewController: UIViewController {

	override func viewDidLoad() {
		super.viewDidLoad()
		// Do any additional setup after loading the view.
	}

	@IBAction func tappedShowHomeButton(_ sender: UIButton) {
		self.performSegue(withIdentifier: "segueHome", sender: nil)
	}
	
}


//
//  ViewController.swift
//  Navigation-iOSAcademy
//
//  Created by Alexandre Cardoso on 09/02/21.
//

import UIKit

class ViewController: UIViewController {
	
	override func viewDidLoad() {
		super.viewDidLoad()
		
		//		self.title = "My Title"
	}
	
	@IBAction func didTapButton() {
		let secondVC = SecondViewController()
//		secondVC.navigationItem.largeTitleDisplayMode = .never
		secondVC.navigationController?.isNavigationBarHidden = true
		navigationController?.pushViewController(secondVC, animated: true)
	}
	
	
}


class SecondViewController: UIViewController {
	
	override func viewDidLoad() {
		super.viewDidLoad()
		view.backgroundColor = .systemGreen
		
//		title = "Second Screen"
		
	}
	
}


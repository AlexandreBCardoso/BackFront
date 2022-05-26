//
//  CardViewController.swift
//  CardViewAnimation
//
//  Created by Alexandre Cardoso on 21/02/21.
//

import UIKit

class CardViewController: UIViewController {
	
	@IBOutlet weak var handlerView: UIView!
	
	override func viewDidLoad() {
		super.viewDidLoad()
		
			
		self.handlerView.layer.cornerRadius = 25
		self.handlerView.layer.maskedCorners = [.layerMinXMinYCorner, .layerMaxXMinYCorner]
		view.layer.cornerRadius = 25
	
		
	}
	
	
}

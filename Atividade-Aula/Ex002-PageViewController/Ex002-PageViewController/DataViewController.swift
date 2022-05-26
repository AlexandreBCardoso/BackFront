//
//  DataViewController.swift
//  Ex002-PageViewController
//
//  Created by Alexandre Cardoso on 17/02/21.
//

import UIKit

class DataViewController: UIViewController {
	
	@IBOutlet weak var displayLabel: UILabel!
	
	static let identifier: String = "DataViewController"
	var displayText: String?
	var index: Int?
	
	override func viewDidLoad() {
		super.viewDidLoad()
		
		self.displayLabel.text = displayText
	}
	
}

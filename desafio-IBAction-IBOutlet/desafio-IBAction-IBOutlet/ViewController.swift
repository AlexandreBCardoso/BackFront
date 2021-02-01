//
//  ViewController.swift
//  desafio-IBAction-IBOutlet
//
//  Created by Alexandre Cardoso on 31/01/21.
//

import UIKit

class ViewController: UIViewController {
	
	// MARK: - IBOutlet
	
	@IBOutlet weak var primeiroLabel: UILabel!
	@IBOutlet weak var segundoLabel: UILabel!
	@IBOutlet weak var terceiroLabel: UILabel!
	
	var nomes = ["Caio", "Felipe", "Alexandre"]
	

	override func viewDidLoad() {
		super.viewDidLoad()
	}
	
	
	// MARK: - IBAction
	
	@IBAction func popularLabel(_ sender: UIButton) {
		
		// Embarralha o Array
		self.nomes.shuffle()
		
		self.primeiroLabel.text = nomes[0]
		self.segundoLabel.text	= nomes[1]
		self.terceiroLabel.text = nomes[2]
		
	}
	

}


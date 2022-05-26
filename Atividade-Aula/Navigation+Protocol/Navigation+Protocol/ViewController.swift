//
//  ViewController.swift
//  Navigation+Protocol
//
//  Created by Alexandre Cardoso on 08/02/21.
//

import UIKit

class ViewController: UIViewController {
	
	@IBOutlet weak var labelTela01: UILabel!
	
	override func viewDidLoad() {
		super.viewDidLoad()
	}
	
	// Método é chamado toda a vez que a ... desaparecer
	override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
		
		if segue.identifier == "Tela_02VC" {
			
			if let confirmarVC = segue.destination as? Tela_02ViewController {
				confirmarVC.view.backgroundColor = .brown
//				confirmarVC.valueLabel.text = "Consegui chegar"
				confirmarVC.atribuirValor(valor: "Consegui Chegar")
				
				confirmarVC.delegate = self
			}
			
		}
		
	}

}

extension ViewController: Tela02VCProtocol {
	func testeProtocol(valor: String) {
		print("valor \(valor)")
		self.labelTela01.text = valor
	}
	
	

	
}

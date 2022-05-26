//
//  ViewController.swift
//  PickerView
//
//  Created by Alexandre Cardoso on 07/02/21.
//

import UIKit

class ViewController: UIViewController {
	
	@IBOutlet weak var pickerView: UIPickerView!
	@IBOutlet weak var nomeLabel: UILabel!
	
	let nomes = ["Alexandre", "Ellen", "Renato", "Caio"]
	
	
	override func viewDidLoad() {
		super.viewDidLoad()
		
		self.configPickerView()
	}
	
	func configPickerView() {
		self.pickerView.delegate = self
		self.pickerView.dataSource = self
	}
	
	
}


// MARK: - Extension

extension ViewController: UIPickerViewDelegate, UIPickerViewDataSource {
	
	func numberOfComponents(in pickerView: UIPickerView) -> Int {
		return 1
	}
	
	func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
		return nomes.count
	}
	
	
	func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
		return nomes[row]
	}
	
	func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
			nomeLabel.text = nomes[row]
		
	}
	
	
}


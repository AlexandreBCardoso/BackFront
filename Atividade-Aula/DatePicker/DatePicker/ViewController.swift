//
//  ViewController.swift
//  DatePicker
//
//  Created by Alexandre Cardoso on 07/02/21.
//

import UIKit

class ViewController: UIViewController {
	
	@IBOutlet weak var datePicker: UIDatePicker!
	@IBOutlet weak var dataLabel: UILabel!
	

	override func viewDidLoad() {
		super.viewDidLoad()
		self.configDatePicker()
	}
	
	
  
	
	// Método para Configurar o DatePicker
	func configDatePicker() {
		self.datePicker.locale = NSLocale.init(localeIdentifier: "pt-BR") as Locale
		
		self.datePicker.minimumDate = Calendar.current.date(byAdding: .year, value: -100, to: Date())
		self.datePicker.maximumDate = Calendar.current.date(byAdding: .year, value: -18, to: Date())
	}

	@IBAction func tappedDatePicker(_ sender: UIDatePicker) {
		let dateFormatter = DateFormatter()
		// Estilo da Data
		dateFormatter.dateStyle = .long
		// Localizacao Data
		dateFormatter.locale = NSLocale.init(localeIdentifier: "pt-BR") as Locale
		
		// variavel formatada com a Date
		let valorData = dateFormatter.string(from: sender.date)
		
		
		self.dataLabel.text = valorData
		
	}
	
}


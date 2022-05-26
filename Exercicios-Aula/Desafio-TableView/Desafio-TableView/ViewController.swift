//
//  ViewController.swift
//  Desafio-TableView
//
//  Created by Alexandre Cardoso on 10/02/21.
//

import UIKit

class ViewController: UIViewController {
	
	@IBOutlet weak var tableView: UITableView!
	
	var carros: [String] = ["Fiat", "BMW", "Ferrai", "VW", "Pegout"]
	

	override func viewDidLoad() {
		super.viewDidLoad()
		
		self.configTableView()
	}
	
	private func configTableView() {
		self.tableView.delegate = self
		self.tableView.dataSource = self
	}


}


extension ViewController: UITableViewDelegate, UITableViewDataSource {
	
	func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
		return carros.count
	}
	
	func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
		
		let carro = self.carros[indexPath.row]
		
		let cell = tableView.dequeueReusableCell(withIdentifier: "celulaReuso", for: indexPath)
		
		cell.imageView?.image = UIImage(named: "imagemCarro")
		cell.textLabel?.text = carro
		
		return cell
	}
	
	func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
		print(carros[indexPath.row])
	}
	
	func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
		print(#function)
	}
	
	
}

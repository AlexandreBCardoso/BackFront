//
//  ViewController.swift
//  Ex001-CoreData
//
//  Created by Alexandre Cardoso on 17/03/21.
//

import UIKit

class ViewController: UIViewController {
	
	// MARK: - IBOutlet
	@IBOutlet weak var listaTableView: UITableView!
	@IBOutlet weak var nameTextField: UITextField!
	@IBOutlet weak var ageTextField: UITextField!
	
	// MARK: - Variable
	var controller: MainController = MainController()
	let dataManager: DataManager = DataManager()
	
	
	// MARK: - Life Cycle
	override func viewDidLoad() {
		super.viewDidLoad()
		configTableView()
		loadData()
	}
	
	
	// MARK: - Function
	private func configTableView() {
		self.listaTableView.delegate = self
		self.listaTableView.dataSource = self
	}
	
	func loadData() {
		self.dataManager.loadData { (success) in
			if success {
				self.listaTableView.reloadData()
			}
		}
	}
	
	
	// MARK: - IBAction
	@IBAction func tappedAddButton(_ sender: UIButton) {
		let name = self.nameTextField.text ?? ""
		let age = Int64(self.ageTextField.text ?? "") ?? 0
		
		self.dataManager.saveAndAddInformation(name: name, age: age) { (success) in
			
			if success {
				self.loadData()
				self.nameTextField.text = nil
				self.ageTextField.text = nil
				
			} else {
				print("Não salvou")
			}
			
		}
	}
	
	
	@IBAction func tappedRemoveButton(_ sender: UIButton) {
		let name = self.nameTextField.text ?? ""
		
		self.dataManager.deletePerson(name: name) { (success) in
			if success {
				self.loadData()
				self.nameTextField.text = nil
				self.ageTextField.text = nil
				
			} else {
				print("Erro no Delete")
			}
		}
	}
	
}


// MARK: - Extension TableView
extension ViewController: UITableViewDelegate, UITableViewDataSource {
	
	func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//		return self.controller.getCount() ?? 0
		return self.dataManager.countInformation()
	}
	
	func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//		let user = self.controller.getUser(indexPath: indexPath)
		let name = self.dataManager.dataInformation(key: "name", indexPath: indexPath)
		let age  = self.dataManager.dataInformation(key: "age", indexPath: indexPath)
		let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
		
		cell.textLabel?.text = name
		cell.detailTextLabel?.text = age
		
		return cell
		
	}
	
	
}


//
//  ViewController.swift
//  Ex001-TableViewAvancada
//
//  Created by Alexandre Cardoso on 10/02/21.
//

import UIKit

class ViewController: UIViewController {

	@IBOutlet weak var tableView: UITableView!
	
	var users: [Pessoa] = []
	
	override func viewDidLoad() {
		super.viewDidLoad()

		self.configTableView()
		self.adicionaPessoaArray()
	}
	
	private func configTableView() {
		self.tableView.delegate = self
		self.tableView.dataSource = self
		self.tableView.register(CustomTableViewCell.nib(), forCellReuseIdentifier: CustomTableViewCell.identifier)
	}
	
	private func adicionaPessoaArray() {
		self.users.append(Pessoa( nome: "Alexandre",
															idade: 33,
															profissao: "SAP ABAP",
															salario: "5.200,00",
															imageUser: UIImage(systemName: "person.circle") ?? UIImage())
		)
		self.users.append(Pessoa(nome: "Caio", idade: 33, profissao: "iOS Develoer", salario: "15.200,00", imageUser: UIImage(systemName: "person.circle") ?? UIImage()))
		self.users.append(Pessoa(nome: "Felipe", idade: 33, profissao: "Tech Lead", salario: "50.000,00", imageUser: UIImage(systemName: "person.circle") ?? UIImage()))
		self.users.append(Pessoa(nome: "Lucas", idade: 33, profissao: "iOS Develoer", salario: "1.200,00", imageUser: UIImage(systemName: "person.circle") ?? UIImage()))
	}


}


// MARK: - Extensions

extension ViewController: UITableViewDelegate, UITableViewDataSource {
	
	func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
		return self.users.count
	}
	
	func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
		let celula = tableView.dequeueReusableCell(withIdentifier: CustomTableViewCell.identifier, for: indexPath) as? CustomTableViewCell
	
		celula?.setupCell(pessoa: self.users[indexPath.row])
		
		return celula ?? UITableViewCell()
	}
	
	
}

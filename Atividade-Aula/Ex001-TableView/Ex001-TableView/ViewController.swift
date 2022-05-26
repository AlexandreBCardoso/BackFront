//
//  ViewController.swift
//  Ex001-TableView
//
//  Created by Alexandre Cardoso on 10/02/21.
//

import UIKit

class ViewController: UIViewController {
	
	@IBOutlet weak var tableView: UITableView!
	
	var nomes: [String] = ["Felipe", "Caio", "Lucas", "Tonon", "Danilo", "Junior", "Alexandre"]
	var pessoas = [Pessoa]()
	
	
	override func viewDidLoad() {
		super.viewDidLoad()
		
		self.configTableView()
		self.criarPessoas()
	}
	
	private func configTableView() {
		self.tableView.delegate = self
		self.tableView.dataSource = self
	}
	
	private func criarPessoas() {
		self.pessoas.append(Pessoa(nome: "Felipe", sobrenome: "BackFront"))
		self.pessoas.append(Pessoa(nome: "Caio", sobrenome: "Fabrini"))
		self.pessoas.append(Pessoa(nome: "Lucas", sobrenome: "Munho"))
		self.pessoas.append(Pessoa(nome: "André", sobrenome: "Tonon"))
		self.pessoas.append(Pessoa(nome: "Danilo", sobrenome: "Uvara"))
		self.pessoas.append(Pessoa(nome: "Junior", sobrenome: "iOS"))
		self.pessoas.append(Pessoa(nome: "Alexandre", sobrenome: "Cardoso"))
	}
	
	
}


// MARK: - Extensions

extension ViewController: UITableViewDelegate, UITableViewDataSource {
	
	func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
		return 0
//		return pessoas.count
	}
	
	func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
		let identifier: String = "celulaReuso"
		let celula = tableView.dequeueReusableCell(withIdentifier: identifier, for: indexPath)
		
//		celula.textLabel?.text = self.nomes[indexPath.row]
//		celula.detailTextLabel?.text = "Olha só o detalhe"
		celula.textLabel?.text = self.pessoas[indexPath.row].nome
//		celula.detailTextLabel?.text = self.pessoas[indexPath.row].sobrenome

		
		return celula
	}
	
	
}

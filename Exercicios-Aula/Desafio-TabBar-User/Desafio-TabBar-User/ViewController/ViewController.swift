//
//  ViewController.swift
//  Desafio-TabBar-User
//
//  Created by Alexandre Cardoso on 14/02/21.
//

import UIKit

class ViewController: UIViewController {
	
	// MARK: - IBOutlet
	@IBOutlet weak var academyLabel: UILabel!
	@IBOutlet weak var adicionarMembroButton: UIButton!
	@IBOutlet weak var tableView: UITableView!
	
	// MARK: - variable
	var membros: [Membro] = []

	
	// MARK: - Init
	override func viewDidLoad() {
		super.viewDidLoad()
		
//		membros.append(Membro(nome: "Alexandre", idade: 33, categoria: Categoria.aluno, conhecimento: "", imagem: UIImage()))
		
		self.configButton()
		self.configTableView()
	}
	
	
	// MARK: Function
	func configButton() {
		self.adicionarMembroButton.layer.cornerRadius = 25
	}
	
	func configTableView() {
		self.tableView.delegate = self
		self.tableView.dataSource = self
		self.tableView.separatorStyle = .none
		self.tableView.backgroundColor = #colorLiteral(red: 0.1443515718, green: 0.1443831027, blue: 0.1443473697, alpha: 1)
		self.tableView.register(CadastroMembroCell.nib(), forCellReuseIdentifier: CadastroMembroCell.identifier)
		self.tableView.register(ProfessorTableViewCell.nib(), forCellReuseIdentifier: ProfessorTableViewCell.identifier)
	}
	
	override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
		if segue.identifier == "segueCadastro" {
			if let cadastroVC = segue.destination as? CadastroMembroVC {
				cadastroVC.delegate = self
			}
		}
	}
	
	
	// MARK: - Action
	@IBAction func tappedAdicionarMembro(_ sender: UIButton) {
		print("Tapped Adicionar!")
		self.performSegue(withIdentifier: "segueCadastro", sender: nil)
		
	}
	
	
}


// MARK: - Extension - TableView
extension ViewController: UITableViewDelegate, UITableViewDataSource {
	
	func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
		return self.membros.count
	}
	
	func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
		let membro = self.membros[indexPath.row]
		let cellMembro = tableView.dequeueReusableCell(withIdentifier: CadastroMembroCell.identifier, for: indexPath) as? CadastroMembroCell
		let cellProfessor = tableView.dequeueReusableCell(withIdentifier: ProfessorTableViewCell.identifier) as? ProfessorTableViewCell
		
		// Validação da Categoria de Membro
		switch membro.categoria {
			
			case Categoria.aluno:
				cellMembro?.preencherCell(membro: membro)
				return cellMembro ?? UITableViewCell()
				
			case Categoria.professor:
				return cellProfessor ?? UITableViewCell()
		}
		
	}
	
	func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
		if editingStyle == .delete {
			self.membros.remove(at: indexPath.row)
			self.tableView.deleteRows(at: [indexPath], with: .fade)
		}
	}
	
	
}


// MARK: - Extension - CadastroDelegate
extension ViewController: CadastroMembroDelegate {

	func infosMembros(_ membro: Membro) {
		print("ViewController - CadastroMembroDelegate - infosMembros")
		self.membros.append(membro)
		
		DispatchQueue.main.async {
			self.tableView.reloadData()
		}
		
		
	}


}

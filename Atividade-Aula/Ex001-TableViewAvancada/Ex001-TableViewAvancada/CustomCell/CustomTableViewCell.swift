//
//  CustomTableViewCell.swift
//  Ex001-TableViewAvancada
//
//  Created by Alexandre Cardoso on 10/02/21.
//

import UIKit

class CustomTableViewCell: UITableViewCell {
	
	@IBOutlet weak var imageUserImageView: UIImageView!
	@IBOutlet weak var nomeLabel: UILabel!
	@IBOutlet weak var idadeLabel: UILabel!
	@IBOutlet weak var profissaoLabel: UILabel!
	@IBOutlet weak var salarioLabel: UILabel!
	
	static let identifier: String = "CustomTableViewCell"
	
	
	override func awakeFromNib() {
		super.awakeFromNib()
	}
	
	static func nib() -> UINib {
		return UINib(nibName: self.identifier, bundle: nil)
	}
	
	func setupCell(pessoa: Pessoa) {
		self.imageUserImageView.image = pessoa.imageUser
		self.nomeLabel.text = "Nome: \(pessoa.nome)"
		self.idadeLabel.text = "Idade: \(pessoa.idade)"
		self.profissaoLabel.text = "Profissão: \(pessoa.profissao)"
		self.salarioLabel.text = "Salário: R$ \(pessoa.salario)"
	}
	
	
}

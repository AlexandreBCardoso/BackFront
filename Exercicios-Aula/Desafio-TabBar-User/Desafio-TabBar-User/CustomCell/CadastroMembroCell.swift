//
//  CadastroMembroCell.swift
//  Desafio-TabBar-User
//
//  Created by Alexandre Cardoso on 14/02/21.
//

import UIKit

class CadastroMembroCell: UITableViewCell {
	
	@IBOutlet weak var telaView: UIView!
	@IBOutlet weak var imageMembroImageView: UIImageView!
	@IBOutlet weak var nomeLabel: UILabel!
	@IBOutlet weak var idadeLabel: UILabel!
	
	
	static let identifier: String = "CadastroMembroCell"
	
	static func nib() -> UINib {
		return UINib(nibName: self.identifier, bundle: nil)
	}
	
	
	override func awakeFromNib() {
		super.awakeFromNib()
		// Initialization code
		
		self.configLayout()
	}
	
	func configLayout() {
		self.telaView.layer.cornerRadius = 15
		self.imageMembroImageView.layer.cornerRadius = 40
	}
	
	
	func preencherCell(membro: Membro) {
		self.imageMembroImageView.image = membro.imagem
		self.nomeLabel.text = membro.nome
		self.idadeLabel.text = "Idade: \(membro.idade)"
	}
	
	
}

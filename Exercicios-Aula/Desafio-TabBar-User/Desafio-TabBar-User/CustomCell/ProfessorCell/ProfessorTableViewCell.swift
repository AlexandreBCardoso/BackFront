//
//  ProfessorTableViewCell.swift
//  Desafio-TabBar-User
//
//  Created by Alexandre Cardoso on 15/02/21.
//

import UIKit

class ProfessorTableViewCell: UITableViewCell {
	
	@IBOutlet weak var imageUserImageView: UIImageView!
	@IBOutlet weak var nomeLabel: UILabel!
	@IBOutlet weak var idadeLabel: UILabel!
	@IBOutlet weak var conhecimentoLabel: UILabel!
	
	
 static let identifier = "ProfessorTableViewCell"
	
	static func nib() -> UINib {
		return UINib(nibName: self.identifier, bundle: nil)
	}
	
	
	override func awakeFromNib() {
		super.awakeFromNib()
		// Initialization code
	}
	
	
	func preencherCell(membro: Membro) {
		self.imageUserImageView.image = membro.imagem
		self.nomeLabel.text = membro.nome
		self.idadeLabel.text = "Idade: \(membro.idade)"
		self.conhecimentoLabel.text = "Conhecimento em \(membro.conhecimento)"
	}
	
	
}

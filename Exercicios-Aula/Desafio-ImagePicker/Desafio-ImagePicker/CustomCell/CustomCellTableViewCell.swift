//
//  CustomCellTableViewCell.swift
//  Desafio-ImagePicker
//
//  Created by Alexandre Cardoso on 14/02/21.
//

import UIKit

class CustomCellTableViewCell: UITableViewCell {
	
	@IBOutlet weak var imageUserImageView: UIImageView!
	@IBOutlet weak var nomeLabel: UILabel!
	@IBOutlet weak var celulaView: UIView!
	
	
	static let identifier: String = "CustomCellTableViewCell"
	
	static func nib() -> UINib {
		return UINib(nibName: self.identifier, bundle: nil)
	}
	
	override func awakeFromNib() {
		super.awakeFromNib()
		// Initialization code
		
		self.configCell()
	}
	
	
	func configCell() {
		self.celulaView.layer.cornerRadius = 10
		self.imageUserImageView.layer.cornerRadius = 15
	}
	
	func setInfo(to with: Pessoa) {
		self.imageUserImageView.image = with.imagemUser
		self.nomeLabel.text = with.nome
	}
	
	
}

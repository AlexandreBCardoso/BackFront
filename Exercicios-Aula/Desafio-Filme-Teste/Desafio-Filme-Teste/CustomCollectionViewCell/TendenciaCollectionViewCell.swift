//
//  TendenciaCollectionViewCell.swift
//  Desafio-Filme-Teste
//
//  Created by Alexandre Cardoso on 21/02/21.
//

import UIKit

class TendenciaCollectionViewCell: UICollectionViewCell {
	
	static let identifier: String = "TendenciaCollectionViewCell"
	
	@IBOutlet weak var imageMovieImageView: UIImageView!
	@IBOutlet weak var nomeFilmeLbal: UILabel!
	@IBOutlet weak var generoFilmeLabel: UILabel!
	
	static func nib() -> UINib {
		return UINib(nibName: self.identifier, bundle: nil)
	}
	
	override func awakeFromNib() {
		super.awakeFromNib()
		// Initialization code
		self.configImageView()
	}
	
	func configCell(value: Filme) {
		self.imageMovieImageView.image = value.imageMovie
		self.nomeFilmeLbal.text = value.titleMovie
		self.generoFilmeLabel.text = value.data
	}
	
	func configImageView() {
		self.imageMovieImageView.layer.borderWidth = 1.5
		self.imageMovieImageView.layer.borderColor = UIColor.lightGray.cgColor
		self.imageMovieImageView.clipsToBounds = true
		self.imageMovieImageView.layer.cornerRadius = 15
	}
	
}

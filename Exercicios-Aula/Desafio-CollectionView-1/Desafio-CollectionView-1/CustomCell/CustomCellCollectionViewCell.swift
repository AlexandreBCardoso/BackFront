//
//  CustomCellCollectionViewCell.swift
//  Desafio-CollectionView-1
//
//  Created by Alexandre Cardoso on 15/02/21.
//

import UIKit

class CustomCellCollectionViewCell: UICollectionViewCell {
	
	@IBOutlet weak var imageCarImageView: UIImageView!
	
	static let identifier: String = "CustomCellCollectionViewCell"
	
	static func nib() -> UINib {
		return UINib(nibName: self.identifier, bundle: nil)
	}
	
	override func awakeFromNib() {
		super.awakeFromNib()
		// Initialization code
	}
	
	func setupCell(carroImagem: String) {
		self.imageCarImageView.image = UIImage(named: carroImagem)
	}
	
}

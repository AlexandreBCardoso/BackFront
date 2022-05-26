//
//  CustomCollectionViewCell.swift
//  Ex001-TableView-CollectionView
//
//  Created by Alexandre Cardoso on 15/02/21.
//

import UIKit

class CustomCollectionViewCell: UICollectionViewCell {
	
	@IBOutlet weak var imageCarImageView: UIImageView!
	
	static let identifier: String = "CustomCollectionViewCell"
	
	static func nib() -> UINib {
		return UINib(nibName: self.identifier, bundle: nil)
	}
	
	override func awakeFromNib() {
		super.awakeFromNib()
		// Initialization code
	}
	
	func setupImage(nameImage: String) {
		self.imageCarImageView.image = UIImage(named: nameImage)
	}
	
}

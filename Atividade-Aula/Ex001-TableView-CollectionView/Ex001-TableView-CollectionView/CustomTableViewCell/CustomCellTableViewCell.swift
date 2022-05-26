//
//  CustomCellTableViewCell.swift
//  Ex001-TableView-CollectionView
//
//  Created by Alexandre Cardoso on 15/02/21.
//

import UIKit

class CustomCellTableViewCell: UITableViewCell {
	
	@IBOutlet weak var nomeCell: UILabel!
	@IBOutlet weak var collectionView: UICollectionView!
	
	var carros: [String] = ["car1", "car2", "car3", "car4", "car5", "car6"]
	
	
	static let identifier: String = "CustomCellTableViewCell"
	
	static func nib() -> UINib {
		return UINib(nibName: self.identifier, bundle: nil)
	}

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
			
			self.configCollectionView()
    }
	
	
	private func configCollectionView() {
		self.collectionView.delegate = self
		self.collectionView.dataSource = self
		self.collectionView.register(CustomCollectionViewCell.nib(), forCellWithReuseIdentifier: CustomCollectionViewCell.identifier)
		
		if let layout = self.collectionView.collectionViewLayout as? UICollectionViewFlowLayout {
			layout.scrollDirection = .horizontal
		}
		
	}
    
}


// MARK: - Extension CollectionView
extension CustomCellTableViewCell: UICollectionViewDelegate, UICollectionViewDataSource {
	
	func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
		return carros.count
	}
	
	func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
		let carro = self.carros[indexPath.row]
		let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CustomCollectionViewCell.identifier, for: indexPath) as? CustomCollectionViewCell
		cell?.setupImage(nameImage: carro)
		
		return cell ?? UICollectionViewCell()
	}
	
	
}

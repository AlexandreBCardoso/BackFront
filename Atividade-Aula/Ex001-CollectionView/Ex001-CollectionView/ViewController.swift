//
//  ViewController.swift
//  Ex001-CollectionView
//
//  Created by Alexandre Cardoso on 15/02/21.
//

import UIKit

class ViewController: UIViewController {
	
	// MARK: - IBOutlet
	@IBOutlet weak var collectionView: UICollectionView!
	
	// MARK: - Variable
	var carros: [String] = ["car1", "car2", "car3", "car4", "car5", "car6"]
	
	override func viewDidLoad() {
		super.viewDidLoad()
		// Do any additional setup after loading the view.
		
		self.configCollectionView()
	}
	
	
	// MARK: - Function
	func configCollectionView() {
		self.collectionView.delegate = self
		self.collectionView.dataSource = self
		self.collectionView.register(CustomCellCollectionViewCell.nib(), forCellWithReuseIdentifier: CustomCellCollectionViewCell.identifier)
		
		if let layout = self.collectionView.collectionViewLayout as? UICollectionViewFlowLayout {
			layout.scrollDirection = .horizontal
		}
		
	}


}


// MARK: - Extension CollectionView
extension ViewController: UICollectionViewDelegate, UICollectionViewDataSource {
	
	func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
		return carros.count
	}
	
	func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
		let carro = self.carros[indexPath.row]
		let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CustomCellCollectionViewCell.identifier, for: indexPath) as? CustomCellCollectionViewCell
		
		cell?.setupCarro(carroImagem: carro)
		
		return cell ?? UICollectionViewCell()
	}
	
	
}


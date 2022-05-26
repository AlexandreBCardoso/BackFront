//
//  TendenciasTableViewCell.swift
//  Desafio-Filme-Teste
//
//  Created by Alexandre Cardoso on 21/02/21.
//

import UIKit

class TendenciasTableViewCell: UITableViewCell {
	
	@IBOutlet weak var titleLabel: UILabel!
	static let identifier: String = "TendenciasTableViewCell"
	
	@IBOutlet weak var collectionView: UICollectionView!
	
	private var filmes: [Filme] = []
	
	static func nib() -> UINib {
		return UINib(nibName: self.identifier, bundle: nil)
	}
	
	override func awakeFromNib() {
		super.awakeFromNib()
		// Initialization code
		configCollectionView()
	}
	
	func labelSetup(title: String) {
		self.titleLabel.text = title
	}
	
	func configCollectionView() {
		self.collectionView.delegate = self
		self.collectionView.dataSource = self
		self.collectionView.register(TendenciaCollectionViewCell.nib(), forCellWithReuseIdentifier: TendenciaCollectionViewCell.identifier)
	}
	
	func getFilmes(value: [Filme]) {
		self.filmes = value
	}
	
	
}



// MARK: - Extension CollectionView
extension TendenciasTableViewCell: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
	
	func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
		return self.filmes.count
	}
	
	func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
		let filme = self.filmes[indexPath.row]
		let cell = collectionView.dequeueReusableCell(withReuseIdentifier: TendenciaCollectionViewCell.identifier, for: indexPath) as? TendenciaCollectionViewCell
		cell?.configCell(value: filme)
		
		return cell ?? UICollectionViewCell()
	}
	
	func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
		return CGSize(width: 247, height: 255)
	}
	
}

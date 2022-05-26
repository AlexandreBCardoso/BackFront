//
//  DetailUserCell.swift
//  Ex002-ViewCode
//
//  Created by Alexandre Cardoso on 05/04/21.
//

import UIKit

class DetailUserCell: UITableViewCell {
	
	// MARK: - Variable
	lazy private var subView: UIView = {
		let view = UIView()
		return view
	}()
	
	lazy var imageUserImageView: UIImageView = {
		let image = UIImageView()
		image.image = UIImage(named: "logo")
		image.clipsToBounds = true
		image.contentMode = .scaleAspectFit
		
		return image
	}()
	
	lazy var nameLabel: UILabel = {
		let label = UILabel()
		label.text = "Alexandre"
		label.textColor = .darkGray
		label.textAlignment = .center
		
		return label
	}()
	
	static let identifier: String = "DetailUserCell"
	
	
	// MARK: - Inicializador
	override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
		super.init(style: style, reuseIdentifier: reuseIdentifier)
		
		self.addSubview(self.subView)
		self.addSubview(self.imageUserImageView)
		self.addSubview(self.nameLabel)
		
		configSubView()
		configImageUserImageView()
		configNameLabel()
	}
	
	required init?(coder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}
	
	
	// MARK: - Function
	private func configSubView() {
		self.subView.snp.makeConstraints { (make) in
			make.edges.equalToSuperview()
			make.height.equalTo(120)
		}
	}
	
	private func configImageUserImageView() {
		self.imageUserImageView.snp.makeConstraints { (make) in
			make.centerY.equalToSuperview()
			make.height.width.equalTo(80)
			make.leftMargin.equalToSuperview()
		}
	}
	
	private func configNameLabel() {
		self.nameLabel.snp.makeConstraints { (make) in
			make.centerY.equalToSuperview()
			make.left.equalTo(self.imageUserImageView.snp.right).offset(20)
		}
	}
	
}

//
//  MainView.swift
//  Ex003-ViewCode
//
//  Created by Alexandre Cardoso on 04/04/21.
//

import UIKit

class MainView: UIView {
	
	// MARK: - Variable Element UI
	lazy var nameLabel: UILabel = {
		let label = UILabel()
		label.text = "Warmmindo"
		label.font = UIFont.boldSystemFont(ofSize: 30)
		label.textColor = .black
		
		return label
	}()
	
	lazy var descriptionLabel: UILabel = {
		let label = UILabel()
		label.text = "What makes Indomie more perfect?"
		label.numberOfLines = 0
		label.font = UIFont.systemFont(ofSize: 25)
		label.textColor = .black
		
		return label
	}()
	
	lazy var bannerView: UIView = {
		let banner = UIView()
		banner.backgroundColor = .lightGray
		banner.layer.cornerRadius = 15
		banner.clipsToBounds = true
		
		return banner
	}()
	
	lazy var pratoLabel: UILabel = {
		let label = UILabel()
		label.text = "X Burguer"
		label.font = UIFont.systemFont(ofSize: 15)
		label.textAlignment = .center
		label.textColor = .black
		
		return label
	}()
	
	lazy var popularLabel: UILabel = {
		let label = UILabel()
		label.text = "Most popular"
		label.font = UIFont.boldSystemFont(ofSize: 20)
		label.textAlignment = .left
		label.textColor = .black
		
		return label
	}()
	
	lazy var seeLabel: UILabel = {
		let label = UILabel()
		label.text = "See all"
		label.font = UIFont.systemFont(ofSize: 15)
		label.textAlignment = .right
		label.textColor = .lightGray
		
		return label
	}()
	
	
	// MARK: - Inicializator
	override init(frame: CGRect) {
		super.init(frame: frame)
		
		addElementUI()
		configureConstraints()
	}
	
	required init?(coder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}
	
	
	// MARK: - Function
	private func addElementUI() {
		addSubview(nameLabel)
		addSubview(descriptionLabel)
		addSubview(bannerView)
		addSubview(pratoLabel)
		addSubview(popularLabel)
		addSubview(seeLabel)
	}
	
	private func configureConstraints() {
		setNameLabelConstraints()
		setDescriptionLabelConstraints()
		setBannerViewConstraints()
		setPratoLabelConstraints()
		setPopularLabelConstraints()
		setSeeLabelConstraints()
	}
	
	private func setNameLabelConstraints() {
		self.nameLabel.translatesAutoresizingMaskIntoConstraints = false
		self.nameLabel.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor, constant: 30).isActive = true
		self.nameLabel.leadingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leadingAnchor, constant: 20).isActive = true
	}
		
	private func setDescriptionLabelConstraints() {
		self.descriptionLabel.translatesAutoresizingMaskIntoConstraints = false
		self.descriptionLabel.topAnchor.constraint(equalTo: self.nameLabel.bottomAnchor, constant: 10).isActive = true
		self.descriptionLabel.leadingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leadingAnchor, constant: 20).isActive = true
		self.descriptionLabel.trailingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.trailingAnchor, constant: -15).isActive = true
	}
		
	private func setBannerViewConstraints() {
		self.bannerView.translatesAutoresizingMaskIntoConstraints = false
		self.bannerView.topAnchor.constraint(equalTo: self.descriptionLabel.bottomAnchor, constant: 20).isActive = true
		self.bannerView.leadingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leadingAnchor, constant: 20).isActive = true
		self.bannerView.trailingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.trailingAnchor, constant: -20).isActive = true
		self.bannerView.heightAnchor.constraint(equalToConstant: 120).isActive = true
	}
		
	private func setPratoLabelConstraints() {
		self.pratoLabel.translatesAutoresizingMaskIntoConstraints = false
		self.pratoLabel.centerYAnchor.constraint(equalTo: self.bannerView.centerYAnchor).isActive = true
		self.pratoLabel.leadingAnchor.constraint(equalTo: self.bannerView.leadingAnchor, constant: 30).isActive = true
		self.pratoLabel.trailingAnchor.constraint(equalTo: self.bannerView.trailingAnchor, constant: -30).isActive = true
	}
		
	private func setPopularLabelConstraints() {
		self.popularLabel.translatesAutoresizingMaskIntoConstraints = false
		self.popularLabel.topAnchor.constraint(equalTo: self.bannerView.bottomAnchor, constant: 15).isActive = true
		self.popularLabel.leadingAnchor.constraint(equalTo: self.bannerView.leadingAnchor).isActive = true
		self.popularLabel.trailingAnchor.constraint(equalTo: self.seeLabel.leadingAnchor, constant: -10).isActive = true
	}
		
	private func setSeeLabelConstraints() {
		self.seeLabel.translatesAutoresizingMaskIntoConstraints = false
		self.seeLabel.topAnchor.constraint(equalTo: self.popularLabel.topAnchor).isActive = true
		self.seeLabel.trailingAnchor.constraint(equalTo: self.bannerView.trailingAnchor).isActive = true
		self.seeLabel.widthAnchor.constraint(equalToConstant: 60).isActive = true
	}
	
}

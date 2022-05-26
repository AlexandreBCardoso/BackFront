//
//  RegisterScreen.swift
//  Ex001-ViewCode
//
//  Created by Alexandre Cardoso on 29/03/21.
//

import UIKit

protocol RegisterScreenProtocol: class {
	func actionVoltar()
}

class RegisterScreen: UIView {
	
	weak private var delegate: RegisterScreenProtocol?

	lazy var voltarButton: UIButton = {
		let button = UIButton()
		button.translatesAutoresizingMaskIntoConstraints = false
		button.setTitle("Voltar", for: .normal)
		button.titleLabel?.font = UIFont.systemFont(ofSize: 20)
		button.setTitleColor(.white, for: .normal)
		button.backgroundColor = UIColor(red: 20/255, green: 60/255, blue: 55/255, alpha: 1.0)
		button.layer.cornerRadius = 7.5
		
		button.addTarget(self, action: #selector(self.tappedScreenVoltar), for: .touchUpInside)
		return button
	}()
	
	
	// MARK: - Inicializator
	override init(frame: CGRect) {
		super.init(frame: frame)
		
		self.backgroundColor = .purple
		self.addSubview(voltarButton)
		self.setupConstraints()
	}
	
	required init?(coder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}
	
	
	// MARK: - Funcion
	private func setupConstraints() {
		NSLayoutConstraint.activate([
			self.voltarButton.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor, constant: CGFloat(50)),
			self.voltarButton.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: CGFloat(60)),
			self.voltarButton.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: CGFloat(-60)),
			self.voltarButton.heightAnchor.constraint(equalToConstant: CGFloat(60))
		])
	}
	
	func delegate(delegate: RegisterScreenProtocol?) {
		self.delegate = delegate
	}
	
	@objc
	func tappedScreenVoltar() {
		self.delegate?.actionVoltar()
	}
	
}

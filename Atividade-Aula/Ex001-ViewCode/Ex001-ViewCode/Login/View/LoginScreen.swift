//
//  LoginScreen.swift
//  Ex001-ViewCode
//
//  Created by Alexandre Cardoso on 29/03/21.
//

import UIKit

protocol LoginScreenProtocol: class {
	func actionLogin()
	func actionRegister()
}

class LoginScreen: UIView {
	
	// MARK: - Variable
	weak var delegate: LoginScreenProtocol?
	let heightImageUser: CGFloat = 200
	
	lazy var logoAppImageView: UIImageView = {
		let image = UIImageView()
		image.image = UIImage(named: "logo")
		image.clipsToBounds = true
		image.contentMode = .scaleAspectFit
		image.translatesAutoresizingMaskIntoConstraints = false
		return image
	}()
	
	lazy var emailTextField: UITextField = {
		let tf = UITextField()
		tf.translatesAutoresizingMaskIntoConstraints = false
		tf.autocorrectionType = .no
		tf.backgroundColor = .white
		tf.layer.borderWidth = 1.5
		tf.layer.borderColor = UIColor.lightGray.cgColor
		tf.layer.cornerRadius = 7.5
		tf.clipsToBounds = true
		tf.keyboardType = .emailAddress
		tf.placeholder = "Email"
		tf.font = UIFont.systemFont(ofSize: 14)
		tf.textColor = .darkGray
		tf.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: 0))
		tf.leftViewMode = .always
		return tf
	}()
	
	lazy var passwordTextField: UITextField = {
		let tf = UITextField()
		tf.translatesAutoresizingMaskIntoConstraints = false
		tf.autocorrectionType = .no
		tf.backgroundColor = .white
		tf.layer.borderWidth = 1.5
		tf.layer.borderColor = UIColor.lightGray.cgColor
		tf.layer.cornerRadius = 7.5
		tf.clipsToBounds = true
		tf.isSecureTextEntry = true
		tf.placeholder = "Senha"
		tf.font = UIFont.systemFont(ofSize: 14)
		tf.textColor = .darkGray
		tf.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: 0))
		tf.leftViewMode = .always
		return tf
	}()
	
	lazy var loginButton: UIButton = {
		let button = UIButton()
		button.translatesAutoresizingMaskIntoConstraints = false
		button.setTitle("Logar", for: .normal)
		button.titleLabel?.font = UIFont.systemFont(ofSize: 20)
		button.setTitleColor(.white, for: .normal)
		button.backgroundColor = UIColor(red: 20/255, green: 60/255, blue: 55/255, alpha: 1.0)
		button.layer.cornerRadius = 7.5
		
		button.addTarget(self, action: #selector(self.tappedScreenLogin), for: .touchUpInside)
		return button
	}()
	
	lazy var registerButton: UIButton = {
		let button = UIButton()
		button.translatesAutoresizingMaskIntoConstraints = false
		button.setTitle("Não tem conta? Cadastre-se", for: .normal)
		button.titleLabel?.font = UIFont.systemFont(ofSize: 16)
		button.setTitleColor(.white, for: .normal)
		
		button.addTarget(self, action: #selector(self.tappedScreenRegister), for: .touchUpInside)
		return button
	}()
	
	
	// MARK: - Inicializadores
	override init(frame: CGRect) {
		super.init(frame: frame)
		
		self.backgroundColor = UIColor(red: 24/255, green: 117/255, blue: 104/255, alpha: 1.0)
		self.addElementView()
		self.setupConstraints()
	}
	
	required init?(coder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}
	
	
	// MARK: - Function
	@objc
	func tappedScreenRegister() {
		print(#function)
		self.delegate?.actionRegister()
	}
	
	@objc
	func tappedScreenLogin() {
		print(#function)
		self.delegate?.actionLogin()
	}
	
	private func addElementView() {
		self.addSubview(logoAppImageView)
		self.addSubview(emailTextField)
		self.addSubview(passwordTextField)
		self.addSubview(loginButton)
		self.addSubview(registerButton)
	}
	
	private func setupConstraints() {
		
		NSLayoutConstraint.activate([
			
			// Logo App
			self.logoAppImageView.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor,
																	 constant: CGFloat(20)),
			self.logoAppImageView.leadingAnchor.constraint(equalTo: self.leadingAnchor,
																		  constant: CGFloat(60)),
			self.logoAppImageView.trailingAnchor.constraint(equalTo: self.trailingAnchor,
																			constant: CGFloat(-60)),
			self.logoAppImageView.heightAnchor.constraint(equalToConstant: self.heightImageUser),
			
			// Email TextField
			self.emailTextField.topAnchor.constraint(equalTo: self.logoAppImageView.bottomAnchor,
																  constant: CGFloat(15)),
			self.emailTextField.leadingAnchor.constraint(equalTo: self.leadingAnchor,
																		constant: CGFloat(20)),
			self.emailTextField.trailingAnchor.constraint(equalTo: self.trailingAnchor,
																		 constant: CGFloat(-20)),
			self.emailTextField.heightAnchor.constraint(equalToConstant: CGFloat(45)),
			
			// Passsword TextField
			self.passwordTextField.topAnchor.constraint(equalTo: self.emailTextField.bottomAnchor,
																	  constant: CGFloat(10)),
			self.passwordTextField.leadingAnchor.constraint(equalTo: self.emailTextField.leadingAnchor),
			self.passwordTextField.trailingAnchor.constraint(equalTo: self.emailTextField.trailingAnchor),
			self.passwordTextField.heightAnchor.constraint(equalTo: self.emailTextField.heightAnchor),
			
			// Logar Button
			self.loginButton.topAnchor.constraint(equalTo: self.passwordTextField.bottomAnchor,
															  constant: CGFloat(10)),
			self.loginButton.leadingAnchor.constraint(equalTo: self.emailTextField.leadingAnchor),
			self.loginButton.trailingAnchor.constraint(equalTo: self.emailTextField.trailingAnchor),
			self.loginButton.heightAnchor.constraint(equalToConstant: CGFloat(50)),
			
			// Registrat Button
			self.registerButton.topAnchor.constraint(equalTo: self.loginButton.bottomAnchor, constant: CGFloat(15)),
			self.registerButton.leadingAnchor.constraint(equalTo: self.emailTextField.leadingAnchor),
			self.registerButton.trailingAnchor.constraint(equalTo: self.emailTextField.trailingAnchor)
//			self.registerButton.heightAnchor.constraint(equalToConstant: CGFloat(50)),
			
		])
		
	}
	
	func delegate(delegate: LoginScreenProtocol?) {
		self.delegate = delegate
	}
	
}

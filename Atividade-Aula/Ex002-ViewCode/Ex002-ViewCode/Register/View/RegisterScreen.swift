//
//  RegisterScreen.swift
//  Ex002-ViewCode
//
//  Created by Alexandre Cardoso on 31/03/21.
//

import UIKit

protocol RegisterScreenProtocol: class {
	func actionVoltar()
	func registerUser()
}

class RegisterScreen: UIView {
	
	// MARK: - Variable
	let heightImageUser: CGFloat = 150
	weak private var delegate: RegisterScreenProtocol?
	
	lazy var voltarButton: UIButton = {
		let button = UIButton(type: .system)
		button.translatesAutoresizingMaskIntoConstraints = false
//		button.setTitle("Cadastrar", for: .normal)
		button.setImage(UIImage(named: "back"), for: .normal)
		button.tintColor = .black
//		button.titleLabel?.font = UIFont.systemFont(ofSize: 20)
//		button.setTitleColor(.white, for: .normal)
//		button.backgroundColor = UIColor(red: 20/255, green: 60/255, blue: 55/255, alpha: 1.0)
//		button.layer.cornerRadius = 7.5
		
		button.addTarget(self, action: #selector(self.tappedScreenVoltar), for: .touchUpInside)
		return button
	}()
	
	lazy var logoAppImageView: UIImageView = {
		let image = UIImageView()
		image.image = UIImage(named: "usuario")
		image.tintColor = .white
		image.clipsToBounds = true
		image.contentMode = .scaleAspectFit
		image.translatesAutoresizingMaskIntoConstraints = false
		return image
	}()
	
	lazy var nameTextField: UITextField = {
		let tf = UITextField()
		tf.translatesAutoresizingMaskIntoConstraints = false
		tf.autocorrectionType = .no
		tf.backgroundColor = .white
		tf.layer.borderWidth = 1.5
		tf.layer.borderColor = UIColor.lightGray.cgColor
		tf.layer.cornerRadius = 7.5
		tf.clipsToBounds = true
		tf.keyboardType = .default
		tf.placeholder = "Nome"
		tf.font = UIFont.systemFont(ofSize: 14)
		tf.textColor = .darkGray
		tf.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: 0))
		tf.leftViewMode = .always
		return tf
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
		tf.placeholder = "Digite sua senha"
		tf.font = UIFont.systemFont(ofSize: 14)
		tf.textColor = .darkGray
		tf.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: 0))
		tf.leftViewMode = .always
		return tf
	}()
	
	lazy var cadastroButton: UIButton = {
		let button = UIButton(type: .system)
		button.translatesAutoresizingMaskIntoConstraints = false
		button.setTitle("Cadastrar", for: .normal)
		button.titleLabel?.font = UIFont.systemFont(ofSize: 20)
		button.setTitleColor(.white, for: .normal)
		button.backgroundColor = UIColor(red: 20/255, green: 60/255, blue: 55/255, alpha: 1.0)
		button.layer.cornerRadius = 7.5
		
		button.addTarget(self, action: #selector(self.tappedCadastrarButton(_:)), for: .touchUpInside)
		return button
	}()
	
	
	// MARK: - Inicializador
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
	private func addElementView() {
		self.addSubview(voltarButton)
		self.addSubview(logoAppImageView)
		self.addSubview(nameTextField)
		self.addSubview(emailTextField)
		self.addSubview(passwordTextField)
		self.addSubview(cadastroButton)
	}
	
	private func setupConstraints() {
		
		NSLayoutConstraint.activate([
			
			// Botão Voltar
			self.voltarButton.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor, constant: CGFloat(10)),
			self.voltarButton.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: CGFloat(30)),
			self.voltarButton.heightAnchor.constraint(equalToConstant: CGFloat(50)),
			self.voltarButton.widthAnchor.constraint(equalToConstant: CGFloat(30)),
			
			// Logo App
			self.logoAppImageView.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor,
																	 constant: CGFloat(20)),
			self.logoAppImageView.centerXAnchor.constraint(equalTo: self.centerXAnchor),
			self.logoAppImageView.heightAnchor.constraint(equalToConstant: self.heightImageUser),
			self.logoAppImageView.widthAnchor.constraint(equalToConstant: self.heightImageUser),
			
			// Nome TextField
			self.nameTextField.topAnchor.constraint(equalTo: self.logoAppImageView.bottomAnchor,
																  constant: CGFloat(15)),
			self.nameTextField.leadingAnchor.constraint(equalTo: self.leadingAnchor,
																		constant: CGFloat(20)),
			self.nameTextField.trailingAnchor.constraint(equalTo: self.trailingAnchor,
																		 constant: CGFloat(-20)),
			self.nameTextField.heightAnchor.constraint(equalToConstant: CGFloat(45)),
			
			// Email TextField
			self.emailTextField.topAnchor.constraint(equalTo: self.nameTextField.bottomAnchor,
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
			self.cadastroButton.topAnchor.constraint(equalTo: self.passwordTextField.bottomAnchor,
															  constant: CGFloat(10)),
			self.cadastroButton.leadingAnchor.constraint(equalTo: self.emailTextField.leadingAnchor),
			self.cadastroButton.trailingAnchor.constraint(equalTo: self.emailTextField.trailingAnchor),
			self.cadastroButton.heightAnchor.constraint(equalToConstant: CGFloat(50))
			
		])
	}
	
	func delegate(delegate: RegisterScreenProtocol?) {
		self.delegate = delegate
	}
	
	@objc
	func tappedScreenVoltar() {
		print(#function)
		self.delegate?.actionVoltar()
	}
	
	@objc
	func tappedCadastrarButton(_ sender: UIButton) {
		print(#function)
		self.delegate?.registerUser()
	}
	
	func configTextFieldDelegate(delegate: UITextFieldDelegate?) {
		self.emailTextField.delegate = delegate
	}
	

}

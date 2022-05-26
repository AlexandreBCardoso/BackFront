//
//  CriarContaViewController.swift
//  Tela-Criar-Conta
//
//  Created by Alexandre Cardoso on 17/02/21.
//

import UIKit

enum NameImage: String {
	case personCircle = "person.circle"
	case personFill 	= "person.fill"
	case cameraFill	= "camera.fill"
	case google			= "icon-Google"
	case facebook		= "icon-Facebook"
	case envelope		= "envelope.fill"
	case eyeFill		= "eye.fill"
	case eyeSlash		= "eye.slash.fill"
}

class CriarContaViewController: UIViewController {
	
	// MARK: - IBOutlet
	@IBOutlet weak var backgroundView: UIView!
	@IBOutlet weak var avatarImageView: UIImageView!
	@IBOutlet weak var viewCamera: UIView!
	@IBOutlet weak var imageCameraImageView: UIImageView!
	@IBOutlet weak var googleButton: UIButton!
	@IBOutlet weak var facebookButton: UIButton!
	@IBOutlet weak var appleButton: UIButton!
	@IBOutlet weak var nomeTextField: UITextField!
	@IBOutlet weak var emailTextField: UITextField!
	@IBOutlet weak var senhaTextField: UITextField!
	@IBOutlet weak var confirmaSenhaTextField: UITextField!
	@IBOutlet weak var conectarButton: UIButton!
	
	
	// MARK: - Variavel
	var imagePicker: UIImagePickerController = UIImagePickerController()
	
	
	override func viewDidLoad() {
		super.viewDidLoad()
		
		configView()
		configImageView()
		configImagePicker()
		configButton()
		configTextField()
	}
	
	
	// MARK: - Function
	func configView() {
		self.backgroundView.layer.cornerRadius = self.backgroundView.frame.height / 2
		self.viewCamera.layer.cornerRadius = self.viewCamera.frame.height / 2
		self.viewCamera.backgroundColor = UIColor(named: "secondColor")
	}
	
	
	func configImageView() {
		// UIImageView - Avatar
		self.avatarImageView.backgroundColor = .lightGray
		self.avatarImageView.tintColor = .darkGray
		self.avatarImageView.layer.cornerRadius = self.avatarImageView.frame.height / 2
		self.avatarImageView.image = UIImage(systemName: NameImage.personCircle.rawValue)
		self.avatarImageView.contentMode = .scaleToFill
		
		// UIImageView - Camera
		self.imageCameraImageView.image = UIImage(systemName: NameImage.cameraFill.rawValue)
		self.imageCameraImageView.tintColor = .white
		
		let tapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(trocarAvatar))
		self.imageCameraImageView.isUserInteractionEnabled = true
		self.imageCameraImageView.addGestureRecognizer(tapGestureRecognizer)
	}
	
	
	func configImagePicker() {
		self.imagePicker.delegate = self
	}
	
	
	func configButton() {
		self.googleButton.setImage(UIImage(named: NameImage.google.rawValue), for: .normal)
		self.googleButton.translatesAutoresizingMaskIntoConstraints = false
		self.googleButton.imageEdgeInsets = UIEdgeInsets(top: 8, left: 45, bottom: 8, right: 45)
		self.googleButton.layer.cornerRadius = 10
		
		self.facebookButton.setImage(UIImage(named: NameImage.facebook.rawValue), for: .normal)
		self.facebookButton.translatesAutoresizingMaskIntoConstraints = false
		self.facebookButton.imageEdgeInsets = UIEdgeInsets(top: 8, left: 45, bottom: 8, right: 45)
		self.facebookButton.layer.cornerRadius = 10
		
		self.appleButton.tintColor = .white
		self.appleButton.layer.cornerRadius = 10
		
		self.conectarButton.layer.cornerRadius = 10
	}
	
	
	func configTextField() {
		// Atribuição Delegate
		self.nomeTextField.delegate = self
		self.emailTextField.delegate = self
		self.senhaTextField.delegate = self
		self.confirmaSenhaTextField.delegate = self
		
		// Atribuição Ocultar Senha
		self.senhaTextField.isSecureTextEntry = true
		self.confirmaSenhaTextField.isSecureTextEntry = true
		
		// Atribuição de Imagem
		configTextFieldImage(icon: NameImage.personFill.rawValue,
									frame: CGRect(x: 10, y: 13, width: 30, height: 25),
									textField: self.nomeTextField)
		
		configTextFieldImage(icon: NameImage.envelope.rawValue,
									frame: CGRect(x: 10, y: 15, width: 30, height: 20),
									textField: self.emailTextField)
		
		// Atribuição Botão
		configTexFieldButton(icon: .eyeSlash, tag: 1, textField: self.senhaTextField)
		configTexFieldButton(icon: .eyeSlash, tag: 2, textField: self.confirmaSenhaTextField)
	}
	
	func configTextFieldImage(icon: String, frame: CGRect, textField: UITextField) {
		let rightImage = UIImageView(frame: frame)
		rightImage.tintColor = .darkGray
		rightImage.image = UIImage(systemName: icon)
		
		let rightView = UIView(frame: CGRect(x: 0, y: 0, width: 50, height: 50))
		rightView.addSubview(rightImage)
		
		textField.rightViewMode = .always
		textField.rightView = rightView
	}
	
	func configTexFieldButton(icon: NameImage, tag: Int, textField: UITextField) {
		let button = UIButton(type: .custom)
		button.setImage(UIImage(systemName: icon.rawValue), for: .normal)
		button.imageEdgeInsets = UIEdgeInsets(top: 0, left: -16, bottom: 0, right: 0)
		button.frame = CGRect(x: textField.frame.size.width - 25, y: 5, width: 25, height: 25)
		button.addTarget(self, action: #selector(self.ocultarSenha(sender:)), for: .touchUpInside)
		button.tintColor = .darkGray
		button.tag = tag
		textField.rightViewMode = .always
		textField.rightView = button
	}
	
	
	@objc func trocarAvatar() {
		self.imagePicker.sourceType = .photoLibrary
		self.present(self.imagePicker, animated: true, completion: nil)
	}
	
	@objc func ocultarSenha(sender: Any) {
		guard let button = sender as? UIButton,
				let image = button.currentImage
		else { return }
		
		let imageEyeSlash = UIImage(systemName: NameImage.eyeSlash.rawValue)
		let imageEyeFill = UIImage(systemName: NameImage.eyeSlash.rawValue)
		
		if button.tag == 1 {
			self.senhaTextField.isSecureTextEntry = !self.senhaTextField.isSecureTextEntry
		} else {
			self.confirmaSenhaTextField.isSecureTextEntry = !self.confirmaSenhaTextField.isSecureTextEntry
		}
		
		if image == imageEyeSlash {
			print("Exibir Senha")
			button.setImage(imageEyeFill, for: .normal)
		} else {
			button.setImage(imageEyeSlash, for: .normal)
		}
		
	}
	
	
	func validarDadosEntrada() -> Bool {
		var dadosOK: Bool = true
		let nome = nomeTextField.text ?? ""
		let email = emailTextField.text ?? ""
		let senha = senhaTextField.text ?? ""
		let confirmaSenha = confirmaSenhaTextField.text ?? ""
		
		// Valida Nome
		if nome == "" {
			dadosOK = false
			self.nomeTextField.layer.borderWidth = 1.0
			self.nomeTextField.layer.borderColor = UIColor.red.cgColor
		}
		
		// Valida Nome
		if email == "" {
			dadosOK = false
			self.emailTextField.layer.borderWidth = 1.0
			self.emailTextField.layer.borderColor = UIColor.red.cgColor
		} else {
			
			let valoresEmail = email.components(separatedBy: "@")
			
			if valoresEmail.count != 2 {
				dadosOK = false
				self.emailTextField.layer.borderWidth = 1.0
				self.emailTextField.layer.borderColor = UIColor.red.cgColor
			} else {
				for valor in valoresEmail {
					if valor == "" {
						dadosOK = false
						self.emailTextField.layer.borderWidth = 1.0
						self.emailTextField.layer.borderColor = UIColor.red.cgColor
						break
					}
				}
			}
			
		}
		
		// Valida Senha
		if senha == "" || senha.count <= 4   {
			dadosOK = false
			self.senhaTextField.layer.borderWidth = 1.0
			self.senhaTextField.layer.borderColor = UIColor.red.cgColor
		}
		
		// Valida Confirmar Senha
		if confirmaSenha == "" {
			dadosOK = false
			self.confirmaSenhaTextField.layer.borderWidth = 1.0
			self.confirmaSenhaTextField.layer.borderColor = UIColor.red.cgColor
		}
		
		// Valida Igualdade de senha
		if senha != confirmaSenha {
			dadosOK = false
			self.senhaTextField.layer.borderWidth = 1.0
			self.senhaTextField.layer.borderColor = UIColor.red.cgColor
			self.confirmaSenhaTextField.layer.borderWidth = 1.0
			self.confirmaSenhaTextField.layer.borderColor = UIColor.red.cgColor
		}
		
		return dadosOK
	}
	
	
	
	// MARK: - Action
	@IBAction func didTapConectar(_ sender: UIButton) {
		
		if validarDadosEntrada() {
			print("Conectar")
		} else {
			Alert.showIncompleteFormAlert(on: self)
		}
		
	}
	
	
	@IBAction func didTapApple(_ sender: UIButton) {
		print("Chamar Tela Login Apple")
	}
	
	
	@IBAction func didTapGoogle(_ sender: UIButton) {
		print("Chamar Tela Login Google")
	}
	
	
	@IBAction func didTapFacebook(_ sender: UIButton) {
		print("Chamar Tela Login Facebook")
	}
	
	
}



// MARK: - Extension ImagePicker
extension CriarContaViewController: UIImagePickerControllerDelegate, UINavigationControllerDelegate {
	
	func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
		let imagemRecuperada = info[UIImagePickerController.InfoKey.originalImage] as? UIImage
		self.avatarImageView.image = imagemRecuperada ?? UIImage()
		imagePicker.dismiss(animated: true, completion: nil)
	}
	
}



// MARK: - Extension TextField
extension CriarContaViewController: UITextFieldDelegate {
	
	func textFieldDidBeginEditing(_ textField: UITextField) {
		textField.layer.borderWidth = 0
		textField.layer.borderColor = nil
	}
	
	func textFieldShouldReturn(_ textField: UITextField) -> Bool {
		textField.resignFirstResponder()
		return false
	}
	
}

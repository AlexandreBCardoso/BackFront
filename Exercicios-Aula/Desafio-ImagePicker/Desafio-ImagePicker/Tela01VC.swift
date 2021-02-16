//
//  Tela01VC.swift
//  Desafio-ImagePicker
//
//  Created by Alexandre Cardoso on 14/02/21.
//

import UIKit

class Tela01VC: UIViewController {
	
	@IBOutlet weak var imageUserImageView: UIImageView!
	@IBOutlet weak var nomeTextField: UITextField!
	@IBOutlet weak var tableView: UITableView!
	
	var imagePicker: UIImagePickerController = UIImagePickerController()
	var pessoas: [Pessoa] = []
	
	
	override func viewDidLoad() {
		super.viewDidLoad()
		
		self.configTextField()
		self.configTableView()
		self.configPickerImage()
	}
	
	
	func configTextField() {
		self.nomeTextField.delegate = self
	}
	
	
	func configTableView() {
		self.tableView.delegate = self
		self.tableView.dataSource = self
		self.tableView.separatorStyle = .none
		
		self.tableView.register(CustomCellTableViewCell.nib(), forCellReuseIdentifier: CustomCellTableViewCell.identifier)
		
	}
	
	
	func configPickerImage() {
		self.imagePicker.delegate = self
	}
	
	
	func validaPreenchimento() -> Bool {
		let nome = self.nomeTextField.text ?? ""
		let foto = self.imageUserImageView.image ?? UIImage()
		var dadosOK = true
		
		// Verifica NOME
		if nome == "" {
			dadosOK = false
			self.nomeTextField.layer.borderWidth = 1.0
			self.nomeTextField.layer.borderColor = UIColor.red.cgColor
		} else {
			self.nomeTextField.layer.borderWidth = 0.0
		}
		
		// Verifica IMAGEM USER
		if foto.isSymbolImage {
			dadosOK = false
		}
		
		return dadosOK
	}
	
	
	
	@IBAction func tappedEditarFotoButton(_ sender: UIButton) {
		self.imagePicker.sourceType = .photoLibrary
		self.present(self.imagePicker, animated: true, completion: nil)
	}
	
	@IBAction func tappedAdicionarButton(_ sender: UIButton) {
		
		let nome = self.nomeTextField.text ?? ""
		let imageUser = self.imageUserImageView.image ?? UIImage()
		
		// Validar o preenchimento
		if self.validaPreenchimento() {
			// Adicionar no Array
			self.pessoas.append(Pessoa(nome: nome, imagemUser: imageUser))
			// Reload
			self.tableView.reloadData()
			// Limpa os valores preenchidos
			self.imageUserImageView.image = UIImage(systemName: "person.circle.fill")
			self.nomeTextField.text = nil
		}
		
	}
	
}


// MARK: - Extension TextField
extension Tela01VC: UITextFieldDelegate {
	
	func textFieldShouldReturn(_ textField: UITextField) -> Bool {
		
		if textField.text != nil {
			textField.layer.borderWidth = 0.0
		}
		
		textField.resignFirstResponder()
		return false
	}
	
}


// MARK: - Extension - TableView
extension Tela01VC: UITableViewDelegate, UITableViewDataSource {
	
	func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
		return self.pessoas.count
	}
	
	func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
		let pessoaItem = self.pessoas[indexPath.row]
		let cell = tableView.dequeueReusableCell(withIdentifier: CustomCellTableViewCell.identifier, for: indexPath) as? CustomCellTableViewCell
		
		cell?.setInfo(to: pessoaItem)
		
		return cell ?? UITableViewCell()
	}
	
	func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
		
		if editingStyle == .delete {
			self.pessoas.remove(at: indexPath.row)
			self.tableView.deleteRows(at: [indexPath], with: .fade)
		}
		
	}

	
}


// MARK: - Extension - ImagePickerView
extension Tela01VC: UIImagePickerControllerDelegate, UINavigationControllerDelegate {
	
	func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
		
		let imagemRecuperada = info[UIImagePickerController.InfoKey.originalImage] as? UIImage
		self.imageUserImageView.image = imagemRecuperada ?? UIImage()
		picker.dismiss(animated: true, completion: nil)
	}
	
}

//
//  CadastroMembroVC.swift
//  Desafio-TabBar-User
//
//  Created by Alexandre Cardoso on 14/02/21.
//

import UIKit


protocol CadastroMembroDelegate {
	func infosMembros(_ membro: Membro)
}

class CadastroMembroVC: UIViewController {
	
	// MARK: - IBOutlet
	@IBOutlet weak var imagemAlunoImageView: UIImageView!
	@IBOutlet weak var nomeTextField: UITextField!
	@IBOutlet weak var idadeTextField: UITextField!
	@IBOutlet weak var categoriaSegmented: UISegmentedControl!
	@IBOutlet weak var conhecimentoTextField: UITextField!
	@IBOutlet weak var conhecimentoLabel: UILabel!
	@IBOutlet weak var boraCodaButton: UIButton!
	
	// MARK: - Variable
	var delegate: CadastroMembroDelegate?
	var imagePicker: UIImagePickerController = UIImagePickerController()
	var conhecimentoPickerView = UIPickerView()
	let listaConhecimento: [String] = ["Design Pattern", "TableView", "CollectionView", "Tab Bar", "MVVM", "VIPER", "Xib"]
	
	
	// MARK: - Cycle
	override func viewDidLoad() {
		super.viewDidLoad()
		
		self.conhecimentoTextField.isHidden = true
		self.conhecimentoLabel.isHidden = true
		
		self.configTextField()
		self.configPickerView()
		self.configButton()
		self.configImagePicker()
	}
	
	
	// MARK: - Function
	func configTextField() {
		// Atribuição de Delegate
		self.nomeTextField.delegate = self
		self.idadeTextField.delegate = self
		self.conhecimentoTextField.delegate = self
		
		// Configuração de Teclados
		self.idadeTextField.keyboardType = .numberPad
		
		// Configuração de Toolbar
		self.configTextFieldToolBar()
		
		// Configuração de PickerView
		self.conhecimentoTextField.inputView = conhecimentoPickerView
	}
	
	func configTextFieldToolBar() {
		let toolbar = UIToolbar()
		toolbar.barStyle = .default
		toolbar.isTranslucent = true
		toolbar.tintColor = #colorLiteral(red: 0, green: 0.7906209826, blue: 0.876229465, alpha: 1)
		toolbar.backgroundColor = .systemGray
		toolbar.sizeToFit()
		
		let cancelButton = UIBarButtonItem(title: "OK", style: .plain, target: self, action: #selector(tappedFinish))
		let spaceButton = UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: nil, action: nil)
		
		toolbar.setItems([spaceButton, cancelButton], animated: true)
		toolbar.isUserInteractionEnabled = true
		
		self.idadeTextField.inputAccessoryView = toolbar
		self.conhecimentoTextField.inputAccessoryView = toolbar
	}
	
	@objc func tappedFinish() {
		
		if self.categoriaSegmented.selectedSegmentIndex == 1 {
			
			if self.conhecimentoTextField.text != "" {
				self.conhecimentoTextField.layer.borderWidth = 0.0
			} else {
				self.conhecimentoTextField.layer.borderWidth = 1.0
				self.conhecimentoTextField.layer.borderColor = UIColor.red.cgColor
			}
			
		}
		
		if self.idadeTextField.text != "" {
			self.idadeTextField.layer.borderWidth = 0.0
		}
		
		self.conhecimentoTextField.resignFirstResponder()
		self.idadeTextField.resignFirstResponder()
		
	}
	
	func configPickerView() {
		self.conhecimentoPickerView.delegate = self
		self.conhecimentoPickerView.dataSource = self
	}
	
	func configButton() {
		self.boraCodaButton.layer.cornerRadius = 25
	}
	
	func configImagePicker() {
		self.imagePicker.delegate = self
	}
	
	func validarMembro(membro: Membro) -> Bool {
		var dadosOK = true
		
		// Valida Nome
		if membro.nome == "" {
			self.nomeTextField.layer.borderWidth = 1.0
			self.nomeTextField.layer.borderColor = UIColor.red.cgColor
			dadosOK = false
		}
		
		// Valida Idade
		if membro.idade == 0 || membro.idade > 100 {
			self.idadeTextField.layer.borderWidth = 1.0
			self.idadeTextField.layer.borderColor = UIColor.red.cgColor
			dadosOK = false
		}
		
		// Valida Conhecimento
		if membro.categoria == Categoria.professor {
			if membro.conhecimento == "" {
				self.conhecimentoTextField.layer.borderWidth = 1.0
				self.conhecimentoTextField.layer.borderColor = UIColor.red.cgColor
				dadosOK = false
			}
		} else {
			self.conhecimentoTextField.layer.borderWidth = 0.0
		}
		
		return dadosOK
		
	}
	
	// MARK: - Action
	@IBAction func tappedBoraCoda(_ sender: UIButton) {
	
		var imagemAluno = self.imagemAlunoImageView.image ?? UIImage()
		let nome = self.nomeTextField.text ?? ""
		let idade: Int = Int(self.idadeTextField.text ?? "") ?? 0
		let categoria1 = self.categoriaSegmented.selectedSegmentIndex == 0 ? Categoria.aluno : Categoria.professor
		let conhecimento = self.conhecimentoTextField.text ?? ""
		
		// Verifica se foi alterado a Imagem
		if imagemAluno.isSymbolImage {
			let imagemPadrao: UIImage = UIImage(systemName: "person.fill") ?? UIImage()
			imagemAluno = imagemPadrao
		}
		
		let membro: Membro = Membro(nome: nome, idade: idade, categoria: categoria1, conhecimento: conhecimento, imagem: imagemAluno)
		
//		let membroTeste = Membro(nome: "Alexandre", idade: 33, categoria: Categoria.aluno, conhecimento: "", imagem: UIImage())
		
		// Valida Preenchimento
		if self.validarMembro(membro: membro) {
			// Retorna Delegate
			self.delegate?.infosMembros(membro)
			self.dismiss(animated: true, completion: nil)
		}
		
	}
	
	@IBAction func tappedCategoria(_ sender: UISegmentedControl) {
		
		switch sender.selectedSegmentIndex {
			
			// Aluno
			case 0:
				self.conhecimentoTextField.isHidden = true
				self.conhecimentoLabel.isHidden = true
				self.conhecimentoTextField.text = nil
			
				// ProFessor
			case 1:
				self.conhecimentoTextField.isHidden = false
				self.conhecimentoLabel.isHidden = false
				
			default:
				break
		}
		
	}
	
	@IBAction func tappedEditarFotoButton(_ sender: UIButton) {
		self.imagePicker.sourceType = .photoLibrary
		self.present(self.imagePicker, animated: true, completion: nil)
	}
	
	
}


// MARK: - Extension - TextField
extension CadastroMembroVC: UITextFieldDelegate {
	
	func textFieldShouldReturn(_ textField: UITextField) -> Bool {
		
		if textField.text != "" {
			textField.layer.borderWidth = 0.0
		}
		
		textField.resignFirstResponder()
		return false
	}
	
}


// MARK: - Extension - PickerView
extension CadastroMembroVC: UIPickerViewDelegate, UIPickerViewDataSource {
	
	func numberOfComponents(in pickerView: UIPickerView) -> Int {
		return 1
	}
	
	func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
		return self.listaConhecimento.count
	}
	
	func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
		return self.listaConhecimento[row]
	}
	
	func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
		self.conhecimentoTextField.text = self.listaConhecimento[row]
		self.conhecimentoTextField.resignFirstResponder()
		
		if self.conhecimentoTextField.text != "" {
			self.conhecimentoTextField.layer.borderWidth = 0.0
		}
	}
	
}


// MARK: - Extension - ImagePicker
extension CadastroMembroVC: UIImagePickerControllerDelegate, UINavigationControllerDelegate {
	
	func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
		let imagemRecuperada = info[UIImagePickerController.InfoKey.originalImage] as? UIImage
		self.imagemAlunoImageView.image = imagemRecuperada ?? UIImage()
		picker.dismiss(animated: true, completion: nil)
	}
	
}

//
//  Tela01VC.swift
//  TabBar
//
//  Created by Alexandre Cardoso on 14/02/21.
//

import UIKit

class Tela01VC: UIViewController {
	
	// MARK: - IBOutlet
	@IBOutlet weak var imageUserImageView: UIImageView!
	
	
	// MARK: - Variaveis
	var imagePicker: UIImagePickerController = UIImagePickerController()
	
	
	override func viewDidLoad() {
		super.viewDidLoad()
		
		self.configImagePicker()
	}
	
	
	func configImagePicker() {
		self.imagePicker.delegate = self
	}
	
	
	// MARK: - Actions
	@IBAction func tappedEditarImagemButton(_ sender: UIButton) {
		self.imagePicker.sourceType = .photoLibrary
		self.present(self.imagePicker, animated: true, completion: nil)
	}
	
}


// MARK: - Extensions
extension Tela01VC: UIImagePickerControllerDelegate, UINavigationControllerDelegate {
	
	func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
		
		let imagemRecuperada = info[UIImagePickerController.InfoKey.originalImage] as? UIImage
		
		self.imageUserImageView.image = imagemRecuperada ?? UIImage()
		
		picker.dismiss(animated: true, completion: nil)
		
	}
	
}

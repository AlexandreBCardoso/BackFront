//
//  Membro.swift
//  Desafio-TabBar-User
//
//  Created by Alexandre Cardoso on 14/02/21.
//

import Foundation
import UIKit

enum Categoria: String {
	case aluno = "Aluno"
	case professor = "Professor"
}

struct Membro {
	let nome: String
	let idade: Int
	let categoria: Categoria
	let conhecimento: String
	let imagem: UIImage
}




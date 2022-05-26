//
//  Filme.swift
//  Desafio-Filme-Teste
//
//  Created by Alexandre Cardoso on 21/02/21.
//

import Foundation
import UIKit

class Filme {
	
	var titleSection: String
	var titleMovie: String
	var data: String
	var imageMovie: UIImage
	
	init(titleSection: String, titleMovie: String, data: String, imageMovie: UIImage) {
		self.titleSection = titleSection
		self.titleMovie = titleMovie
		self.data = data
		self.imageMovie = imageMovie
	}
	
}

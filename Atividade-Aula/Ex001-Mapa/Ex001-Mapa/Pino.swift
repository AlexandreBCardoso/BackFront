//
//  Pino.swift
//  Ex001-Mapa
//
//  Created by Alexandre Cardoso on 22/03/21.
//

import Foundation
import MapKit

class Pino: NSObject, MKAnnotation {
	
	var title: String?
	var icon: UIImage?
	var color: UIColor?
	var coordinate: CLLocationCoordinate2D
	
	init(coordenada: CLLocationCoordinate2D) {
		self.coordinate = coordenada
	}
	
}

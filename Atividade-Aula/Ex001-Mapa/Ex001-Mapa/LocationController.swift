//
//  LocationController.swift
//  Ex001-Mapa
//
//  Created by Alexandre Cardoso on 22/03/21.
//

import Foundation
import MapKit

class LocationController: NSObject, MKMapViewDelegate {
	
	func configPino(title: String, location: CLPlacemark, color: UIColor?, icon: UIImage?) -> Pino {
		let pino = Pino(coordenada: location.location?.coordinate ?? CLLocationCoordinate2D())
		
		pino.title = title
		pino.color = color
		pino.icon  = icon
		
		return pino
	}
	
	func converterEnderecoCoordenada(endereco: String, local: @escaping(_ local: CLPlacemark) -> Void) {
		let conversor = CLGeocoder()
		
		conversor.geocodeAddressString(endereco) { (listaLocalizacao, error) in
			if let location = listaLocalizacao?.first {
				local(location)
			}
		}
		
	}
	
	func mapView(_ mapView: MKMapView, viewFor annotation: MKAnnotation) -> MKAnnotationView? {
		
		if annotation is Pino {
			let annotationView = annotation as? Pino
			var pinoView = mapView.dequeueReusableAnnotationView(withIdentifier: annotationView?.title ?? "") as? MKMarkerAnnotationView
			
			pinoView = MKMarkerAnnotationView(annotation: annotation, reuseIdentifier: annotation.title ?? "")
			pinoView?.annotation = annotationView
			pinoView?.glyphImage = annotationView?.icon
			pinoView?.markerTintColor = annotationView?.color
			
			return pinoView
		}
		
		return nil
	}
	
	func configBotaoLocalizacaoAtual(mapa: MKMapView) -> MKUserTrackingButton {
		let botao = MKUserTrackingButton(mapView: mapa)
		botao.frame.origin.x = 10
		botao.frame.origin.y = 10
		
		return botao
	}
	
}



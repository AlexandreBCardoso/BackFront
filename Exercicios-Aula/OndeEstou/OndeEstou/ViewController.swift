//
//  ViewController.swift
//  OndeEstou
//
//  Created by Alexandre Cardoso on 22/03/21.
//

import UIKit
import MapKit

class ViewController: UIViewController {
	
	// MARK: - IBOutlet
	@IBOutlet weak var velocidadeLabel: UILabel!
	@IBOutlet weak var latitudeLabel: UILabel!
	@IBOutlet weak var longitudeLabel: UILabel!
	@IBOutlet weak var enderecoLabel: UILabel!
	@IBOutlet weak var mapa: MKMapView!
	
	// MARK: - Variable
	var gerenciadorLocalizacao: CLLocationManager = CLLocationManager()
	
	
	// MARK: - Lifecycle
	override func viewDidLoad() {
		super.viewDidLoad()
		// Do any additional setup after loading the view.
		configView()
		configLocalizacao()
	}
	
	private func configView() {
		self.velocidadeLabel.clipsToBounds = true
		self.velocidadeLabel.layer.cornerRadius = self.velocidadeLabel.frame.height/2
	}
	
	private func configLocalizacao() {
		self.gerenciadorLocalizacao.delegate = self
		self.gerenciadorLocalizacao.desiredAccuracy = kCLLocationAccuracyBest
		self.gerenciadorLocalizacao.requestWhenInUseAuthorization()
		self.gerenciadorLocalizacao.startUpdatingLocation()
	}
	
}


// MARK: - Extension Map
extension ViewController: CLLocationManagerDelegate {
	
	func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
		guard let localizacaoUser = locations.last else { return }
		let longitude = localizacaoUser.coordinate.longitude
		let latitude  = localizacaoUser.coordinate.latitude
		
		self.latitudeLabel.text  = String(latitude)
		self.longitudeLabel.text = String(longitude)
		
		if localizacaoUser.speed > 0 {
			self.velocidadeLabel.text = String(localizacaoUser.speed)
		} else {
			self.velocidadeLabel.text = "0.0"
		}
				
		let deltaLatitude: CLLocationDegrees = 0.01
		let deltaLongitude: CLLocationDegrees = 0.01
		let localizacao: CLLocationCoordinate2D = CLLocationCoordinate2D(latitude: latitude, longitude: longitude)
		let areaVisualizacao: MKCoordinateSpan = MKCoordinateSpan.init(latitudeDelta: deltaLatitude, longitudeDelta: deltaLongitude)
		let regiao: MKCoordinateRegion = MKCoordinateRegion.init(center: localizacao, span: areaVisualizacao)
		self.mapa.setRegion(regiao, animated: true)
		
		CLGeocoder().reverseGeocodeLocation(localizacaoUser) { (placemark, error) in
			if error == nil {
				
				if let dadosLocal = placemark?.first {
					
					// Nome da rua
					var rua: String = ""
					if dadosLocal.thoroughfare != nil {
						rua = dadosLocal.thoroughfare ?? ""
					}
					
					// Nome da Cidade
					var cidade: String = ""
					if dadosLocal.locality != nil {
						cidade = dadosLocal.locality ?? ""
					}
					
					// Nome da Pais
					var pais: String = ""
					if dadosLocal.country != nil {
						pais = dadosLocal.country ?? ""
					}
					
					// Nome da Bairro
					var bairro: String = ""
					if dadosLocal.subLocality != nil {
						bairro = dadosLocal.subLocality ?? ""
					}
					
					self.enderecoLabel.text = "Rua: \(rua), Bairro: \(bairro), Cidade: \(cidade), Pais: \(pais)"
					
				}
				
			}
		}
		
	}
	
	
	
	//	func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
	//		let localizacaoUser = locations.last
	//		let latitude = localizacaoUser?.coordinate.latitude
	//		let longitude = localizacaoUser?.coordinate.longitude
	//
	//		latitudeLabel.text = String(latitude!)
	//		longitudeLabel.text = String(longitude!)
	//
	//		if localizacaoUser!.speed > 0.0 {
	//			velocidadeLabel.text = String(localizacaoUser!.speed)
	//		}
	//
	//		let location = CLLocationCoordinate2D(latitude: CLLocationDegrees(latitude!), longitude: CLLocationDegrees(longitude!))
	//		let span = MKCoordinateSpan(latitudeDelta: CLLocationDegrees(0.01), longitudeDelta: CLLocationDegrees(0.01))
	//		let region = MKCoordinateRegion(center: location, span: span)
	//		mapa.setRegion(region, animated: true)
	//
	//		CLGeocoder().reverseGeocodeLocation(localizacaoUser!) { (placemark, error) in
	//			if error == nil {
	//
	//				let local = placemark?.first
	//				self.enderecoLabel.text = local?.thoroughfare
	//
	//			} else {
	//				print(error!)
	//			}
	//		}
	//
	//	}
	
}

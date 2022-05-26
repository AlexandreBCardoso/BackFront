//
//  ViewController.swift
//  Ex001-Mapa
//
//  Created by Alexandre Cardoso on 22/03/21.
//

import UIKit
import MapKit

class ViewController: UIViewController {
	
	// MARK: - IBOutlet
	@IBOutlet weak var enderecoTextField: UITextField!
	@IBOutlet weak var nomeTextField: UITextField!
	@IBOutlet weak var mapa: MKMapView!
	
	// MARK: - Variable
	lazy var gerenciadorLocalizacao: CLLocationManager = CLLocationManager()
	lazy var controller: LocationController = LocationController()
	
	
	// MARK: - Lifecycle
	override func viewDidLoad() {
		super.viewDidLoad()
		// Do any additional setup after loading the view.
//		verificarAutorizacaoUser()
		configLocation()
		localizacaoInicial()
	}
	
	override func viewWillAppear(_ animated: Bool) {
		super.viewWillAppear(animated)
		verificarAutorizacaoUser()
	}
	
	
	// MARK: - Function
	private func configLocation() {
		self.mapa.delegate = controller
	}
	
	private func verificarAutorizacaoUser() {
		let manager: CLLocationManager = CLLocationManager()
		
		switch manager.authorizationStatus {
			
			case .authorizedWhenInUse:
				let botao = self.controller.configBotaoLocalizacaoAtual(mapa: self.mapa)
				self.mapa.addSubview(botao)
				
				self.gerenciadorLocalizacao.startUpdatingLocation()
				
			case .authorizedAlways:
				self.gerenciadorLocalizacao.startUpdatingLocation()
				
			case .notDetermined:
				self.gerenciadorLocalizacao.requestWhenInUseAuthorization()
				
			default:
				break
		}
		
	}
	
	private func localizacaoInicial() {
		
		self.controller.converterEnderecoCoordenada(endereco: "Nuporanga - São Paulo") { (placemark) in
			
			print("Placemark: \(placemark)")
			
			let pino = self.controller.configPino(title: "Cidade Deserta", location: placemark, color: nil, icon: nil)
			let regiao = MKCoordinateRegion(center: pino.coordinate, latitudinalMeters: 500, longitudinalMeters: 500)
			
			self.mapa.setRegion(regiao, animated: true)
			self.mapa.addAnnotation(pino)
		}
		
	}
	
	private func localizarPessoa(endereco: String, nome: String) {
		self.controller.converterEnderecoCoordenada(endereco: endereco) { (placemark) in
			
			let pino = self.controller.configPino(title: nome, location: placemark, color: nil, icon: UIImage(systemName: "person"))
			
			self.mapa.addAnnotation(pino)
			self.mapa.showAnnotations(self.mapa.annotations, animated: true)
			
		}
	}
	
	
	// MARK: - IBAction
	@IBAction func tappedAddButton(_ sender: UIButton) {
		let endereco = self.enderecoTextField.text ?? ""
		let nome = self.nomeTextField.text ?? ""
		
		self.localizarPessoa(endereco: endereco, nome: nome)
	}
	
}

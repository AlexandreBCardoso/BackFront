//
//  Tela02ViewController.swift
//  NotificationCenterTabbar
//
//  Created by Alexandre Cardoso on 24/03/21.
//

import UIKit
import WebKit


class Tela02ViewController: UIViewController {
	
	@IBOutlet weak var web: WKWebView!
	
	override func viewDidLoad() {
		super.viewDidLoad()
		
		NotificationCenter.default.addObserver(self, selector: #selector(self.alterarBackground),
															name: .alterarParaAzul, object: nil)
		NotificationCenter.default.addObserver(self, selector: #selector(self.configColorBackground),
															name: .trocarCorDeFundo, object: nil)
		self.configColorBackground()
		self.configWebView()
	}
	
//	override func viewWillAppear(_ animated: Bool) {
//		super.viewWillAppear(animated)
//		self.configColorBackground()
//	}
		
	@objc
	func alterarBackground() {
		self.view.backgroundColor = .blue
	}
	
	@objc
	func configColorBackground() {
		self.view.backgroundColor = .corDeFundoView
	}
	
	func configWebView() {
		let urlString: String = "https://www.facebook.com./"
		guard let url = URL(string: urlString) else { return }
		let urlRequest = URLRequest(url: url)
		self.web.load(urlRequest)
		
	}
	
}

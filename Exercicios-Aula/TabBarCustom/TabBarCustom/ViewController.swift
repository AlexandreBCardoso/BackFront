//
//  ViewController.swift
//  TabBarCustom
//
//  Created by Alexandre Cardoso on 24/02/21.
//

import UIKit

class ViewController: UIViewController {

	override func viewDidLoad() {
		super.viewDidLoad()
		// Do any additional setup after loading the view.
		
		
//		let watchListVC = WatchListVC()
//		let homeVC = HomeVC()
//		let perfilVC = PerfilVC()
//		
//		let tabBarCuston = UITabBarController()
//		tabBarCuston.setViewControllers([watchListVC, homeVC, perfilVC], animated: false)
		
	
		
	}


}


class WatchListVC: UIViewController {
	override func viewDidLoad() {
		super.viewDidLoad()
		view.backgroundColor = .systemRed
		title = "Wath List"
	}
}


class HomeVC: UIViewController {
	override func viewDidLoad() {
		super.viewDidLoad()
		view.backgroundColor = .systemBlue
		title = "Home"
	}
}


class PerfilVC: UIViewController {
	override func viewDidLoad() {
		super.viewDidLoad()
		view.backgroundColor = .systemBlue
		title = "Perfil"
	}
}



//
//  ViewController.swift
//  Ex003-ViewCode
//
//  Created by Alexandre Cardoso on 04/04/21.
//

import UIKit

class ViewController: UIViewController {
	
	// MARK: - Variable
	private var mainView: MainView?
	
	
	// MARK: - Lifecycle
	override func loadView() {
		super.loadView()
		self.mainView = MainView()
		self.view = mainView
	}
	
	override func viewDidLoad() {
		super.viewDidLoad()
		view.backgroundColor = .white
	}
	
}

//
//  ViewController.swift
//  Ex001-TableView-CollectionView
//
//  Created by Alexandre Cardoso on 15/02/21.
//

import UIKit

class ViewController: UIViewController {
	
	// MARK: - IBOutlet
	@IBOutlet weak var tableView: UITableView!
	
	
	override func viewDidLoad() {
		super.viewDidLoad()
		
		self.configTableView()
	}
	
	
	func configTableView() {
		self.tableView.delegate = self
		self.tableView.dataSource = self
		self.tableView.register(CustomCellTableViewCell.nib(), forCellReuseIdentifier: CustomCellTableViewCell.identifier)
	}
	
}


// MARK: - Extension TableView
extension ViewController: UITableViewDelegate, UITableViewDataSource {
	
	func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
		return 1
	}
	
	func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
		let cell = tableView.dequeueReusableCell(withIdentifier: CustomCellTableViewCell.identifier, for: indexPath) as? CustomCellTableViewCell
	
		return cell ?? UITableViewCell()
	}
	
}


//
//  DetailUserVC.swift
//  Ex002-ViewCode
//
//  Created by Alexandre Cardoso on 05/04/21.
//

import UIKit

class DetailUserVC: UIViewController {
	
	// MARK: - Variable
	var dados: String?
	var detailUserView: DetailUserView?
	
	
	// MARK: - Lifecycle
	override func loadView() {
		super.loadView()
		
		self.detailUserView = DetailUserView()
		self.view = self.detailUserView
	}
	
	override func viewDidLoad() {
		super.viewDidLoad()
		
		self.detailUserView?.configTableViewDelegate(delegate: self, dataSource: self)
		
		print("Dados: \(String(describing: dados))")
	}
	
}


extension DetailUserVC: UITableViewDelegate, UITableViewDataSource {
	
	func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
		return 5
	}
	
	func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
		
		if let cell: DetailUserCell = tableView.dequeueReusableCell(withIdentifier: DetailUserCell.identifier,
																						for: indexPath) as? DetailUserCell {
			cell.nameLabel.text = "Caio"
			return cell
		}
		
		return UITableViewCell()
	}
	
}

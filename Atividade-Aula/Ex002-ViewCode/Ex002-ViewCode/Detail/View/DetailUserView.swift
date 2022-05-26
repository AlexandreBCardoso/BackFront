//
//  DetailUserView.swift
//  Ex002-ViewCode
//
//  Created by Alexandre Cardoso on 05/04/21.
//

import UIKit
import SnapKit

class DetailUserView: UIView {
	
	// MARK: - Element UI
	lazy var tableView: UITableView = {
		let table = UITableView()
		table.register(DetailUserCell.self, forCellReuseIdentifier: DetailUserCell.identifier)
//		table.backgroundColor = .white
		return table
	}()
	
	
	// MARK: - Inicializador
	override init(frame: CGRect) {
		super.init(frame: frame)
		self.backgroundColor = UIColor(red: 24/255, green: 117/255, blue: 104/255, alpha: 1.0)
		
		self.addSubview(tableView)
		
		self.configTableView()
	}
	
	required init?(coder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}
	
	
	// MARK: - Function
	private func configTableView() {
		self.tableView.snp.makeConstraints { (make) in
			// edges => São as 4 direções
			make.edges.equalTo(safeAreaLayoutGuide)
		}
	}
	
	func configTableViewDelegate(delegate: UITableViewDelegate, dataSource: UITableViewDataSource) {
		self.tableView.delegate = delegate
		self.tableView.dataSource = dataSource
	}
	
}

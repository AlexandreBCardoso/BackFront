//
//  ViewController.swift
//  Desafio-Filme-Teste
//
//  Created by Alexandre Cardoso on 21/02/21.
//

import UIKit

class ViewController: UIViewController {
	
	@IBOutlet weak var tableview: UITableView!
	
	var arrayFilmes: [Filme] = [ Filme(titleSection: "Tendencias", titleMovie: "Filme1", data: "10 Jul 2021", imageMovie: #imageLiteral(resourceName: "filmev4")),
										  Filme(titleSection: "Tendencias", titleMovie: "Filme2", data: "01 Fev 2021", imageMovie: #imageLiteral(resourceName: "filmev5")),
										  Filme(titleSection: "Tendencias", titleMovie: "Filme3", data: "10 Jan 2021", imageMovie: #imageLiteral(resourceName: "filmev12")),
										  Filme(titleSection: "Tendencias", titleMovie: "Filme4", data: "23 Dez 2020", imageMovie: #imageLiteral(resourceName: "filmev1")),
										  Filme(titleSection: "Tendencias", titleMovie: "Filme5", data: "30 Mai 2020", imageMovie: #imageLiteral(resourceName: "filmev9"))
	]
	
	override func viewDidLoad() {
		super.viewDidLoad()
		// Do any additional setup after loading the view.
	}
	
	func configTableView() {
		self.tableview.delegate = self
		self.tableview.dataSource = self
		self.tableview.register(TendenciasTableViewCell.nib(), forCellReuseIdentifier: TendenciasTableViewCell.identifier)
	}


}



// MARK: - Extension TableView
extension ViewController: UITableViewDelegate, UITableViewDataSource {
	func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
		return 3
	}
	
	func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
		let cell = tableview.dequeueReusableCell(withIdentifier: TendenciasTableViewCell.identifier, for: indexPath) as? TendenciasTableViewCell
		
		cell?.getFilmes(value: arrayFilmes)
		
		return cell ?? UITableViewCell()
	}
	
	
}


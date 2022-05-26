//
//  ViewController.swift
//  Ex002-PageViewController
//
//  Created by Alexandre Cardoso on 17/02/21.
//

import UIKit

class ViewController: UIViewController {
	
	@IBOutlet weak var contentView: UIView!
	
	let dataSource: [String] = [ "Caio",
															 "Felipe",
															 "Alexandre",
															 "Danilo",
															 "Tonon",
															 "Lucas",
															 "Junior"
	]
	var currentViewControllerIndex: Int = 0
	
	override func viewDidLoad() {
		super.viewDidLoad()
		// Do any additional setup after loading the view.
		configPageViewController()
	}
	
	
	func configPageViewController() {
		guard let pageViewController = storyboard?.instantiateViewController(identifier: CustomPageViewController.identifier) as? CustomPageViewController else { return }
		pageViewController.delegate = self
		pageViewController.dataSource = self
		
		self.addChild(pageViewController)
		pageViewController.didMove(toParent: self)
		
		pageViewController.view.translatesAutoresizingMaskIntoConstraints = false
		
		self.contentView.addSubview(pageViewController.view)
		
		let views: [String:Any] = ["pageView": pageViewController.view ?? UIView()]
		
		self.contentView.addConstraints(NSLayoutConstraint.constraints( withVisualFormat: "H:|-0-[pageView]-0-|",
																																		options: [],
																																		metrics: nil,
																																		views: views))
		
		self.contentView.addConstraints(NSLayoutConstraint.constraints( withVisualFormat: "V:|-0-[pageView]-0-|",
																																		options: [],
																																		metrics: nil,
																																		views: views))
		
		guard let startingViewController = self.detailViewController(index: self.currentViewControllerIndex)
		else { return }
		pageViewController.setViewControllers( [startingViewController],
																					 direction: .forward,
																					 animated: true,
																					 completion: nil)
		
	}
	
	func detailViewController(index: Int) -> DataViewController? {
		
		if index >= self.dataSource.count || self.dataSource.count == 0 {
			return nil
		}
		
		guard let dataViewController = storyboard?.instantiateViewController(identifier: DataViewController.identifier) as? DataViewController
		else { return nil }
		
		dataViewController.index = index
		dataViewController.displayText = self.dataSource[index]
		
		return dataViewController
		
	}
	
	
}


// MARK: - Extension PageViewController
extension ViewController: UIPageViewControllerDelegate, UIPageViewControllerDataSource {
	
	func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
		
		let dataViewController = viewController as? DataViewController
		
		guard var currentIndex = dataViewController?.index else { return nil }
		
		if currentIndex == 0 {
			return nil
		}
		
		currentIndex -= 1
		self.currentViewControllerIndex = currentIndex
		
		return detailViewController(index: currentIndex)
	}
	
	func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
		
		let dataViewController = viewController as? DataViewController
		
		guard var currentIndex = dataViewController?.index else { return nil }
		
		if currentIndex == self.dataSource.count {
			return nil
		}
		
		currentIndex += 1
		self.currentViewControllerIndex = currentIndex
		
		return detailViewController(index: currentIndex)
	}
	
	func presentationIndex(for pageViewController: UIPageViewController) -> Int {
		return self.currentViewControllerIndex
	}
	
	func presentationCount(for pageViewController: UIPageViewController) -> Int {
		return self.dataSource.count
	}
	
	
}

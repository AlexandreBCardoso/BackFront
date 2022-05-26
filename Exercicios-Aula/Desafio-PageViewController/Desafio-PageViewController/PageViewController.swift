//
//  PageViewController.swift
//  Desafio-PageViewController
//
//  Created by Alexandre Cardoso on 17/02/21.
//

import UIKit

class PageViewController: UIPageViewController {
	
	lazy var dataViewController: [UIViewController] = [ getViewController(name: "Tela01ViewController"),
																											getViewController(name: "Tela02ViewController"),
																											getViewController(name: "Tela03ViewController"),
																											getViewController(name: "Tela04ViewController")]
	
	override func viewDidLoad() {
		super.viewDidLoad()
		
		configPageViewController()
	}
	
	
	func configPageViewController() {
		self.dataSource = self
		self.delegate = self
		
		guard let firstViewController = self.dataViewController.first else { return }
		self.setViewControllers([firstViewController], direction: .forward, animated: true, completion: nil)
	}
	
	private func getViewController(name: String) -> UIViewController{
		return UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: name)
	}
	
	
}


// MARK: - Extension PageViewController
extension PageViewController: UIPageViewControllerDelegate, UIPageViewControllerDataSource {
	func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
		
		guard let viewControllerIndex = self.dataViewController.firstIndex(of: viewController) else { return nil }
		let previewIndex = viewControllerIndex - 1
		
		guard previewIndex >= 0 && previewIndex < self.dataViewController.count else { return nil }
		
		return self.dataViewController[previewIndex]
	}
	
	func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
		
		guard let viewControllerIndex = self.dataViewController.firstIndex(of: viewController) else { return nil }
		let nextIndex = viewControllerIndex + 1
		
		guard nextIndex < self.dataViewController.count else { return nil }
		
		return self.dataViewController[nextIndex]
	}
	
	func presentationIndex(for pageViewController: UIPageViewController) -> Int {
		
		guard let firstViewController = viewControllers?.first,
					let firstViewControllerIndex = self.dataViewController.firstIndex(of: firstViewController)
		else { return 0 }
		
		return firstViewControllerIndex
		
	}
	
	func presentationCount(for pageViewController: UIPageViewController) -> Int {
		return self.dataViewController.count
	}
	
	
}

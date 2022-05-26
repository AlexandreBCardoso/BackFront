//
//  PageViewController.swift
//  Ex001-PageViewController
//
//  Created by Alexandre Cardoso on 17/02/21.
//

import UIKit

class PageViewController: UIPageViewController {
	
	// MARK: - Variable
	lazy var dataViewController: [UIViewController] = [ self.getViewController(name: "OrangeViewController"),
																											self.getViewController(name: "RedViewController"),
																											self.getViewController(name: "PurpleViewController")
	]
	
	
	override func viewDidLoad() {
		super.viewDidLoad()
		
		configPageViewController()
	}
	
	
	func configPageViewController() {
		self.dataSource = self
		self.delegate   = self
		
		guard let firstViewController = dataViewController.first else { return }
		self.setViewControllers([firstViewController], direction: .forward, animated: true, completion: nil)
		
	}
	
	
	private func getViewController(name: String) -> UIViewController {
		return UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: name)
	}
	
}


// MARK: - PageViewController - Delegate
extension PageViewController: UIPageViewControllerDelegate, UIPageViewControllerDataSource {
	
	func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
		
		guard let viewControllerIndex = dataViewController.firstIndex(of: viewController) else { return nil }
		let previewsIndex = viewControllerIndex - 1
		
//		guard previewsIndex >= 0 && self.dataViewController.count > previewsIndex else { return nil }
		guard previewsIndex < self.dataViewController.count && previewsIndex >= 0 else { return nil }
		
		return self.dataViewController[previewsIndex]
		
	}
	
	func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
		
		guard let viewControllerIndex = dataViewController.firstIndex(of: viewController) else { return nil }
		let nextIndex = viewControllerIndex + 1
		
//		guard self.dataViewController.count != nextIndex && self.dataViewController.count > nextIndex else { return nil }
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

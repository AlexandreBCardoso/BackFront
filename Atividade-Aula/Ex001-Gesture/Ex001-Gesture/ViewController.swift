//
//  ViewController.swift
//  Ex001-Gesture
//
//  Created by Alexandre Cardoso on 21/02/21.
//

import UIKit

class ViewController: UIViewController {
	
	@IBOutlet weak var viewTapGesture: UIView!
	@IBOutlet weak var viewSwipeGesture: UIView!
	@IBOutlet weak var viewLongPressGesture: UIView!
	
	override func viewDidLoad() {
		super.viewDidLoad()
		// Do any additional setup after loading the view.
		
		configGesture()
	}
	
	func configGesture() {
		
		let tap = UITapGestureRecognizer(target: self, action: #selector(self.handleTap(_:)))
		self.viewTapGesture.addGestureRecognizer(tap)
		
		let swipeRight = UISwipeGestureRecognizer(target: self, action: #selector(self.handleSwipe(_:)))
		swipeRight.direction = .right
		self.viewSwipeGesture.addGestureRecognizer(swipeRight)
		
		let longPress = UILongPressGestureRecognizer(target: self, action: #selector(self.handleLongPress(_:)))
		longPress.minimumPressDuration = 5
		self.viewLongPressGesture.addGestureRecognizer(longPress)
		
	}
	
	@objc
	func handleTap(_ sender: UITapGestureRecognizer) {
		print(#function)
	}
	
	@objc
	func handleSwipe(_ sender: UISwipeGestureRecognizer) {
		print(#function)
	}
	
	@objc
	func handleLongPress(_ sender: UILongPressGestureRecognizer) {
		print(#function)
		self.viewLongPressGesture.backgroundColor = .brown
	}
	
	
}


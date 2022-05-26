//
//  ViewController.swift
//  Desafio-Gesture
//
//  Created by Alexandre Cardoso on 21/02/21.
//

import UIKit

class ViewController: UIViewController {
	
	@IBOutlet weak var viewTapGesture: UIView!
	@IBOutlet weak var viewSwipeGesture: UIView!
	@IBOutlet weak var viewLongPressGesture: UIView!
	@IBOutlet weak var contadorLabel: UILabel!
	
	var contador: Int = 0
	
	override func viewDidLoad() {
		super.viewDidLoad()
		// Do any additional setup after loading the view.
		
		self.configGesture()
	}
	
	func configGesture() {
		
		let tap = UITapGestureRecognizer(target: self, action: #selector(self.handleTap(_:)))
		self.viewTapGesture.addGestureRecognizer(tap)
		
		let swipeLeft = UISwipeGestureRecognizer(target: self, action: #selector(self.handleSwipe(_:)))
		swipeLeft.direction = .left
		let swipeRight = UISwipeGestureRecognizer(target: self, action: #selector(self.handleSwipe(_:)))
		swipeRight.direction = .right
		
		self.viewSwipeGesture.addGestureRecognizer(swipeLeft)
		self.viewSwipeGesture.addGestureRecognizer(swipeRight)
		
		let longPress = UILongPressGestureRecognizer(target: self, action: #selector(self.handleLongPress(_:)))
		longPress.minimumPressDuration = 3
		self.viewLongPressGesture.addGestureRecognizer(longPress)
		
	}
	
	@objc
	func handleTap(_ sender: UITapGestureRecognizer) {
		contador += 1
		self.contadorLabel.text = "Valor: \(contador)"
	}
	
	@objc
	func handleSwipe(_ sender: UISwipeGestureRecognizer) {
		if sender.direction == .left {
			contador -= 1
		} else {
			contador += 2
		}
		self.contadorLabel.text = "Valor: \(contador)"
	}
	
	@objc
	func handleLongPress(_ sender: UILongPressGestureRecognizer) {
		self.view.backgroundColor = self.view.backgroundColor == UIColor.brown ? .yellow : .brown
	}


}


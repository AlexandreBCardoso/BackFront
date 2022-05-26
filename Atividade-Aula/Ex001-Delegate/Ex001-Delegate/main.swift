//
//  main.swift
//  Ex001-Delegate
//
//  Created by Alexandre Cardoso on 07/02/21.
//

import Foundation

// Struct Cooki
struct Cookie {
	var size: Int = 5
	var hasChocolateChips: Bool = false
}


// Protocolo Delegate - Bakery
protocol BakeryDelegate {
	
	func cookieWasBaked(_ cookie: Cookie)
	
}


// Classe Bakery
class Bakery {
	
	var delegate: BakeryDelegate?
	
	func makeCookie() {
		var cookie = Cookie()
		cookie.size = 6
		cookie.hasChocolateChips = true
		
		delegate?.cookieWasBaked(cookie)
	}
	
}


// Classe Loja
class CookieShop: BakeryDelegate {
	
	func cookieWasBaked(_ cookie: Cookie) {
		print("Yay! A new cookie was bekery, with size \(cookie.size)")
	}
	
}


// Chamada
let shop = CookieShop()

let bakery = Bakery()
bakery.delegate = shop

bakery.makeCookie()




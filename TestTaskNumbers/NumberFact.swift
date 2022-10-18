//
//  NumberFact.swift
//  TestTaskNumbers
//
//  Created by Viacheslav Tolstopianteko on 16.10.2022.
//

import Foundation


struct NumberFact: Decodable {
	let text: String
	let number: Int?
	let found: Bool
}


extension NumberFact {
	func mapToRealmObject() -> Item {
		let obj = Item()
		obj.text = self.text
		obj.number = self.number ?? 0
		obj.found = found
		return obj
	}
}

//
//  ViewModel.swift
//  TestTaskNumbers
//
//  Created by Viacheslav Tolstopianteko on 16.10.2022.
//

import Foundation
import Combine
import RealmSwift
import SwiftUI
import Realm

class ContentViewModel: ObservableObject {
		
	private var cancellables: Set<AnyCancellable> = []
	
	@ObservedRealmObject var itemGroup: ItemGroup
	
	init(itemGroup: ItemGroup) {
		self.itemGroup = itemGroup
	}

	func loadFact(number: Int) {
		guard let url = URL(string: "http://numbersapi.com/\(number)?json") else { return }
		self.loadFact(url: url)
	}
	
	func loadRandomFact() {
		guard let url = URL(string: "http://numbersapi.com/random/math?json") else { return	}
		self.loadFact(url: url)
	}
	
	private func loadFact(url: URL) {
		URLSession.shared.dataTaskPublisher(for: url)
			.map { $0.data }
			.decode(type: NumberFact.self, decoder: JSONDecoder())
			.map { $0.mapToRealmObject() }
			.receive(on: RunLoop.main)
			.sink(receiveCompletion: { completion in
				print(completion)
			}, receiveValue: { [unowned self] numFact in
//				$itemGroup.items.insert(numFact)
			})
			.store(in: &cancellables)
	}
	
	func cancel() {
		cancellables.removeAll()
	}
}



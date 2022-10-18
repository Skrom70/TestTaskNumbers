//
//  ItemRow.swift
//  TestApp
//
//  Created by Viacheslav Tolstopianteko on 18.10.2022.
//

import Foundation
import SwiftUI
import RealmSwift

struct ItemRow: View {
	@ObservedRealmObject var item: Item
	var body: some View {
		NavigationLink(destination: ItemDetailsView(item: item)) {
			Text(item.text)
				.lineLimit(1)
				.foregroundColor(item.found ? .black : .red)
		}
	}
}

struct ItemDetailsView: View {
	@ObservedRealmObject var item: Item
	var body: some View {
		VStack {
			Text(String(item.number))
				.multilineTextAlignment(.center)
				.padding()
				.font(.title)
				.foregroundColor(item.found ? .black : .red)
			Text(item.text)
				.multilineTextAlignment(.center)
				.padding()
				.foregroundColor(item.found ? .black : .red)
		}
	}
}

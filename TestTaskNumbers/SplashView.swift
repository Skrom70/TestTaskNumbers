//
//  AppCoordinatorView.swift
//  TestApp
//
//  Created by Viacheslav Tolstopianteko on 18.10.2022.
//

import SwiftUI
import RealmSwift


struct SplashView: View {
	@ObservedResults(ItemGroup.self) var itemGroups
	
	var body: some View {
		if let itemGroup = itemGroups.first {
			ContentView(vm: ContentViewModel(itemGroup: itemGroup))
		} else {
			ProgressView().onAppear {
				$itemGroups.append(ItemGroup())
			}
		}
	}
}

//
//  ContentView.swift
//  TestTaskNumbers
//
//  Created by Viacheslav Tolstopianteko on 15.10.2022.
//

import SwiftUI
import RealmSwift

struct ContentView: View {
	
	@StateObject var vm: ContentViewModel
	@State private var inputNumber: String = ""
	@State private var showingAlert = false

	var body: some View {
		NavigationView {
			VStack {
	
				// Text Field
				buildTextField(placehorlder: "Your number")
				
				// Get fact by number
				buildButton(title: "Get fact about input number") {
					if let number = Int(inputNumber) {
						vm.loadFact(number: number)
					} else {
						inputNumber = ""
						showingAlert = true
					}
				}
				.alert("Please enter the number", isPresented: $showingAlert) {
					Button("OK", role: .cancel) { }
				}
				
				// Get fact by random number
				buildButton(title: "Get fact about random number") {
					vm.loadRandomFact()
				}
				
				// List of number facts
				buildList()

			}.onDisappear {
				vm.cancel()
			}
		}
	}
	
	private func buildTextField(placehorlder: String) -> some View {
		TextField(placehorlder, text: $inputNumber)
			.textFieldStyle(RoundedBorderTextFieldStyle())
			.frame(width: 200, alignment: .center)
			.textContentType(.creditCardNumber)
			.multilineTextAlignment(.center)
			.padding()
			.font(.title)
	}
	
	
	private func buildButton(title: String, action: @escaping () -> Void) -> some View {
		return Button(action: action, label: {
			Text(title)
				.font(.headline)
				.fontWeight(.medium)
				.multilineTextAlignment(.center)
				.padding()
				.background(Color.accentColor)
				.foregroundColor(Color.white)
				.cornerRadius(10)
		})
	}
	
	private func buildList() -> some View {
		return List {
			ForEach(vm.itemGroup.items) { item in
				ItemRow(item: item)
			}.onDelete(perform: vm.$itemGroup.items.remove)
				.onMove(perform: vm.$itemGroup.items.move)
		}
	}
}

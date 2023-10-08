//
//  ContentView.swift
//  iTour
//
//  Created by Elliot Knight on 08/10/2023.
//

import SwiftData
import SwiftUI

struct ContentView: View {
	@Environment(\.modelContext) var modelContext
	@Query private var destinations: [Destination]
	@State private var path = [Destination]()
    var body: some View {
		NavigationStack(path: $path) {
			List {
				ForEach(destinations) { destination in
					NavigationLink(value: destination) {
						VStack(alignment: .leading) {
							Text(destination.name)
								.font(.headline)
							Text(destination.date.formatted(date: .long, time: .shortened))
						}
					}
				}
				.onDelete(perform: deletDestinations)
			}
			.navigationTitle("iTour")
			.navigationDestination(for: Destination.self, destination: EditDestinationView.init)
			.toolbar {
				Button("Add Samples", action: addSamples)
				Button("Add destination", systemImage: "plus.circle.fill", action: addDestination)
			}
		}
    }

	func addSamples() {
		let rome = Destination(name: "Rome")
		let florence = Destination(name: "Florence")
		let naples = Destination(name: "Naples")

		modelContext.insert(rome)
		modelContext.insert(florence)
		modelContext.insert(naples)
	}

	func addDestination() {
		let destination = Destination()
		modelContext.insert(destination)
		path = [destination]
	}

	func deletDestinations(_ indexSet: IndexSet) {
		for index in indexSet {
			let destination = destinations[index]
			modelContext.delete(destination)
		}
	}
}

#Preview {
    ContentView()
}

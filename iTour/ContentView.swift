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
	@Query private var destination: [Destination]
    var body: some View {
		NavigationStack {
			List {
				ForEach(destination) { destination in
					VStack(alignment: .leading) {
						Text(destination.name)
							.font(.headline)

						Text(destination.date.formatted(date: .long, time: .shortened))
					}
				}
			}
			.navigationTitle("iTour")
			.toolbar {
				Button("Add Samples", action: addSamples)
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
}

#Preview {
    ContentView()
}

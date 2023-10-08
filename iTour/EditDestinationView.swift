//
//  EditDestinationView.swift
//  iTour
//
//  Created by Elliot Knight on 08/10/2023.
//

import SwiftData
import SwiftUI

struct EditDestinationView: View {
	@Bindable var destination: Destination
	var body: some View {
		Form {
			TextField("Name", text: $destination.name)
			TextField("Detail", text: $destination.detail)
			DatePicker("Date", selection: $destination.date)

			Section("Priority") {
				Picker("Priority", selection: $destination.priority) {
					Text("MEH").tag(1)
					Text("Maybe").tag(2)
					Text("Must").tag(3)
				}
				.pickerStyle(.segmented)
			}
		}
		.navigationTitle("Edit destination")
		.navigationBarTitleDisplayMode(.inline)
	}
}


#Preview {
	do {
		let config = ModelConfiguration(isStoredInMemoryOnly: true)
		let container = try ModelContainer(for: Destination.self, configurations: config)
		let example = Destination(name: "Exemple destination", detail: "Exemple details go here and will automaticaly expend vertically as they are edites")
		return EditDestinationView(destination: example)
			.modelContainer(container)
	} catch {
		fatalError("Failed to create model container")
	}
}

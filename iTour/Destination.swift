//
//  Destination.swift
//  iTour
//
//  Created by Elliot Knight on 08/10/2023.
//

import Foundation
import SwiftData

@Model
class Destination {
	var name: String
	var detail: String
	var date: Date
	var priority: Int

	init(name: String = "", detail: String = "", date: Date = .now, priority: Int = 2) {
		self.name = name
		self.detail = detail
		self.date = date
		self.priority = priority
	}
}

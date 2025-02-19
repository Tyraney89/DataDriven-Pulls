//
//  DateFormatter.swift
//  DataDriven Pulls
//
//  Created by Tyler Burke on 12/23/24.
//

import Foundation

struct GlobalDateFormatter {
    static let shared: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateStyle = .medium
        formatter.timeStyle = .none // Optional if you don't need time
        return formatter
    }()
}

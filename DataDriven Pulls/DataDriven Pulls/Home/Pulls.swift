//
//  Pulls.swift
//  DataDriven Pulls
//
//  Created by Tyler Burke on 12/23/24.
//

import Foundation

struct Pulls: Hashable, Identifiable {
    
    let id = UUID()
    let pullName: String
    let pullLocation: String
    let pullDate: Date
}

struct MockData{
    static var pulls = [
        Pulls(pullName: "Cow Town", pullLocation: "Kansas City MO", pullDate: Date()),
    ]
    
    static func addPull(pullName: String, pullLocation: String, pullDate: Date) {
            let newPull = Pulls(pullName: pullName, pullLocation: pullLocation, pullDate: pullDate)
            pulls.append(newPull)
        }
}

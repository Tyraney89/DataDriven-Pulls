//
//  Pulls.swift
//  DataDriven Pulls
//
//  Created by Tyler Burke on 12/23/24.
//

import Foundation
import SwiftData


@Model
class Pulls {
    @Attribute(.unique) var id = UUID()
    var pullName: String
    var pullLocation: String
    var pullDate: Date
    
    init(pullName: String, pullLocation: String, pullDate: Date) {
            self.id = UUID()
            self.pullName = pullName
            self.pullLocation = pullLocation
            self.pullDate = pullDate
        }
}

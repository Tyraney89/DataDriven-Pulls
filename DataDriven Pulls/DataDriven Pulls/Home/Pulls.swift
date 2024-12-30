//
//  Pulls.swift
//  DataDriven Pulls
//
//  Created by Tyler Burke on 12/23/24.
//

import Foundation
import SwiftData

@Model
class Hook{
    
    var pull: Pull?
    var pullerName: String
    var pullClass: String
    var place: Int
    var distance: String
    var sled: String
    var gear: Int
    var tirePressure: Float
    var frontWeight: Float
    var bellyWeight: Float
    var backWeight: Float
    
    
    init(pull: Pull? = nil, pullerName: String, pullClass: String, place: Int, distance: String, sled: String, gear: Int, tirePressure: Float, frontWeight: Float, bellyWeight: Float, backWeight: Float) {
        self.pull = pull
        self.pullerName = pullerName
        self.pullClass = pullClass
        self.place = place
        self.distance = distance
        self.sled = sled
        self.gear = gear
        self.tirePressure = tirePressure
        self.frontWeight = frontWeight
        self.bellyWeight = bellyWeight
        self.backWeight = backWeight
    }
}

@Model
class Pull {
    @Attribute(.unique) var id = UUID()
    var pullName: String
    var pullLocation: String
    var pullDate: Date
    var hooks: [Hook]
    
    init(pullName: String, pullLocation: String, pullDate: Date, hooks: [Hook]) {
            self.id = UUID()
            self.pullName = pullName
            self.pullLocation = pullLocation
            self.pullDate = pullDate
            self.hooks = hooks
        }
}




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
    var tractor: String
    var place: String
    var distance: String
    var sled: String
    var gear: Int
    var tirePressure: Float
    var frontWeight: Float
    var bellyWeight: Float
    var backWeight: Float
    
    
    init(pull: Pull? = nil, pullerName: String, pullClass: String, place: String, distance: String, sled: String, gear: Int, tirePressure: Float, frontWeight: Float, bellyWeight: Float, backWeight: Float, tractor: String) {
        self.pull = pull
        self.pullerName = pullerName
        self.pullClass = pullClass
        self.place = place
        self.distance = distance
        self.sled = sled
        self.gear = gear
        self.tirePressure = tirePressure.isNaN ? 0.0 : tirePressure
        self.frontWeight = frontWeight.isNaN ? 0.0 : frontWeight
        self.bellyWeight = bellyWeight.isNaN ? 0.0 : bellyWeight
        self.backWeight = backWeight.isNaN ? 0.0 : backWeight
        
        self.tractor = tractor
    }
}

@Model
class Pull {
    @Attribute(.unique) var id = UUID()
    var pullName: String
    var pullLocation: String
    var pullDate: Date
    var hooks: [Hook]
    
    init(pullName: String, pullLocation: String, pullDate: Date, hooks: [Hook] = []) {
        self.id = UUID()
        self.pullName = pullName
        self.pullLocation = pullLocation
        self.pullDate = pullDate
        self.hooks = hooks.isEmpty ? [] : hooks
    }
}




import Foundation
import SwiftData

@Model
class Hook {
    
    // Required fields
    var pull: Pull?
    var pullerName: String
    var pullClass: String
    var tractor: String
    var place: String
    var distance: String
    var sled: String
    var tirePressure: Float

    // Custom categories for flexibility
    var customCategories: [String: String]
    
    init(
        pull: Pull? = nil,
        pullerName: String,
        pullClass: String,
        tractor: String,
        place: String,
        distance: String,
        sled: String,
        tirePressure: Float,
        customCategories: [String: String] = [:]
    ) {
        self.pull = pull
        self.pullerName = pullerName
        self.pullClass = pullClass
        self.tractor = tractor
        self.place = place
        self.distance = distance
        self.sled = sled
        self.tirePressure = tirePressure
        self.customCategories = customCategories
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
        self.hooks = hooks
    }
}

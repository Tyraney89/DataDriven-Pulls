//
//  InsertPull.swift
//  DataDriven Pulls
//
//  Created by Tyler Burke on 12/22/24.
//

import SwiftUI

struct InsertPull: View {
    //Pull Details
    @State private var puller: String = ""
    @State private var distance: String = ""
    @State private var sled: String = ""
    @State private var tclass: String = ""
    
    //Tractor Details
    @State private var tirePressure: String = ""
    @State private var gear: String = ""
    @State private var frontWeight: String = ""
    @State private var bellyWeight: String = ""
    @State private var backWeight: String = ""
    
    var body: some View {
        NavigationView{
            VStack{
                Form{
                    Section(header: Text("Pull Details")){
                        TextField("Puller (e.g., Rick)", text: $puller)
                        TextField("Class (e.g., 9500 Pro Farm)", text: $tclass)
                        TextField("Distance (e.g., 300 ft)", text: $distance).keyboardType(.decimalPad)
                        TextField("Sled (e.g., Red Rock)", text: $sled)
                    }
                    
                    
                    Section(header: Text("Tractor Details")){
                        TextField("Tire Pressure (e.g., 25.5 psi)", text: $tirePressure)
                        TextField("Gear (e.g., 3rd)", text: $gear)
                        TextField("Front Weight (e.g., 300 lbs)", text: $frontWeight)
                        TextField("Belly Weight (e.g., 300 lbs", text: $bellyWeight)
                        TextField("Back Weight (e.g., 300 lbs)", text: $backWeight)
                    }
                }.navigationTitle("Insert Pull")
                
            }
        }
    }
}

#Preview {
    InsertPull()
}

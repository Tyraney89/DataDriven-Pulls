//
//  NewHookView.swift
//  DataDriven Pulls
//
//  Created by Tyler Burke on 12/23/24.
//

import SwiftUI

struct NewHookView: View {
        //Hook Details
        @State private var puller: String = ""
        @State private var tractor: String = ""
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
                    Section(header: Text("Hook Details")){
                        TextField("Puller Name (e.g., Rick)", text: $puller)
                        TextField("Tractor Name (e.g., WhyNot)", text: $tractor)
                        TextField("Class Name (e.g., 9500 Pro Farm)", text: $tclass)
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
                }.navigationTitle("Record a New Hook")
                    .accentColor(Color("PullingColor"))
                Button(action: saveHook) {
                    Text("Save Hook")
                        .foregroundColor(.white)
                        .frame(maxWidth: .infinity)
                        .padding()
                        .background(Color("PullingColor"))
                        .cornerRadius(10)
                }
            }
        }.navigationViewStyle(StackNavigationViewStyle())
    }
    func saveHook() {

        }
}

#Preview {
    NewHookView()
}

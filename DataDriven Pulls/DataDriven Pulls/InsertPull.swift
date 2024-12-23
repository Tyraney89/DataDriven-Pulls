//
//  InsertPull.swift
//  DataDriven Pulls
//
//  Created by Tyler Burke on 12/22/24.
//

import SwiftUI
import MapKit
import CoreLocation

struct InsertPull: View {
    //Pull details
    @State private var pullName: String = ""
    @State private var pullDate = Date()
    @State private var pullLocation: String = ""
    var body: some View {
        NavigationView{
            VStack{
                Form{
                    Section(header: Text("Pull Details")){
                        TextField("Pull Name (e.g., Cow Town)", text: $pullName)
                        DatePicker("Pull Date", selection: $pullDate, displayedComponents: .date)
                        TextField("Pull Location (e.g., Kansas City MO)", text: $pullLocation)
                    }
                }.navigationTitle("Record a New Pull")
                
            }
        }
    }
}

#Preview {
    InsertPull()
}

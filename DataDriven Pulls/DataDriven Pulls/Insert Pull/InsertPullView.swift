//
//  InsertPull.swift
//  DataDriven Pulls
//
//  Created by Tyler Burke on 12/22/24.
//

import SwiftUI

struct InsertPullView: View {
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
                    Button(action: savePull) {
                        Text("Save Pull")
                            .foregroundColor(.white)
                            .frame(maxWidth: .infinity)
                            .padding()
                            .background(Color("PullingColor"))
                            .cornerRadius(10)
                    }
                }
                .navigationTitle("Record a New Pull")
                .accentColor(Color("PullingColor"))
                
            }
        }
    }
    func savePull() {
            // Add the new pull to the MockData
            MockData.addPull(pullName: pullName, pullLocation: pullLocation, pullDate: pullDate)
            
            // Clear the form fields after saving
            pullName = ""
            pullLocation = ""
            pullDate = Date()
        }
}

#Preview {
    InsertPullView()
}

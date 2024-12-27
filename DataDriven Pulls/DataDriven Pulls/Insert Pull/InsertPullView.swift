//
//  InsertPull.swift
//  DataDriven Pulls
//
//  Created by Tyler Burke on 12/22/24.
//

import SwiftUI
import SwiftData

struct InsertPullView: View {
    
    @Environment(\.modelContext) private var modelContext
    
    
    //Pull details
    @State private var pullName: String = ""
    @State private var pullDate = Date()
    @State private var pullLocation: String = ""
    
    @Binding var selectedTab: Int
    
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
        .navigationViewStyle(StackNavigationViewStyle())
    }
    func savePull() {
        let newPull = Pulls(pullName: pullName, pullLocation: pullLocation, pullDate: pullDate)
                modelContext.insert(newPull)
                do {
                    try modelContext.save()
                    selectedTab = 0
                } catch {
                    print("Failed to save the pull: \(error)")
                }
        
                //clear form
                pullName = ""
                pullLocation = ""
                pullDate = Date()

        }
}


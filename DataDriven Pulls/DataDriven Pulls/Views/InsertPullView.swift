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
    @Environment(\.dismiss) private var dismiss
    
    
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
                .toolbar {
                    ToolbarItem(placement: .navigationBarTrailing) {
                        Button(action: {
                            dismiss()  // Dismiss the view when "X" is tapped
                        }) {
                            Image(systemName: "xmark")
                                .foregroundColor(.primary)
                                .padding()
                        }
                    }
                }
                .accentColor(Color("PullingColor"))
                
            }
        }
        .navigationViewStyle(StackNavigationViewStyle())
    }
    func savePull() {
        let newPull = Pull(pullName: pullName, pullLocation: pullLocation, pullDate: pullDate, hooks: [])
                modelContext.insert(newPull)
                do {
                    try modelContext.save()
                    dismiss()
                } catch {
                    print("Failed to save the pull: \(error)")
                }
        }
}


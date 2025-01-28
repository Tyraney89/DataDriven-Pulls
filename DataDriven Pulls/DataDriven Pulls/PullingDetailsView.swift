//
//  PullingDetailsView.swift
//  DataDriven Pulls
//
//  Created by Tyler Burke on 12/22/24.
//

import SwiftUI
import SwiftData

struct PullingDetailsView: View {
    
    @Environment(\.modelContext) private var modelContext
    @State private var showNewHookView = false
    @State private var selectedHook: Hook?
    var pull: Pull
    
    var body: some View {
        NavigationView{
            VStack{
                HStack{
                    VStack(alignment: .leading){
                        Text("Date: \(GlobalDateFormatter.shared.string(from: pull.pullDate))")
                        Text("Location: \(pull.pullLocation)")
                    }
                    Spacer()
                }
                .padding()
                    List{
                        ForEach(pull.hooks) { hook in
                                Hooks(
                                    Puller: hook.pullerName,
                                    Class: hook.pullClass,
                                    Distance: hook.distance,
                                    Place: hook.place
                                )
                                .onTapGesture {
                                    selectedHook = hook
                                }
                            .swipeActions {
                                Button(role: .destructive) {
                                    deleteHook(hook)
                                } label: {
                                    Label("Delete", systemImage: "trash")
                                }
                            }
                        }
                    }
                    .listStyle(PlainListStyle())
                    Button(action: {
                                    showNewHookView.toggle()  // Show NewHookView sheet
                                }) {
                                    Text("Add New Hook")
                                        .foregroundColor(.white)
                                        .frame(maxWidth: .infinity)
                                        .padding()
                                        .background(Color("PullingColor"))
                                        .cornerRadius(10)
                                }
                                .padding()
                                .sheet(isPresented: $showNewHookView) {
                                    NewHookView(pull: pull)  // Pass the pull to NewHookView
                                }
            }.navigationTitle(pull.pullName)
                .sheet(item: $selectedHook) { hook in
                                EditHookView(hook: hook)  // Show the edit view for the selected hook
                            }
        }
    }
    func deleteHook(_ hook: Hook) {
        modelContext.delete(hook)
        do {
            try modelContext.save()
        } catch {
            print("Error saving context after deletion: \(error.localizedDescription)")
        }
    }
}


struct Hooks: View {
    var Puller: String
    var Class: String
    var Distance: String
    var Place: String
    var body: some View {
        VStack{
            HStack{
                VStack(alignment: .leading)
                {
                    Text(Puller).font(.headline)
                    Spacer()
                    Text(Class).font(.subheadline).foregroundColor(.gray)
                }
                Spacer()
                VStack{
                    Text(Distance).font(.subheadline).foregroundColor(Color("PullingColor"))
                    Text(Place).font(.subheadline).foregroundColor(Color("PullingColor"))
                }
            }
            .padding() // Padding inside the bubble
            .background(Color("PullingColor").opacity(0.1)) // Background color for the bubble
            .cornerRadius(15) // Rounded corners for the bubble
            .shadow(radius: 5) // Shadow to give it a lifted effect
            .padding(.horizontal) // Padding on the sides of the bubble
        }
        .padding(.vertical, 8)
        .listRowInsets(EdgeInsets())
    }
}


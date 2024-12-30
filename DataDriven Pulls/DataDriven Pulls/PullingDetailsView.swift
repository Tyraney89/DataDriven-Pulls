//
//  PullingDetailsView.swift
//  DataDriven Pulls
//
//  Created by Tyler Burke on 12/22/24.
//

import SwiftUI
import SwiftData

struct PullingDetailsView: View {
    
    @Query var hooks: [Hook] // Use @Query to filter hooks
    var viewModel: Pull
    
    init(viewModel: Pull) {
        self.viewModel = viewModel
        _hooks = Query(filter: #Predicate { hook in
            hook.pull?.id == viewModel.id // Compare the `pull.id` with `viewModel.id`
        })
    }
    
    var body: some View {
        NavigationView{
            VStack{
                HStack{
                    VStack(alignment: .leading){
                        Text(GlobalDateFormatter.shared.string(from: viewModel.pullDate))
                        Text(viewModel.pullLocation)
                    }
                    Spacer()
                }.padding()
                NavigationView{
                    List{
                        ForEach(viewModel.hooks) { hook in
                            Hooks(
                                Puller: hook.pullerName,
                                Class: hook.pullClass,
                                Distance: hook.distance,
                                Place: "\(hook.place)"
                            )
                            .swipeActions {
                                Button(role: .destructive) {
                                    deleteHook(hook)
                                } label: {
                                    Label("Delete", systemImage: "trash")
                                }
                            }
                        }
                    }
                }
            }.navigationTitle(viewModel.pullName)
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


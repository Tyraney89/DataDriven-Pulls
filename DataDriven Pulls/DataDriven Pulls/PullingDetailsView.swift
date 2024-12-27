//
//  PullingDetailsView.swift
//  DataDriven Pulls
//
//  Created by Tyler Burke on 12/22/24.
//

import SwiftUI

struct PullingDetailsView: View {
    var viewModel: Pulls
    
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
                    ScrollView{
                        LazyVStack{
                            Hooks(Puller: "Rick", Class: "9500 Pro Farm", Distance: "300 ft", Place: "1st")
                            Hooks(Puller: "Jerrica", Class: "9500 Pro Farm", Distance: "300 ft", Place: "1st")
                        }
                        .navigationTitle("Hooks")
                    }
                }
            }.navigationTitle(viewModel.pullName)
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


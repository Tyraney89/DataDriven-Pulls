//
//  HomeView.swift
//  DataDriven Pulls
//
//  Created by Tyler Burke on 12/22/24.
//

import SwiftUI

struct HomeView: View {
    var body: some View {
        TabView{
            NavigationView{
                ScrollView{
                    LazyVStack{
                        PullRow(Location: "New Market", Class: "9500 Pro farm", Date: "11-11-02")
                        PullRow(Location: "Burlington Junciton", Class: "Pro Stock", Date: "11-11-02")
                        PullRow(Location: "St Joeseph", Class: "10mph clas", Date: "11-11-02")
                        PullRow(Location: "Mexico", Class: "Pro Stock", Date: "11-11-02")
                        PullRow(Location: "St Joeseph", Class: "10mph clas", Date: "11-11-02")
                        PullRow(Location: "Mexico", Class: "Pro Stock", Date: "11-11-02")
                        PullRow(Location: "St Joeseph", Class: "10mph clas", Date: "11-11-02")
                        PullRow(Location: "Mexico", Class: "Pro Stock", Date: "11-11-02")
                        PullRow(Location: "St Joeseph", Class: "10mph clas", Date: "11-11-02")
                        PullRow(Location: "Mexico", Class: "Pro Stock", Date: "11-11-02")
                    }
                    .navigationTitle("Recent Pulls")
                }
            }.tabItem {
                Image(systemName: "house")
                Text("Home")
            }
            InsertPull().tabItem {
                Image(systemName: "plus.app")
                Text("Add Pull")
            }
        }.accentColor(Color("PullingColor"))
    }
}

#Preview {
    HomeView()
}


struct PullRow: View {
    var Location: String
    var Class: String
    var Date: String
    var body: some View{
        VStack{
            HStack{
                VStack(alignment: .leading)
                {
                    Text(Location).font(.headline)
                    Spacer()
                    Text(Class).font(.subheadline).foregroundColor(.gray)
                }
                Spacer()
                VStack{
                    Text(Date).font(.subheadline).foregroundColor(Color("PullingColor"))
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

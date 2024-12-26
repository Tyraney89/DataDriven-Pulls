//
//  HomeView.swift
//  DataDriven Pulls
//
//  Created by Tyler Burke on 12/22/24.
//

import SwiftUI
import SwiftData

struct HomeView: View {
    
    @Query
    var pulls: [Pulls]
    
    @State private var selectedTab = 0
    
    var body: some View {
        TabView{
            NavigationView{
                ScrollView{
                    LazyVStack{
                        ForEach(pulls) { pull in
                            PullRow(Name: pull.pullName, Location: pull.pullLocation, Date: pull.pullDate).onTapGesture {
                            }
                        }
                    }
                    .navigationTitle("Recent Pulls")
                }
                
            }.tabItem {
                Image(systemName: "house")
                Text("Home")
            }
            .tag(0)
            InsertPullView(selectedTab: $selectedTab).tabItem {
                Image(systemName: "plus.app")
                Text("Add Pull")
            }
            .tag(1)
        }.accentColor(Color("PullingColor"))
    }
}


#Preview {
    HomeView()
}


struct PullRow: View {
    var Name: String
    var Location: String
    var Date: Date

    var body: some View{
            VStack{
                HStack{
                    VStack(alignment: .leading)
                    {
                        Text(Name).font(.title2)
                        Spacer()
                        Text(Location)
                    }
                    Spacer()
                    VStack{
                        Text(GlobalDateFormatter.shared.string(from: Date)).font(.subheadline).foregroundColor(Color("PullingColor"))
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

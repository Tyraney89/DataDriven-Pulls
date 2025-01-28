//
//  HomeView.swift
//  DataDriven Pulls
//
//  Created by Tyler Burke on 12/22/24.
//

import SwiftUI
import SwiftData

struct HomeView: View {
    @Environment(\.modelContext) private var modelContext
    @Query(sort: \Pull.pullDate, order: .reverse) var pulls: [Pull]
    
    
    var body: some View {
        TabView{
            NavigationView{
                List{
                    ForEach(pulls) { pull in
                        NavigationLink(destination: PullingDetailsView(pull: pull)) {
                            PullRow(Name: pull.pullName, Location: pull.pullLocation, Date: pull.pullDate)
                        }
                        .navigationTitle("Recent Pulls")
                    }
                    .onDelete(perform: deletePull)
                    
                }
                .listStyle(PlainListStyle())
                
            }
            .navigationViewStyle(StackNavigationViewStyle())
            .tabItem {
                Image(systemName: "house")
                Text("Home")
            }
            InsertPullView().tabItem {
                Image(systemName: "plus.app")
                Text("Add Pull")
            }
        }.accentColor(Color("PullingColor"))
    }
    private func deletePull(at offsets: IndexSet) {
        for index in offsets {
            let pull = pulls[index]
            modelContext.delete(pull)
        }
        
        do {
            try modelContext.save()
        } catch {
            print("Failed to delete the pull: \(error.localizedDescription)")
        }
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

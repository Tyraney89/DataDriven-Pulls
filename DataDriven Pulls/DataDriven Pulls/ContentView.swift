//
//  ContentView.swift
//  DataDriven Pulls
//
//  Created by Tyler Burke on 12/22/24.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationLink(destination: InsertPull()){
            Text("insert pull")
        }
        }
}


#Preview {
    ContentView()
}

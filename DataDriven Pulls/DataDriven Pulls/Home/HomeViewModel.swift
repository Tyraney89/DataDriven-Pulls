//
//  HomeViewModel.swift
//  DataDriven Pulls
//
//  Created by Tyler Burke on 12/23/24.
//

import SwiftUI
import Observation

@Observable final class PullsViewModel{
    var selectedPull: Pulls? {
        didSet{
            isShowingDetailView = true
        }
    }
    
    
    var isShowingDetailView = false
}

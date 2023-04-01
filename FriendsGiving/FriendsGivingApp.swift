//
//  FriendsGivingApp.swift
//  FriendsGiving
//
//  Created by Lori Rothermel on 4/1/23.
//

import SwiftUI

@main
struct FriendsGivingApp: App {
    @StateObject var friendsVM = FriendsViewModel()
    
    
    var body: some Scene {
        WindowGroup {
            ListView()
                .environmentObject(friendsVM)
        }
    }
}

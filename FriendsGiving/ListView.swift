//
//  ListView.swift
//  FriendsGiving
//
//  Created by Lori Rothermel on 4/1/23.
//

import SwiftUI

struct ListView: View {
    @EnvironmentObject var friendsVM: FriendsViewModel
    @State private var sheetPresented = false
    
    
    var body: some View {
        NavigationStack {
            List {
                ForEach(friendsVM.friends) { friend in
                    NavigationLink {
                        DetailView(friend: friend)
                    } label: {
                        VStack {
                            Text(friend.name)
                                .font(.title2)
                            Text(friend.bringing)
                                .font(.callout)
                        }  // VStack
                    }  // Navigationlink
                }  // ForEach
                .onDelete(perform: friendsVM.deleteFriend)
                .onMove(perform: friendsVM.moveFriend)
            }  // List
            .listStyle(.plain)
            .navigationTitle("Friends")
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    EditButton()
                }  // ToolbarItem
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button {
                        sheetPresented.toggle()
                    } label: {
                        Image(systemName: "plus")
                    }

                }  // ToolbarItem
                
            }  // .toolbar
        }  // NavigationStack
        .sheet(isPresented: $sheetPresented) {
            NavigationStack {
                DetailView(friend: Friend())
            }  // NavigationStack
        }  // .sheet
        
    }  // some View
}  // ListView

struct ListView_Previews: PreviewProvider {
    static var previews: some View {
        ListView()
            .environmentObject(FriendsViewModel())
    }
}

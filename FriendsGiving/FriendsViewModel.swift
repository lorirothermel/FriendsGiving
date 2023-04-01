//
//  FriendsViewModel.swift
//  FriendsGiving
//
//  Created by Lori Rothermel on 4/1/23.
//

import Foundation



class FriendsViewModel: ObservableObject {
    @Published var friends: [Friend] = []
        
    init() {
        
        loadData()
        
    }
    
    func saveFriend(friend: Friend) {
        if friend.id == nil {           // This is a new friend to append. Create an id first.
            var newFriend = friend
            newFriend.id = UUID().uuidString
            friends.append(newFriend)
        } else {                        // This is an existing friend we're editing. Find the index to update.
            if let index = friends.firstIndex(where: { $0.id == friend.id }) {
                friends[index] = friend
            }  // if let index
        }  // if friend.id
        
        saveData()
        
    }  // func saveFriend
    
    
    func deleteFriend(atOffsets: IndexSet) {
        friends.remove(atOffsets: atOffsets)
        saveData()
    }  // func deleteFriend
    
    
    func moveFriend(fromOffsets: IndexSet, toOffset: Int) {
        friends.move(fromOffsets: fromOffsets, toOffset: toOffset)
        saveData()
    }  // func moveFriend
        
    
    private func loadData() {
        let path = URL.documentsDirectory.appending(component: "friends")
        guard let data = try? Data(contentsOf: path) else {
            print("🤬 ERROR: Could not read data from path \(path)")
            return
        }  // guard let data
        
        do {
            friends = try JSONDecoder().decode([Friend].self, from: data)
        } catch {
            print("🤬 ERROR: Could not decode data. \(error.localizedDescription)")
        }
        
        
    }
    
    
    private func saveData() {
        let path = URL.documentsDirectory.appending(component: "friends")
        let data = try? JSONEncoder().encode(friends)   // try? Ignore error
        
        do {
            try data?.write(to: path)
        } catch {
            print("🤬 ERROR: Could not save data. \(error.localizedDescription)")
        }  // do...catch
    }  // func saveData
    
    
    
    
    
    
    
}

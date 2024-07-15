//
//  ContentView.swift
//  ToDoList
//
//  Created by Kajal, Kajal on 30/06/24.
//

import SwiftUI

struct ContentView: View {
    @StateObject var viewModel = MainViewViewModel()
    var body: some View {
        if viewModel.isSignedIn , !viewModel.currentUserId.isEmpty {
            accountView
        }
        else {
            LoginView()
        }
   }
    
    @ViewBuilder
    var accountView : some View {
        TabView{
            ToDoListView(userId:viewModel.currentUserId).tabItem{
                Label("Home",systemImage: "house")
            }
            ProfileView().tabItem{
                Label("Profile",systemImage: "person.circle")
            }
            
        }
    }
}

#Preview {
    ContentView()
}

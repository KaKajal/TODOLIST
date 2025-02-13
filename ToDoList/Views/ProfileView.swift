//
//  ProfileView.swift
//  ToDoList
//
//  Created by Kajal, Kajal on 30/06/24.
//

import SwiftUI

struct ProfileView: View {
    @StateObject var viewModel = ProfileViewViewModel()
    
    
    var body: some View {
        NavigationView{
            VStack{
                if let user  = viewModel.user{
                    Image(systemName: "person.circle")
                       .resizable()
                       .aspectRatio(contentMode: .fit)
                       .foregroundColor(Color.yellow)
                       .frame(width: 125,height: 125)
                   VStack(alignment: .leading){
                       HStack{
                           Text("Name: ")
                               .bold()
                           Text(user.name)
                       }.padding()
                       HStack{
                           Text("Email: ")
                               .bold()
                           Text(user.email)
                       }.padding()
                       HStack{
                           Text("Member since ")
                               .bold()
                           Text("\(Date(timeIntervalSince1970: user.joined).formatted(date: .abbreviated, time: .shortened))")
                              
                       }.padding()
                       
                    }
                   TLButtonView(title: "Logout", background: .red){
                       viewModel.logout()
                   }
                   .frame(height: 45)
                   .padding(.horizontal, 20)

                }
                else {
                    Text("loading Profile .....")
                }
                
            }.navigationTitle("Profile")
        }.onAppear{
            viewModel.fetchUser()
        }
    }
}

#Preview {
    ProfileView()
}

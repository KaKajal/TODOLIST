//
//  ToDoListitemsView.swift
//  ToDoList
//
//  Created by Kajal, Kajal on 30/06/24.
//

import SwiftUI

struct ToDoListItemView: View {
    @StateObject var viewModel = ToDoListItemsViewViewModel()
    let item : ToDoListItem
    
    
    var body: some View {
        HStack{
            VStack{
                Text(item.title)
                    .font(.title)
                    .bold()
                Text("\(Date(timeIntervalSince1970: item.dueDate).formatted(date: .abbreviated, time: .shortened))")
                    .font(.footnote)
                    .foregroundColor(Color(.secondaryLabel))
            }
        Spacer()
            Button{
                viewModel.toggleIsDone(item:item)
                
            } label: {
                Image(systemName: item.isDone ? "checkmark.circle.fill":"circle")
            }.foregroundColor(Color.yellow)
        }
    }
}

#Preview {
    ToDoListItemView(item: .init(id: "123", title: "get Milk", dueDate: Date().timeIntervalSince1970, createDate: Date().timeIntervalSince1970, isDone: false))
}

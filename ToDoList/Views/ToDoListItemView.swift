//
//  ToDoListitemsView.swift
//  ToDoList
//
//  Created by Kajal, Kajal on 30/06/24.
//

import SwiftUI

struct ToDoListItemView: View {
    let item : ToDoListItem
    
    var body: some View {
        HStack{
            VStack{
                Text(item.title)
//                Text("\(Date(timeIntervalSince1970: item.dueDate).formatted(date: .abbreviated, time: .shortened))")
            }
        }
    }
}

#Preview {
    ToDoListItemView()
}

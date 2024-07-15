//
//  ToDoListView.swift
//  ToDoList
//
//  Created by Kajal, Kajal on 30/06/24.
//

import SwiftUI
import FirebaseFirestore

struct ToDoListView: View {
    @StateObject var viewModel: ToDoListViewViewModel
    @FirestoreQuery var items : [ToDoListItem]

    init(userId :String){
        self._items = FirestoreQuery(collectionPath:"users/\(userId)/todos")
        
        self._viewModel = StateObject(wrappedValue: ToDoListViewViewModel(userId: userId))
    }
    
    var body: some View {
 
        NavigationView{
            
            VStack{
                List(items){ item in
                    ToDoListItemView(item: item)
                        .swipeActions{
                            Button("Delete") {
                                viewModel.delete(id: item.id)
                            }
                            .tint(.red)
                        }
                    
                }
                .listStyle(PlainListStyle())
                
            }.navigationTitle("TO Do List")
                .toolbar{
                    Button {
                        viewModel.showingNewItemView = true
                    } label: {
                        Image(systemName: "plus")
                    }
                }
                .sheet(isPresented: $viewModel.showingNewItemView){
                    NewItemIView(newItemPresented: $viewModel.showingNewItemView)
                    
                }
        }
    }
}

#Preview {
    ToDoListView(userId: "xd3dfhq12BTtEEhBfYOEBde1zrx2")
}

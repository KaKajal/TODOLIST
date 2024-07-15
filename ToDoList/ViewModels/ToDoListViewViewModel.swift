//
//  ToDoListViewViewModel.swift
//  ToDoList
//
//  Created by Kajal, Kajal on 30/06/24.
//
import FirebaseFirestore
import Foundation
class ToDoListViewViewModel : ObservableObject {
    @Published var showingNewItemView = false
    private let userId : String
    
    init (userId : String){
        self.userId = userId
    }
    
    func delete(id:String){
        let db = Firestore.firestore()
        
        db.collection("users")
            .document(userId)
            .collection("todos")
            .document(id)
            .delete()
        
        
    }
}

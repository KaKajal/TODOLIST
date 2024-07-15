//
//  NewItemIViewViewModel.swift
//  ToDoList
//
//  Created by Kajal, Kajal on 30/06/24.
//

import Foundation
import FirebaseFirestore
import FirebaseAuth
class NewItemViewViewModel : ObservableObject {
    @Published var title = ""
    @Published var dueDate = Date()
    @Published var showAlert = false
    
    init(){
        
    }
    func save() {
        guard canSave else {
            return
        }
        guard let uId = Auth.auth().currentUser?.uid else {
            return
        }
        
        let newId = UUID().uuidString
        let newItem = ToDoListItem(id: newId, title: title, dueDate: dueDate.timeIntervalSince1970 , createDate: Date().timeIntervalSince1970, isDone: false)
        
        
        
        let db = Firestore.firestore()
        db.collection("users")
            .document(uId)
            .collection("todos")
            .document(newId)
            .setData(newItem.asDictionary())
        // create modal and save mmodel
        
       
    }
    var canSave: Bool{
        guard !title.trimmingCharacters(in: .whitespaces).isEmpty else {
            return false
        }
        guard dueDate >=  Date().addingTimeInterval(-86400) else {
            return false
        }
        return true
        
    }
}

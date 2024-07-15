//
//  RegisterViewViewModel.swift
//  ToDoList
//
//  Created by Kajal, Kajal on 30/06/24.
//

import Foundation
import FirebaseAuth
import FirebaseFirestore
class RegisterViewViewModel:ObservableObject{
    @Published var name = ""
    @Published var email = ""
    @Published var password = ""
    
    init(){}
    
    func register(){
        guard validate() else {
            return
        }
        Auth.auth().createUser(withEmail: email, password: password){ result , error  in
            guard let userId = result?.user.uid else {
                return
            }
            self.insertUserRecoard(id: userId)
        }
    }
    private func insertUserRecoard (id : String) {
        
        let newUser = User(id: id, name: name, joined: Date().timeIntervalSince1970, email: email)
        
        let db = Firestore.firestore()
        db.collection("users")
            .document(id)
            .setData(newUser.asDictionary())
        
        
    }
    private func validate() -> Bool{
        guard !name.trimmingCharacters(in: .whitespaces).isEmpty,
              !email.trimmingCharacters(in: .whitespaces).isEmpty,
              !password.trimmingCharacters(in: .whitespaces).isEmpty else {
            return false
        }
        guard email.contains("@") && email.contains(".") else {
            return false
        }
        return true
    }
}

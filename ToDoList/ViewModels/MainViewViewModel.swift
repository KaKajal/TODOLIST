//
//  MainViewViewModel.swift
//  ToDoList
//
//  Created by Kajal, Kajal on 30/06/24.
//
import FirebaseAuth
import Foundation
class MainViewViewModel :ObservableObject {
    @Published var currentUserId : String = ""
    private var  handler : AuthStateDidChangeListenerHandle?
    
    init () {
        self.handler =  Auth.auth().addStateDidChangeListener { [weak self] _ ,user in
            DispatchQueue.main.async {
                self?.currentUserId = user?.uid ?? ""
            }
        }
    }
    
    
    public var isSignedIn:Bool{
     return Auth.auth().currentUser != nil
    }
    
}

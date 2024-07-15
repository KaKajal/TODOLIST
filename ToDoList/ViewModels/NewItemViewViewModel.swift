//
//  NewItemIViewViewModel.swift
//  ToDoList
//
//  Created by Kajal, Kajal on 30/06/24.
//

import Foundation
class NewItemIViewViewModel : ObservableObject {
    @Published var Title = ""
    @Published var dueDate = Date()
    
    init(){
        
    }
}

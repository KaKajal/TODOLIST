//
//  ToDoListItem.swift
//  ToDoList
//
//  Created by Kajal, Kajal on 30/06/24.
//

import Foundation
struct ToDoListItem: Codable, Identifiable {
    let id : String
    let title : String
    let dueDate : TimeInterval
    let createDate : TimeInterval
    var isDone : Bool
    mutating func setDone (_ state:Bool){
        isDone = state
    }
    
}

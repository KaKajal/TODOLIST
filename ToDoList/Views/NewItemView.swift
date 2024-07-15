//
//  NewItemIView.swift
//  ToDoList
//
//  Created by Kajal, Kajal on 30/06/24.
//

import SwiftUI

struct NewItemIView: View {
    @StateObject var viewModel = NewItemViewViewModel()
    @Binding var newItemPresented  : Bool
    
    var body: some View {
        VStack{
            Text(" new Item ")
                .font(.system(size:32))
                .bold()
                .padding(.top,10)
            
            
            Form{
                TextField("Title",text: $viewModel.title)
                    .textFieldStyle(DefaultTextFieldStyle())
                
                DatePicker("Due Date",selection: $viewModel.dueDate)
                    .datePickerStyle(GraphicalDatePickerStyle())
                TLButtonView(title: "Save", background: .pink) {
                   if viewModel.canSave {
                        viewModel.save()
                        newItemPresented = false
                    }
                    else {
                        viewModel.showAlert = true
                    }
             
                }
                .padding()
            }
            .alert(isPresented: $viewModel.showAlert){
                Alert(title: Text("Error"),message:Text("Please fill in all fileds and select due date that is today or newer."))
            }
        }
    }
}

#Preview {
    NewItemIView( newItemPresented: Binding(get: {
        return true
        
    }, set: {_ in
    }))
}

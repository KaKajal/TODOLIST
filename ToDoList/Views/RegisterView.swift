//
//  RegisterView.swift
//  ToDoList
//
//  Created by Kajal, Kajal on 30/06/24.
//

import SwiftUI


struct RegisterView: View {
    @StateObject var viewModel = RegisterViewViewModel()
    var body: some View {
        NavigationView{
            VStack{
                HeaderView(Title: "REGISTER", SubTitle: "START ORGANIZAING TODO", angle:-15, background: .orange)
                Form{
                    TextField("Name",text:$viewModel.name)
                        .textFieldStyle(DefaultTextFieldStyle())
                        .autocorrectionDisabled()
                    
                    TextField("Email Address",text:$viewModel.email)
                        .textFieldStyle(DefaultTextFieldStyle())
                        .autocorrectionDisabled()
                        .autocapitalization(.none)
                    SecureField("Password",text:$viewModel.password)
                        .textFieldStyle(DefaultTextFieldStyle ())
                    TLButtonView(title: "Login In", background: .yellow){
                        viewModel.register()
                    }
                    .padding()
                }
                    VStack{
                        NavigationLink("Already have an account An account", destination: LoginView())
                    }.padding(.bottom,20)
                }
                .offset(y:-50)
                Spacer()
        }

        
        
       
        
    }
}

#Preview {
    RegisterView()
}

//
//  HeaderView.swift
//  ToDoList
//
//  Created by Kajal, Kajal on 30/06/24.
//

import SwiftUI

struct HeaderView: View {
    let Title: String;
    let SubTitle:String;
    let angle:Double;
    let background:Color;
    var body: some View {
        ZStack{
            RoundedRectangle(cornerRadius: 0).foregroundColor(background)/*.rotationEffect(Angle(degrees: angle))*/
              
            
            VStack{
                Text(Title).font(.system(size:40))
                    .foregroundColor(Color.white)
                    .bold()
                Text(SubTitle).font(.system(size:20))
                    .foregroundColor(Color.white)
                    .bold()
                
            }
            
            .padding(.top,100)
        }
        .frame(width: UIScreen.main.bounds.width * 3,height: 150)
        .offset(y:-100)    }
}

#Preview {
    HeaderView(Title: "Title", SubTitle: "subtile", angle:15, background: Color.pink)
}

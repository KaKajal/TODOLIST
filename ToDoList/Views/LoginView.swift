import SwiftUI

struct LoginView: View {
    @StateObject var viewModel = LoginViewViewModel()
    
    var body: some View {
        NavigationView {
            VStack {
                HeaderView(Title: "Login", SubTitle: "START ORGANIZAING TODO", angle:-15, background: .orange)

                Form {
                    if !viewModel.errorMsg.isEmpty{
                        Text(viewModel.errorMsg)
                            .foregroundStyle(Color.red)
                    }
                    TextField("Email Address", text: $viewModel.email)
                        .textFieldStyle(DefaultTextFieldStyle())
                    SecureField("Password", text: $viewModel.password)
                        .textFieldStyle(DefaultTextFieldStyle())
                    TLButtonView(title: "Login In", background: .yellow) {
                        viewModel.login()
                    }
                    .padding()
                }
                
                VStack {
                    Text("NEW Around Here?")
                    
                    NavigationLink("Create An Account", destination: RegisterView())
                }
                .padding(.bottom, 20)
                Spacer()
            }
            }
    
    }
}

#Preview {
    LoginView()
}

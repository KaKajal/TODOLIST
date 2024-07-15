
import Foundation
import FirebaseAuth
 
class LoginViewViewModel: ObservableObject {
    @Published var email = ""
    @Published var password = ""
    @Published var errorMsg = ""

    init() {}

    func login() {
        guard validation() else {
            return
        }
        Auth.auth().signIn(withEmail: email, password: password)
       
    }

    func validation() -> Bool {
        errorMsg = ""
        guard !email.trimmingCharacters(in: .whitespaces).isEmpty,
              !password.trimmingCharacters(in: .whitespaces).isEmpty else {
            errorMsg = "Fields cannot be empty"
       
            return false
        }
        //Email validation
        guard email.contains("@") && email.contains(".") else {
            errorMsg = "Please Enter Valid email"
            return false
        }
        
        print("Login action performed with email: \(email) and password: \(password)")
        // Add validation logic here if needed
         return true
    }
}

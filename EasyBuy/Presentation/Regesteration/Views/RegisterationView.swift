import SwiftUI

struct RegisterationView: View {
    @ObservedObject var regestrationViewModel = RegestrationViewModel()
    
    @State private var email = ""
    @State private var firstName = ""
    @State private var lastName = ""
    @State private var password = ""
    @State private var confirmPassword = ""
    @State private var phoneNumber = ""
    @Environment (\.dismiss) var dismiss
    
    var body: some View {
        VStack {
            // Image
            Image("Shopify-Symbol")
                .resizable()
                .scaledToFit()
                .padding(.vertical, 32)
            
            // Form fields
            VStack(spacing: 24) {
                InputView(text: $email,
                          title: "Email Address",
                          placeholder: "name@example.com")
                .textInputAutocapitalization(.none)
                
                HStack {
                    InputView(text: $firstName,
                              title: "First Name",
                              placeholder: "Enter your first name")
                    
                    InputView(text: $lastName,
                              title: "Last Name",
                              placeholder: "Enter your last name")
                }
                
                InputView(text: $password,
                          title: "Password",
                          placeholder: "Enter your password",
                          isSecuredField: true)
                
                InputView(text: $confirmPassword,
                          title: "Confirm Password",
                          placeholder: "Confirm your password",
                          isSecuredField: true)
                
                InputView(text: $phoneNumber,
                          title: "Phone Number",
                          placeholder: "Enter your phone number")
                .keyboardType(.phonePad)
            }
            .padding(.horizontal)
            .padding(.top, 12)
            
            // SignIn button
            Button(action: {
                createNewCustomer()
            }) {
                HStack {
                    Text("CREATE ACCOUNT")
                        .fontWeight(.semibold)
                    Image(systemName: "arrow.right")
                }
                .foregroundColor(.white)
                .frame(width: UIScreen.main.bounds.width - 32, height: 48)
            }
            .background(Color.black)
            .disabled(!regestrationViewModel.formIsValid(email: email,
                                                         password: password,
                                                         confirmPassword: confirmPassword,
                                                         firstName: firstName,
                                                         lastName: lastName,
                                                         phoneNumber: phoneNumber))
            .opacity(regestrationViewModel.formIsValid(email: email,
                                                       password: password,
                                                       confirmPassword: confirmPassword,
                                                       firstName: firstName,
                                                       lastName: lastName,
                                                       phoneNumber: phoneNumber) ? 1 : 0.5)
            .cornerRadius(10)
            .padding(.top, 24)
            
            Spacer()
            
            Button {
                dismiss()
            } label: {
                HStack(spacing: 3) {
                    Text("Already have an account?")
                    Text("Sign In")
                        .fontWeight(.bold)
                }
                .font(.system(size: 14))
            }
        }
    }
    
    func createNewCustomer() {
        let newCustomerInput = CustomerCreateInput(firstName: firstName,
                                                   lastName: lastName,
                                                   email: email,
                                                   phone: phoneNumber,
                                                   password: password)
        regestrationViewModel.createCustomer(newCustomerInput: newCustomerInput)
    }
    
}

struct RegisterationView_Previews: PreviewProvider {
    static var previews: some View {
        RegisterationView()
    }
}
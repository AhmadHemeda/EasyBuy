import SwiftUI

struct RegisterationView: View {
    @ObservedObject var regestrationViewModel = RegestrationViewModel()
    
    @State private var signUpSuccess = false
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        ScrollView {
            VStack {
                // Image
                Image("Shopify-Symbol")
                    .resizable()
                    .scaledToFit()
                    .padding(.vertical, 32)
                
                // Form fields
                VStack(spacing: 24) {
                    InputView(text: $regestrationViewModel.email,
                              title: "Email Address",
                              placeholder: "name@example.com")
                    .textInputAutocapitalization(.none)
                    
                    InputView(text: $regestrationViewModel.firstName,
                              title: "First Name",
                              placeholder: "Enter your first name")
                    
                    InputView(text: $regestrationViewModel.lastName,
                              title: "Last Name",
                              placeholder: "Enter your last name")
                    
                    InputView(text: $regestrationViewModel.password,
                              title: "Password",
                              placeholder: "Enter your password (At least 6 characters)",
                              isSecuredField: true)
                    
                    InputView(text: $regestrationViewModel.confirmPassword,
                              title: "Confirm Password",
                              placeholder: "Confirm your password",
                              isSecuredField: true)
                    
                    InputView(text: $regestrationViewModel.phoneNumber,
                              title: "Phone Number",
                              placeholder: "Enter your phone number")
                    .keyboardType(.numberPad)
                }
                .padding(.horizontal)
                .padding(.top, 12)
                
                // SignIn button
                Button(action: {
                    regestrationViewModel.createCustomer(newCustomerInput: CustomerCreateInput(
                        firstName: regestrationViewModel.firstName,
                        lastName: regestrationViewModel.lastName,
                        email: regestrationViewModel.email,
                        phone: regestrationViewModel.phoneNumber,
                        password: regestrationViewModel.password)) { result in
                            switch result {
                            case .success:
                                print("Account created successfully")
                                signUpSuccess = true
                            case .failure(let error):
                                let alert = UIAlertController(title: "Error", message: error.localizedDescription, preferredStyle: .alert)
                                alert.addAction(UIAlertAction(title: "OK", style: .default))
                                if let scene = UIApplication.shared.connectedScenes.first as? UIWindowScene {
                                    scene.windows.first?.rootViewController?.present(alert, animated: true)
                                }
                            }
                        }
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
                .disabled(!regestrationViewModel.isFormValid)
                .opacity(regestrationViewModel.isFormValid ? 1 : 0.5)
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
        .onDisappear {
            regestrationViewModel.email = ""
            regestrationViewModel.firstName = ""
            regestrationViewModel.lastName = ""
            regestrationViewModel.password = ""
            regestrationViewModel.confirmPassword = ""
            regestrationViewModel.phoneNumber = ""
        }
        .alert(isPresented: $signUpSuccess) {
            Alert(title: Text("SignUp success"), message: Text("Please login to use EasyBuy app!"), dismissButton: .default(Text("Ok")){
//                if let scene = UIApplication.shared.connectedScenes.first as? UIWindowScene {
//                    scene.windows.first?.rootViewController = UIHostingController(rootView:_NavigationView()
//                    )
//                }
                dismiss()
            })
        }
    }
}

struct RegisterationView_Previews: PreviewProvider {
    static var previews: some View {
        RegisterationView()
    }
}

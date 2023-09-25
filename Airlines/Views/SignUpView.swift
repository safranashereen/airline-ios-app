//
//  SignUpView.swift
//  Airlines
//
//  Created by Safrana on 9/23/23.
//

import SwiftUI
import Firebase

struct SignUpView: View {
    @State private var email = ""
    @State private var password = ""
    @State private var showAlert = false
    @State private var alertMessage = ""
    @State private var alertTitle = ""
    //@State private var isUserLoggedIn = false
    @State private var isLoginViewPresented = false
    @State private var isLoading = false

    var body: some View {
        NavigationView{
            ZStack(alignment: .topLeading) {
                LoadingView(isLoading: isLoading)
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
                    .background(Color.white.opacity(0.3))
                    .ignoresSafeArea()
                AuthImage()
                VStack(alignment: .leading) {
                    Spacer()
                    AuthHeading(heading: Strings.signUp, subHeading: Strings.signupDescription)
                    CustomTextField(placeholder: Strings.email, text: $email)
                        .autocapitalization(.none).padding(.bottom, 8)
                    CustomSecureField(placeholder: Strings.password, text: $password)
                    
                    HStack {
                        Spacer()
                        AuthButton(action: {
                            NetworkListner.checkInternetConnection { isConnected in
                                DispatchQueue.main.async {
                                    if isConnected {
                                        signup()
                                    } else {
                                        showAlert = true
                                        alertTitle = "Network"
                                        alertMessage = Strings.noInternet
                                    }
                                }
                            }
                        } , label: Strings.signUp)
                    }
                    
                    Spacer()
                    AuthBottomLink(heading: Strings.login, subHeading: Strings.alreadyHaveAnAccount, action: {
                        isLoginViewPresented = true
                    })
                    NavigationLink("", destination:  LoginView(), isActive: $isLoginViewPresented)
                }.padding(Dimension.appPadding)
                .alert(isPresented: $showAlert) {
                    Alert(title: Text(alertTitle), message: Text(alertMessage), dismissButton: .default(Text("OK")))
                }
            }
        }.adaptNavigationViewStyle()
            .navigationBarBackButtonHidden(true)
    }

    func signup() {
        if Utils.validateAuthCredentials(email: email, password: password) {
            if Utils.validateEmail(email: email) {
                isLoading = true
                Auth.auth().createUser(withEmail: email, password: password) { result, error in
                    if let error = error {
                        // login fail
                        print(error.localizedDescription)
                        isLoading = false
                       // isUserLoggedIn = false
                        showAlert = true
                        alertTitle = Strings.error
                        alertMessage = error.localizedDescription
                    } else {
                        // Successful login
                        isLoading = false
                        isLoginViewPresented = true
                      //  isUserLoggedIn = true
                        
                    }
                }
            } else {
                showAlert = true
                alertTitle = Strings.invalidEmail
                alertMessage = Strings.pleaseEnterYourEmail
            }

        } else {
            showAlert = true
            alertTitle = Strings.invalidCredentialsHeading
            alertMessage = Strings.pleaseEnterYourEmailAndPassword
        }
    }
}

struct SignUpView_Previews: PreviewProvider {
    static var previews: some View {
        SignUpView()
    }
}



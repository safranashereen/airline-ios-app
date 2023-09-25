//
//  LoginView.swift
//  Airlines
//
//  Created by Safrana on 9/23/23.
//

import SwiftUI
import Firebase

struct LoginView: View {
    @State private var email = ""
    @State private var password = ""
    @State private var showAlert = false
    @State private var alertMessage = ""
    @State private var alertTitle = ""
    @State private var isUserLoggedIn = false
    @State private var isSignUpViewPresented = false
    @State private var isForgotPressed = false
    @State private var isLoading = false

    var body: some View {
        if isUserLoggedIn{
            AirlineListView()
        }else{
            NavigationView{
                ZStack(alignment: .topLeading) {
                    LoadingView(isLoading: isLoading)
                        .frame(maxWidth: .infinity, maxHeight: .infinity)
                        .background(Color.white.opacity(0.3))
                        .ignoresSafeArea()
                    AuthImage()
                    VStack(alignment: .leading) {
                        Spacer()
                        AuthHeading(heading: Strings.login, subHeading: Strings.loginDescription)
                        
                        //login fields
                        CustomTextField(placeholder: Strings.email, text: $email)
                            .autocapitalization(.none).padding(.bottom, 8)
                        CustomSecureField(placeholder: Strings.password, text: $password)
                        
                        //forgot password link
                        HStack{
                            Spacer()
                            Button (action: {isForgotPressed = true}){
                                Text(Strings.forgotPassword).labelBoldStyle().padding(.top, 16)
                            }
                            NavigationLink("", destination:  ForgotPasswordView(), isActive: $isForgotPressed)
                        }

                        HStack{
                            Spacer()
                            AuthButton(action: {
                                NetworkListner.checkInternetConnection { isConnected in
                                    if isConnected {
                                       signIn()
                                    } else {
                                        showAlert = true
                                        alertTitle = "Network"
                                        alertMessage = Strings.noInternet
                                        
                                    }
                                }
                            } , label: Strings.login)
                        }
                        
                        Spacer()
                        AuthBottomLink(heading: Strings.signUp, subHeading: Strings.dontHaveAnAccount, action: {
                            isSignUpViewPresented = true
                        })
                        NavigationLink("", destination:  SignUpView(), isActive: $isSignUpViewPresented)
                    }.padding(Dimension.appPadding)
                    .alert(isPresented: $showAlert) {
                        Alert(title: Text(alertTitle), message: Text(alertMessage), dismissButton: .default(Text("OK")))
                    }
                }
            }.adaptNavigationViewStyle()
                .edgesIgnoringSafeArea(.all)
                .navigationBarBackButtonHidden(true)
        }
        
    }
    
    func signIn() {
        if Utils.validateAuthCredentials(email: email, password: password) {
            if Utils.validateEmail(email: email) {
                isLoading = true
                Auth.auth().signIn(withEmail: email, password: password) { result, error in
                    if let error = error {
                        if let errorCode = AuthErrorCode.Code(rawValue: error._code){
                            //debug if the error code is 17999: INVALID AUTH CREDNITALS
                            if(errorCode != AuthErrorCode.Code.invalidAppCredential){
                                // TODO log the error in Crashlytics
                            }
                            alertMessage = Strings.invalidEmailAndPassword
                        }
                    
                        // handle login fail
                        isLoading = false
                        isUserLoggedIn = false
                        showAlert = true
                        alertTitle = Strings.error
                    } else {
                        // Successful login
                        isLoading = false
                        UserDefaults.standard.set(true, forKey: "isLoggedIn")
                        isUserLoggedIn = true
                        
                    }
                }
            } else {
                showAlert = true
                alertTitle = Strings.invalidEmail
                alertMessage = Strings.pleaseEnterYourValidEmail
            }
        } else {
            showAlert = true
            alertTitle = Strings.invalidCredentialsHeading
            alertMessage = Strings.pleaseEnterYourEmailAndPassword
        }
    }
    
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}

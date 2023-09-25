//
//  ForgotPasswordView.swift
//  Airlines
//
//  Created by Safrana on 9/24/23.
//

import SwiftUI
import Firebase

struct ForgotPasswordView: View {
    @State private var email = ""
    @State private var isLoading = false
    @State private var showAlert = false
    @State private var alertMessage = ""
    @State private var alertTitle = ""
    @State private var isLoginViewPresented = false
    var body: some View {
        NavigationView {
            ZStack(alignment: .topLeading) {
                LoadingView(isLoading: isLoading)
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
                    .background(Color.white.opacity(0.3))
                    .ignoresSafeArea()
                AuthImage()
                VStack(alignment: .leading) {
                    Spacer()
                    AuthHeading(heading: Strings.forgotPassword, subHeading: Strings.forgotPasswordDescription)
                    CustomTextField(placeholder: Strings.email, text: $email)
                        .autocapitalization(.none)
                        .padding(.bottom, 8)
                    
                    HStack {
                        Spacer()
                        AuthButton(action: {
                            NetworkListner.checkInternetConnection { isConnected in
                                DispatchQueue.main.async {
                                    if isConnected {
                                        forgotPassword()
                                    } else {
                                        showAlert = true
                                        alertTitle = "Network"
                                        alertMessage = Strings.noInternet

                                    }
                                    
                                }
                            }
                        }, label: Strings.resetPassword)
                    }
                    Spacer()
                    AuthBottomLink(heading: Strings.login, subHeading: Strings.backTo, action: {
                        isLoginViewPresented = true
                    })
                    NavigationLink("", destination:  LoginView(), isActive: $isLoginViewPresented)
                }.padding(Dimension.appPadding).alert(isPresented: $showAlert) {
                    Alert(title: Text(alertTitle), message: Text(alertMessage), dismissButton: .default(Text(Strings.ok)))
                }
            }
        }.adaptNavigationViewStyle()
            .navigationBarBackButtonHidden(true)
    }
    
    func forgotPassword() {
        if !email.isEmpty {
            if Utils.validateEmail(email: email) {
                isLoading = true
                Auth.auth().sendPasswordReset(withEmail: email) { error in
                   if let error = error {
                       // An error occurred
                       alertTitle = Strings.error
                       alertMessage = Strings.errorSendingPasswordResetEmail
                       //TODO: log the error.localizedDescription on crashlytics
                       print(error.localizedDescription)
                       showAlert = true
                   } else {
                       email=""
                       // Password reset email sent successfully
                       alertTitle = Strings.success
                       alertMessage = Strings.passwordResetEmailSendSuccessfully
                       showAlert = true
                       isLoading = false
                   }
               }
            } else {
                showAlert = true
                alertTitle = Strings.invalidEmail
                alertMessage = Strings.pleaseEnterYourEmail
            }
            
            
            
           
        } else {
            showAlert = true
            alertTitle = Strings.invalidEmail
            alertMessage = Strings.pleaseEnterYourEmail
        }
    }
}




struct ForgotPasswordView_Previews: PreviewProvider {
    static var previews: some View {
        ForgotPasswordView()
    }
}

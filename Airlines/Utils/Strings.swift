//
//  Constants.swift
//  Airlines
//
//  Created by Safrana on 9/23/23.
//

import Foundation
import SwiftUI

struct Strings {
    static let appName: String = "Flight Finder App";
    static let signUp: String = "Sign Up"
    static let login: String = "Login"
    static let forgotPassword: String = "Forgot Password"
    static let resetPassword: String = "Reset Password"
    static let noInternet : String = "\n No internet availble"
    static let invalidEmail: String = " Invalid Email"
    static let invalidCredentialsHeading: String = "Invalid Credentials"
    static let pleaseEnterYourEmailAndPassword: String = "\n Please enter your email and password"
    static let pleaseEnterYourEmail: String = "\n Please enter your email address"
    static let pleaseEnterYourValidEmail: String = "\n Please enter a valid email address"
    static let invalidEmailAndPassword: String = "Login failed, please try again"
    static let error: String = "Error"
    static let greeting: String = "Hello,"
    static let loginDescription: String = "Please sign in to continue"
    static let signupDescription: String = "Create a new account to continue"
    static let forgotPasswordDescription: String = "Reset your password using your registered email"
    static let email: String = "Email"
    static let password: String = "Password"
    static let alreadyHaveAnAccount: String = "Already have an account?"
    static let dontHaveAnAccount: String = "Don't have an account?"
    static let backTo: String = "Back to"
    static let ok: String = "OK"
    static let success: String = "Success"
    static let errorSendingPasswordResetEmail: String = "Error sending password reset email:"
    static let passwordResetEmailSendSuccessfully: String = "Password reset email sent successfully"
}

struct AppColors {
    static let primaryColor: Color = Color.black
    static let secondaryColor: Color = Color(hex: "#757575")
    static let primaryBgColor: Color = Color(hex: "#eef1f5")
    static let primaryBgBlueColor: Color = Color(hex: "#B3E5FC")//#03A9F4
    static let primaryButtonBgColor: Color = Color(hex: "#03A9F4")
    
    static func statusBadgeColor(status: String) -> Color {
        if(status == "scheduled"){
            return Color(hex: "#001d3d")
        }else if(status == "active"){
            return Color(hex: "#0077b6")
        }else if(status == "landed"){
            return Color(hex: "#03A9F4")
        }else if(status == "active"){
            return Color(hex: "#03A9F4")
        }else if(status == "cancelled"){
            return Color(hex: "#d62828")
        }else if(status == "incident"){
            return Color(hex: "#f77f00")
        }else if(status == "diverted"){
            return Color(hex: "#4a5759")
        }else{
            return Color(hex: "#8338ec")
        }
    }
}

struct Dimension {
    static let appPadding = 36.0
    static let spacePadding = 16.0
    static let headingFont = 40.0
    static let subHeadingFont = 16.0
    static let labelFont = 16.0
    static let placeholderFont = 16.0
    static let linkFont = 16.0
    static let buttonFont = 18.0
    static let vStackSpacing = 8.0
    static let mapHeight = 300.0
}

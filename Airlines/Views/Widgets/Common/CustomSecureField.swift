//
//  CustomSecureField.swift
//  Airlines
//
//  Created by Safrana on 9/23/23.
//

import SwiftUI

struct CustomSecureField: View {
    var placeholder: String
    @State private var isPasswordVisible = false
    @Binding var text: String
    
    var body: some View {
        VStack(alignment: .leading, content: {
            Text(placeholder).subTitleStyle()
            ZStack(alignment: .leading) {
                if text.isEmpty {
                    Text("Enter your \(placeholder.lowercased())")
                        .foregroundColor(Color.secondary)
                }
                if isPasswordVisible {
                    TextField("", text: $text)
                        .foregroundColor(Color.primary)
                        .font(.custom("Arial", size: 20))
                        .autocapitalization(.none)
                } else {
                    SecureField("", text: $text)
                        .foregroundColor(Color.primary)
                        .font(.custom("Arial", size: 20))
                }
                
                HStack {
                    Spacer()
                    Button(action: {
                        isPasswordVisible.toggle()
                    }) {
                        Image(systemName: isPasswordVisible ? "eye.fill" : "eye.slash.fill")
                            .foregroundColor(.blue)
                            .padding(.trailing, 8)
                    }
                }

            }
            .padding()
            .background(
                RoundedRectangle(cornerRadius: 5)
                    .stroke(AppColors.primaryButtonBgColor, lineWidth: 1)
            )
        })
       
    }
}

struct CustomSecureField_Previews: PreviewProvider {
    static var previews: some View {
        CustomSecureField(placeholder: "password", text: .constant(""))
    }
}

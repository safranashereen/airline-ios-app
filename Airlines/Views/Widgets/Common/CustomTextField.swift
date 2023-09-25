//
//  TextFieldView.swift
//  Airlines
//
//  Created by Safrana on 9/23/23.
//

import SwiftUI

struct CustomTextField: View {
    var placeholder: String
        @Binding var text: String
    var body: some View {
        VStack(alignment: .leading, content: {
            Text(placeholder).subTitleStyle()
            ZStack(alignment: .leading) {
                if text.isEmpty {
                    Text("Enter your \(placeholder.lowercased())")
                        .foregroundColor(Color.secondary)
                }
                TextField("", text: $text)
                    .foregroundColor(Color.primary)
                    .font(.custom("Arial", size: 20)
                )

            }
            .padding()
            .background(
                RoundedRectangle(cornerRadius: 5)
                    .stroke(AppColors.primaryButtonBgColor, lineWidth: 1)
            )
          
        })
        
    }
    
}




struct CustomTextField_Previews: PreviewProvider {
    static var previews: some View {
        CustomTextField(placeholder: "Email", text: .constant(""))
    }
}

//
//  AuthImage.swift
//  Airlines
//
//  Created by Safrana on 9/25/23.
//

import SwiftUI

struct AuthImage: View {
    var body: some View {
        Image("auth_bg")
            .resizable()
            .frame(width: 400, height: 400)
            .scaledToFill()
            .padding(.top, -70)
            .padding(.leading, 30)
    }
}

struct AuthHeading: View {
    let heading: String
    let subHeading: String
    
    var body: some View{
        Text(heading)
            .font(.custom("Futura-Bold", size: 40))
            .fontWeight(.heavy)
        Text(subHeading)
            .font(.custom("Arial", size: 16))
            .fontWeight(.thin)
            .padding(.bottom, 32)
            .foregroundColor(Color.black.opacity(0.6))
    }
}

struct AuthButton: View {
    let action: () -> Void
    let label: String
    var body: some View {
        Button(action: {
            action()
        }){
            ZStack{
                HStack{
                    Text(label.uppercased())
                        .frame(width: 200, height: 50)
                        .foregroundColor(.white)
                        .font(.custom("Arial-BoldMT", size: Dimension.buttonFont))
                        .background(
                            RoundedRectangle(cornerRadius: 10)
                                .fill(LinearGradient(
                                    gradient: Gradient(
                                        colors: [Color.blue, Color.black]
                                    ),
                                    startPoint: .topLeading, endPoint: .bottomTrailing))
                        )
                        .padding(.top, 24)
                        .padding(.bottom, 10)
                    
                }
                
            }
        }
    }
}

struct AuthBottomLink: View {
    let heading: String
    let subHeading: String
    let action: () -> Void
    
    var body: some View {
        HStack(alignment: .center){
            Spacer()
            Button (action: { action() }){
                Text(subHeading).labelStyle()
                Text(heading).labelBoldStyle()
            }
            Spacer()
        }
    }
}

struct AuthImage_Previews: PreviewProvider {
    static var previews: some View {
        AuthImage()
    }
}

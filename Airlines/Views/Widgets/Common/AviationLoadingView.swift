//
//  AviationLoadingView.swift
//  Airlines
//
//  Created by Safrana on 9/24/23.
//

import SwiftUI

struct CustomLoadingView: View {
    var body: some View {
        Image("loading") // Make sure you have an image named "customLoadingImage" in your asset catalog
            .resizable()
            .frame(width: 50, height: 50) // Adjust the size as needed
            .rotationEffect(Angle(degrees: 360))
            .animation(Animation.linear(duration: 1).repeatForever(autoreverses: false))
    }
}

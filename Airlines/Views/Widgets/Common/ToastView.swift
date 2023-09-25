//
//  ToastView.swift
//  Airlines
//
//  Created by Safrana on 9/24/23.
//

import SwiftUI

struct ToastView<Content>: View where Content: View {
    @Binding var isPresented: Bool
    let content: () -> Content

    var body: some View {
        GeometryReader { geometry in
            if isPresented {
                ZStack(alignment: .center) {
                    content()
                        .padding()
                        .background(Color.black.opacity(0.7))
                        .foregroundColor(.white)
                        .cornerRadius(10)
                        .transition(.move(edge: .top))
                        .animation(.easeInOut(duration: 0.3))
                        .offset(y: -geometry.size.height/2 + 50) // Adjust as needed

                    Spacer()
                }
                .onAppear {
                    DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
                        withAnimation {
                            isPresented = false
                        }
                    }
                }
            }
        }
    }
}

extension View {
    func toast<Content: View>(isPresented: Binding<Bool>, @ViewBuilder content: @escaping () -> Content) -> some View {
        ToastView(isPresented: isPresented, content: content)
    }
}

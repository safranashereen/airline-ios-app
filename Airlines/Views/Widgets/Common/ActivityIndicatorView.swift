//
//  ActivityIndicatorView.swift
//  Airlines
//
//  Created by Safrana on 9/22/23.
//

import SwiftUI

struct ActivityIndicatorView: UIViewRepresentable {
    
    func updateUIView(_ uiView: UIActivityIndicatorView, context: Context) {}

    func makeUIView(context: Context) -> UIActivityIndicatorView {
        let view = UIActivityIndicatorView(style: .large)
        
        view.startAnimating()
        return view
    }

}

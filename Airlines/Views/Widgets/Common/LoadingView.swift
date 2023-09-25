//
//  LoadingView.swift
//  Airlines
//
//  Created by Safrana on 9/22/23.
//

import SwiftUI

struct LoadingView: View {
    let isLoading: Bool
    var body: some View {
        Group {
            if isLoading {
                HStack(alignment:.center) {
                    Spacer()
                    ActivityIndicatorView()
                    Spacer()
                }
            }
        }
    }
}

struct LoadingView_Previews: PreviewProvider {
    static var previews: some View {
        LoadingView(isLoading: true)
    }
}

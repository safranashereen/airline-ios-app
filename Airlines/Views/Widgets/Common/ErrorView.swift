//
//  ErrorView.swift
//  Airlines
//
//  Created by Safrana on 9/22/23.
//

import SwiftUI

struct ErrorView: View {
    let error: NSError
    var body: some View {
        Text(error.localizedDescription)
    }
}

//struct ErrorView_Previews: PreviewProvider {
//    static var previews: some View {
//        ErrorView(error: "error")
//    }
//}

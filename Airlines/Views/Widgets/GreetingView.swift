//
//  GreetingView.swift
//  Airlines
//
//  Created by Safrana on 9/25/23.
//

import SwiftUI

struct GreetingView: View {
    let label: String
    var body: some View {
        VStack(alignment: .leading){
            Text(Strings.greeting).titleStyle()
            Text(label).subTitleStyle()
        }.padding(Dimension.spacePadding)
    }
}

struct GreetingView_Previews: PreviewProvider {
    static var previews: some View {
        GreetingView(label: "someone@email.com")
    }
}

//
//  TextView.swift
//  Airlines
//
//  Created by Safrana on 9/23/23.
//

import SwiftUI

struct TextView: View {
    let title:String
    let value: String
    var body: some View {
        VStack(alignment: .center,spacing: 5) {
            Text(title).foregroundColor(.gray)
            Text(value).fontWeight(.semibold)
                    }
                        .frame(minWidth: 0, maxWidth: .infinity)
                        .padding(8)
                .background(
                    RoundedRectangle(cornerRadius: 6, style: .continuous)
                        .fill(Color(hex: "#eef1f5"))
                    )
    }
}

struct TextView_Previews: PreviewProvider {
    static var previews: some View {
        TextView(title: "Flight", value: "AAC785")
    }
}

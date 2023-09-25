//
//  AirlineLogo.swift
//  Airlines
//
//  Created by Safrana on 9/25/23.
//

import SwiftUI

struct AirlineLogo: View {
    let iataCode: String
    let width: Double
    let height: Double
    let imageLoader = ImageLoader()
    
    var body: some View {
        ImageView(
            imageLoader: imageLoader,
            imageURL: Utils.generateAirlineImageUrl(iataCode: iataCode)
        ).listRowInsets(EdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 0))
        .frame(width: width, height: height)
    }
}

struct AirlineLogo_Previews: PreviewProvider {
    static var previews: some View {
        AirlineLogo(iataCode: "UL", width: 70, height: 30)
    }
}

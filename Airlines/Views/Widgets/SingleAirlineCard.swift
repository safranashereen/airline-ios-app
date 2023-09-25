//
//  AirlineCard.swift
//  Airlines
//
//  Created by Safrana on 9/21/23.
//

import SwiftUI

struct SingleAirlineCard: View {
    let airline: Airline
    let imageLoader = ImageLoader()
    
    var body: some View {
        NavigationLink(
            destination: AirlineFlightScheduleListView(
                airlineId: airline.iataCode,
                airlineName: airline.airlineName
            )
        ){
            HStack{
                VStack(alignment: .leading, spacing: Dimension.vStackSpacing){
                    Text(airline.airlineName).titleStyle()
                    Text(airline.countryName).subTitleStyle()
                }.padding(Dimension.spacePadding)
                Spacer()
                AirlineLogo(iataCode: airline.iataCode, width: 70, height: 30)
                .padding(.trailing, Dimension.spacePadding)
            }.frame(height: 80).cardLayoutStyle()
        }
    }
}

struct SingleAirlineCard_Previews: PreviewProvider {
    static var previews: some View {
        SingleAirlineCard(
            airline: Airline(
                id: "1",
                airlineName: "Sri Lankan Airlines",
                countryName: "Sri Lanka",
                iataCode: "UL"
            )
        )
    }
}

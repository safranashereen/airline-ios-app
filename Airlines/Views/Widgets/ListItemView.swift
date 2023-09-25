//
//  ListItemView.swift
//  Airlines
//
//  Created by Safrana on 9/25/23.
//

import SwiftUI

struct ListItemView: View {
    let airlines: [Airline]
    var body: some View {
        ForEach(airlines.indices, id: \.self) { index in
            let airline = airlines[index]
            NavigationLink(destination: FlightScheduleListView(airlineId: airline.iataCode, airlineName: airline.airlineName)){
                AirlineCard(airline: airline).onAppear  {
                    if(airlines.count == (index+1)){
                        Network.checkInternetConnection { isConnected in
                            if isConnected {
                                airlineState.loadAirlinesMore(with: .airlines, offset: String(index+1))
                            }
                        }
                    }
                }
            }
        }
    }
}

struct ListItemView_Previews: PreviewProvider {
    static var previews: some View {
        ListItemView()
    }
}

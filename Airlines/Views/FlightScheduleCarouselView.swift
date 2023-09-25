//
//  FlightScheduleCarouselView.swift
//  Airlines
//
//  Created by Safrana on 9/22/23.
//

import SwiftUI

struct FlightScheduleCarouselView: View {
    let airlineName: String
    var flightSchedules: [FlightSchedule]
    var body: some View {
            VStack(alignment:.leading, spacing: 10){
                    ForEach(self.flightSchedules.indices, id: \.self) { index in
                        NavigationLink(destination: FlightDetailView(flightSchedule: flightSchedules[index], airlineName: airlineName)){
                            FlightScheduleCard(airlineName: airlineName, flightSchedule:self.flightSchedules[index])
                        }
                    }
            }.navigationBarTitle(airlineName)
    }
}

//struct FlightScheduleCarouselView_Previews: PreviewProvider {
//    static var previews: some View {
//        FlightScheduleCarouselView()
//    }
//}

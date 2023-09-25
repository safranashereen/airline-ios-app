//
//  FlightScheduleCard.swift
//  Airlines
//
//  Created by Safrana on 9/21/23.
//

import SwiftUI

struct FlightScheduleCard: View {
    let airlineName: String
    let flightSchedule: FlightSchedule
    
    var body: some View {
        VStack(alignment:.leading, spacing: 10) {
            HStack {
                Text(flightSchedule.flightDate).font(.subheadline)
                    .padding(.top, Dimension.spacePadding)
                    .padding(.leading, Dimension.spacePadding)
                Spacer()
                Text(flightSchedule.flightStatus.uppercased())
                    .badgeStyle(status: flightSchedule.flightStatus)
            }
            HStack{
                Text(flightSchedule.departure.airport)
                    .subTitleStyle()
                    .multilineTextAlignment(.leading)
                   
                
                Spacer()
                
                Text(flightSchedule.flightDate)
                    .fontWeight(.bold)
                    .hidden()
                
                Spacer()
                //
                Text(flightSchedule.arrival.airport)
                    .subTitleStyle()
                    .multilineTextAlignment(.trailing)
                    
                
            }.padding(.leading, Dimension.spacePadding)
                .padding(.trailing, Dimension.spacePadding)
            
            HStack{
                Text(flightSchedule.departure.iata).titleStyle()
                
                Spacer()
                
                Image("flight2_icon").resizable().frame(width: 50, height: 30)
                
                Spacer()
                
                Text(flightSchedule.arrival.iata).titleStyle()
                
            }.padding(.leading, Dimension.spacePadding)
                .padding(.trailing, Dimension.spacePadding)
            
            
            HStack{
                Text(Utils.formatTime(datetime:flightSchedule.departure.scheduled))
                    .subTitleStyle()
                
                Spacer()
                Text(Utils.formatTime(datetime:flightSchedule.arrival.scheduled))
                    .subTitleStyle()
                
            }
            .padding(.leading,Dimension.spacePadding)
            .padding(.trailing, Dimension.spacePadding)
            .padding(.bottom, Dimension.spacePadding)
            
        }
        .cardLayoutStyle()
    }
    
}

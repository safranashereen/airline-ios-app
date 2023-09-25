//
//  FlightDetailView.swift
//  Airlines
//
//  Created by Safrana on 9/22/23.
//
import Foundation
import SwiftUI

struct FlightDetailView: View {
    let flightSchedule: FlightSchedule
    let airlineName: String
    let imageLoader = ImageLoader()
    
    var body: some View {
        VStack{
            
            //ploting the live data on map if exist on API /v1/flights
            if(flightSchedule.live?.latitude != nil && flightSchedule.live?.longitude != nil) {
                MapView(
                    latitude: flightSchedule.live?.latitude ?? Double(flightSchedule.live?.latitude ?? Config.fallbackLocation.latitude),
                    longitude: Double(flightSchedule.live?.longitude ?? Config.fallbackLocation.longitude)
                ).ignoresSafeArea(edges: .top)
                    .frame(height: Dimension.mapHeight)
            }else {
                //adding overlay if the live is not exist on API reponse
                MapView(
                    latitude: Config.fallbackLocation.latitude,
                    longitude: Config.fallbackLocation.longitude)
                    .ignoresSafeArea(edges: .top)
                    .frame(height: Dimension.mapHeight)
                    .overlay(
                        ZStack {
                            Color.black.opacity(0.5)
                                .ignoresSafeArea(edges: .top)
                            VStack(alignment: .trailing) {
                                Text("No Live Data Available")
                                    .font(.title2)
                                    .foregroundColor(.white)
                                    .padding()
                            }
                })
            }

            ScrollView {
                VStack(alignment:.leading, spacing: Dimension.spacePadding){
                    HStack {
                        Text(flightSchedule.airline.name).subTitleStyle()
                        AirlineLogo(iataCode: flightSchedule.airline.iata, width: 50, height: 20)
                        Spacer()
                        FlightStatusBadge(status: flightSchedule.flightStatus)
                    }

                    //departure
                    BoundCard(airport: flightSchedule.departure.airport,
                              iata: flightSchedule.departure.airport,
                              scheduledTime: flightSchedule.departure.scheduled,
                              isArrival: false)
                    
                    HStack{
                        Image(systemName: "arrow.down").foregroundColor(AppColors.secondaryColor).padding(.trailing,Dimension.spacePadding)
                    }
                    
                    //arrival
                    BoundCard(airport: flightSchedule.arrival.airport,
                              iata: flightSchedule.arrival.iata,
                              scheduledTime: flightSchedule.arrival.scheduled,
                              isArrival: true)
                    
                    //date and flight bottom cards
                    HStack{
                        TextView(title: "Date", value: flightSchedule.flightDate)
                        TextView(title: "Flight", value: flightSchedule.flight.iata)
                    }
                   
                    
                }.padding()
            }
        }
    }
}

struct BoundCard: View {
    let airport: String
    let iata: String
    let scheduledTime: String
    let isArrival: Bool
    
    var body: some View {
        HStack{
            Image(systemName: "circle.fill").foregroundColor(isArrival ? .blue : .gray).padding(.trailing,Dimension.spacePadding)
            VStack(alignment:.leading){
                Text(airport).bodyTitleStyle()
                Text(iata).titleStyle()
            }
            Spacer()
            Text(Utils.formatTime(datetime:scheduledTime)).titleStyle()
        }
    }
}


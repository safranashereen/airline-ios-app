//
//  FlightScheduleView.swift
//  Airlines
//
//  Created by Safrana on 9/21/23.
//

import SwiftUI

struct AirlineFlightScheduleListView: View {
    @ObservedObject private var flightScheduleState = FlightScheduleStateHandler()
    
    let airlineId: String
    let airlineName: String

    var body: some View {
        ScrollView{
            LazyVStack {
                //listing flight schedule from /v1/flights API
                if let flightSchedules = flightScheduleState.flightSchedules {
                    ForEach(flightSchedules.indices, id: \.self) { index in
                        NavigationLink(destination: FlightDetailView(flightSchedule: flightSchedules[index], airlineName: airlineName)){
                            FlightScheduleCard(airlineName: airlineName, flightSchedule: flightSchedules[index]).onAppear{
                                if(flightSchedules.count == (index+1)){
                                    NetworkListner.checkInternetConnection { isConnected in
                                        if isConnected {
                                            flightScheduleState.loadFlightSchedulesMore(with: .flights, id: airlineId, offset: String(index+1))
                                        }
                                    }
                                }
                            }
                            
                        }
                    }
                }
                else{
                    //empty and error handler
                    if(flightScheduleState.isLoading == false){
                        if(flightScheduleState.error == nil){
                            EmptyView()
                        }else{
                            ErrorView(error: flightScheduleState.error ?? NSError())
                        }
                    }
                   
                }
                
                //loading handler
                LoadingView(isLoading: flightScheduleState.isLoading)
            }.navigationBarTitle(airlineName)
         
        }
        .onAppear{
            NetworkListner.checkInternetConnection { isConnected in
                if isConnected {
                    self.flightScheduleState.loadFlightSchedules(with: .flights, id: airlineId, offset: Config.offsetDefault)
                }
            }
        }
    }
}

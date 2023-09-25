//
//  Flight.swift
//  Airlines
//
//  Created by Safrana on 9/21/23.
//

import Foundation

struct FlightScheduleResponse: Decodable{
    
    let data: [FlightSchedule]
    
}
struct FlightSchedule: Decodable{
    let flightDate:String
    let flightStatus: String
    let departure:InOutBound
    let arrival: InOutBound
    let flight: Flight
    let live: Live?
    let airline: FlightAirline
}

struct InOutBound: Decodable{
    let airport: String
    let iata: String
    let scheduled: String
    let gate: String?
}

struct Flight: Decodable{
    let number: String
    let iata: String
    let icao: String
}

struct Live: Decodable{
    let latitude: Double
    let longitude: Double
    let updated: String //time
}

struct FlightAirline: Decodable{
    let name: String
    let iata: String
}

struct AirportLocation: Decodable{
    let latitude: Double
    let longitude: Double
}


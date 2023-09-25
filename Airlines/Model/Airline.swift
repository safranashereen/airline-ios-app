//
//  Airline.swift
//  Airlines
//
//  Created by Safrana on 9/21/23.
//

import Foundation


struct AirlineResponse: Decodable{
    
    let data: [Airline]
    
}
struct Airline: Decodable, Identifiable{
    let id: String
    let airlineName: String
    let countryName: String
    let iataCode: String
//    let iataPrefixAccounting: String
//    let icaoCode: String
//    let callsign: String
//    let type: String
//    let status: String
//    let fleetSize: String
//    let fleetAverageAge: String
//    let dateFounded: String
//    let hubCode: String
//    let countryName: String
//    let countryIso2: String
//

}


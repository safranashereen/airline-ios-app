//
//  AirlineService.swift
//  Airlines
//
//  Created by Safrana on 9/21/23.
//

import Foundation


protocol AirlineApiService{
    
    func fetchAirlines(from endpoint: AirlineListEndpoint, offset: String, completion: @escaping (Result<AirlineResponse, AirlineError>) ->())
    func fetchFlightSchedule(from endpoint: AirlineListEndpoint, id:String, offset:String, completion: @escaping (Result<FlightScheduleResponse, AirlineError>) ->())
}

enum AirlineListEndpoint: String, CodingKey {
        case airlines = "airlines"
        case flights =  "flights"
}

enum AirlineError: Error, CustomNSError{
    case apiError
    case invalidEndpoint
    case invalidResponse
    case noData
    case serializationError
    
    var localizedDescription: String{
        switch self{
            case .apiError: return "Failed to fetch data"
            case .invalidEndpoint: return "The given API endpoint does not exist."
            case .invalidResponse: return "Resource not found."
            case .noData: return "No data"
            case .serializationError: return "Failed to decode data"
        }
    }
    
    var errorUserInfo: [String : Any]{
        [NSLocalizedDescriptionKey: localizedDescription]
    }
    
}

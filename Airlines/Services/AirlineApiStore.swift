//
//  AirlineStore.swift
//  Airlines
//
//  Created by Safrana on 9/21/23.
//

import Foundation

class AirlineApiStore: AirlineApiService{
    
    
    static let shared = AirlineApiStore()
    private init(){}
    
    private let apiKey = Config.apiKey
    private let baseAPIURL = Config.baseUrl
    private let urlSession = URLSession.shared
    private let jsonDecoder = Utils.jsonDecoder
    

    func fetchAirlines(from endpoint: AirlineListEndpoint, offset: String, completion: @escaping (Result<AirlineResponse, AirlineError>) -> ()) {
        guard let url = URL(string: "\(baseAPIURL)\(endpoint.rawValue)?") else{
            completion(.failure(.invalidEndpoint))
            return
        }
        var queryParams = ["limit": Config.limit]
        if(offset != ""){
            queryParams["offset"] = offset
        }
        print(queryParams)
        self.loadURLAndDecode(url: url, params: queryParams,completion: completion)
        
    }
    
    func fetchFlightSchedule(from endpoint: AirlineListEndpoint, id: String, offset: String, completion: @escaping (Result<FlightScheduleResponse, AirlineError>) -> ()) {
        guard let url = URL(string: "\(baseAPIURL)\(endpoint.rawValue)?") else{
            completion(.failure(.invalidEndpoint))
            return
        }
        self.loadURLAndDecode(url: url, params: ["airline_iata":id, "limit": Config.limit, "offset": offset],completion: completion)
    }
    
    private func loadURLAndDecode<D: Decodable>(url:URL, params:[String:String]? = nil, completion: @escaping(Result<D, AirlineError>) -> ()){
        //check url is valid or not
        guard var urlComponents = URLComponents(url: url, resolvingAgainstBaseURL: false) else{
            completion(.failure(.invalidEndpoint))
            return
        }
        
        //build api_key in queryitem
        var queryItems = [URLQueryItem(name: "access_key", value: apiKey)]
        if let params = params{
            queryItems.append(contentsOf: params.map{URLQueryItem(name: $0.key, value: $0.value)})
        }
        
        urlComponents.queryItems = queryItems
        
        guard let finalURL = urlComponents.url else{
            completion(.failure(.invalidEndpoint))
            return
        }
        print("finalURL \(finalURL)")
        urlSession.dataTask(with: finalURL){[weak self] (data, response, error) in
            guard let self = self else { return }
            
            if error != nil{
                self.executeCompletionHandlerInMainThread(with: .failure(.apiError), completion: completion)
                return
            }
            
            //get response
            guard let httpResponse = response as? HTTPURLResponse, 200..<300 ~= httpResponse.statusCode else{
                self.executeCompletionHandlerInMainThread(with: .failure(.invalidResponse), completion: completion)
                return
            }
            
            //get data
            guard let data = data else{
                self.executeCompletionHandlerInMainThread(with: .failure(.noData), completion: completion)
                return
            }
            
            
            do{
                let decodedResponse = try self.jsonDecoder.decode(D.self, from: data)
                self.executeCompletionHandlerInMainThread(with: .success(decodedResponse), completion: completion)
            } catch{
                self.executeCompletionHandlerInMainThread(with: .failure(.serializationError), completion: completion)
            }
            
        }.resume()
    }
    
    private func executeCompletionHandlerInMainThread<D: Decodable>(with result: Result<D, AirlineError>, completion: @escaping (Result<D, AirlineError>) ->()){
        DispatchQueue.main.async {
            completion(result)
        }
    }
}

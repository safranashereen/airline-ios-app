//
//  AirlineListState.swift
//  Airlines
//
//  Created by Safrana on 9/21/23.
//

import Foundation

class AirlineStateHandler: ObservableObject{
    @Published var airlines:[Airline]?
    @Published var error: NSError?
    @Published var isLoading: Bool = false
    
    private let airlineService : AirlineApiService
    
    init(airlineService: AirlineApiService = AirlineApiStore.shared){
        self.airlineService = airlineService
    }
    
    func loadAirlines (with endpoint: AirlineListEndpoint, offset: String){
        self.airlines = nil
        self.isLoading = true
        
        self.airlineService.fetchAirlines(from: endpoint, offset: offset) { [weak self] (result) in
            guard let self = self else { return }
            self.isLoading = false
            
            switch result {
                case .success(let response):
                    if self.airlines == nil {
                        self.airlines = response.data
                    }
                
                case .failure(let error):
                    self.error = error as NSError
            }
        }
    }
    
    func loadAirlinesMore (with endpoint: AirlineListEndpoint, offset: String){
        self.isLoading = true
        
        self.airlineService.fetchAirlines(from: endpoint, offset: offset) { [weak self] (result) in
            guard let self = self else { return }
            self.isLoading = false
            
            switch result {
                case .success(let response):
                    self.airlines! += response.data
                
                case .failure(let error):
                    self.error = error as NSError
            }
        }
    }
}

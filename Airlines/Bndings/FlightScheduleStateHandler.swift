//
//  FlightScheduleState.swift
//  Airlines
//
//  Created by Safrana on 9/21/23.
//

import Foundation
class FlightScheduleStateHandler: ObservableObject{
    @Published var flightSchedules:[FlightSchedule]?
    @Published var error: NSError?
    @Published var isLoading: Bool = false
    
    private let airlineService : AirlineApiService
    
    init(airlineService: AirlineApiService = AirlineApiStore.shared){
        self.airlineService = airlineService
    }
    
    
    func loadFlightSchedules (with endpoint: AirlineListEndpoint , id:String, offset:String){
        self.flightSchedules = nil
        self.isLoading = true
        
        self.airlineService.fetchFlightSchedule(from: endpoint, id: id, offset: offset) { [weak self] (result) in
            guard let self = self else { return }
                self.isLoading = false
                print(result)
                switch result {
                case .success(let response):
                    if self.flightSchedules == nil {
                        self.flightSchedules = response.data
                    }
                    print(response.data)
                    
                case .failure(let error):
                    self.error = error as NSError
                }
        }
    }
    
    
    func loadFlightSchedulesMore (with endpoint: AirlineListEndpoint , id:String, offset:String){
        self.isLoading = true
        
        self.airlineService.fetchFlightSchedule(from: endpoint, id: id, offset: offset) { [weak self] (result) in
            guard let self = self else { return }
            self.isLoading = false
            print(result)
            switch result {
            case .success(let response):
                if(self.flightSchedules != nil){
                    self.flightSchedules! += response.data
                    print(response.data)
                }
        
                
            case .failure(let error):
                self.error = error as NSError
            }
        }
    }
}

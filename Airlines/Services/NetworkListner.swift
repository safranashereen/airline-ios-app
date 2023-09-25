//
//  Network.swift
//  Airlines
//
//  Created by Safrana on 9/24/23.
//

import Foundation
import Network
import SwiftUI

class NetworkListner{
    static func checkInternetConnection(completion: @escaping (Bool) -> Void) {
        let monitor = NWPathMonitor()
        let queue = DispatchQueue(label: "InternetConnectionMonitor")

        monitor.pathUpdateHandler = { path in
            if path.status == .satisfied {
                completion(true)

            } else {
                completion(false)
            }
        }

        monitor.start(queue: queue)
    }
}

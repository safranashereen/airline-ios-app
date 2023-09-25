//
//  FlightStatusBadge.swift
//  Airlines
//
//  Created by Safrana on 9/25/23.
//

import SwiftUI

struct FlightStatusBadge: View {
    let status: String
    
    var body: some View {
        Text(status.uppercased())
            .badgeStyle(status: status)
    }
}

struct FlightStatusBadge_Previews: PreviewProvider {
    static var previews: some View {
        FlightStatusBadge(status: "scheduled")
        FlightStatusBadge(status: "active")
        FlightStatusBadge(status: "cancelled")
    }
}

//
//  beta.swift
//  Airlines
//
//  Created by Safrana on 9/24/23.
//

import Foundation

struct Config {
    static let apiKey: String = "eb172163aca216c8aefe78cc18d1c4fc"
    static let baseUrl: String = "http://api.aviationstack.com/v1/"
    static let limit: String = "10";
    static let offsetDefault: String = "0"
    static let fallbackLocation: (latitude: Double, longitude: Double) = (6.927079, 79.861244)
}

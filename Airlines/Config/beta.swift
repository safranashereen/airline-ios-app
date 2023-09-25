//
//  beta.swift
//  Airlines
//
//  Created by Safrana on 9/24/23.
//

import Foundation

struct Config {
    static let apiKey: String = "6b01f1d87893205195127deabd464e69"
    static let baseUrl: String = "http://api.aviationstack.com/v1/"
    static let limit: String = "10";
    static let offsetDefault: String = "0"
    static let fallbackLocation: (latitude: Double, longitude: Double) = (6.927079, 79.861244)
}

//
//  Utils.swift
//  Airlines
//
//  Created by Safrana on 9/21/23.
//

import Foundation
import Firebase
class Utils{
    
    //configure JSONDecoder
    static let jsonDecoder: JSONDecoder = {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "E MMM d' '"
        
        let jsonDecoder = JSONDecoder()
        jsonDecoder.keyDecodingStrategy = .convertFromSnakeCase
        jsonDecoder.dateDecodingStrategy = .formatted(dateFormatter)
        return jsonDecoder
    }()
    
    //time format 09:00 PM
    static func formatTime(datetime: String) -> String {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ssZ"
        
        if let date = formatter.date(from: datetime) {
            let timeString = DateFormatter.localizedString(from: date, dateStyle: .none, timeStyle: .short)
            return timeString
        } else {
            return "00:00"
        }
    }
    
    static func validateEmail(email: String) -> Bool {
        let emailRegex = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,}"
        let emailPredicate = NSPredicate(format: "SELF MATCHES %@", emailRegex)
        return emailPredicate.evaluate(with: email)
    }
    
    static  func validateAuthCredentials(email: String, password: String) -> Bool {
        return !email.isEmpty && !password.isEmpty
    }
    
    static func generateAirlineImageUrl(iataCode: String) -> URL{
        return URL(string: "https://content.airhex.com/content/logos/airlines_\(iataCode)_350_100_r.png?background=eef1f5")!
    }
       
}

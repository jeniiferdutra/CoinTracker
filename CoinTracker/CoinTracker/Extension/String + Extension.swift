//
//  String + Extension.swift
//  CoinTracker
//
//  Created by Jenifer Rocha on 25/07/25.
//

public enum ValidType {
    case email
    case password
    case name
}

import Foundation

extension String {
    
    enum Regex: String {
        case name = "^[A-Za-zÀ-ú ]{2,}$"
        case email = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
        case password = ".{6,}"
    }
    
    func isValid(validType: ValidType) -> Bool {
        let format = "SELF MATCHES %@"
        var regex = ""
        
        switch validType {
        case .name:
            regex = Regex.name.rawValue
        case .email:
            regex = Regex.email.rawValue
        case .password:
            regex = Regex.password.rawValue
        }
        
        return NSPredicate(format: format, regex).evaluate(with: self)
    }
}

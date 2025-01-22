//
//  NetworkErrors.swift
//  Practice(Algorithms)
//
//  Created by Roman Samborskyi on 19.01.2025.
//

import UIKit



enum AppError: Error {
    case badUrl, badResponse(Int), invalidData, coreDataFetchError
    
    var description: String {
        switch self {
        case .badUrl:
            "Bad url"
        case .badResponse(let response):
            "Bad response: \(response)"
        case .invalidData:
            "Invalid data"
        case .coreDataFetchError:
            "Error of fething data from core data"
        }
    }
}

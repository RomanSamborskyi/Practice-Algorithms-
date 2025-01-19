//
//  EndPoints.swift
//  Practice(Algorithms)
//
//  Created by Roman Samborskyi on 19.01.2025.
//

import UIKit


protocol NetworkingUrlProtocol {
    var url: String { get }
    var method: HTTPMethods { get }
}

enum HTTPMethods: String {
    case get, post, delete
}

enum BaseUrl {
    case baseURL
    
    var url: String {
        switch self {
        case .baseURL:
            return "https://newsapi.org/v2/everything?"
        }
    }
}

enum URLEndpoint: NetworkingUrlProtocol {
    case all(String)
    
    var method: HTTPMethods {
        return HTTPMethods.get
    }
    
    var url: String {
        switch self {
        case .all(let all):
            return "\(BaseUrl.baseURL.url)q=\(all)&apiKey=\(Constants.apiKey)"
        }
    }
}

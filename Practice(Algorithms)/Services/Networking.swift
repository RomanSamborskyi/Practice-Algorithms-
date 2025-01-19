//
//  Networking.swift
//  Practice(Algorithms)
//
//  Created by Roman Samborskyi on 19.01.2025.
//

import UIKit


class Networking {
    
    func requestFactory(urlData: NetworkingUrlProtocol) throws -> URLRequest {
        
        guard let url = URL(string: urlData.url) else {
            throw AppError.badUrl
        }
        
        var request = URLRequest(url: url)
        request.httpMethod = urlData.method.rawValue.uppercased()
        
        return request
    }
    
    func fetchNews<T: Decodable>(type: T.Type, urlSession: URLSession, request: URLRequest) async throws -> T? {
        
        let (data, response) = try await urlSession.data(for: request)
        let returnedData = try responseHandler(data: data, response: response)
        
        let decoder = JSONDecoder()
        
        return try decoder.decode(T.self, from: returnedData)
    }
    private func responseHandler(data: Data?, response: URLResponse) throws -> Data {
        guard let data = data,
              let respone = response as? HTTPURLResponse,
              respone.statusCode >= 200 && respone.statusCode < 300 else {
            throw AppError.badResponse
        }
        return data
    }
}

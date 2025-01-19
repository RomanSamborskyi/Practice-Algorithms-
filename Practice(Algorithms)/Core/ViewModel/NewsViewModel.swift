//
//  NewsViewModel.swift
//  Practice(Algorithms)
//
//  Created by Roman Samborskyi on 19.01.2025.
//

import UIKit


class NewsViewModel: ObservableObject {
    
    @Published var news: [NewsModel] = []
    private let netWorking: Networking
    @Published var totalResults: Int = 0
    
    init(netWorking: Networking) {
        self.netWorking = netWorking
    }
    
    func getNews() {
        Task {
            do {
                try await fetchNews()
            } catch let error as AppError {
                print(error.localizedDescription)
            }
        }
    }
    
    func fetchNews() async throws {
        let session = URLSession.shared
        let request = try netWorking.requestFactory(urlData: URLEndpoint.all("all"))
        let data = try await netWorking.fetchNews(type: NewsResponse.self, urlSession: session, request: request)
        await MainActor.run {
            self.totalResults = data?.totalResults ?? 0
            self.news = data?.articles ?? []
        }
    }
}

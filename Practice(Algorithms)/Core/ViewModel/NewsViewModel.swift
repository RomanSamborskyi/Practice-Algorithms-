//
//  NewsViewModel.swift
//  Practice(Algorithms)
//
//  Created by Roman Samborskyi on 19.01.2025.
//

import UIKit


class NewsViewModel: ObservableObject {
    
    @Published var news: [NewsModel] = []
    @Published var totalResults: Int = 0
    private let netWorking: Networking
    private let coreData: CoreDataManager
    private var currentPage: Int = 1
    
    init(netWorking: Networking, coreData: CoreDataManager) {
        self.netWorking = netWorking
        self.coreData = coreData
    }
    
    func getNews() {
        Task {
            do {
                try await fetchNews()
            } catch let error as AppError {
                print("Error here: \(error.description)")
            }
        }
    }
    
    func fetchNews() async throws {
        let session = URLSession.shared
        while news.count != totalResults - 1 {
            let request = try netWorking.requestFactory(urlData: URLEndpoint.all("all", currentPage))
            let data = try await netWorking.fetchNews(type: NewsResponse.self, urlSession: session, request: request)
            await MainActor.run {
                self.totalResults = data?.totalResults ?? 0
                self.news.append(contentsOf: data?.articles ?? [])
            }
            currentPage += 1
        }
    }
}

//
//  NewsViewModel.swift
//  Practice(Algorithms)
//
//  Created by Roman Samborskyi on 19.01.2025.
//

import UIKit
import SwiftUICore


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
    
    func deleteAllLocalData() {
        do {
            try coreData.deleteAllData()
        } catch let error {
            print("Error of deleting core data: \(error.localizedDescription)")
        }
    }
    
    func getNewsFromCoreData() {
        do {
           let coreDataNews = try coreData.fetcNews()
            
            for news in coreDataNews {
                let newsModelItem = NewsModel(source: NewsSource(id: news.newsSource?.id, name: news.newsSource?.name), author: news.author, title: news.title, description: news.descript, url: news.url, urlToImage: news.urlToImage, publishedAt: news.publishedAt, content: news.content)
                withAnimation(Animation.bouncy) {
                    self.news.append(newsModelItem)
                }
            }
        } catch let error {
            print("Error of fetching news from core data: \(error)")
        }
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
                if let dataArray = data?.articles {
                    for news in dataArray {
                        coreData.addToCoreData(news)
                    }
                }
            }
            currentPage += 1
        }
    }
}

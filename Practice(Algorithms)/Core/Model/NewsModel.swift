//
//  NewsModel.swift
//  Practice(Algorithms)
//
//  Created by Roman Samborskyi on 19.01.2025.
//

import UIKit

struct NewsResponse: Decodable {
    let status: String
    let totalResults: Int
    let articles: [NewsModel]
}

struct NewsModel: Decodable {
    let source: NewsSource
    let author: String
    let title: String
    let description: String
    let url: String
    let urlToImage: String
    let publishedAt: String
    let content: String
}

struct NewsSource: Identifiable, Decodable {
    let id: String
    let name: String
}
 

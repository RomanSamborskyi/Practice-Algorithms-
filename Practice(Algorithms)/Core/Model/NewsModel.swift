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
   var source: NewsSource
   var author: String?
   var title: String?
   var description: String?
   var url: String?
   var urlToImage: String?
   var publishedAt: String?
   var content: String?
}

struct NewsSource: Identifiable, Decodable {
    var id: String?
    var name: String?
}
 

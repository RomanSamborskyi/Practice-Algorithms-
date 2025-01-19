//
//  DeveloperPreview.swift
//  Practice(Algorithms)
//
//  Created by Roman Samborskyi on 19.01.2025.
//

import UIKit


class DeveloperPreview {
    static let shared: DeveloperPreview = DeveloperPreview()
    
    private init() { }
    
    var newsPost: NewsModel = NewsModel(source: NewsSource(id: "NewYorkTimes", name: "Gizmodo.com"), author: "Gizmodo Deals", title: "Here’s How to Get The Costco Gold Star Membership For Nearly Free For All of 2025", description: "Instead of $65 for the year, the Costco Gold Star membership will only cost you $20.", url: "https://hotestnews.com", urlToImage: "https://gizmodo.com/app/uploads/2024/08/Costco.jpg", publishedAt: "10.01.2025", content: "Costco is very popular for its great prices and extensive selection of quality products. With millions of loyal members, the retailer has transformed the way people shop and offers a unique blend of")
}

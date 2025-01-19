//
//  NewsRowView.swift
//  Practice(Algorithms)
//
//  Created by Roman Samborskyi on 19.01.2025.
//

import SwiftUI

struct NewsRowView: View {
    
    let news: NewsModel
    
    var body: some View {
        VStack(alignment: .leading) {
            Text(news.title ?? "NO TITLE")
                .font(.title)
            Text(news.description ?? "NO DESCRIPTION")
                .font(.title3)
                .padding(.bottom, 10)
                .foregroundStyle(Color.gray)
            Text(news.content ?? "")
                .padding(.bottom, 10)
            if let url = news.urlToImage {
                AsyncImage(url: URL(string: url)) { image in
                    image.image?.resizable()
                }
                .frame(height: 200)
                .cornerRadius(15)
            }
            Text(news.source.name ?? "NIL")
                .fontWeight(.bold)
            HStack {
                Text(news.author ?? "NIL")
                Text("at: \(news.publishedAt ?? "NIL")")
            }
            .foregroundStyle(Color.gray)
                
        }
        .padding(5)
    }
}

#Preview {
    NewsRowView(news: DeveloperPreview.shared.newsPost)
}

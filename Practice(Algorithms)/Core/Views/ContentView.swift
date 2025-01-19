//
//  ContentView.swift
//  Practice(Algorithms)
//
//  Created by Roman Samborskyi on 19.01.2025.
//

import SwiftUI

struct ContentView: View {
    
    @StateObject private var viewModel: NewsViewModel
    
    init(netWorking: Networking) {
        _viewModel = StateObject(wrappedValue: NewsViewModel(netWorking: netWorking))
    }
    
    var body: some View {
        NavigationStack {
            List {
                ForEach(viewModel.news, id: \.author) { news in
                    NewsRowView(news: news)
                }
            }
            .toolbar {
                ToolbarItem(placement: .topBarTrailing) {
                    Button {
                        viewModel.getNews()
                    } label: {
                        Text("Fetch and Save")
                    }

                }
                ToolbarItem(placement: .topBarLeading) {
                    Text("\(viewModel.totalResults)")
                }
            }
        }
    }
}


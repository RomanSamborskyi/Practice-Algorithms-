//
//  ContentView.swift
//  Practice(Algorithms)
//
//  Created by Roman Samborskyi on 19.01.2025.
//

import SwiftUI

struct ContentView: View {
    
    @StateObject private var viewModel: NewsViewModel
    @State private var showMenu: Bool = false
    init(netWorking: Networking, coreData: CoreDataManager) {
        _viewModel = StateObject(wrappedValue: NewsViewModel(netWorking: netWorking, coreData: coreData))
    }
    
    var body: some View {
        NavigationStack {
            List {
                ForEach(viewModel.news, id: \.author) { news in
                    NewsRowView(news: news)
                }
            }
            .confirmationDialog("", isPresented: $showMenu, actions: {
                Button {
                    viewModel.getNews()
                } label: {
                    Text("Fetch and Save")
                }
                Button {
                    viewModel.getNewsFromCoreData()
                } label: {
                    Text("Show news")
                }
                Button {
                    viewModel.deleteAllLocalData()
                    withAnimation(Animation.bouncy) { 
                        viewModel.news.removeAll()
                    }
                } label: {
                    Text("Delete all data")
                }
            })
            .toolbar {
                ToolbarItem(placement: .topBarLeading) {
                    VStack {
                        Text("\(viewModel.totalResults)")
                        Text("\(viewModel.news.count)")
                    }
                }
                ToolbarItem(placement: .topBarTrailing) {
                    Button {
                        self.showMenu.toggle()
                    } label: {
                        Text("Show menu")
                    }
                }
            }
        }
    }
}


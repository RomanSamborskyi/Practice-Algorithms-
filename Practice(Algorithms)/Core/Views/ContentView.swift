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
            VStack {
                Text("Result of searching should be here")
                    .padding()
                    .font(.largeTitle)
                    .fontWeight(.bold)
                    .multilineTextAlignment(.center)
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
                    VStack {
                        Text("\(viewModel.totalResults)")
                        Text("\(viewModel.news.count)")
                    }
                }
            }
        }
    }
}


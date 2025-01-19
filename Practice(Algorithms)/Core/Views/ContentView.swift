//
//  ContentView.swift
//  Practice(Algorithms)
//
//  Created by Roman Samborskyi on 19.01.2025.
//

import SwiftUI

struct ContentView: View {
    
    @StateObject private var viewModel: NewsViewModel
    
    init() {
        _viewModel = StateObject(wrappedValue: NewsViewModel())
    }
    
    var body: some View {
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundStyle(.tint)
            Text("Hello, world!")
        }
        .padding()
    }
}

#Preview {
    ContentView()
}

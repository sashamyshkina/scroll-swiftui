//
//  ContentView3_iOS14.swift
//  swiftUI_scrollView
//
//  Created by Sasha Myshkina on 14/08/2023.
//

import SwiftUI

// This view showcases vertical scroll with
// .scrollPosition(id:) modifier

struct ContentView3_iOS14: View {
    
    // MARK: - Declarations
    
    enum Constant {
        static let smallFrame = CGSize(width: 300, height: 100)
        static let cornerRadius = 25.0
        static let safeAreaPadding = 40.0
        static let vstackSpacing = 20.0
        static let buttonViewHeight = 100.0
    }
    
    // MARK: - Properties
    
    @StateObject var viewModel = ScrollViewContentModel()
    
    @State var currentId: Int = 0
    
    // MARK: - Body
    
    var body: some View {
        VStack(spacing: Constant.vstackSpacing) {
            ScrollViewReader { proxy in
                buttonView(with: proxy)
                ScrollView(.vertical) {
                    LazyVStack {
                        ForEach(viewModel.contentItems) { item in
                            rectangleView(colour: item.colour, text: "\(item.id)")
                                .containerRelativeFrame([.vertical, .horizontal])
                                .id(item.id)
                        }
                    }
                }
                .safeAreaPadding(.horizontal, Constant.safeAreaPadding)
            }
        }
        .safeAreaPadding(.bottom, Constant.safeAreaPadding)
    }
    
    private func rectangleView(colour: Color, text: String) -> some View {
        RoundedRectangle(cornerRadius: Constant.cornerRadius)
            .fill(colour)
            .overlay {
                Text(text)
            }
    }
    
    private func buttonView(with proxy: ScrollViewProxy) -> some View {
        ZStack {
            Color.black
            HStack {
                topButton(with: proxy)
                VStack {
                    Button("Next page") {
                        if currentId < viewModel.contentItems.count - 1 {
                            proxy.scrollTo(currentId + 1)
                            currentId = currentId + 1
                        }
                    }
                    .padding(5)
                    
                    Text("Current page: \(currentId)")
                        .foregroundColor(.white)
                }
                bottomButton(with: proxy)
            }
        }
        .frame(height: Constant.buttonViewHeight)
    }
    
    private func topButton(with proxy: ScrollViewProxy) -> some View {
        Button(action: {
            proxy.scrollTo(0)
            currentId = 0
        }, label: {
            Image(systemName: "arrow.up")
                .foregroundColor(.white)
        })
        .padding(.horizontal, Constant.safeAreaPadding)
    }
    
    private func bottomButton(with proxy: ScrollViewProxy) -> some View {
        Button(action: {
            let lastItemId = viewModel.contentItems.count - 1
            proxy.scrollTo(lastItemId)
            currentId = lastItemId
        }, label: {
            Image(systemName: "arrow.down")
                .foregroundColor(.white)
        })
        .padding(.horizontal, Constant.safeAreaPadding)
    }
}

struct ContentView3_iOS14_Previews: PreviewProvider {
    static var previews: some View {
        ContentView3_iOS14()
    }
}

//
//  ContentView3.swift
//  swiftUI_scrollView
//
//  Created by Sasha Myshkina on 07/08/2023.
//

import SwiftUI

// This view showcases vertical scroll with
// .scrollPosition(id:) modifier

struct ContentView3: View {
    
    // MARK: - Declarations
    
    enum Constant {
        static let smallFrame = CGSize(width: 300, height: 100)
        static let cornerRadius = 25.0
        static let safeAreaPadding = 40.0
        static let vstackSpacing = 20.0
        static let floatingButtonSize = CGSize(width: 60, height: 60)
        static let buttonViewHeight = 100.0
    }
    
    // MARK: - Properties
    
    @StateObject var viewModel = ScrollViewContentModel()
    
    @State private var scrollPosition: Int? = 0
    
    // MARK: - Body
    
    var body: some View {
        VStack(spacing: Constant.vstackSpacing) {
            buttonView
            
            ScrollView(.vertical) {
                LazyVStack {
                    ForEach(viewModel.contentItems) { item in
                        rectangleView(colour: item.colour, text: "\(item.id)")
                            .containerRelativeFrame([.vertical, .horizontal])
                    }
                }
                .scrollTargetLayout()
            }
            .scrollPosition(id: $scrollPosition)
            .safeAreaPadding(.horizontal, Constant.safeAreaPadding)
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
    
    private var buttonView: some View {
        ZStack {
            Color.black
            HStack {
                buttonTop
                VStack {
                    Button("Next page") {
                        scrollPosition = scrollPosition == nil ? 0 : (scrollPosition! + 1)
                    }
                    .padding(5)
                    
                    if let position = scrollPosition {
                        Text("Current page: \(position)")
                            .foregroundColor(.white)
                    }
                }
                buttonBottom
            }
        }
        .frame(height: Constant.buttonViewHeight)
    }
    
    private var buttonTop: some View {
        Button(action: {
            scrollPosition = 0
        }, label: {
            Image(systemName: "arrow.up")
                .foregroundColor(.white)
        })
        .padding(.horizontal, Constant.safeAreaPadding)
    }
    
    private var buttonBottom: some View {
        Button(action: {
            scrollPosition = viewModel.contentItems.count - 1
        }, label: {
            Image(systemName: "arrow.down")
                .foregroundColor(.white)
        })
        .padding(.horizontal, Constant.safeAreaPadding)
    }
}

struct ContentView3_Previews: PreviewProvider {
    static var previews: some View {
        ContentView3()
    }
}

//
//  ContentView2.swift
//  swiftUI_scrollView
//
//  Created by Sasha Myshkina on 07/08/2023.
//

import SwiftUI

// This view showcases horizontal scroll with .containerRelativeFrame(_:alignment:) modifier

struct ContentView2: View {
    
    // MARK: - Declarations
    
    enum Constant {
        static let smallFrame = CGSize(width: 300, height: 100)
        static let cornerRadius = 25.0
        static let safeAreaPadding = 40.0
    }
    
    // MARK: - Properties
    
    @State var viewModel = ScrollViewContentModel()
    
    // MARK: - Body
    
    var body: some View {
        ScrollView(.horizontal) {
            LazyHStack {
                ForEach(viewModel.contentItems) { item in
                    rectangleView(colour: item.colour, text: "\(item.id)")
                        .containerRelativeFrame([.vertical, .horizontal])
                }
            }
            .scrollTargetLayout()
        }
        .scrollTargetBehavior(.viewAligned)
        .safeAreaPadding(.horizontal, Constant.safeAreaPadding)
    }
    
    private func rectangleView(colour: Color, text: String) -> some View {
        RoundedRectangle(cornerRadius: Constant.cornerRadius)
            .fill(colour)
            .overlay {
                Text(text)
            }
    }
}

struct ContentView2_Previews: PreviewProvider {
    static var previews: some View {
        ContentView2()
    }
}

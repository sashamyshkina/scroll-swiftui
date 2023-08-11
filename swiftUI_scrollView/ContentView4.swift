//
//  ContentView4.swift
//  swiftUI_scrollView
//
//  Created by Sasha Myshkina on 07/08/2023.
//

import SwiftUI

// This view showcases horizontal scroll with
// .scrollTransition() modifier
// The .identity phase = the view is visible on the screen.
// The .topLeading phase = the view is about to become visible from either the top or leading edge depending on scroll direction
// The .bottomTrailing phase = bottom/trailing counterpart to .topLeading.

struct ContentView4: View {
    
    // MARK: - Declarations
    
    enum Constant {
        static let smallFrame = CGSize(width: 100, height: 300)
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
                    rectangleView(colour: item.colour)
                }
            }
            .scrollTargetLayout()
        }
        .scrollTargetBehavior(.viewAligned)
        .safeAreaPadding(.horizontal, Constant.safeAreaPadding)
    }
    
    private func rectangleView(colour: Color) -> some View {
        RoundedRectangle(cornerRadius: Constant.cornerRadius)
            .fill(colour)
            .frame(width: Constant.smallFrame.width, height: Constant.smallFrame.height
            )
//            .scrollTransition { content, phase in
//                    content
//                    .opacity(phase.isIdentity ? 1 : 0)
//                    .scaleEffect(phase.isIdentity ? 1 : 0.75)
//                    .blur(radius: phase.isIdentity ? 0 : 10)
//            }
        
            .scrollTransition(.animated) { content, phase in
                content
                    .scaleEffect(phase == .topLeading || phase ==  .bottomTrailing ? 0.6 : 1)
                    .opacity(phase != .identity ? 0.3 : 1)
            }
    }
}

struct ContentView4_Previews: PreviewProvider {
    static var previews: some View {
        ContentView4()
    }
}

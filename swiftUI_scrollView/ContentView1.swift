//
//  ContentView.swift
//  swiftUI_scrollView
//
//  Created by Sasha Myshkina on 06/08/2023.
//

import SwiftUI

// This view showcases horizontal scroll with paging
// Before iOS17 this behaviour could be achieved by using TabView
// or scrollViewObserver with adding custom offset

struct ContentView1: View {
    
    // MARK: - Declarations
    
    enum Constant {
        static let smallFrame = CGSize(width: 300, height: 100)
        static let cornerRadius = 25.0
        static let safeAreaPadding = 40.0
    }
    
    // MARK: - Properties
    
    @StateObject var viewModel = ScrollViewContentModel()
    
    // MARK: - Body
    
    var body: some View {
        ScrollView(.horizontal) {
            LazyHStack {
                ForEach(viewModel.contentItems) { item in
                    rectangleView(colour: item.colour)
                }
            }
            // scrollTargetLayout is set to the whole LazyVStack
            // and applied to each and every view it contains
            .scrollTargetLayout()
        }
        // if behaviour is set to .paging every time scroll happens
        //it will add scrollOffset of the width of the screen
         .scrollTargetBehavior(.paging)
        
        // if behaviour is set to .viewAligned every time scroll happens
        // it will add offset to center the next child view
//        .scrollTargetBehavior(.viewAligned)
        
        .safeAreaPadding(.horizontal, Constant.safeAreaPadding)
    }
    
    private func rectangleView(colour: Color) -> some View {
        RoundedRectangle(cornerRadius: Constant.cornerRadius)
            .fill(colour)
            .frame(width: Constant.smallFrame.width, height: Constant.smallFrame.height
            )
    }
}

struct ContentView1_Previews: PreviewProvider {
    static var previews: some View {
        ContentView1()
    }
}

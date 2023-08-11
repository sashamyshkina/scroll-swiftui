//
//  ScrollViewContentModel.swift
//  swiftUI_scrollView
//
//  Created by Sasha Myshkina on 06/08/2023.
//

import SwiftUI

final class ScrollViewContentModel: ObservableObject {
    
    var contentItems: [ContentItem] = ContentItem.defaultContent()
}

struct ContentItem: Identifiable {

    var id: Int
    
    var colour: Color
    
    init(id: Int, colour: Color?) {
        self.id = id
        self.colour = colour ?? .gray
    }
    
    static func defaultContent() -> [ContentItem] {
        let colours: [Color] = .randomColours()
        
        return colours.enumerated().map { iterator, colour in
            ContentItem(id: iterator, colour: colour)
        }
    }
}

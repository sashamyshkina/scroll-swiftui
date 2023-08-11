//
//  Extensions.swift
//  swiftUI_scrollView
//
//  Created by Sasha Myshkina on 06/08/2023.
//

import SwiftUI

extension Color {
    
    init(hex: String) {
        let hex = hex.trimmingCharacters(in: CharacterSet.alphanumerics.inverted)
        var int: UInt64 = 0
        Scanner(string: hex).scanHexInt64(&int)
        let a, r, g, b: UInt64
        switch hex.count {
        case 3: // RGB (12-bit)
            (a, r, g, b) = (255, (int >> 8) * 17, (int >> 4 & 0xF) * 17, (int & 0xF) * 17)
        case 6: // RGB (24-bit)
            (a, r, g, b) = (255, int >> 16, int >> 8 & 0xFF, int & 0xFF)
        case 8: // ARGB (32-bit)
            (a, r, g, b) = (int >> 24, int >> 16 & 0xFF, int >> 8 & 0xFF, int & 0xFF)
        default:
            (a, r, g, b) = (1, 1, 1, 0)
        }
        
        self.init(
            .sRGB,
            red: Double(r) / 255,
            green: Double(g) / 255,
            blue:  Double(b) / 255,
            opacity: Double(a) / 255
        )
    }
}

extension Array where Element == Color {
    
    static func randomColours() -> [Color] {
        return [
            Color(hex: "#959d90"),
            Color(hex: "#bba58f"),
            Color(hex: "#e8d9cd"),
            Color(hex: "#efefe9"),
            Color(hex: "#efa16e"),
            Color(hex: "#c09984"),
            Color(hex: "#efa16e"),
            Color(hex: "#bfc4ba"),
            Color(hex: "#b2aba1"),
            Color(hex: "#d5dbd9"),
            Color(hex: "#f3f5f3"),
            Color(hex: "#fbfa984"),
            Color(hex: "#ccba9d"),
            Color(hex: "#d9cbb5"),
            Color(hex: "#e5ddce"),
            Color(hex: "#f2eee6")
        ]
    }
}

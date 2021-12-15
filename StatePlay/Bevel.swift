//
//  Bevel.swift
//  StatePlay
//
//  Created by Quinn McHenry on 12/15/21.
//

import SwiftUI

struct BevelModifier: ViewModifier {
    enum Style {
        case up
        case down
    }
    let style: Style

    func body(content: Content) -> some View {
        content
            .overlay(Rectangle()
                        .fill(topLeadingColor)
                        .frame(height: 2), alignment: .topLeading)
            .overlay(Rectangle()
                        .fill(topLeadingColor)
                        .frame(width: 2), alignment: .leading)
            .overlay(Rectangle()
                        .fill(bottomTrailingColor)
                        .frame(height: 2), alignment: .bottomTrailing)
            .overlay(Rectangle()
                        .fill(bottomTrailingColor)
                        .frame(width: 2), alignment: .trailing)
    }

    var topLeadingColor: Color {
        style == .down ? Color.black : Color.white
    }

    var bottomTrailingColor: Color {
        style == .up ? Color.black : Color.white
    }
}

extension View {
    func beveled(_ style: BevelModifier.Style) -> some View {
        modifier(BevelModifier(style: style))
    }
}

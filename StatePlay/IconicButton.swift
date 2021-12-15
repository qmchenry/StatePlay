//
//  IconicButton.swift
//  StatePlay
//
//  Created by Quinn McHenry on 12/15/21.
//

import SwiftUI

struct IconicButtonStyle: ButtonStyle {
    @Environment(\.isEnabled) var isEnabled: Bool

    public func makeBody(configuration: Configuration) -> some View {
        Rectangle()
            .fill(Color.fillColor)
            .overlay(
                configuration
                    .label
                    .padding()
                    .foregroundColor(.black.opacity(isEnabled ? 1 : 0.4))
            )
            .beveled(configuration.isPressed ? .down : .up)
    }
}

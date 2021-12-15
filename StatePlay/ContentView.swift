//
//  ContentView.swift
//  StatePlay
//
//  Created by Quinn McHenry on 12/14/21.
//

import SwiftUI

struct ContentView: View {
    let fillColor = Color(white: 0.8)
    var body: some View {
        VStack {
            HStack(spacing: 5) {
                Spacer()
                icon(Text("_").padding(.bottom, 10))
                    .beveled(.up)
                icon(Text("❒"))
                    .beveled(.up)
                icon(Text("X"))
                    .beveled(.up)
                    .padding(5)
            }
            .font(.largeTitle)
            .background(Color.black)
            .padding([.top, .horizontal], 5)
            VStack {
                HStack(spacing: 40) {
                    box("1")
                        .beveled(.down)
                    box("00:00")
                        .beveled(.down)
                }
                .font(.largeTitle)

                HStack(spacing: 0) {
                    icon(Image(systemName: "play.fill")).frame(width: 60)
                        .beveled(.up)
                    icon(Image(systemName: "pause"))
                        .beveled(.up)
                    icon(Image(systemName: "stop.fill"))
                        .beveled(.up)
                    icon(Image(systemName: "backward.end.fill"))
                        .beveled(.up)
                    icon(Image(systemName: "backward.fill"))
                        .beveled(.up)
                    icon(Image(systemName: "forward.fill"))
                        .beveled(.up)
                    icon(Image(systemName: "forward.end.fill"))
                        .beveled(.up)
                    icon(Image(systemName: "eject.fill"))
                        .beveled(.up)
                }
                .padding(.vertical, 15)
            }
            .padding(.vertical, 25)
            .frame(maxWidth: .infinity)
            .beveled(.down)
            .padding([.bottom, .horizontal], 5)
        }
        .background(fillColor)
        .beveled(.up)
        .padding()
    }

    // todo: make this a button style to allow disabling
    func icon<V>(_ contents: V) -> some View where V: View {
        Rectangle()
            .fill(Color(white: 0.8))
            .frame(width: 34, height: 34)
            .overlay(contents)
    }

    func box(_ text: String) -> some View {
        Rectangle()
            .fill(fillColor)
            .frame(width: 110, height: 60)
            .overlay(Text(text))
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

//public struct IconicButtonStyle: ButtonStyle {
//    @Environment(\.isEnabled) var isEnabled: Bool
//
//    public func makeBody(configuration: Configuration) -> some View {
//        let background = RoundedRectangle(cornerRadius: 14, style: .continuous)
//            .fill(color(for: configuration))
//
//        configuration
//            .label
//            .padding()
//            .foregroundColor(isEnabled ? primaryColor : disabled)
//            .background(background)
//    }
//}

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

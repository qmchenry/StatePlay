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
        depth(inner: false,
            VStack {
                HStack(spacing: 5) {
                    Spacer()
                    depth(icon(Text("_").font(.largeTitle).padding(.bottom, 10)))
                    depth(icon(Text("❒").font(.largeTitle)))
                    depth(icon(Text("X").font(.largeTitle)))
                        .padding(5)
                }
                .background(Color.black)
                .padding([.top, .horizontal], 5)
                    depth(inner: true, VStack {
                        HStack(spacing: 40) {
                            depth(inner: true, box("1"))
                            depth(inner: true, box("00:00"))
                        }
                        .font(.largeTitle)

                        HStack(spacing: 0) {
                            depth(icon(Image(systemName: "play.fill")).frame(width: 60))
                            depth(icon(Image(systemName: "pause")))
                            depth(icon(Image(systemName: "stop.fill")))
                            depth(icon(Image(systemName: "backward.end.fill")))
                            depth(icon(Image(systemName: "backward.fill")))
                            depth(icon(Image(systemName: "forward.fill")))
                            depth(icon(Image(systemName: "forward.end.fill")))
                            depth(icon(Image(systemName: "eject.fill")))
                        }
                        .padding(.vertical, 15)
                    }
                    .padding(.vertical, 25)
                    .frame(maxWidth: .infinity)
                    )
                .padding([.bottom, .horizontal], 5)
            }
            .background(fillColor)
        )
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

    // todo: make this a modifier
    func depth<V>(inner: Bool = false, _ contents: V) -> some View where V: View {
        let tlColor = inner ? Color.black : Color.white
        let btColor = inner ? Color.white : Color.black
        return contents
            .overlay(Rectangle()
                        .fill(tlColor)
                        .frame(height: 2), alignment: .topLeading)
            .overlay(Rectangle()
                        .fill(tlColor)
                        .frame(width: 2), alignment: .leading)
            .overlay(Rectangle()
                        .fill(btColor)
                        .frame(height: 2), alignment: .bottomTrailing)
            .overlay(Rectangle()
                        .fill(btColor)
                        .frame(width: 2), alignment: .trailing)
    }
 }

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

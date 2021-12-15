//
//  MenuBar.swift
//  StatePlay
//
//  Created by Quinn McHenry on 12/15/21.
//

import SwiftUI

struct MenuBar: View {
    var body: some View {
        HStack(spacing: 5) {
            Spacer()
            icon(Text("_").padding(.bottom, 10))
                .beveled(.up)
            icon(Text("❒"))
                .beveled(.up)
            icon(Image(systemName: "xmark").font(Font.system(size: 22, weight: .bold)))
                .beveled(.up)
                .padding(5)
        }
        .font(.largeTitle)
        .background(Color.black)
        .padding([.top, .horizontal], 4)
    }

    func icon<V>(_ contents: V) -> some View where V: View {
        Rectangle()
            .fill(Color(white: 0.8))
            .frame(width: 34, height: 34)
            .overlay(contents)
    }
}

struct MenuBar_Previews: PreviewProvider {
    static var previews: some View {
        MenuBar()
    }
}

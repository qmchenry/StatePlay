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
            Group {
                Spacer()
                Button {

                } label: {
                    Text("_")
                        .font(.largeTitle)
                        .frame(width: 34)
                        .padding(.bottom, 10)
                }
                .frame(width: 34)

                Button {

                } label: {
                    Text("❒")
                        .font(.largeTitle)
                        .frame(width: 34)
                }
                .frame(width: 34)

                Button {

                } label: {
                    Image(systemName: "xmark").font(Font.system(size: 22, weight: .bold))
                }
                .frame(width: 34)
            }
            .frame(height: 34)
        }
        .buttonStyle(IconicButtonStyle())
        .font(.largeTitle)
        .padding(4)
        .padding(.top, 2)
        .background(Color.black)
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

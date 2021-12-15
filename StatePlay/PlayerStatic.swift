//
//  ContentView.swift
//  StatePlay
//
//  Created by Quinn McHenry on 12/14/21.
//

import SwiftUI

struct PlayerStatic: View {
    var body: some View {
        VStack {
            MenuBar()
            
            VStack {
                HStack(spacing: 40) {
                    Text("1")
                        .frame(width: 110, height: 60)
                        .beveled(.down)
                    Text("00:00")
                        .frame(width: 110, height: 60)
                        .beveled(.down)
                }
                .font(.largeTitle)

                HStack(spacing: 0) {
                    Button {

                    } label: {
                        Image(systemName: "play.fill")
                    }
                    .frame(width: 60)
                    .disabled(true)

                    Button {

                    } label: {
                        Image(systemName: "pause")
                            .font(Font.system(size: 22, weight: .bold))
                    }

                    Button {

                    } label: {
                        Image(systemName: "stop.fill")
                    }

                    Button {

                    } label: {
                        Image(systemName: "backward.end.fill")
                    }

                    Button {

                    } label: {
                        Image(systemName: "backward.fill")
                    }

                    Button {

                    } label: {
                        Image(systemName: "forward.fill")
                    }

                    Button {

                    } label: {
                        Image(systemName: "forward.end.fill")
                    }

                    Button {

                    } label: {
                        Image(systemName: "eject.fill")
                    }

                }
                .buttonStyle(IconicButtonStyle())
                .frame(width: 60 + 7*34, height: 34)
                .padding(.vertical, 15)
            }
            .padding(.vertical, 25)
            .frame(maxWidth: .infinity)
            .beveled(.down)
            .padding([.bottom, .horizontal], 5)
        }
        .background(Color.fillColor)
        .beveled(.up)
        .padding()
    }
}

struct PlayerStatic_Previews: PreviewProvider {
    static var previews: some View {
        PlayerStatic()
    }
}

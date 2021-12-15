//
//  PlayerNaturalState.swift
//  StatePlay
//
//  Created by Quinn McHenry on 12/15/21.
//

import SwiftUI

class CDPlayerNatural: ObservableObject {
    @Published var isLoaded = false
    @Published var isOpen = false
    @Published var isPlaying = false
    @Published var isStopped = true
    @Published var isPaused = false
    @Published var currentTrack = 1
    @Published var currentTime = "00:00"
    var totalTracks = 10

    var isNoCDLoaded: Bool {
        !isLoaded || isOpen
    }

    func stop() {
        isStopped = true
        currentTrack = 1
        currentTime = "00:00"
    }


}

struct PlayerNaturalState: View {
    @StateObject var player = CDPlayerNatural()

    var body: some View {
        VStack {
            VStack {
                MenuBar()

                VStack {
                    HStack(spacing: 40) {
                        // Track label
                        Text("\(player.currentTrack)")
                            .frame(width: 110, height: 60)
                            .beveled(.down)

                        // Time label
                        Text(player.currentTime)
                            .frame(width: 110, height: 60)
                            .beveled(.down)
                    }
                    .font(.largeTitle)

                    HStack(spacing: 0) {
                        // Play button
                        Button {
                            guard !player.isNoCDLoaded else { return }
                            player.isPlaying = true
                            if player.isStopped {
                                player.isStopped = false
                            } else if player.isPaused {
                                player.isPaused = false
                            }
                        } label: {
                            Image(systemName: "play.fill")
                        }
                        .disabled(player.isPlaying)
                        .frame(width: 60)

                        // Pause button
                        Button {
                            guard !player.isNoCDLoaded else { return }
                            if player.isPlaying {
                                player.isPaused = true
                                player.isPlaying = false
                            } else if player.isPaused {
                                player.isPaused = false
                                player.isPlaying = true
                            }

                        } label: {
                            Image(systemName: "pause")
                                .font(Font.system(size: 22, weight: .bold))
                        }
                        .disabled(player.isStopped)

                        // Stop button
                        Button {
                            guard !player.isNoCDLoaded else { return }
                            if player.isPlaying {
                                player.stop()
                                player.isPlaying = false
                            }

                        } label: {
                            Image(systemName: "stop.fill")
                        }
                        .disabled(player.isStopped)

                        // Previous button
                        Button {
                            guard !player.isNoCDLoaded else { return }

                        } label: {
                            Image(systemName: "backward.end.fill")
                        }

                        // Reverse button
                        Button {
                            guard !player.isNoCDLoaded else { return }

                        } label: {
                            Image(systemName: "backward.fill")
                        }

                        // Forward button
                        Button {
                            guard !player.isNoCDLoaded else { return }

                        } label: {
                            Image(systemName: "forward.fill")
                        }

                        // Next button
                        Button {
                            guard !player.isNoCDLoaded else { return }

                        } label: {
                            Image(systemName: "forward.end.fill")
                        }

                        // Eject button
                        Button {
                            if player.isNoCDLoaded && player.isOpen {
                                player.isOpen = false
                                if player.isLoaded {
                                    player.isStopped = true
                                }
                            }

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

            Toggle("Is a CD in the player?", isOn: $player.isLoaded)
                .padding()
        }
    }
}

struct PlayerNaturalState_Previews: PreviewProvider {
    static var previews: some View {
        PlayerNaturalState()
    }
}


/// ✅ 1 There shall be eight buttons named: Play, Pause, Stop. Previous, Next, Forward, Reverse, and Eject.
/// ✅ 2 There shall be two text fields for displaying data. They shall be named Time and Track.
/// ✅ 3 When there is no disc in the CD player or when the CD player drawer is open, the system shall be in a state named <No CD Loaded>.
/// ✅ 4 When the CD player drawer is closed and a CD is in the CD player, the system shall be in one of three possible states: <CD Stopped>, <CD Playing>, or <CD Paused>.
/// ✅ 5 When in the <No CD Loaded> state, with the drawer open and a CD in the drawer, pressing the Eject button shall cause the drawer of the CD player to close and the system shall enter the <CD Stopped> state.
/// ✅ 6 When in the <No CD Loaded> state, with the drawer open and no CD in the drawer, pressing the Eject button shall cause the drawer of the CD player to close and the system shall remain in the <No CD Loaded> state.
/// ✅ 7 When in the <No CD Loaded> state, pressing the Play, Pause, Stop, Previous, Next, Forward and Reverse buttons shall have no effect.
/// ✅ 8 The <CD Playing> state is entered from the <CD Stopped> state by a user clicking the Play button.
/// ✅ 9 The <CD Stopped> state is entered from the <CD Playing> state by a user clicking the Stop button.
/// ✅ 10 The <CD Paused> state is entered from the <CD Playing> state by a user clicking the Pause button.
/// ✅ 11 The <CD Playing> state is entered from the <CD Paused> state by a user clicking the Pause button or the Play button.
/// ✅ 12 When in the <CD Stopped> state, the <Time> field shall display 00:00 and the <Track> field shall display [1J.
/// ✅ 13 When in the <CD Stopped> state, the Pause and Stop buttons shall be disabled.
/// ✅ 14 When in the <CD Playing> state, the Play button shall be disabled.
/// 15 When in the <CD Stopped>, <CD Playing> or <CD Paused> states, clicking the Next button when the current track is not the last track on the CD, will cause the CD player to move to the next track, the <Time> field will display 00:00 and the <Track> field shall display the track number.
/// 16 When in the <CD Stopped>, <CD Playing>, or <CD Paused> states, clicking the Next button when the current track is the last track on the CD, will cause the CD player to move to the first track, the <Time> field will display 00:00, the <Track> field shall display [1] and the <CD Stopped> state will be entered.
/// 17 When in the <CD Stopped>, <CD Playing> or <CD Paused> states, clicking the Previous button when the current track is not the first track on the CD, will cause the CD player to move to the previous track, the <Time> field will display 00:00 and the <Track> field shall display the track number.
/// 18 When in the <CD Stopped>, <CD Playing> or <CD Paused> states, clicking the Previous button when the current track is the first track on the CD, will cause the CD player to move to the start of the first track, the <Time> field will display 00:00 and the <Track> field shall display [11.
/// 19 When in the <CD Stopped>, <CD Playing> or <CD Paused> states, clicking the Forward button down will cause the CD to stop playing and the CD to step forwards through the CD in one-second intervals; each step will take no more than 0.1 seconds. For each step, the <Time> field will display the current track time and the <Track> field will display the current track number. The application will stop stepping through the CD when the user stops holding down the Forward button with the mouse pointer, or the end of the CD is reached. If the end of the CD is reached, the <CD Stopped> state will be entered and the <Time> field will display 00:00 and the <Track> field shall display [1].
/// 20 When in the <CD Stoppcd>, <CD Playing> or <CD Paused> states, clicking the Reverse button down will cause the CD to stop playing and the CD to step backwards through the CD in one-second intervals; each step will take no more than 0.1 seconds. For each step, the <Time> field will display the current track time and the <Track> field will display the current track number. The application will stop stepping through the CD when the user stops holding down the Reverse button with the mouse pointer, or the start of the CD is reached.
/// 21 When in the <CD Playing> state, the <Time> field shall be updated every second with the elapsed playing time of the current track and the <Track> field shall display the current track number.
/// 22 When in the <CD Paused> state, the values in the Time and Track fields will be displayed initially and then after one second they will be hidden. After a further second they will be displayed again. This displaying and hiding cycle will continue while the system is in the <CD Paused> state.
/// 23 When in the <No CD Loaded>, <CD Stopped>, <CD Playing> or <CD Paused> states, the balloon help for the buttons shall be as follows: Stop button = Stop, Previous button = Previous Track, Next button = Next Track, Forwards button = Step Forward, Reverse button = Step Backwards.
/// 24 When in the <No CD Loaded> state and the CD player door is open, the balloon help for the buttons shall be as follows: Play button = Play, Pause button = Pause, and Eject button = Close.
/// 25 When in the <No CD Loaded> state and the CD player door is closed, the balloon help for the buttons shall be as follows: Play button = Play, Pause button = Pause, and Eject button = Eject.
/// 26 When in the <CD Stopped> or <CD Playing> state, the balloon help for the buttons shall be as follows: Play button = Play, Pause button = Pause, and Eject button = Eject.
/// 27 When in the <CD Paused> state, the balloon help for the buttons shall be as follows: Play button = Resume, Pause button = Resume, and Eject button = Eject.

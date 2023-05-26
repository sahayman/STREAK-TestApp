//
//  ContentView.swift
//  STREAK+TestApp
//
//  Created by Steve Hayman on 2023-05-26.
//

import SwiftUI
import STREAK

struct ContentView: View {
    var body: some View {
        VStack {
            ForEach(allSoundFiles()) { SoundButton($0)}
        }
        .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

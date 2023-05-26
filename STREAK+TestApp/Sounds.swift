//
//  Sounds.swift
//  STREAK+TestApp
//
//  Created by Steve Hayman on 2023-05-26.
//

import SwiftUI
import STREAK

struct Sounds: View {
    var body: some View {
        SimpleGrid(minimumWidth: 100) {
            SoundButton(.tada)
            SpeechButton("Hey")
            ForEach(allSoundFiles() ) {
                SoundButton($0)
            }
            ForEach(1...200, id:\.self ) {
                SpeechButton("\($0)")
            }
            
        }
    }
}
struct Sounds_Previews: PreviewProvider {
    static var previews: some View {
        Sounds()
    }
}

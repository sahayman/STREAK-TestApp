//
//  FaceMarks.swift
//  STREAK+TestApp
//
//  Created by Steve Hayman on 2023-06-29.
//

import SwiftUI
import STREAK

struct FaceMarks: View {
    let face = Face()
    var body: some View {
        VStack {
            
            
            if face.tongueIsOut {
                Text("😛")
            } else {
                Text("😐")
            }

            🐮
        }
        .font(.system(size: 256.0))
    }
}

#Preview {
    FaceMarks()
}

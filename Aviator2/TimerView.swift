//
//  TimerView.swift
//  Aviator2
//
//  Created by Aliya Alymbekova on 16/11/24.
//

import SwiftUI

struct TimerView: View {
    
    @State var startDate = Date.now
    @State var timeElapsed: Int = 0
    
    let timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
    
    var body: some View {
        VStack {
                Text("Time elapsed: \(timeElapsed) sec")
                    .onReceive(timer) { firedDate in
                        print("timer fired")
                        timeElapsed = Int(firedDate.timeIntervalSince(startDate))
                    }
                Button("Stop") {

                    timer.upstream.connect().cancel()
                }
            }
            .font(.largeTitle)
        }
    }

#Preview {
    TimerView()
}

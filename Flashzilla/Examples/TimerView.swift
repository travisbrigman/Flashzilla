//
//  TimerView.swift
//  Flashzilla
//
//  Created by Travis Brigman on 3/12/21.
//  Copyright © 2021 Travis Brigman. All rights reserved.
//

import SwiftUI

struct TimerView: View {
    let timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
    @State private var counter = 0
    
    var body: some View {
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
        .onReceive(timer) { time in
            if self.counter == 5 {
                self.timer.upstream.connect().cancel()
            } else {
                print("The time is now \(time)")
            }
            self.counter += 1
        }
    }
}

struct TimerView_Previews: PreviewProvider {
    static var previews: some View {
        TimerView()
    }
}

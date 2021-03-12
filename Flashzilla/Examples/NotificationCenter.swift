//
//  NotificationCenter.swift
//  Flashzilla
//
//  Created by Travis Brigman on 3/12/21.
//  Copyright © 2021 Travis Brigman. All rights reserved.
//

import SwiftUI

struct NotificationCenter: View {
    var body: some View {
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
        .onReceive(NotificationCenter.default.publisher(for: UIApplication.willResignActiveNotification)) { _ in
            print("Moving to the background!")
        }
    }
}

struct NotificationCenter_Previews: PreviewProvider {
    static var previews: some View {
        NotificationCenter()
    }
}

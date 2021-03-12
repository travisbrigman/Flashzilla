//
//  ContentView.swift
//  Flashzilla
//
//  Created by Travis Brigman on 3/12/21.
//  Copyright © 2021 Travis Brigman. All rights reserved.
//

import SwiftUI

struct gestureView: View {
    @State private var currentAmount: CGFloat = 0
    @State private var finalAmount: CGFloat = 1
    var body: some View {
        Text("Hello, World!")
            /*    .onLongPressGesture(minimumDuration: 1, pressing: {
             inProgress in
             print("In Progress \(inProgress)")
             
             }) {
             print("long pressed")
             } */
            .scaleEffect(finalAmount + currentAmount)
            .gesture(
                MagnificationGesture()
                    .onChanged{ amount in
                        self.currentAmount = amount - 1
                }
                .onEnded { amount in
                    self.finalAmount += self.currentAmount
                    self.currentAmount = 0
                }
        )
    }
}

struct gestureView_Previews: PreviewProvider {
    static var previews: some View {
        gestureView()
    }
}

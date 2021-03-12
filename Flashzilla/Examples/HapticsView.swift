//
//  HapticsView.swift
//  Flashzilla
//
//  Created by Travis Brigman on 3/12/21.
//  Copyright © 2021 Travis Brigman. All rights reserved.
//
import CoreHaptics
import SwiftUI

struct HapticsView: View {
    @State private var engine: CHHapticEngine?
    
    var body: some View {
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
            .onAppear(perform: prepareHaptics)
            .onTapGesture( perform: complexSuccess)
    }
    
    func simpleSuccess() {
        let generator = UINotificationFeedbackGenerator()
        generator.notificationOccurred(.success)
    }
    
    func complexSuccess() {
        guard CHHapticEngine.capabilitiesForHardware()
            .supportsHaptics else { return }
        var events = [CHHapticEvent]()
        
        let intensity = CHHapticEventParameter(parameterID: .hapticIntensity, value: 1)
        
        let sharpness = CHHapticEventParameter(parameterID: .hapticSharpness, value: 1)
        
        let event = CHHapticEvent(eventType: .hapticTransient, parameters: [intensity, sharpness], relativeTime: 0)
        
        events.append(event)
        
        do {
            let pattern = try CHHapticPattern(events: events, parameters: [])
            let player = try engine?.makePlayer(with: pattern)
            try player?.start(atTime: 0)
        } catch {
            print("failed: \(error.localizedDescription)")
        }
    }
    
    func prepareHaptics() {
        guard CHHapticEngine.capabilitiesForHardware()
            .supportsHaptics else { return }
        do {
            self.engine = try CHHapticEngine()
            try engine?.start()
        } catch {
            print("There was an error: \(error.localizedDescription)")
        }
    }
}

struct HapticsView_Previews: PreviewProvider {
    static var previews: some View {
        HapticsView()
    }
}

//
//  Card.swift
//  Flashzilla
//
//  Created by Travis Brigman on 3/12/21.
//  Copyright © 2021 Travis Brigman. All rights reserved.
//

import Foundation

struct Card: Codable {
    let prompt: String
    var answer: String
    
    
    //computed property that is static allows us to create test data
    static var example: Card {
        Card(prompt: "Who played the 13th doctor in Doctor Who?", answer: "Jodie Whittaker")
    }
}

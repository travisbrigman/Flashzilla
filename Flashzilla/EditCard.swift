//
//  EditCard.swift
//  Flashzilla
//
//  Created by Travis Brigman on 3/14/21.
//  Copyright © 2021 Travis Brigman. All rights reserved.
//

import SwiftUI

struct EditCard: View {
    @Environment(\.presentationMode) var presentationMode
    @State private var cards = [Card]()
    @State private var newPrompt = ""
    @State private var newAnswer = ""
    var body: some View {
        NavigationView {
            List {
                Section(header: Text("Add new card")) {
                    TextField("prompt", text: $newPrompt)
                    TextField("answer", text: $newAnswer)
                    Button("add card", action: addCard)
                }
                
                Section {
                    ForEach(0..<cards.count, id: \.self) {
                        index in
                        VStack(alignment: .leading) {
                            Text(self.cards[index].prompt)
                                .font(.headline)
                            Text(self.cards[index].answer)
                                .foregroundColor(.secondary)
                        }
                    }
                .onDelete(perform: removeCards)
                }
            }
        .navigationBarTitle("Edit Cards")
            .navigationBarItems(trailing: Button("Done", action: dismiss))
        .listStyle(GroupedListStyle())
            .onAppear(perform: loadData)
        }
    .navigationViewStyle(StackNavigationViewStyle())
    }
    func dismiss() {
        presentationMode.wrappedValue.dismiss()
    }
    func loadData() {
        if let data = UserDefaults.standard.data(forKey: "Data") {
            if let decoded = try? JSONDecoder().decode([Card].self, from: data) {
                self.cards = decoded
            }
        }
    }
    
    func saveData() {
        if let data = try? JSONEncoder().encode(cards) {
            UserDefaults.standard.set(data, forKey: "Cards")
        }
    }
    
    func addCard() {
        let trimmedPrompt = newPrompt.trimmingCharacters(in: .whitespaces)
        let trimmedAnswer = newAnswer.trimmingCharacters(in: .whitespaces)
        guard trimmedPrompt.isEmpty == false && trimmedAnswer.isEmpty == false else { return }

        let card = Card(prompt: trimmedPrompt, answer: trimmedAnswer)
        cards.insert(card, at: 0)
        saveData()
    }

    func removeCards(at offsets: IndexSet) {
        cards.remove(atOffsets: offsets)
        saveData()
    }
}

struct EditCard_Previews: PreviewProvider {
    static var previews: some View {
        EditCard()
    }
}

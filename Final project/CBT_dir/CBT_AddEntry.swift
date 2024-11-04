//
//  CBT_AddEntry.swift
//  Final project
//
//  Created by Keshawn B on 10/29/24.
//

import SwiftUI

struct CBT_AddEntry: View {
    @State private var userInput: String = "" // State variable to hold user input

    var body: some View {
        VStack {
            TextField("Enter text here", text: $userInput)
                .padding()
                .textFieldStyle(RoundedBorderTextFieldStyle())

            Text("You entered: \(userInput)")
                .padding()
        }
        .padding()
    }
}

#Preview{
    CBT_AddEntry()
}

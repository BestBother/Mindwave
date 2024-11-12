//
//  ContentView.swift
//  Final project
//
//  Created by Keshawn B on 11/7/24.
//

import SwiftUI
import FirebaseDatabase

struct ContentView: View {
 

    var body: some View {
        NavigationStack {
            NavigationLink(destination: CBT_Journal()) {
                Text("CBT_Journal")
            }
        }
    }

}

#Preview {
    ContentView()
}

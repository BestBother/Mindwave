//
//  CBT_Journal.swift
//  Final project
//
//  Created by Keshawn B on 10/29/24.
//

import SwiftUI
import FirebaseDatabase
import Foundation

class JournalViewModel: ObservableObject {
    @Published var entries: [JournalEntry] = []
    
    func fetchJournalEntries(forUser userID: String) {
        let ref = Database.database().reference().child("users").child(userID).child("journalEntries")
        
        // Observe all entries in the user's journal node
        ref.observe(.value) { snapshot in
            var fetchedEntries: [JournalEntry] = []
            
            // Loop through years, months, and days
            for case let yearSnapshot as DataSnapshot in snapshot.children {
                for case let monthSnapshot as DataSnapshot in yearSnapshot.children {
                    for case let daySnapshot as DataSnapshot in monthSnapshot.children {
                        for case let entrySnapshot as DataSnapshot in daySnapshot.children {
                            if let entryData = entrySnapshot.value as? [String: Any],
                               let title = entryData["title"] as? String,
                               let content = entryData["content"] as? String,
                               let timestamp = entryData["timestamp"] as? TimeInterval {
                                
                                let entry = JournalEntry(
                                    id: entrySnapshot.key,
                                    title: title,
                                    content: content,
                                    timestamp: timestamp
                                )
                                
                                fetchedEntries.append(entry)
                            }
                        }
                    }
                }
            }
            
            // Update the entries property with fetched data
            DispatchQueue.main.async {
                self.entries = fetchedEntries.sorted(by: { $0.timestamp > $1.timestamp }) // Sort by most recent
            }
        }
    }
}


struct CBT_Journal: View {
    
    @StateObject private var viewModel = JournalViewModel()
    @State private var userID: String = "Keshawn" // Example user ID, replace with actual user ID

    var body: some View {

        VStack{
            
            VStack(alignment: .leading){

                HStack(){
                    
                    Spacer()
                    Text("Journal entries")
                        .font(.largeTitle)
                    Spacer()
                }
                Rectangle()
                    .frame(height: 5.0)
            }
            .padding(.bottom)
            .frame(height: 100.0)
                NavigationStack {
                       List(viewModel.entries) { entry in
                           VStack(alignment: .leading) {
                               Text(entry.title)
                                   .font(.title)
                               Text(entry.content)
                                   .font(.body)
                               
                               /* Furture edit button
                                
                                NavigationLink(destination: CBT_AddEntry()) {
                                   HStack{
                                       Image(systemName: "plus.circle")
                                           .foregroundColor(Color.black)
                                       Text("Add Entry")
                                           .foregroundColor(Color.black)
                                   }
                               }
                                */
                               Text(entry.date, style: .date)
                                   .font(.caption)
                                   .foregroundColor(.gray)
                           }
                           .padding(.vertical, 5)
                       }
                       .onAppear {
                           viewModel.fetchJournalEntries(forUser: userID) // Fetch entries when view appears
                       }
                    // NavigationLink acts as the button to navigate to AnotherView
                    NavigationLink(destination: CBT_AddEntry()) {
                        HStack{
                            Image(systemName: "plus.circle")
                                .foregroundColor(Color.black)
                            Text("Add Entry")
                                .foregroundColor(Color.black)
                        }
                    }
                   }
            
        }
            .frame(height: 650.0)
        }
    }

    


struct JournalEntry: Identifiable, Codable {
    let id: String       // Unique ID for each entry
    let title: String
    let content: String
    let timestamp: TimeInterval // Store as Unix time for easier date handling
    
    // Computed property to convert timestamp to Date
    var date: Date {
        Date(timeIntervalSince1970: timestamp)
    }
}



#Preview {
    CBT_Journal()
}

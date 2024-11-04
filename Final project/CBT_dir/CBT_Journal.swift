//
//  CBT_Journal.swift
//  Final project
//
//  Created by Keshawn B on 10/29/24.
//

import SwiftUI

struct CBT_Journal: View {
    var body: some View {
        VStack{
            VStack(alignment: .leading){
                Image(systemName: "arrowshape.backward.fill")
                    .resizable()
                    .padding(.leading)
                    .frame(width: 80.0, height: 50.0)
                
                HStack(){
                    Spacer()
                    Text("Journal entries")
                    Spacer()
                }
                Rectangle()
                    .frame(height: 5.0)
            }
            .padding(.bottom)
            .frame(height: 100.0)
        }
    }
    
}

#Preview {
    CBT_Journal()
}

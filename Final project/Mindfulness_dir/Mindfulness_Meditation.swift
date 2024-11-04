//
//  Mindfulness_Meditation.swift
//  Final project
//
//  Created by Keshawn B on 10/29/24.
//

import SwiftUI

struct Mindfulness_Meditation: View {
    var body: some View {
        VStack{
            VStack(alignment: .leading){
                Image(systemName: "arrowshape.backward.fill")
                    .resizable()
                    .padding(.leading)
                    .frame(width: 80.0, height: 50.0)
                
                HStack(){
                    Spacer()
                    Text("Meditation exercises")
                    Spacer()
                }
                Rectangle()
                    .frame(height: 5.0)
            }
            .padding(.bottom)
            .frame(height: 100.0)
            
            
            
            VStack{
                Text("Meditation exercises go here")
            }
            .frame(height: 575.0)
            VStack{
                Rectangle()
                    .frame(height: 5.0)
                HStack{
                    Image(systemName: "plus.circle")
                    Text("Add Meditation exercises")
                }
            }
            .frame(height: 50.0)
            
            
        }
    }
}

#Preview {
    Mindfulness_Meditation()
}

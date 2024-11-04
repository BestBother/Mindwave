//
//  Mindfulness_Breathing.swift
//  Final project
//
//  Created by Keshawn B on 10/29/24.
//

import SwiftUI

struct Mindfulness_Breathing: View {
    var body: some View {
        
        VStack{
            VStack(alignment: .leading){
                Image(systemName: "arrowshape.backward.fill")
                    .resizable()
                    .padding(.leading)
                    .frame(width: 80.0, height: 50.0)
                
                HStack(){
                    Spacer()
                    Text("Breathing exercises")
                    Spacer()
                }
                Rectangle()
                    .frame(height: 5.0)
            }
            .padding(.bottom)
            .frame(height: 100.0)
            
            
            
            VStack{
                Text("Breathing exercises Go here")
            }
            .frame(height: 575.0)
            VStack{
                Rectangle()
                    .frame(height: 5.0)
                HStack{
                    Image(systemName: "plus.circle")
                    Text("Add Breathing exercises")
                }
                
            }
            .frame(height: 100.0)
            
            
        }
    }
    
}

#Preview {
    Mindfulness_Breathing()
}

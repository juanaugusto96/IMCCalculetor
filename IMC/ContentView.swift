//
//  ContentView.swift
//  IMC
//
//  Created by Juan augusto Roldan on 21/07/2024.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationStack{
            VStack{
                NavigationLink(destination:IMCview()) {
                    Text("IMC CALCULETOR")
                }
            }
        }
        }
        
    }


#Preview {
    ContentView()
}

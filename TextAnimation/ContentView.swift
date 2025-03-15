//
//  ContentView.swift
//  TextAnimation
//
//  Created by Vlad Crisan on 15.03.2025.
//

import SwiftUI

struct ContentView: View {
    @State private var currentNumber: Decimal = 0
    let timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
    
    var body: some View {
        VStack {
            Text("Number Animation Demo")
                .font(.headline)
                .padding()
            
            NumberAnimationView(number: currentNumber)
                .font(.system(size: 42, weight: .bold, design: .rounded))
                .padding()
            
            Text("Updates every second")
                .font(.caption)
        }
        .onReceive(timer) { _ in
            currentNumber = Decimal(Int.random(in: 0...10000))
        }
    }
}

#Preview {
    ContentView()
}

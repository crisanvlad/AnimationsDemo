//
//  NumberAnimationView.swift
//  TextAnimation
//
//  Created by Vlad Crisan on 15.03.2025.
//

import SwiftUI
import Foundation

struct NumberAnimationView: View {
    let number: Decimal
    
    @State private var previousNumber: Decimal?
    @State private var animateColor: Color = .primary
    
    var body: some View {
        Text(formatNumber(number))
            .foregroundStyle(animateColor)
            .contentTransition(.opacity)
            .animation(.easeInOut, value: number)
            .onChange(of: number) { newValue in
                updateColorBasedOnChange(newValue)
            }
            .onAppear {
                previousNumber = number
            }
    }
    
    private func updateColorBasedOnChange(_ newNumber: Decimal) {
        guard let previous = previousNumber else {
            previousNumber = newNumber
            return
        }
        
        if newNumber > previous {
            animateColor = .green
        } else if newNumber < previous {
            animateColor = .red
        } else {
            animateColor = .primary
        }
        
        previousNumber = newNumber
    }
    
    private func formatNumber(_ number: Decimal) -> String {
        let formatter = NumberFormatter()
        formatter.numberStyle = .decimal
        formatter.maximumFractionDigits = 2
        return formatter.string(from: number as NSNumber) ?? "0"
    }
}

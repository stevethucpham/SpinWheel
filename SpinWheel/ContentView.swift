//
//  ContentView.swift
//  SpinWheel
//
//  Created by Thuc Pham on 9/4/2023.
//

import SwiftUI
import FortuneWheel
import Shimmer

struct ContentView: View {
    private var players = ["Sameer", "Spikey", "Amelia", "Danny", "Karen", "Kathy"]
    @State private var isSpinned: Bool = false
    @State private var player: String = ""
    
    var body: some View {
        VStack {
            Text("🥳 Lucky Wheel 🥳")
                .font(.largeTitle)
                .fontWeight(.bold)
                .foregroundColor(.red)
                .padding()
            
            Spacer()
            
            ZStack {
                FortuneWheel(titles: players, size: 320, onSpinEnd: onSpinEnd)
            }
            
            if isSpinned {
                Text("🎉 Congratulations \(player)!!! 🎉")
                    .font(.title2)
                    .fontWeight(.semibold)
                    .padding(.horizontal, 16)
                    .padding(.vertical, 25)
                    .foregroundColor(.red)
                    .shimmering(duration: 2, bounce: true)
            }
            
            
            Spacer()
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(.black)
    }
    
    private func onSpinEnd(index: Int) {
        isSpinned.toggle()
        player = players[index]
    }

}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

//
//  ContentView.swift
//  Dicee-SwiftUI
//
//  Created by Dhruv Bhardwaj on 25/11/22.
//

import SwiftUI

struct ContentView: View {
    @State private var leftDiceNumber=1
    @State private var rightDiceNumber=1
    var body: some View {
        ZStack {
            Image("background")
                .resizable()
                .ignoresSafeArea()
            VStack {
                Image("diceeLogo")
                Spacer()
                HStack {
                    DiceView(number: leftDiceNumber)
                    DiceView(number: rightDiceNumber)
                }
                .padding(.horizontal)
                Spacer()
                Button(action: {
                    leftDiceNumber=Int.random(in: 1...6)
                    rightDiceNumber=Int.random(in: 1...6)
                })
                {
                    Text("Roll")
                        .font(.system(size: 50))
                        .fontWeight(.heavy)
                        .foregroundColor(.white)
                        .padding(.horizontal)
                        
                }
                .background(Color.red)
                .padding()
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct DiceView: View {
    let number:Int
    var body: some View {
        Image("dice\(number)")
            .resizable()
            .aspectRatio(1, contentMode: .fit)
            .padding(.all)
    }
}

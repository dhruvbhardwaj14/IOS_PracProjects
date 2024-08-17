//
//  ContentView.swift
//  IAmRichSwift
//
//  Created by Dhruv Bhardwaj on 22/11/22.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        ZStack{
            Color(.systemTeal)
            VStack {
                Text("I Am Rich")
                    .font(.custom("AmericanTypeWriter", size: 40))
                    .fontWeight(.bold)
                .foregroundColor(Color.white)
                Image("diamond")
                    .resizable()
                    .renderingMode(.original)
                    .aspectRatio( contentMode: .fit)
                    .frame(width: 200.0, height: 200.0,alignment: .center)
                    
                    
                    
            }
        }
        .ignoresSafeArea()
        
            
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

//
//  ContentView.swift
//  DhruvCard
//
//  Created by Dhruv Bhardwaj on 25/11/22.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        ZStack {
            Color(red: 0.09, green: 0.63, blue: 0.52, opacity: 1.00)
                .ignoresSafeArea()
            VStack {
                Image("dhruv")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 150.0,height: 150.0)
                    .clipShape(Circle())
                    .overlay(
                        Circle()
                            .stroke(Color.white,lineWidth: 5))
                Text("Dhruv Bhardwaj")
                    .font(Font.custom("Pacifico-Regular", size: 40))
                    .bold()
                .foregroundColor(.white)
                Text("iOS Developer")
                    .foregroundColor(.white)
                    .font(.system(size: 25))
                Divider()
                InfoView(text: "+91 72176 81731", imageName: "phone.fill")
                InfoView(text: "dhruv9891891827@gmail.com", imageName: "envelope.fill")
            }
        }
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

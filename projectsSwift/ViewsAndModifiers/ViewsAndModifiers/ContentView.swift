//
//  ContentView.swift
//  ViewsAndModifiers
//
//  Created by Dhruv Bhardwaj on 20/06/22.
//

import SwiftUI
struct Title: ViewModifier {
    func body(content: Content) -> some View {
        content
            .font(.largeTitle)
            .foregroundColor(.white)
            .padding()
            .background(.blue)
            .clipShape(RoundedRectangle(cornerRadius: 10))
    }
}
extension View {
    func titleStyle() -> some View {
        modifier(Title())
    }
}
struct Watermark: ViewModifier {
    var text: String

    func body(content: Content) -> some View {
        ZStack(alignment: .bottomTrailing) {
            content
            Text(text)
                .font(.caption)
                .foregroundColor(.white)
                .padding(5)
                .background(.black)
        }
    }
}

extension View {
    func watermarked(with text: String) -> some View {
        modifier(Watermark(text: text))
    }
}
struct ContentView: View {
    var body: some View {
            
        Text("Hello world")
            .frame(width: 300, height: 200)
            .background(.blue)
            .titleStyle()
            .watermarked(with: "Hacking with Swift")
        
           
    }
}
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}


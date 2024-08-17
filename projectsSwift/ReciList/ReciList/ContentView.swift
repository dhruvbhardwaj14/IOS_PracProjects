//
//  ContentView.swift
//  ReciList
//
//  Created by Dhruv Bhardwaj on 27/09/22.
//

import SwiftUI
import CoreImage
extension UIColor {
    public convenience init?(hex: String) {
        let r, g, b, a: CGFloat

        if hex.hasPrefix("#") {
            let start = hex.index(hex.startIndex, offsetBy: 1)
            let hexColor = String(hex[start...])

            if hexColor.count == 8 {
                let scanner = Scanner(string: hexColor)
                var hexNumber: UInt64 = 0

                if scanner.scanHexInt64(&hexNumber) {
                    r = CGFloat((hexNumber & 0xff000000) >> 24) / 255
                    g = CGFloat((hexNumber & 0x00ff0000) >> 16) / 255
                    b = CGFloat((hexNumber & 0x0000ff00) >> 8) / 255
                    a = CGFloat(hexNumber & 0x000000ff) / 255

                    self.init(red: r, green: g, blue: b, alpha: a)
                    return
                }
            }
        }

        return nil
    }
}
struct ContentView: View {
    let gold = UIColor(hex: "#FBD631ff")
    @State private var isSearch=false;
    @State private var sheetPresent=false;
        var body: some View {
            NavigationView{
                    ScrollView(.vertical){
                        ForEach(0..<10){_ in
                                RecipeLabelView()
                                    .clipShape(RoundedRectangle(cornerRadius: 10))
                                    .onTapGesture {
                                        sheetPresent=true;
                                    }
                                    .fullScreenCover(isPresented: $sheetPresent){
                                        RecipeView()
                                    }
                            
                    }
                }.frame(maxWidth:.infinity)
                        .background{
                            VStack{
                            Color(gold ?? UIColor.red)
                                .frame(width: .infinity, height: 300,alignment: .topLeading)
                            Color.white
                            }.ignoresSafeArea()
                        }
            
                        .navigationTitle("Cook Book")
            .navigationBarTitleDisplayMode(.large)
            .toolbar{
                Button{
                    isSearch=true
                }label: {
                    Image(systemName: "magnifyingglass.circle.fill")
                        .resizable()
                        .frame(width: 40, height: 40)
                        .alignmentGuide(.leading) { d in d[.leading] }
                        .foregroundColor(.secondary)
                }
            }
        }
            
            
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

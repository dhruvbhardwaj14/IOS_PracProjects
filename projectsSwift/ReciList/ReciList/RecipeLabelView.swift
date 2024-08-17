//
//  RecipeLabelView.swift
//  ReciList
//
//  Created by Dhruv Bhardwaj on 28/09/22.
//

import SwiftUI

struct RecipeLabelView: View {
    @State private var isStar=false;
    var body: some View {
        ZStack{
            Image("Superfood")
                .resizable()
                .clipShape(RoundedRectangle(cornerRadius: 50))
                .opacity(0.2)
                .frame(width:350, height: 450, alignment: .center)
            VStack{
                Button{
                    isStar.toggle()
                }label:{
                    Image(systemName: isStar ? "heart.fill" : "heart")
                        .resizable()
                        .foregroundColor(.red)
                        .frame(width: 30, height: 30, alignment: .center)
                }
//                    .frame(width:300, height: 320, alignment: .topLeading)
//                    .clipShape(RoundedRectangle(cornerRadius: 10))
                Text("Hello World")
                    .frame(width: .infinity, height: .infinity, alignment: .bottomLeading)
            }
            .frame(width:300, height: 320, alignment: .topLeading)
            .clipShape(RoundedRectangle(cornerRadius: 10))
//            VStack{
//                VStack{
//                    HStack{
//                        Button{
//                            isStar.toggle()
//                        }label:{
//                            Image(systemName: isStar ? "heart.fill" : "heart")
//                                .resizable()
//                                .foregroundColor(.red)
//                                .frame(width: 30, height: 30, alignment: .center)
//                        }
//                    }.frame(width:310, height: 80, alignment: .topLeading)
//            }
//                .padding(.vertical)
//                .padding(.horizontal)
//                    Text("Superfood Salad")
//                    .padding()
//                        .font(.title.bold())
//                        .foregroundColor(.black)
//                        .frame(width:350, height: 80, alignment: .topLeading)
//                        .background(.ultraThinMaterial)
//            }
        }
    }
}

struct RecipeLabelView_Previews: PreviewProvider {
    static var previews: some View {
        RecipeLabelView()
    }
}

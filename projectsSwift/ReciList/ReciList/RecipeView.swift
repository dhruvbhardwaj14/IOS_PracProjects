//
//  RecipeView.swift
//  ReciList
//
//  Created by Dhruv Bhardwaj on 28/09/22.
//

import SwiftUI

struct RecipeView: View {
    @Environment(\.presentationMode) var presentationMode
    var body: some View {
//        NavigationView{
//        ZStack{
//            VStack{
//            Image("Superfood")
//                    .frame(width: .infinity, height:400,alignment: .topLeading)
//                Color.gray
//                    .opacity(0.4)
//            }.ignoresSafeArea()
//
//            VStack{
//                    RecipeLabelView()
//
//            }
//            .clipShape(RoundedRectangle(cornerRadius: 50))
//            .background(
//
//            )
//
//                }
//            }
//        }
//
        NavigationView{
                RecipeLabelView()
                .clipShape(RoundedRectangle(cornerRadius: 10))
                .toolbar{
                Button{
                        presentationMode.wrappedValue.dismiss()
                }label: {
                    Image(systemName: "xmark.circle.fill")
                        .resizable()
                        .frame(width: 32, height: 32, alignment:.trailing)
                        .foregroundColor(.secondary)
                }
            }
        }
    }
}

struct RecipeView_Previews: PreviewProvider {
    static var previews: some View {
        RecipeView()
    }
}

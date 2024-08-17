//
//  GridView.swift
//  ModifiedMoonShot
//
//  Created by Dhruv Bhardwaj on 05/07/22.
//

import SwiftUI

struct GridView: View {
    let astronauts:[String:Astronaut]//Bundle-decoder extensions use
    //error-generic  parameter 'T' does not confirm-add a type notations to astronauts
    let missions:[Mission]
    //dividing into grids of adaptive columns
    @State private var columns=[GridItem(.adaptive(minimum: 150))]
//    if showing      columns=[GridItem(.adaptive(minimum: 150))]
//    }
//
    var body: some View {
            ScrollView{
                LazyVGrid(columns: columns){
                    ForEach(missions){mission in
                        NavigationLink{
//                                Text("Detail view")
                            //showing the Missionview
                            withAnimation{
                                MissionView(mission: mission, astronauts: astronauts)
                            }
                        }label: {
                            VStack{
                                Image(mission.image)
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: 100, height: 100)
//                                    padded images from the frame
                                    .padding()
                                VStack{
                                    Text(mission.displayName)
                                        .font(.headline)
                                        .foregroundColor(.white)
//                                        Text(mission.launchDate ?? "N/A")//errror//earlier it showed date like 1968-05-21
                                    //show the date in a better format
                                    Text(mission.formattedLaunchDate)
                                        .font(.caption)
                                        .foregroundColor(.white.opacity(0.5))//less opaque date not pure white
                                }
                                //giving a vertical padding before frame
                                .padding(.vertical)
                                .frame(maxWidth:.infinity)
                                //given light bg colour to text
                                .background(.lightBackground)
                            }
                            //clip shape for the text part
                            .clipShape(RoundedRectangle(cornerRadius: 10))
//                                overlay with image and text part
                            .overlay(
                                RoundedRectangle(cornerRadius: 10)
                                    .stroke(.lightBackground)
                            )
                        }
                    }
                }
                //adding horizontal and vertical padding to our lazyvgrid
                .padding([.horizontal,.bottom])
            }
        }
}


struct GridView_Previews: PreviewProvider {
    static var previews: some View {
        GridView(astronauts: Bundle.main.decode("astronauts.json"), missions: Bundle.main.decode("missions.json"))
            .preferredColorScheme(.dark)
    }
}

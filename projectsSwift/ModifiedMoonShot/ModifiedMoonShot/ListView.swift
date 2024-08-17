//
//  ListView.swift
//  ModifiedMoonShot
//
//  Created by Dhruv Bhardwaj on 05/07/22.
//

import SwiftUI

struct ListView: View {
    let astronauts:[String:Astronaut]//Bundle-decoder extensions use
    //error-generic  parameter 'T' does not confirm-add a type notations to astronauts
    let missions:[Mission]
        
        //dividing into grids of adaptive columns
//    let columns=[GridItem(.adaptive(minimum:150)]
    var body: some View {
            List(missions) { mission in
                NavigationLink {
                    MissionView(mission: mission, astronauts: astronauts)
                } label: {
                    HStack {
                        Image(mission.image)
                            .resizable()
                            .scaledToFit()
                            .frame(width: 40, height: 40)
                            .padding()

                        VStack(alignment: .leading) {
                            Text(mission.displayName)
                                .font(.headline)
                            Text(mission.formattedLaunchDate)
                        }
                    }
                }
                //adding darkbackground to list
                .listRowBackground(Color.darkBackground)
            }.listStyle(.plain)
            
        }
}

struct ListView_Previews: PreviewProvider {
    static var previews: some View {
        ListView(astronauts: Bundle.main.decode("astronauts.json"), missions: Bundle.main.decode("missions.json"))
            .preferredColorScheme(.dark)
    }
}

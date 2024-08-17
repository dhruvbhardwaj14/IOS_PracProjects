//
//  CrewRosterView.swift
//  MoonShot
//
//  Created by Dhruv Bhardwaj on 05/07/22.
//

import SwiftUI

struct CrewRosterView: View {
    let crew: [MissionView.CrewMember]
    var body: some View {
        ScrollView(.horizontal,showsIndicators: false){
            HStack{
                ForEach(crew,id:\.role){crewMember in
                    NavigationLink{
                        //astronaut details
//                                    Text("Astronaut Details")
                        AstronautView(astronaut: crewMember.astronaut)
                        
                    }label:{
                        HStack{
                            Image(crewMember.astronaut.id)
                                .resizable()
                                .frame(width: 104, height: 72)
                                .clipShape(Capsule())
                                .overlay(
                                    Capsule()
                                        .strokeBorder(.white,lineWidth: 1)
                                )
                            VStack(alignment: .leading){
                                Text(crewMember.astronaut.name)
                                    .foregroundColor(.white)
                                    .font(.headline)
                                Text(crewMember.role)
                                    .foregroundColor(.secondary)
                            }
                        }.padding(.horizontal)
                    }
                }
            }
        }
        
    }
}

struct CrewRosterView_Previews: PreviewProvider {
    static var previews: some View {
        CrewRosterView(crew: [])
    }
}

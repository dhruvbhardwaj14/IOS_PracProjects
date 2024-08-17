//
//  MissionView.swift
//  MoonShot
//
//  Created by Dhruv Bhardwaj on 05/07/22.
//

import SwiftUI

struct MissionView: View {
    //getting our astronauts data displayed
    struct CrewMember {
        let role: String
        let astronaut: Astronaut
    }
    let crew: [CrewMember]
    //getting mission and description displayed
    let mission:Mission
    var body: some View {
        GeometryReader{geometry in
            ScrollView{
                VStack{//center aligned
                    Image(mission.image)
                        .resizable()
                        .scaledToFit()
                        .frame(maxWidth:geometry.size.width * 0.6)//60% screen size
                        .padding(.top)
                    
                    VStack(alignment: .leading){//left to left aligned
                        //                    Divider()//divides the views replaced by a thin rectangle line
                        Rectangle()
                            .frame(height:2)
                            .foregroundColor(.lightBackground)
                            .padding(.vertical)
                        Text("Mission Highlights")
//                        Text("\(mission.displayName)")
                            .font(.title.bold())
                            .padding(.bottom,5)//5 padding of bottom
                        Text(mission.description)
                        Rectangle()
                            .frame(height:2)
                            .foregroundColor(.lightBackground)
                            .padding(.vertical)
                        
                        //heading for crew as it must have same style of mission highlights
                        Text("Crew")
                            .font(.title.bold())
                            .padding(.bottom, 5)
                    }
                    .padding(.horizontal)
                    
                    // to use crew outside
//                    Text("Crew")
//                        .font(.title.bold())
//                        .padding(.bottom, 5)
//                        .padding(.horizontal)
                    
                    //showing astronauts as a Hstack
                    ScrollView(.horizontal,showsIndicators: false){
                        HStack{
                            ForEach(crew,id:\.role){crewMember in
                                NavigationLink{
                                    //astronaut details
//                                    Text("Astronaut Details")
                                    withAnimation{
                                        AstronautView(astronaut: crewMember.astronaut)
                                    }
                                    
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
                .padding(.bottom)
            }.navigationTitle(mission.displayName)
                .navigationBarTitleDisplayMode(.inline)
                .background(.darkBackground)
        }
    }
    //getting our astronauts data displayed
    init(mission: Mission, astronauts: [String: Astronaut]) {
        self.mission = mission

        self.crew = mission.crew.map { member in
            if let astronaut = astronauts[member.name] {
                return CrewMember(role: member.role, astronaut: astronaut)
            } else {
                fatalError("Missing \(member.name)")
            }
        }
    }
}

struct MissionView_Previews: PreviewProvider {
    static let missions:[Mission]=Bundle.main.decode("missions.json")
    static let astronauts: [String: Astronaut] = Bundle.main.decode("astronauts.json")
    static var previews: some View {
        MissionView(mission: missions[0],astronauts: astronauts)
            .preferredColorScheme(.dark)//force dark scheme here as well
    }
}

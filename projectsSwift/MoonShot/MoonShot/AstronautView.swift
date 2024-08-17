//
//  AstronautView.swift
//  MoonShot
//
//  Created by Dhruv Bhardwaj on 05/07/22.
//

import SwiftUI

struct AstronautView: View {
    let astronaut: Astronaut

    var body: some View {
        ScrollView {
            VStack {
                Image(astronaut.id)
                    .resizable()
                    .scaledToFit()

                Text(astronaut.description)
                    .padding()
            }
        }
        .background(.darkBackground)
        .navigationTitle(astronaut.name)
        .navigationBarTitleDisplayMode(.inline)
    }
}

struct AstronautView_Previews: PreviewProvider {
    static let astronauts: [String: Astronaut] = Bundle.main.decode("astronauts.json")
    static var previews: some View {
        AstronautView(astronaut: astronauts["armstrong"]!)
        //reading a dictionary key may or may not return a value so add ! to force unwrap the code
            .preferredColorScheme(.dark)
    }
}

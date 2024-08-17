//
//  ContentView.swift
//  MoonShot
//
//  Created by Dhruv Bhardwaj on 03/07/22.
//

import SwiftUI
struct ContentView: View {
    @AppStorage("showingGrid") private var showingGrid = true//to store user preference use Appstorage instead of @state
    //error-generic  parameter 'T' does not confirm-add a type notations to astronauts
    let astronauts:[String:Astronaut]=Bundle.main.decode("astronauts.json")//Bundle-decoder extensions use
    let missions:[Mission]=Bundle.main.decode("missions.json")
        var body: some View {
            NavigationView{
                //since we cannot put any modifier to a if so we will add them to a group
                Group{
                    if showingGrid{
                        GridView(astronauts: astronauts, missions: missions)
                    }
                    else{
                        ListView(astronauts: astronauts, missions: missions)
                    }
                }
                //adding list and grid items
                .toolbar{
                    Button{
                        showingGrid.toggle()
                    }label: {
                        if showingGrid{
                            Label("Show as table",systemImage: "list.dash")//adding image
                        }
                        else{
                            Label("Show as grid",systemImage: "square.grid.2x2")//adding image
                        }
                    }
                }
                .navigationTitle("MoonShot")
                    .background(.darkBackground)
                //the colour of moonshot is either black(lightmode of iphone) or white(dark mode of iphone) so to make moonshot always visible we can say to app to always prefer dark mode as it is always white in dark mode
                    .preferredColorScheme(.dark)//always dark mode for app
            }
        }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .previewInterfaceOrientation(.portrait)
    }
}

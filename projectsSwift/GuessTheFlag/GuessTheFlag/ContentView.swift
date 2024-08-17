//
//  ContentView.swift
//  GuessTheFlag
//
//  Created by Dhruv Bhardwaj on 17/06/22.
//

import SwiftUI
struct FlagImage:View{
    var name:String
    var body:some View{
        Image(name)
            .renderingMode(.original)//original image not button
            .clipShape(Capsule())//capsule shape
            .shadow(radius: 50)
    }
}

struct ContentView: View {
    @State private var showingScore = false
    @State private var restartScore = false
    @State private var countScore = 0
    @State private var countTimes = 0
    @State private var scoreTitle = ""
    @State private var countries = ["Estonia", "France", "Germany", "Ireland", "Italy", "Nigeria", "Poland", "Russia", "Spain", "UK", "US"].shuffled()//will get a randomised array each time
    @State private var correctAnswer = Int.random(in: 0...2)//three flags given
    
    let labels = [
        "Estonia": "Flag with three horizontal stripes of equal size. Top stripe blue, middle stripe black, bottom stripe white",
        "France": "Flag with three vertical stripes of equal size. Left stripe blue, middle stripe white, right stripe red",
        "Germany": "Flag with three horizontal stripes of equal size. Top stripe black, middle stripe red, bottom stripe gold",
        "Ireland": "Flag with three vertical stripes of equal size. Left stripe green, middle stripe white, right stripe orange",
        "Italy": "Flag with three vertical stripes of equal size. Left stripe green, middle stripe white, right stripe red",
        "Nigeria": "Flag with three vertical stripes of equal size. Left stripe green, middle stripe white, right stripe green",
        "Poland": "Flag with two horizontal stripes of equal size. Top stripe white, bottom stripe red",
        "Russia": "Flag with three horizontal stripes of equal size. Top stripe white, middle stripe blue, bottom stripe red",
        "Spain": "Flag with three horizontal stripes. Top thin stripe red, middle thick stripe gold with a crest on the left, bottom thin stripe red",
        "UK": "Flag with overlapping red and white crosses, both straight and diagonally, on a blue background",
        "US": "Flag with red and white stripes of equal size, with white stars on a blue background in the top-left corner"
    ]
    var body: some View {
        //UPGRADING DESIGN-WILL HAVE COMMENT UPGRADED AFTER A COMMENTED TAG
        ZStack{//to add background
//            LinearGradient(colors: [.blue,.black], startPoint: .top, endPoint: .bottom)
            //updated
            RadialGradient(stops: [
                .init(color: Color(red: 0.1, green: 0.2, blue: 0.45), location: 0.3),
                .init(color: Color(red: 0.76, green: 0.15, blue: 0.26), location: 0.3),
            ], center: .top, startRadius: 200, endRadius: 400)
                .ignoresSafeArea()
            //UPDATED-ADDING A TITLE
            VStack {
                Spacer()
                Text("Guess the Flag")
                    .font(.largeTitle.weight(.bold))
                    .foregroundColor(.white)
        VStack (spacing: /*30*/ 15){//flag spacing
        VStack{
            Text("Tap the Flag of")
//                .foregroundColor(.white)
                .foregroundStyle(.secondary)
            //font sizing and styling this
                .font(.subheadline.weight(.heavy))
            Text(countries[correctAnswer])//any random one is answer
//                .foregroundColor(.white)//UPDATED
            //font sizing and styling this
                .font(.largeTitle.weight(.bold))
        }
        ForEach(0..<3) { number in
            Button {
                flagTapped(number)
               // flag was tapped
            }
        label: {
                //editing the flags by giving shape and shadow
                Image(countries[number])
                    .renderingMode(.original)//original image not button
                    .clipShape(Capsule())//capsule shape
                    .shadow(radius: 50)//giving them shadow
                    .accessibilityLabel(labels[countries[number],default: "Unknown Flag"])
//            FlagImage(name: self.countries[number])
            }
        }
    }.frame(maxWidth:.infinity)//UPDATED
                .padding(.vertical,20)
                .background(.thinMaterial)
                .clipShape(RoundedRectangle(cornerRadius: 20))
                Spacer()
                Spacer()
                //UPDATED
                Text((countScore==0) ? "Score:???" : "Score : \(countScore)")
                    .foregroundColor(.white)
                    .font(.title.bold())
                Spacer()
            }
            .padding()
        }
        .alert(scoreTitle, isPresented: $showingScore){
            Button("Continue",action: askQuestion)}
    message: {
                Text("Your score is \(countScore)")
            }
    }
    func restarted(){
        showingScore=true

    }
    func flagTapped(_ number: Int) {
        if number == correctAnswer {
            scoreTitle = "Correct"
            countScore+=1
            countTimes+=1;
        } else {
            scoreTitle = "Wrong that's the flag of \(countries[number])"
        }

        showingScore = true
    }
//to continue and reset the game
    func askQuestion(){
        countries.shuffle()
        correctAnswer=Int.random(in:0...2)
    }
}
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

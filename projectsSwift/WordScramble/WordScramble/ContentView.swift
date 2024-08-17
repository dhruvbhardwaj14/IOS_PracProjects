//
//  ContentView.swift
//  WordScramble
//
//  Created by Dhruv Bhardwaj on 24/06/22.
//

/*
 CHallenges
 1.Disallow answers that are shorter than three letters or are just our start word.
 2.Add a toolbar button that calls startGame(), so users can restart with a new word whenever they want to.
 3.Put a text view somewhere so you can track and show the player’s score for a given root word. How you calculate score is down to you, but something involving number of words and their letter count would be reasonable.
 */
import SwiftUI

struct ContentView: View {
    @State private var usedWords = [String]()
    @State private var rootWord = ""
    @State private var newWord = ""
    @State private var scoreWin = 0
    
    //showing errors for wrong words in our game
    @State private var errorTitle = ""
    @State private var errorMessage = ""
    @State private var showingError = false
    var body: some View {
        NavigationView {
                List {
                    Section {
                        TextField("Enter your word", text: $newWord)
                            .autocapitalization(.none)//no captilisation of first word
                    }

                    Section {
                        ForEach(usedWords, id: \.self) { word in
                            //adding image as length of word near to it
                            HStack {
                                Image(systemName: "\(word.count).circle")
                                Text(word)
                            }
                            .accessibilityElement(children: .ignore)
                            .accessibilityLabel(word)
                            .accessibilityHint("\(word.count) letters")    
                        }
                    }
                    Section{
                        Text("Score : \(scoreWin)")
                            .font(.callout)
                            .foregroundColor(scoreWin==0 ? .red : .blue)
                    }
                    Button((scoreWin==0 ? "Change Word" : "Done"),action: startGame)
                }
                .navigationTitle(rootWord)//gives the root word as title
                .onSubmit(addNewWord)
                .onAppear(perform: startGame)//appear a random 8 letter word on top of navigation view whenever the program starts
            
            //for adding the error part on our screen
                .alert(errorTitle, isPresented: $showingError) {
                    Button("OK", role: .cancel) { }
                } message: {
                    Text(errorMessage)
                }
        }
    }
    func addNewWord() {
        // lowercase and trim the word, to make sure we don't add duplicate words with case differences
        let answer = newWord.lowercased().trimmingCharacters(in: .whitespacesAndNewlines)

        // exit if the remaining string is empty
        guard answer.count >= 3 else {
            wordError(title: "Word length too short", message: "Make it aleast 3")
            return }
        guard  !(answer==rootWord) else{
            wordError(title: "Shown word Typed", message: "Make some real efforts")
            return}

        // extra validation required-In Swift, we use the guard statement to transfer program control out of scope when certain conditions are not met.
        guard isOriginal(word: answer) else {
            wordError(title: "Word used already", message: "Be more original")
            return
        }

        guard isPossible(word: answer) else {
            wordError(title: "Word not possible", message: "You can't spell that word from '\(rootWord)'!")
            return
        }

        guard isReal(word: answer) else {
            wordError(title: "Word not recognized", message: "You can't just make them up, you know!")
            return
        }

        //adding animation to the word addition-just a little
        withAnimation{
            usedWords.insert(answer, at: 0)//so it comes at top just like stack
            scoreWin+=1
        }
        newWord = ""
    }
    func startGame() {
        // 1. Find the URL for start.txt in our app bundle
        if let startWordsURL = Bundle.main.url(forResource: "start", withExtension: "txt") {
            // 2. Load start.txt into a string
            if let startWords = try? String(contentsOf: startWordsURL) {
                // 3. Split the string up into an array of strings, splitting on line breaks
                let allWords = startWords.components(separatedBy: "\n")

                // 4. Pick one random word, or use "silkworm" as a sensible default
                rootWord = allWords.randomElement() ?? "silkworm"

                // If we are here everything has worked, so we can exit
                return
            }
        }

        // If were are *here* then there was a problem – trigger a crash and report the error
        fatalError("Could not load start.txt from bundle.")
    }
    
    //to check if word is inside our list of words in start.txt
    func isOriginal(word: String) -> Bool {
        !usedWords.contains(word)//if it contains the used word then isoriginal should not be valid so just send false of contain
    }
    //to find and check whether a random word can be made out of the letters from another random word?
    func isPossible(word: String) -> Bool {
        var tempWord = rootWord

        for letter in word {
            if let pos = tempWord.firstIndex(of: letter) {
                tempWord.remove(at: pos)
            } else {
                return false
            }
        }

        return true
    }
    // to use UITextChecker from UIKit. In order to bridge Swift strings to Objective-C strings safely, we need to create an instance of NSRange using the UTF-16 count of our Swift string.
    func isReal(word: String) -> Bool {
        let checker = UITextChecker()
        let range = NSRange(location: 0, length: word.utf16.count)
        let misspelledRange = checker.rangeOfMisspelledWord(in: word, range: range, startingAt: 0, wrap: false, language: "en")

        return misspelledRange.location == NSNotFound//if word was fine then NSNotFound runs
    }
    func wordError(title: String, message: String) {
        errorTitle = title
        errorMessage = message
        showingError = true
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

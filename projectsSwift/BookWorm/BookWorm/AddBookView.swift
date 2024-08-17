//
//  AddBookView.swift
//  BookWorm
//
//  Created by Dhruv Bhardwaj on 23/07/22.
//

import SwiftUI

struct AddBookView: View {
    @Environment(\.managedObjectContext) var moc
    @Environment(\.dismiss) var dismiss
    @State private var title = ""
    @State private var author = ""
    @State private var rating = 3
    @State private var genre = ""
    @State private var review = ""
    @State private var date=Date.now
    
    let genres = ["Fantasy", "Horror", "Kids", "Mystery", "Poetry", "Romance", "Thriller","None"]
    var body: some View {
        NavigationView {
            Form {
                Section {
                    TextField("Name of book", text: $title)
                    TextField("Author's name", text: $author)

                    Picker("Genre", selection: $genre) {
                        ForEach(genres, id: \.self) {
                            Text($0)
                        }
                    }
                    Text("Date:\(date.formatted(date:.abbreviated,time: .shortened))")
                }

                Section {
                    TextEditor(text: $review)
                    RatingView(rating: $rating)
                    }header: {
                    Text("Write a review")
                }

                Section {
                    Button("Save") {
                        let newBook = Book(context: moc)
                        newBook.id = UUID()
                        newBook.title = title
                        newBook.author = author
                        newBook.rating = Int16(rating)
                        newBook.genre = genre
                        newBook.review = review
                        newBook.date = Date.now

                        try? moc.save()
                        dismiss()
                    }
                }
                .disabled(title.isEmpty || author.isEmpty || genre.isEmpty || review.isEmpty)
            }
            .navigationTitle("Add Book")
            .toolbar{
                ToolbarItem(placement: .navigationBarTrailing){
                    Button("Cancel"){
                        dismiss()
                    }
                }
            }
        }
    }
}

struct AddBookView_Previews: PreviewProvider {
    static var previews: some View {
        AddBookView()
    }
}

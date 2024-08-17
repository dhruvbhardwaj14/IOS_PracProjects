//
//  ContentView.swift
//  BookWorm
//
//  Created by Dhruv Bhardwaj on 21/07/22.
//

import SwiftUI
struct ContentView: View {
    @Environment(\.managedObjectContext) var moc
    //for sorting the books-using two sortdescriptor sorts data with first property then by author
    @FetchRequest(sortDescriptors: [
        SortDescriptor(\.title),
        SortDescriptor(\.author)
    ]) var books: FetchedResults<Book>

    @State private var showingAddScreen = false
    
    func deleteBooks(at offsets: IndexSet) {
        for offset in offsets {
            // find this book in our fetch request
            let book = books[offset]

            // delete it from the context
            moc.delete(book)
        }

        // save the context-comment this line to not delete when the app runs again for that session
        try? moc.save()
    }
    
    var body: some View {
        NavigationView {
            List{
                ForEach(books){ book in
                    NavigationLink{
                       DetailView(book: book)
                    }label: {
                        HStack{
                            EmojiRatingView(rating: book.rating)
                                .font(.largeTitle)
                            VStack(alignment: .leading){
                                Text(book.title ?? "Unknown Title")
                                    .font(.headline)
                                    .foregroundColor((book.rating==1) ? .red : .primary)
                                Text(book.author ?? "Unknown Author")
                                    .foregroundColor(.secondary)
                            }
                        }
                    }
                }
                .onDelete(perform: deleteBooks)
            }
           .navigationTitle("Bookworm")
           .toolbar {
               ToolbarItem(placement: .navigationBarLeading) {
                   EditButton()
               }
               ToolbarItem(placement: .navigationBarTrailing) {
                   Button {
                       showingAddScreen.toggle()
                   } label: {
                       Label("Add Book", systemImage: "plus")
                   }
               }
           }
           .sheet(isPresented: $showingAddScreen) {
               AddBookView()
           }
       }
    }
    }

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

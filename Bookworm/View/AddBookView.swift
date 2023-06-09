//
//  AddBookView.swift
//  Bookworm
//
//  Created by Seika Hirori on 6/4/23.
//

import SwiftUI

struct AddBookView: View {
    // Sheet properties
    @Environment(\.dismiss) var dismiss
    
    // Storing managed object context
    @Environment(\.managedObjectContext) var moc
    
    // Book data
    @State private var title: String = ""
    @State private var author: String = ""
    @State private var rating: Int = 3
    @State private var genre: String = "Fantasy"
//    @State private var genre: String = ""
    @State private var review: String = ""
    
    // Choices
    let genres: [String] = ["Fantasy", "Horror", "Kids", "Mystery", "Poetry", "Romance", "Thriller"]

    var isThereEmptyField: Bool {
        if title.isEmpty || author.isEmpty {
            return true
        }
        
        return false
    }
    
    var body: some View {
        return VStack {
            NavigationStack {
                Form {
                    Section {
                        TextField("Name of book", text: $title)
                        TextField("Author's name", text: $author)
                        
                        Picker("Genre", selection: $genre) {
                            ForEach(genres, id:\.self) {
                                Text($0)
                            }
                        }
                    }
                    
                    Section {
                        TextEditor(text: $review)
                        
                        RatingView(rating: $rating)
                    } header: {
                        Text("Write a review")
                    }
                    
                    Section {
                        Button("Save") {
                            // add the book
                            saveNewBook()
                            resetFields()
                            dismiss()
                        }
                    }
                    .disabled(isThereEmptyField == true)
                }
                .navigationTitle("Add Book")
            }
            
            
        }
//        .onAppear(perform: resetFields)
        
        
        
    }
    
    func saveNewBook() -> Void {
        let newBook: Book = Book(context: moc)
        
        newBook.id = UUID()
        newBook.title = title
        newBook.author = author
        newBook.rating = Int16(rating)
        newBook.genre = genre
        newBook.review = review
        newBook.date = Date.now
        
        try? moc.save()
    }

//    func clearFields() -> Void {
//        title = ""
//        author = ""
//        rating = 3
//        genre = ""
//        review = ""
//    }
    
    func resetFields() -> Void {
        title = ""
        author = ""
        rating = 3
        genre = genres[0]
        review = ""
    }
}

struct AddBookView_Previews: PreviewProvider {
    static var dataController: DataController = DataController()
    
    static var previews: some View {
        AddBookView()
            .environment(\.managedObjectContext, dataController.container.viewContext)
    }
}

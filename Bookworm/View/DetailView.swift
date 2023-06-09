//
//  DetailView.swift
//  Bookworm
//
//  Created by Seika Hirori on 6/8/23.
//

import CoreData
import SwiftUI

struct DetailView: View {
    @Environment(\.managedObjectContext) var moc
    @Environment(\.dismiss) var dismiss
    @State private var showingDeleteAlert: Bool = false
    
    let book: Book
    
    var body: some View {
        return ScrollView {
            ZStack(alignment: .bottomTrailing) {
                Image(book.genre?.uppercased() ?? "Fantasy")
                    .resizable()
                    .scaledToFit()
                
                Text(book.genre?.uppercased() ?? "FANTASY")
                    .font(.caption)
                    .fontWeight(.black)
                    .padding(8)
                    .foregroundColor(.white)
                    .background(.black.opacity(0.75))
                    .clipShape(Capsule())
                    .offset(x: -5, y: -5)
            }
            
            Text(book.author ?? "Unknown author")
                .font(.title)
                .foregroundColor(.secondary)
            
            Text(book.review ?? "No review")
                .padding()
            
            RatingView(rating: .constant(Int(book.rating)))
                .font(.largeTitle)
            
            Text("Date: \(book.date?.formatted(.dateTime.month().day().year()) ?? "N/A")")
                .padding()
        }
        .navigationTitle(book.title ?? "Unknown Book")
        .navigationBarTitleDisplayMode(.inline)
        .alert("Delete book", isPresented: $showingDeleteAlert) {
            Button("Delete", role: .destructive, action: deleteBook)
            Button("Cancel", role: .cancel) { }
        } message: {
            Text("Are you sure?")
        }
        .toolbar {
            Button {
                showingDeleteAlert = true
            } label: {
                Label("Delete this book", systemImage: "trash")
            }
        }
        
    // END OF BODY

    }
    

    // METHODS
    func deleteBook() -> Void {
        moc.delete(book)
        
        // // Uncomment if I want to PEREMENTANELY delete the deleted values
        // try? moc.save()
        
        dismiss()
    }
}

struct DetailView_Previews: PreviewProvider {

    // RFER #3
    static var dataController = DataController()
    static var moc = dataController.container.viewContext
    
    static var previews: some View {
        let fillBook = Book(context: moc)
        fillBook.title = "Test book"
        fillBook.author = "Test author"
        fillBook.genre = "Fantasy"
        fillBook.rating = 4
        fillBook.review = "This was a great book; I really enjoyed it."
        fillBook.date = Date.now
        
        let emptyBook = Book(context: moc)
        emptyBook.title = ""
        emptyBook.author = ""
        emptyBook.genre = ""
        emptyBook.rating = 3
        emptyBook.review = ""
        

        return NavigationView {
//            // Empty Test
//            DetailView(book: emptyBook)
            
            // Filled out Test
            DetailView(book: fillBook)
        }
    }
}

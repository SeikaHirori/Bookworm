//
//  ContentView.swift
//  Bookworm
//
//  Created by Seika Hirori on 6/2/23.
//

import SwiftUI

struct ContentView: View {
    @Environment(\.managedObjectContext) var moc
    @FetchRequest(sortDescriptors: [
        SortDescriptor(\.title),
        SortDescriptor(\.author)
    ]) var books: FetchedResults<Book>
    
    // Sheet management
    @State private var isAddingBookOn: Bool = false
    
    var body: some View {
        return NavigationStack {
            VStack {
//                Text("Count: \(books.count)")
//                    .navigationTitle("Bookworm")
                
                List {
                    ForEach(books) { book in
                        NavigationLink {
//                            Text(book.title ?? "Unknown Title")
                            DetailView(book: book)
                        } label: {
                            HStack {
                                EmojiRatingView(rating: book.rating)
                                    .font(.largeTitle)
                                
                                VStack(alignment: .leading) {
                                    Text(book.title ?? "Unknown Title")
                                        .font(.headline)
                                    
                                    Text(book.author ?? "Unknown Author")
                                        .foregroundColor(.secondary)
                                }
                            }
                        }
                    }
                    .onDelete(perform: deleteBooks)
                }
                .navigationTitle("Bookworm")

                
            }
            .padding()
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button {
                        isAddingBookOn.toggle()
                        print("Pressed sheet 'AddBookView'")
                    } label: {
                        Label("Add Book", systemImage: "plus")
                    }
                    .sheet(isPresented: $isAddingBookOn) {
                        AddBookView()
                    }
                }
                
                ToolbarItem(placement: .navigationBarLeading) {
                    EditButton()
                }
            }
        }
    }
    
    func deleteBooks(at offsets: IndexSet) {
        for offset in offsets {
            // find this book in our fetch request
            let book = books[offset]
            
            // delete it from the context
            moc.delete(book)
        }
        
        // save the context
        try? moc.save()
    }
    
}

struct ContentView_Previews: PreviewProvider {
    // RFER #1
    static var dataController: DataController = DataController()
    
    static var previews: some View {
        ContentView()
            .environment(\.managedObjectContext, dataController.container.viewContext)
    }
}

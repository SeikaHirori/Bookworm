//
//  FilteredList.swift
//  Bookworm
//
//  Created by Seika Hirori on 6/8/23.
//

import SwiftUI
import CoreData

struct FilteredList: View {
    @Environment(\.managedObjectContext) var moc
    @FetchRequest(sortDescriptors: []) var books: FetchedResults<Book>
    
    // Searchable Stuff
    let criteria:String = "title BEGINSWITH %@"
    
    // Sheet management
    @State private var isAddingBookOn: Bool = false

    // Search Terms
    @State private var searchTerm: String = ""
    
    // EditMode
    @State private var editMode:EditMode = EditMode.inactive // RFER #6
    
    init(filter: String) {
        if !filter.isEmpty {
            _books = FetchRequest<Book>(sortDescriptors: [],
                                        predicate: NSPredicate(format: criteria, filter))
        } else {
            _books = FetchRequest<Book>(sortDescriptors: [])
        }
    }
    
    var body: some View {
        return NavigationStack {
            VStack {
                List {
                    ForEach(books) { book in
                        NavigationLink {
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
                    .onDelete{ indexSet in
                        deleteBooks(at: indexSet)
                        resetEditMode()
                    }
                }
                .navigationTitle("Bookworm")
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
                            .disabled(books.isEmpty)
                            
                    }
                }
                .environment(\.editMode, $editMode) // RFER #6

                
            }
            
            .searchable(text: $searchTerm, placement: .automatic, prompt: "Search book title")
            
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
    
    // RFER #6
    func resetEditMode() -> Void {
        if books.isEmpty {
            editMode = EditMode.inactive
            print("Switching to EditMode.inactive")
        }
    }

}

struct FilteredList_Previews: PreviewProvider {
    static var dataController: DataController = DataController()


    static var previews: some View {
        var searchWord:String = ""
        
        FilteredList(filter: searchWord)
            .environment(\.managedObjectContext, dataController.container.viewContext)

    }
}

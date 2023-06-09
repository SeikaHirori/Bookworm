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
                    .onDelete(perform: deleteBooks)
                }
                .navigationTitle("Bookworm")
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

struct FilteredList_Previews: PreviewProvider {
    static var dataController: DataController = DataController()


    static var previews: some View {
        var searchWord:String = ""
        
        FilteredList(filter: searchWord)
            .environment(\.managedObjectContext, dataController.container.viewContext)

    }
}

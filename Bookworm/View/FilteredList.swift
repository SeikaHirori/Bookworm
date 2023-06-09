//
//  FilteredList.swift
//  Bookworm
//
//  Created by Seika Hirori on 6/8/23.
//

import SwiftUI

struct FilteredList: View {
    @Environment(\.managedObjectContext) var moc
    @FetchRequest(sortDescriptors: []) var books: FetchedResults<Book>
    @State var searchTerm: String = ""

    
    var body: some View {
        return NavigationStack {
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
}

struct FilteredList_Previews: PreviewProvider {
    static var dataController: DataController = DataController()

    static var previews: some View {
        FilteredList()
            .environment(\.managedObjectContext, dataController.container.viewContext)

    }
}

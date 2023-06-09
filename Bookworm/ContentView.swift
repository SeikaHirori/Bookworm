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
    
    // Searchable
    // RFER #4
    @State private var searchTerm:String = ""
    
    var body: some View {
        return NavigationStack {
            VStack {
                if books.isEmpty { Text("empty book list :'[")
                } else {
                    FilteredList(filter: searchTerm)
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
        }
        .searchable(text: $searchTerm, placement: .automatic, prompt: "Search book title")

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

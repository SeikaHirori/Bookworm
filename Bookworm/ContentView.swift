//
//  ContentView.swift
//  Bookworm
//
//  Created by Seika Hirori on 6/2/23.
//

import SwiftUI

struct ContentView: View {
    @Environment(\.managedObjectContext) var moc
    @FetchRequest(sortDescriptors: []) var books: FetchedResults<Book>
    
    // Sheet management
    @State private var isAddingBookOn: Bool = false
    
    var body: some View {
        return NavigationStack {
            VStack {
                Text("Count: \(books.count)")
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
            }
        }
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

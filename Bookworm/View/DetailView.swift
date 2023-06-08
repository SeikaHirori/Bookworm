//
//  DetailView.swift
//  Bookworm
//
//  Created by Seika Hirori on 6/8/23.
//

import CoreData
import SwiftUI

struct DetailView: View {
    let book: Book
    
    var body: some View {
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
    }
}

struct DetailView_Previews: PreviewProvider {

    // RFER #3
    static var dataController = DataController()
    static var moc = dataController.container.viewContext
    
    static var previews: some View {
        let book = Book(context: moc)
        book.title = "Test book"
        book.author = "Test author"
        book.genre = "Fantasy"
        book.rating = 4
        book.review = "This was a great book; I really enjoyed it."

        return NavigationView {
            DetailView(book: book)
        }
    }
}

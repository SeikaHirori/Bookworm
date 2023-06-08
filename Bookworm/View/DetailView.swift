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
    static let moc = NSManagedObjectContext(concurrencyType: .mainQueueConcurrencyType)
    
    static var previews: some View {
        let book: Book = Book(context: moc)
        book.title = "Test book :O"
        book.author = "Test author :D"
        book.genre = "Fantasy"
        book.rating = 4
        book.review = "This was a great book; I really loved it."
        
        return NavigationStack  {
            DetailView(book: book)
        }
    }
}

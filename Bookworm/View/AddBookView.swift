//
//  AddBookView.swift
//  Bookworm
//
//  Created by Seika Hirori on 6/4/23.
//

import SwiftUI

struct AddBookView: View {
    // Storing managed object context
    @Environment(\.managedObjectContext) var moc
    
    // Book data
    @State private var title: String = ""
    @State private var author: String = ""
    @State private var rating: Int = 3
    @State private var genre: String = ""
    @State private var review: String = ""

    
    var body: some View {
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
    }
}

struct AddBookView_Previews: PreviewProvider {
    static var dataController: DataController = DataController()
    
    static var previews: some View {
        AddBookView()
            .environment(\.managedObjectContext, dataController.container.viewContext)
    }
}

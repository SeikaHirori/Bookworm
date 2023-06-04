//
//  AddBookView.swift
//  Bookworm
//
//  Created by Seika Hirori on 6/4/23.
//

import SwiftUI

struct AddBookView: View {
    @Environment(\.managedObjectContext) var moc
    
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

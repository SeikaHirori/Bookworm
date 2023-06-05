//
//  RatingView.swift
//  Bookworm
//
//  Created by Seika Hirori on 6/5/23.
//

import SwiftUI

struct RatingView: View {
    var body: some View {
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
    }
}

struct RatingView_Previews: PreviewProvider {
    // RFER #1
    static var dataController: DataController = DataController()
    
    
    static var previews: some View {
        RatingView()
            .environment(\.managedObjectContext, dataController.container.viewContext)
    }
}

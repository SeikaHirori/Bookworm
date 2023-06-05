//
//  RatingView.swift
//  Bookworm
//
//  Created by Seika Hirori on 6/5/23.
//

import SwiftUI

struct RatingView: View {
    @Binding var rating: Int
    
    var maximumRating: Int = 5
    var minimumRating: Int = 1 // Personal touch
    
    var offImage: Image?
    var onImage: Image = Image(systemName: "star.fill")
    
    var offColor: Color = Color.gray
    var onColor: Color = Color.yellow
    
    var body: some View {
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
    }
}

struct RatingView_Previews: PreviewProvider {
    // RFER #1
    static var dataController: DataController = DataController()
    
    
    static var previews: some View {
        
        RatingView(rating: .constant(4))
            .environment(\.managedObjectContext, dataController.container.viewContext)
    }
}

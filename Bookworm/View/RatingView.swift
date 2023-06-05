//
//  RatingView.swift
//  Bookworm
//
//  Created by Seika Hirori on 6/5/23.
//

import SwiftUI

struct RatingView: View {
    @Binding var rating: Int
    
    var label = ""
    
    var maximumRating: Int = 5
    var minimumRating: Int = 1 // Personal touch
    
    var offImage: Image?
    var onImage: Image = Image(systemName: "star.fill")
    
    var offColor: Color = Color.gray
    var onColor: Color = Color.yellow
    
    var body: some View {
        return HStack {
            if label.isEmpty == false {
                Text(label)
            }

            ForEach(minimumRating..<maximumRating + 1, id: \.self) { number in
                image(for: number)
                    .foregroundColor(number > rating ? offColor : onColor)
                    .onTapGesture {
                        rating = number
                    }
            }

        }
    }
    
    func image(for number: Int) -> Image {
        if number > rating {
            return offImage ?? onImage
        } else {
            return onImage
        }
    }
}

struct RatingView_Previews: PreviewProvider {
    // RFER #1
    static var dataController: DataController = DataController()
    
    
    static var previews: some View {
        
        // RFER #2
        RatingView(rating: .constant(4))
            .environment(\.managedObjectContext, dataController.container.viewContext)
    }
}

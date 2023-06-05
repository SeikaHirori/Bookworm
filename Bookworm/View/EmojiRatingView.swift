//
//  EmojiRatingView.swift
//  Bookworm
//
//  Created by Seika Hirori on 6/5/23.
//

import SwiftUI

struct EmojiRatingView: View {
    let rating: Int16
    
    var body: some View {
        return HStack {
            switch rating {
            case 1:
                Text("1")
            case 2:
                Text("2")
            case 3:
                Text("3")
            case 4:
                Text("4")
            default:
                Text("5")
            }
        }

    }
}

struct EmojiRatingView_Previews: PreviewProvider {
    static var dataController: DataController = DataController()

    
    static var previews: some View {
        EmojiRatingView(rating: 3)
            .environment(\.managedObjectContext, dataController.container.viewContext)

    }
}

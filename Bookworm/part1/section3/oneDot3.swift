//
//  oneDot3.swift
//  Bookworm
//
//  Created by Seika Hirori on 6/4/23.
//

import SwiftUI

struct oneDot3: View {
    @AppStorage("notes") private var notes: String = ""
    
    var body: some View {
        return VStack {
            NavigationStack {
                TextEditor(text: $notes)
                    .navigationTitle("Notes")
                    .padding()
            }
        }
        
    }
}

struct oneDot3_Previews: PreviewProvider {
    static var previews: some View {
        oneDot3()
    }
}

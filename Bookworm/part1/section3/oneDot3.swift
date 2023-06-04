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
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
    }
}

struct oneDot3_Previews: PreviewProvider {
    static var previews: some View {
        oneDot3()
    }
}

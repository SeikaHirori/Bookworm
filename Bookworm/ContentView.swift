//
//  ContentView.swift
//  Bookworm
//
//  Created by Seika Hirori on 6/2/23.
//

import SwiftUI

struct ContentView: View {
    @FetchRequest(sortDescriptors: []) var students: FetchedResults<Student>
    
    var body: some View {
        return VStack {
            Text("Hello meep :333")
        }
        .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    // RFER #1
    static var dataController: DataController = DataController()
    
    static var previews: some View {
        ContentView()
            .environment(\.managedObjectContext, dataController.container.viewContext)
    }
}

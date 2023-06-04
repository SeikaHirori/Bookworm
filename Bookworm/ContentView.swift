//
//  ContentView.swift
//  Bookworm
//
//  Created by Seika Hirori on 6/2/23.
//

import SwiftUI

struct ContentView: View {
    @FetchRequest(sortDescriptors: []) var students: FetchedResults<Student>
    @Environment(\.managedObjectContext) var moc
    
    var body: some View {
        return VStack {
            if students.isEmpty {
                Text("empty :'[")
            } else {
                List(students) { student in
                    Text(student.name ?? "Unknown")
                }
            }
            
            Button("Add") {
                addRandomPresetNames()
            }

        }
        .padding()
    }
    
    func addRandomPresetNames() -> Void {
        let firstNames: [String] = ["Ginny", "Harry", "Hermione", "Luna", "Ron"]
        let lastNames: [String] = ["Granger", "Lovegood", "Potter", "Weasley"]
        
        let chosenFirstName = firstNames.randomElement() ?? "meep :D"
        let chosenLastName = lastNames.randomElement() ?? "beep :'["
        
        let student = Student(context: moc)
        student.id = UUID()
        student.name = "\(chosenFirstName) \(chosenLastName)"
        
        try? moc.save()
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

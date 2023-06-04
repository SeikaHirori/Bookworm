//
//  oneDot2.swift
//  Bookworm
//
//  Created by Seika Hirori on 6/3/23.
//

import SwiftUI

struct oneDot2: View {
    @State private var rememberMe: Bool = false
    
    var body: some View {
        return VStack {
            PushButton(title: "test", isOn: rememberMe)
            Text(rememberMe ? "On" : "Off")
        }
        .padding()
        
        
    }
}

struct oneDot2_Previews: PreviewProvider {
    static var previews: some View {
        oneDot2()
    }
}

struct PushButton: View {
    let title: String
    @State var isOn: Bool
    
    var onColors: [Color] = [Color.red, Color.yellow]
    var offColors: [Color] = [Color(white: 0.6), Color(white: 0.4)]
    
    var body: some View {
        Button(title) {
            
        }
        .padding()
        .background(LinearGradient(gradient: Gradient(colors: isOn ? onColors: offColors), startPoint: .top, endPoint: .bottom))
        .foregroundColor(.white)
        .clipShape(Capsule())
        .shadow(radius: isOn ? 0 : 5)
        
    }
}

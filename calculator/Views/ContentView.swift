//
//  ContentView.swift
//  calculator
//
//  Created by Aman Negi on 08/09/22.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        ZStack{
            LinearGradient(colors: [.teal, .mint, .cyan.opacity(0.9), .blue], startPoint: .top, endPoint: .bottom)
                .ignoresSafeArea()
            KeyView()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

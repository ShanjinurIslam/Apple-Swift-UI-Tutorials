//
//  ContentView.swift
//  Landmarks
//
//  Created by Shanjinur Islam on 7/16/20.
//  Copyright © 2020 Shanjinur Islam. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        
        VStack {
            MapView().frame(height:300)
            CircleImage().offset(y:-130).padding(.bottom,-130)
            VStack(alignment:.leading) {
                Text("Turtle rock").font(.title).foregroundColor(.green)
                HStack() {
                    Text("Joshua Tree National Park").font(.subheadline)
                    Spacer()
                    Text("California")
                }
            }.padding()
            Spacer()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

//
//  ContentView.swift
//  GuessTheFlag
//
//  Created by Badran on 20/06/2022.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        
        AngularGradient(gradient: Gradient(colors: [.red, .yellow, .green, .blue, .purple, .red]), center: .center)
        
//        RadialGradient(gradient: Gradient(colors: [.blue, .black]), center: .center, startRadius: 20, endRadius: 200)
        
//        LinearGradient(gradient: Gradient(stops: [
//                .init(color: .white, location: 0.45),
//                .init(color: .black, location: 0.55),
//            ]), startPoint: .top, endPoint: .bottom)
        
//        LinearGradient(gradient: Gradient(stops: [
//                Gradient.Stop(color: .white, location: 0.45),
//                Gradient.Stop(color: .black, location: 0.55),
//            ]), startPoint: .top, endPoint: .bottom)
        
//        LinearGradient(gradient: Gradient(colors: [.white, .black]), startPoint: .top, endPoint: .bottom)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

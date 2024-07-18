//
//  ContentView.swift
//  Cocktails
//
//  Created by David Dunne on 19/08/2021.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        CocktailTabView()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView().preferredColorScheme(/*@START_MENU_TOKEN@*/.dark/*@END_MENU_TOKEN@*/)
    }
}

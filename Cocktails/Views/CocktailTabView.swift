//
//  CocktailTabView.swift
//  Cocktails
//
//  Created by David Dunne on 21/08/2021.
//

import SwiftUI

struct CocktailTabView: View {

    var body: some View {
        TabView {
            CocktailExplore()
                .tabItem {
                    Label("Explore", systemImage: "magnifyingglass")
                }
            CocktailAdd()
                .tabItem{
                    Label("Your Drinks", systemImage: "cube.fill")
                }
            SettingsView()
                .tabItem {
                    Label("Settings", systemImage: "gearshape.fill")
                }
        }
    }
    
    
//    var body: some View {
//        TabView {
//            CocktailList()
//                .tabItem {
//                    Label("Search", systemImage: "magnifyingglass")
//                }
//            CocktailRandomView()
//                .tabItem {
//                    Label("Random", systemImage: "cube.fill")
//                }
//            SettingsView()
//                .tabItem {
//                    Label("Settings", systemImage: "gearshape.fill")
//                }
//        }
//    }
}

struct CocktailTabView_Previews: PreviewProvider {
    static var previews: some View {
        CocktailTabView()
    }
}

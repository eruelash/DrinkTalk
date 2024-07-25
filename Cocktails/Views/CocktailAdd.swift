//
//  CocktailAdd.swift
//  Cocktails
//
//  Created by Kaela Fabian on 7/10/24.
//  Origin - CocktailRandomView
//

import SwiftUI
struct CocktailAdd: View {
    @State private var cocktail: Cocktail?
    
    var body: some View {
        VStack {
            if cocktail == nil {
                Button(action: {
                    getRandomCocktails()
                }){ Text("Generate Cocktail").padding() }
            }
            else {
                CocktailDetail(fromCocktail: cocktail)
                Button(action: {
                    cocktail = nil
                }){ Text("Reset").padding() }
            }
        }
    }
    
    func getRandomCocktails() {
        requestRandomCocktail() { cocktails in
            self.cocktail = cocktails[0]
        }
    }
    
    init() {
        self.cocktail = nil
    }
}

struct CocktailAddView_Previews: PreviewProvider {
    static var previews: some View {
        CocktailAdd()
    }
}

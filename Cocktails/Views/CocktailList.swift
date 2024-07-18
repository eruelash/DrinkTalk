//
//  CocktailList.swift
//  Cocktails
//
//  Created by David Dunne on 20/08/2021.
//

import SwiftUI

struct CocktailList: View {
    @State private var cocktails: [Cocktail]
    @State private var searchText = ""
    
    var body: some View {
        VStack {
            NavigationView {
                VStack {
                    TextField("Search", text: $searchText, onCommit:  {
                        getCocktails(searchTerm: searchText)
                    })
                    .padding(7)
                    .padding(.horizontal, 25)
                    .background(Color(.systemGray6))
                    .cornerRadius(8)
                    .overlay(
                        HStack {
                            Image(systemName: "magnifyingglass")
                                .foregroundColor(.gray)
                                .frame(minWidth: 0, maxWidth: .infinity, alignment: .leading)
                                .padding(.leading, 8)
                        }
                    )
                    .padding(.horizontal, 10)
                    List(cocktails, id: \.idDrink) { cocktail in
                        NavigationLink(destination: CocktailDetail(fromCocktail: cocktail)) {
                            CocktailRow(fromCocktail: cocktail)
                        }
                    }
                }
                .navigationTitle("Search")
            }
        }
    }
    
    func getCocktails(searchTerm: String) {
        requestCocktailByName(searchTerm: searchTerm) { cocktails in
            self.cocktails = cocktails
        }
    }
    
    init() {
        self.cocktails = []
    }
}

struct CocktailList_Previews: PreviewProvider {
    static var previews: some View {
        CocktailList()
    }
}

//
//  CocktailDetail.swift
//  Cocktails
//
//  Created by David Dunne on 20/08/2021.
// TESTING THIS IS KAELA TYPING

import SwURL
import SwiftUI

struct CocktailDetail: View {
    var cocktail: Cocktail
    
    init(fromCocktail: Cocktail?) {
        if fromCocktail != nil {
            cocktail = fromCocktail!
        }
        else {
            let cocktails: [Cocktail] = load("cocktailData.json")
            cocktail = cocktails[0]
        }
        SwURL.setImageCache(type: .persistent)
    }
    
    var body: some View {
        ScrollView {
            
            //VStack for Title
            VStack(alignment: .leading) {
                Text(cocktail.strDrink)
                    .font(.system(.largeTitle, design: .serif)) //Anna -> font style -> try rounded, serif, default, monospaced
                    .bold()
                HStack {
                    Spacer()
                    RemoteImageView(url: URL(string: cocktail.strDrinkThumb)!, placeholderImage: Image(systemName: "photo"), transition: .custom(transition: .opacity, animation: .easeIn(duration: 0.25)))
                        .imageProcessing({
                            image in
                            return image
                                .resizable()
                                .frame(width: 250, height: 250)
                                .cornerRadius(20) // Anna -> rounds image corners
                        })
                    Spacer()
                }
                
                //VStack for instructions
                VStack (alignment: .leading){
                    
                    Spacer(minLength: 30)
                    Text("Instructions")
                        .font(.system(.title2, design: .serif))
                        .bold()
                        .padding(1)
                    Text(cocktail.strInstructions)
                        .fixedSize(horizontal: false, vertical: true)
                        .font(.system(.body, design: .serif))
                }
                  
                //VStack for ingredients
                VStack (alignment: .leading){
                    Spacer(minLength: 15)
                    Divider()       // Anna -> horizontal divider line
                    Spacer(minLength: 15)
                    Text("Ingredients")
                        .font(.system(.title2, design: .serif))
                        .bold()
                        .padding(1)
                    ForEach(cocktail.ingredientsAndMeasures()) {
                        ingredientInfo in
                        HStack {
                            Text(ingredientInfo.ingredient)
                                .font(.system(.body, design: .serif))
                            Spacer()
                            Text(ingredientInfo.measure)
                                .font(.system(.body, design: .serif))
                                .foregroundColor(Color.gray)
                    
                }
                        
                    }
                }
            }
        }
        .padding()
        .navigationTitle(cocktail.strDrink)
        .navigationBarTitleDisplayMode(.inline)
    }
}

struct CocktailDetail_Previews: PreviewProvider {
    static var previews: some View {
        CocktailDetail(fromCocktail: nil)
    }
}

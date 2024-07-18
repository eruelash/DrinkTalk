//
//  CocktailRow.swift
//  Cocktails
//
//  Created by David Dunne on 19/08/2021.
//

import SwURL
import SwiftUI

struct CocktailRow: View {
    
    init(fromCocktail: Cocktail?) {
        cocktail = fromCocktail!
        SwURL.setImageCache(type: .persistent)
    }
    
    var cocktail: Cocktail
    
    var body: some View {
        HStack {
            RemoteImageView(url: URL(string: cocktail.strDrinkThumb)!, placeholderImage: Image(systemName: "photo"), transition: .custom(transition: .opacity, animation: .easeIn(duration: 0.25)))
                .imageProcessing({
                    image in
                    return image
                        .resizable()
                        .frame(width: 70, height: 70)
                })
            Text(cocktail.strDrink)
            Spacer()
        }
        .frame(minHeight: 70, idealHeight: 70)
    }
}

struct CocktailRow_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            CocktailRow(fromCocktail: nil)
            CocktailRow(fromCocktail: nil)
        }
        .previewLayout(.fixed(width: 300, height: 70))
    }
}

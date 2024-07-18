//
//  CocktailImage.swift
//  Cocktails
//
//  Created by David Dunne on 19/08/2021.
//

import SwiftUI

struct CocktailImage: View {
    var body: some View {
        Image("strawberryDaiquiri")
            .resizable()
            .frame(width: 200.0, height:200.0)
            .cornerRadius(20)   //Anna -> rounds image corners
    }
}

struct CocktailImage_Previews: PreviewProvider {
    static var previews: some View {
        CocktailImage().preferredColorScheme(/*@START_MENU_TOKEN@*/.dark/*@END_MENU_TOKEN@*/)
    }
}

//
//  SettingsView.swift
//  Cocktails
//
//  Created by David Dunne on 21/08/2021.
//

import SwiftUI

struct SettingsView: View {
    var body: some View {
        VStack(alignment: .leading) {
            Text("This app was designed and developed by David Dunne (www.dunnedev.ie)")
            Text("The backend data is obtained from CocktailDB (www.thecocktaildb.com/)")
        }
    }
}

struct SettingsView_Previews: PreviewProvider {
    static var previews: some View {
        SettingsView()
    }
}

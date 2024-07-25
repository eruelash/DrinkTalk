//
//  CocktailExplore.swift
//  Cocktails
//
//  Created by Kaela Fabian on 7/10/24.
// Explore Page - top of page has search bar. Bottome of page has a rec of 3-5
// cocktails for the user. Originated from CocktailList
//

// @State - property changes, SwiftUI automatically re-renders the view to reflect the new state. It is used to manage the state of a view, ensuring that any changes to this state result in an automatic update of the view's UI.

import SwiftUI

struct CocktailExplore: View {
    // cockatils array - holds an array of Cocktail objects that will be displayed in the list.
    @State private var cocktails: [Cocktail]
    // random cocktail array for first list
    @State private var randomCocktails: [Cocktail] = []
    // cocktailVar variable - ? allows var to hold a value of type Cocktail or it can be nil.
    @State private var cocktailVar: Cocktail?
    // searchText variable set to empty string. When the user types into the TextField, searchText gets updated in real-time.
    @State private var searchText = ""
    
    var body: some View {
        // Organizes the search bar and list vertically.
        VStack {
            //  Navigation is used to manage and present a stack-based interface for navigating between different views.
            NavigationView {
                VStack {
                    // When the user types into the TextField, searchText gets updated in real-time. When the user presses the return key, the onCommit closure is executed, calling getCocktails(searchTerm:) with the current value of searchText.
                    TextField("Search", text: $searchText, onCommit:  {
                        getCocktails(searchTerm: searchText)
                    })
                    .padding(7)
                    .padding(.horizontal, 25)
                    .background(Color(.systemGray6))
                    .cornerRadius(8)
                    .font(.system(.subheadline, design: .serif)) // change font
                    .overlay(
                        // a horizontal stack that arranges its children in a horizontal line.
                        // This HStack is used as an overlay for the TextField to add a magnifying glass icon inside the text field.
                        HStack {
                            Image(systemName: "magnifyingglass")
                                .foregroundColor(.blue) // Sets the color of the icon.
                            // minWidth: 0 = The minimum width for the frame is 0.
                            // maxWidth: .infinity = The frame can expand to fill the available horizontal space.
                            // alignment: .leading = Aligns the content (the icon) to the leading edge (left side) of the frame.
                                .frame(minWidth: 0, maxWidth: .infinity, alignment: .leading)
                            // Adds padding of 8 points to the leading (left) edge of the icon.
                                .padding(.leading, 8)
                        }
                    )
                    .padding(.horizontal, 10)
                    
                    // If there is nothing being searched for, display a suggested list of drinks
                    if searchText.isEmpty {
                        Text("You May Like...")
                            .font(.headline)
                            .padding(.top)
                            .padding(.leading, 10)
                        
                        // the prefix() allows for the amount of drinks in list
                        List(randomCocktails.prefix(5), id: \.idDrink) { cocktail in
                            NavigationLink(destination: CocktailDetail(fromCocktail: cocktail)) {
                                CocktailRow(fromCocktail: cocktail)
                            }
                        }
                        .listStyle(PlainListStyle()) // removes the grayish background that seperates list
                    } else {
                        // once something is searched for - it will be the only list displayed
                        // List is used to display a scrollable list of items.
                        List(cocktails, id: \.idDrink) { cocktail in
                            NavigationLink(destination: CocktailDetail(fromCocktail: cocktail)) {
                                CocktailRow(fromCocktail: cocktail)
                            }
                        }
                        .listStyle(PlainListStyle())
                    }
                }
                // sets the title of the navigation bar.
                .navigationTitle("Explore")
                .onAppear(perform: getRandomCocktails)
            }
        }
    }
    
    // Retreives cocktail information for the search bar
    func getCocktails(searchTerm: String) {
        requestCocktailByName(searchTerm: searchTerm) { cocktails in
            self.cocktails = cocktails
        }
    }
    
    //  Generates random cocktail from data
    func getRandomCocktails() {
        // get rid of any cocktail data to ensure a new list each time app refreshes
        self.randomCocktails.removeAll()
        // dispatchGroup - A group of tasks that you monitor as a single unit.
        let dispatchGroup = DispatchGroup()
        // for loop to create 5 random drinks
        for _ in 0..<5 {
            // signals a new task is starting.
            dispatchGroup.enter()
            // calls request random cocktail function, cocktail is the parameter
            requestRandomCocktail { cocktail in
                // let cocktail var equal the first cocktail in the array if exists
                if let cocktail = cocktail.first {
                    // if there is a cocktail, append to randomCocktails array
                    self.randomCocktails.append(cocktail)
                }
                // signals that the task has completed.
                dispatchGroup.leave()
            }
        }
        // the group will wait to execute until all actions are completed
        dispatchGroup.notify(queue: .main) {
            
        }
    }
    
    init() {
        self.cocktails = []
    }
    
    
    struct CocktailExplore_Previews: PreviewProvider {
        static var previews: some View {
            CocktailExplore()
        }
    }
}

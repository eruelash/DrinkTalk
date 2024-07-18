//
//  RequestData.swift
//  Cocktails
//
//  Created by David Dunne on 20/08/2021.
//

import Foundation

func requestRandomCocktail(completionBlock:@escaping ([Cocktail]) -> Void) -> Void {
    print("started >>> requestRandomCocktail()")
    
    let url = URL(string: "https://www.thecocktaildb.com/api/json/v1/1/random.php")

    let task = URLSession.shared.dataTask(with: url!) {(data, response, error) in
        guard let data = data else { return }
        completionBlock(parseCocktails(data: String(data: data, encoding: .utf8)!))
    }

    task.resume()
    print("finished >>> requestRandomCocktail()")
}

func requestCocktailByName(searchTerm: String, completionBlock:@escaping ([Cocktail]) -> Void) -> Void {
    print("started >>> requestCocktailByName()")
    
    let searchTerm = searchTerm.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed)
    
    let url = URL(string: "https://www.thecocktaildb.com/api/json/v1/1/search.php?s=\( searchTerm!)")

    let task = URLSession.shared.dataTask(with: url!) {(data, response, error) in
        guard let data = data else { return }
        completionBlock(parseCocktails(data: String(data: data, encoding: .utf8)!))
    }

    task.resume()
    print("finished >>> requestCocktailByName()")
}

func parseCocktails(data: String) -> [Cocktail] {
    do {
        let dataAsDict = convertStringToDictionary(text: data)
        let drinks = dataAsDict!["drinks"]
        if drinks is NSNull {
            return []
        }
        let json = try JSONSerialization.data(withJSONObject: drinks!)
        let decoder = JSONDecoder()
        decoder.keyDecodingStrategy = .convertFromSnakeCase
        let decodedCountries = try decoder.decode([Cocktail].self, from: json)
        //decodedCountries.forEach{print($0)}
        return decodedCountries
    } catch {
        fatalError("Couldn't parse json response")
    }
}

func convertStringToDictionary(text: String) -> [String:AnyObject]? {
   if let data = text.data(using: .utf8) {
       do {
           let json = try JSONSerialization.jsonObject(with: data, options: .mutableContainers) as? [String:AnyObject]
           return json
       } catch {
           print("Something went wrong")
       }
   }
   return nil
}


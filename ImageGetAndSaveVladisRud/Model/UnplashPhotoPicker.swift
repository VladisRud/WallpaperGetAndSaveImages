//
//  UnplashPhotoPicker.swift
//  ImageGetAndSaveVladisRud
//
//  Created by Влад Руденко on 07.05.2022.
//

import Foundation
import UnsplashPhotoPicker

struct Photo: Codable {
    var links: [String: String]
}

class UserImage: ObservableObject {
    
    let dictOfCategories = ["Space": 1111575,
                            "Animals": 332024,
                            "Plant": 1521781,
                            "Yellow Thinking": 1717137,
                            "Home Decor and Design": 494266
    ]
    
    var urlPhoto: String = ""
    
    init () {
        
    }
    
    func loadImage(category: String) {
        
        let unplashKey = "xwjMhFNd-hpPJV3wbCWOENLblnH0lm18Kpdwqyw6H4Q"
        let url = "https://api.unsplash.com/photos/random/?count=1&collections=\(dictOfCategories[category]!)&topics=people&client_id=\(unplashKey)"
        
        guard let unplashURL = URL(string: url) else {
            fatalError("WTFWTFWTFWTFWTFWTFWTFWTFWTF")
        }
        
        let sessionUnplash = URLSession(configuration: .default)
        
        let taskUnplash = sessionUnplash.dataTask(with: unplashURL) { (data, response, error) in
            guard let data = data else {
                print("URL FUCKED YOU")
                return
            }
            do {
                let json = try JSONDecoder().decode([Photo].self, from: data)
                for photo in json {
                    DispatchQueue.main.async {
                        self.urlPhoto = photo.links["download"]!
                        print(self.urlPhoto)
                    }
                }
            } catch {
                print(error.localizedDescription)
            }
        }
        taskUnplash.resume()
    }
}



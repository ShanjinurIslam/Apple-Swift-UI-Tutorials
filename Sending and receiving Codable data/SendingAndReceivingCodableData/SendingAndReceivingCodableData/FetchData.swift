//
//  FetchData.swift
//  SendingAndReceivingCodableData
//
//  Created by Shanjinur Islam on 7/18/20.
//  Copyright © 2020 Shanjinur Islam. All rights reserved.
//

import SwiftUI

class FetchData:ObservableObject{
    var artistName:String
    @Published var results:[Result] = [Result]()
    
    init(artistName:String) {
        self.artistName = artistName
    }
    
    func loadData(){
        guard let url = URL(string: "https://itunes.apple.com/search?term=\(self.artistName)&entity=song") else {
            print("Invalid URL")
            return
        }
        let request = URLRequest(url: url)
        
        
        URLSession.shared.dataTask(with: request) { data, response, error in
            if let data = data {
                if let decodedResponse = try? JSONDecoder().decode(Response.self, from: data) {
                    // we have good data – go back to the main thread
                    DispatchQueue.main.async {
                        // update our UI
                        self.results = decodedResponse.results
                    }

                    // everything is good, so we can exit
                    return
                }
            }

            // if we're still here it means there was a problem
            print("Fetch failed: \(error?.localizedDescription ?? "Unknown error")")
        }.resume()
    }
}

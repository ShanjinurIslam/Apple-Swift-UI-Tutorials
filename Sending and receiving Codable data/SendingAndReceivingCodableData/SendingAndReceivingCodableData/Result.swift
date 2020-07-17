//
//  Result.swift
//  SendingAndReceivingCodableData
//
//  Created by Shanjinur Islam on 7/18/20.
//  Copyright © 2020 Shanjinur Islam. All rights reserved.
//

struct Response: Codable {
    var results: [Result]
}

struct Result: Codable {
    var trackId: Int
    var trackName: String
    var collectionName: String
    var artworkUrl100:String
}

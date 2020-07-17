//
//  SongDetails.swift
//  SendingAndReceivingCodableData
//
//  Created by Shanjinur Islam on 7/18/20.
//  Copyright © 2020 Shanjinur Islam. All rights reserved.
//

import SwiftUI

struct SongDetails: View {
    var result:Result
    
    var body: some View {
        Text(result.trackName)
    }
}

//
//  ContentView.swift
//  SendingAndReceivingCodableData
//
//  Created by Shanjinur Islam on 7/17/20.
//  Copyright © 2020 Shanjinur Islam. All rights reserved.
//

import SwiftUI
import URLImage

struct ContentView: View {
    @ObservedObject var fetchedData = FetchData(artistName: "")
    @State var username: String = ""
    
    init(){
        UITableView.appearance().separatorStyle = .none
        fetchedData.loadData()
    }
    
    var body: some View {
        NavigationView{
            List{
                TextField("Enter artist name", text: $username){
                    self.fetchedData.artistName = self.username.replacingOccurrences(of: " ", with: "+")
                    self.fetchedData.loadData()
                }
                
                ForEach(fetchedData.results, id: \.trackId) { item in
                    NavigationLink(destination:SongDetails(result: item)){
                        HStack{
                            URLImage(URL(string: item.artworkUrl100)!).clipShape(Circle()).offset(x:-10)
                            VStack(alignment: .leading) {
                                Text(item.trackName)
                                .font(.headline)
                                Text(item.collectionName)
                            }
                            Spacer()
                        }
                    }
                }
            }.navigationBarTitle(Text("Song Database"))
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

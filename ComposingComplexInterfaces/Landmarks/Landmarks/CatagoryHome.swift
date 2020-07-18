//
//  CatagoryHome.swift
//  Landmarks
//
//  Created by Shanjinur Islam on 7/18/20.
//  Copyright © 2020 Apple. All rights reserved.
//

import SwiftUI

struct CatagoryHome: View {
    @State var showingProfile = false
    
    var categories: [String: [Landmark]] {
        Dictionary(
            grouping: landmarkData,
            by: { $0.category.rawValue }
        )
    }
    
    var profileButton: some View {
        Button(action: { self.showingProfile.toggle() }) {
            Image(systemName: "person.crop.circle")
                .imageScale(.large)
                .accessibility(label: Text("User Profile"))
                .padding()
        }
    }
    
    struct FeaturedLandmarks: View {
        var landmarks: [Landmark]
        var body: some View {
            landmarks[0].image.resizable()
        }
    }
    
    var featured: [Landmark] {
        landmarkData.filter { $0.isFeatured }
    }
    
    var body: some View {
        NavigationView{
            List {
                FeaturedLandmarks(landmarks: featured)
                    .scaledToFill()
                    .frame(height: 200)
                    .clipped().listRowInsets(EdgeInsets())
                ForEach(categories.keys.sorted(), id: \.self) { key in
                    CategoryRow(categoryName: key, items: self.categories[key]!)
                }.listRowInsets(EdgeInsets())
            
                NavigationLink(destination: LandmarkList()) {
                    Text("See All")
                }
            }.navigationBarTitle(Text("Featured"))
            .navigationBarItems(trailing: profileButton)
            .sheet(isPresented: $showingProfile) {
                Text("User Profile")
            }
        }
    }
}

struct CatagoryHome_Previews: PreviewProvider {
    static var previews: some View {
        CatagoryHome()
    }
}

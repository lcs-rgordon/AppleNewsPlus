//
//  NewsFeedView.swift
//  AppleNewsPlus
//
//  Created by Russell Gordon on 2023-05-23.
//

import SwiftUI

struct NewsFeedView: View {
    
    // MARK: Stored properties
    let specifiedColumns = [
        GridItem(.adaptive(minimum: 150))
    ]
    
    // MARK: Computed properties
    var body: some View {
        ScrollView {
            
            LazyVGrid(columns: specifiedColumns) {
                NewsItemView(image: "Farming",
                             source: "GlobeAndMail",
                             headline: "Maritime farmers holding breath as record-dry spring wrings region",
                             timePosted: "1h ago")

                NewsItemView(image: "Carroll",
                             source: "Reuters",
                             headline: "E. Jean Carroll seeks $10 millon in damages from Trump over post-verdict statements",
                             timePosted: "1h ago")

                NewsItemView(image: "Sheep",
                             source: "TheGuardian",
                             headline: "New Zealand's ratio of sheep to humans at lowest point in 170 years",
                             timePosted: "1h ago")
            }
        }
    }
}

struct NewsFeedView_Previews: PreviewProvider {
    static var previews: some View {
        NewsFeedView()
            .preferredColorScheme(.dark)
    }
}

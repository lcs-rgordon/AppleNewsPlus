//
//  NewsItemView.swift
//  AppleNewsPlus
//
//  Created by Russell Gordon on 2023-05-23.
//

import SwiftUI

struct NewsItemView: View {
    
    // MARK: Stored properties
    let image: String
    let source: String
    let headline: String
    let timePosted: String
    
    // MARK: Computed properties
    var body: some View {
        VStack(alignment: .leading) {
            
            // Ensure a square image is shown even if original image is not square
            GeometryReader { geo in
                Image(image)
                    .resizable()
                    .scaledToFill()
                    .frame(height: geo.size.width)
                    .position(x: geo.frame(in: .local).midX, y: geo.frame(in: .local).midY)
                    // Why does this work?
                    // SEE: https://stackoverflow.com/a/64996759/5537362
                    // SEE: Page 100 of SwiftUI Views Quick Start
            }
            .clipped()
            .aspectRatio(1.0, contentMode: .fit)
            
            Image(source)
                .resizable()
                .scaledToFit()

            Text(headline)
                .font(.title3)
                .fontWeight(.semibold)
                .padding(.horizontal)
            
            Spacer()
            
            Divider()
            
            HStack {
                Text(timePosted)
                Spacer()
                Image(systemName: "ellipsis")
            }
            .padding([.horizontal, .bottom])
        }
        .background(Color("DarkGrey"))
        .cornerRadius(25.0)
        .padding(5)
    }
}

struct NewsItemView_Previews: PreviewProvider {
    static var previews: some View {
        ScrollView {
            
            let specifiedColumns = [
                GridItem(.adaptive(minimum: 150))
            ]
            
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
        .preferredColorScheme(.dark)
    }
}

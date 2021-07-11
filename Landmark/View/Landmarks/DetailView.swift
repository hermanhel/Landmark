//
//  ContentView.swift
//  Landmark
//
//  Created by Linfeng  He on 2021/6/25.
//

import SwiftUI

struct DetailView: View {
    @EnvironmentObject var modelData: modelData
    var landmark: Landmark
    var landmarkindex: Int{
        modelData.landmarks.firstIndex(where:{ $0.id == landmark.id})!
    }
    var body: some View {
        ScrollView {
            Mapview(coordinate:landmark.locationCoordinates)
                .frame(height:300)
                .ignoresSafeArea(edges: .top)
            CircleImage(image: landmark.image)
                .offset(y:-130)
                .padding(.bottom,-130)
            VStack (alignment: .leading) {
                HStack {
                    Text(landmark.name)
                        .font(.headline)
                        .foregroundColor(/*@START_MENU_TOKEN@*/.blue/*@END_MENU_TOKEN@*/)
                    FavoriteButton(isSet: $modelData.landmarks[landmarkindex].isFavorite)
                }
                HStack {
                    Text(landmark.name)
                    Spacer()
                    Text(landmark.state)
                }
                .font(.subheadline)
                .foregroundColor(.secondary)
                Divider()
                Text("About \(landmark.name)")
                    .font(.title2)
                Text(landmark.description)
                
            }
            .padding()
        }
        .navigationTitle(landmark.name)
        .navigationBarTitleDisplayMode(.inline)
}
}

struct DetailView_Previews: PreviewProvider {
    static let ModelData = modelData()
    static var previews: some View {
        DetailView(landmark: modelData().landmarks[0])
            .environmentObject(ModelData)
    }
}

//
//  Landmarklist.swift
//  Landmark
//
//  Created by Linfeng  He on 2021/6/26.
//

import SwiftUI

struct Landmarklist: View {
    @EnvironmentObject var ModelData: modelData
    @State private var showFilteredlist = true
    
    var filteredLandmarks: [Landmark]  {
        ModelData.landmarks.filter{ landmark in
        (!showFilteredlist || landmark.isFavorite)
        }
    }
    var body: some View {
        NavigationView{
            List{
                Toggle(isOn: $showFilteredlist, label: {
                    Text("Favorite")
                })
                ForEach(filteredLandmarks){landmark in
                    NavigationLink(destination: DetailView(landmark: landmark)){
                    LandmarkRow(landmark: landmark)
                    }
                }
            }
        }
        .navigationTitle("Landmarks")
    }
}

struct Landmarklist_Previews: PreviewProvider {
    static var previews: some View {
        Landmarklist()
            .environmentObject(modelData())
        
//        ForEach(["iPhone SE (2nd generation)", "iPhone XS Max"], id:\.self){ devicename in
//            Landmarklist()
//                .previewDevice(PreviewDevice(rawValue: devicename))
//                .previewDisplayName(devicename)
//        }
    }
}

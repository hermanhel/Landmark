//
//  LandmarkApp.swift
//  Landmark
//
//  Created by Linfeng  He on 2021/6/25.
//

import SwiftUI

@main
struct LandmarkApp: App {
    @StateObject private var ModelData = modelData()
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(ModelData)
        }
    }
}


//
//  ContentView.swift
//  Landmark
//
//  Created by Linfeng  He on 2021/6/25.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        Landmarklist()
}
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .environmentObject(modelData())
    }
}

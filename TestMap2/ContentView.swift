//
//  ContentView.swift
//  TestMap2
//
//  Created by Исмаил Хасбулатов on 29.01.2020.
//  Copyright © 2020 Organization Name. All rights reserved.
//

import MapKit
import SwiftUI

struct ContentView: View {
    
    @State private var centerCoordinate = CLLocationCoordinate2D()
    
    var body: some View {
        VStack {
            ZStack {
                MapView(centerCoordinator: $centerCoordinate)
                .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: 450, alignment: .topLeading)
                Circle()
                    .fill(Color.blue)
                    .opacity(0.3)
                    .frame(width: 32, height: 32)
            }
            Spacer()
            Text("latitude = \(String(centerCoordinate.latitude)) \nlongitude =\(String(centerCoordinate.longitude))")
            Spacer()

        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

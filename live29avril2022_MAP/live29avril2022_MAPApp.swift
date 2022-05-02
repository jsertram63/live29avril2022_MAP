//
//  live29avril2022_MAPApp.swift
//  live29avril2022_MAP
//
//  Created by Lunack on 29/04/2022.
//

import SwiftUI



@main
struct live29avril2022_MAPApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(SitesViewModel())
        }
    }
}

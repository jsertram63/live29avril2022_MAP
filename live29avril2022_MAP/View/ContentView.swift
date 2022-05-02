//
//  ContentView.swift
//  live29avril2022_MAP
//
//  Created by Lunack on 29/04/2022.
//

import SwiftUI
import MapKit

struct ContentView: View {
    @StateObject var location: LocationHelper = LocationHelper(CLLocation(latitude: 48.8588897, longitude: 2.320041))
    
    @EnvironmentObject var SitesVM: SitesViewModel
    
    @State var userTrackingMode: MapUserTrackingMode = .none
    
    var body: some View {
        NavigationView {
            Map(
                coordinateRegion: $location.coordinates,
                interactionModes: .all,
                showsUserLocation: true,
                userTrackingMode: $userTrackingMode,
                annotationItems: SitesVM.Sites,
                annotationContent: { location in
                    MapMarker(coordinate: location.coordinate)
                   }
            )
            .ignoresSafeArea(edges:.bottom)
            .overlay(alignment: .bottomLeading) {
                Button {
                    userTrackingMode = .follow
                } label: {
                    Image(systemName: "smallcircle.filled.circle")
                        .frame(width: 15.0, height: 15.0)
                        .font(.headline)
                        .padding(15.0)
                        .background(.thickMaterial)
                        .clipShape(Circle())
                        .shadow(color: Color.black.opacity(0.5), radius: 5, x: 0, y: 0)
                }
                .padding([.leading, .bottom], 27.0)
            }
            .navigationTitle("Cartes")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .environmentObject(SitesViewModel())
    }
}

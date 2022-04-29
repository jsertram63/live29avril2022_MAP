//
//  ContentView.swift
//  live29avril2022_MAP
//
//  Created by Lunack on 29/04/2022.
//

import SwiftUI
import MapKit

struct ContentView: View {
    
    //  @State var coordinates:MKCoordinateRegion = MKCoordinateRegion(center: CLLocationCoordinate2D(latitude: 42.69853, longitude: 2.895312),span: MKCoordinateSpan(latitudeDelta: 2, longitudeDelta: 2))
    @StateObject var location: LocationHelper = LocationHelper(CLLocation(latitude: 48.8588897, longitude: 2.320041))
    
    @State private var userTrackingMode: MapUserTrackingMode = .none
    
    var body: some View {
        //
        NavigationView{
            
            Map(
                coordinateRegion: $location.coordinates,
                interactionModes: .all,
                showsUserLocation: true,
                userTrackingMode: $userTrackingMode
            )
            .ignoresSafeArea(edges:.bottom)
            .navigationTitle("Cartes")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

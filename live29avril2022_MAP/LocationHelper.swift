//
//  LocationHelper.swift
//  live29avril2022_MAP
//
//  Created by Lunack on 29/04/2022.
//

import Foundation
import SwiftUI
import MapKit


class LocationHelper:NSObject, ObservableObject, CLLocationManagerDelegate {
    
    
    
    
    var manager = CLLocationManager()
    var span: MKCoordinateSpan
    @Published var coordinates:MKCoordinateRegion
    var lastLocation: CLLocation?
    
    
    init(_ location: CLLocation){
        span = MKCoordinateSpan(latitudeDelta: 0.06, longitudeDelta: 0.06)
        coordinates = MKCoordinateRegion(center: location.coordinate,span: span)
        super.init()
        manager.delegate = self
        start()
        
        
    }
    
    func start() {
        manager.requestAlwaysAuthorization()
        manager.startUpdatingLocation()
    }
    
    
    // 3 méthodes à implémenter pour la gestion du gps
    func locationManagerDidChangeAuthorization(_ manager: CLLocationManager) {
        switch manager.authorizationStatus {
        case .authorizedAlways: print("toujours autorisé")
        case .authorizedWhenInUse: print("seulement authorisé quand l'application tourner")
        case .denied: print("je n'autorise pas ")
        case .notDetermined: print("Not Determined")
        case .restricted:print("Vous n'avez pas autorisé l'application à accéder à votre localisation. Allez dans réglages pour activer votre position.")
            @unknown default: break
            
        }
    }
    
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        print(error.localizedDescription)
    }
    
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        print(locations)
        if let lastLocation = locations.last {
            recentrer(newLocation: lastLocation)
        }
        
    }
    
    func recentrer(newLocation : CLLocation){
        lastLocation = newLocation
        coordinates = MKCoordinateRegion(center: newLocation.coordinate,span: span)
    }
    
}

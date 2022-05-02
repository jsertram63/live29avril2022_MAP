//
//  SitesModel.swift
//  live29avril2022_MAP
//
//  Created by Pierric Marye on 02/05/2022.
//

import Foundation
import MapKit

struct SitesModel: Identifiable {
    let id = UUID()
    let name: String
    let latitude: Double
    let longitude: Double
    
    var coordinate: CLLocationCoordinate2D {
        CLLocationCoordinate2D(latitude: latitude, longitude: longitude)
    }
}

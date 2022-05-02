//
//  SitesModelView.swift
//  live29avril2022_MAP
//
//  Created by Pierric Marye on 02/05/2022.
//

import Foundation
import MapKit

class SitesViewModel: ObservableObject {
    @Published var Sites: [SitesModel] = [
        SitesModel(name: "La Tour Eiffel", latitude: 48.8582602, longitude: 2.2944991),
        SitesModel(name: "Arc de Triomphe", latitude: 48.8737791, longitude: 2.2950372),
        SitesModel(name: "Le Louvre", latitude: 48.8611473, longitude: 2.3380277),
        SitesModel(name: "Château de Versailles", latitude: 48.8044252, longitude: 2.1202853),
    ]
}

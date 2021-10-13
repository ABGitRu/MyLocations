//
//  CLLocationValueTransformer.swift
//  MyLocations
//
//  Created by Mac on 28.09.2021.
//

import Foundation
import CoreLocation

@objc(CLLocationValueTransformer)

final class CLLocationValueTransformer: NSSecureUnarchiveFromDataTransformer {
    static let name = NSValueTransformerName(rawValue: String(describing: CLLocationValueTransformer.self))
    override static var allowedTopLevelClasses: [AnyClass] {
        return [CLLocation.self]
    }
    public static func register() {
        let transformer = CLLocationValueTransformer()
        ValueTransformer.setValueTransformer(transformer, forName: name)
    }
}

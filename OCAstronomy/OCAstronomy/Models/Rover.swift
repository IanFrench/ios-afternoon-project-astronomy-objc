//
//  Rover.swift
//  OCAstronomy
//
//  Created by Ian French on 12/2/20.
//

import Foundation

@objc class Rover: NSObject {
    @objc var id: Int
    @objc var name: String
    @objc var landingDate: Date
    @objc var launchDate: Date
    @objc var status: String

    @objc init(id: Int, name: String, landingDate: Date, launchDate: Date, status: String) {
        self.id = id
        self.name = name
        self.landingDate = landingDate
        self.launchDate = launchDate
        self.status = status

    }
}

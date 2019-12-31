//
//  Vehicle.swift
//  reg-info
//
//  Created by George Crisan on 26/12/2019.
//  Copyright © 2019 George Crisan. All rights reserved.
//

import SwiftUI
import Foundation

struct Vehicle: Codable {
    var registrationNumber: String?
    var co2Emissions: Int?
    var engineCapacity: Int?
    var markedForExport: Bool?
    var fuelType: String?
    var motStatus: String?
    var revenueWeight: Int?
    var colour: String?
    var make: String
    var typeApproval: String?
    var yearOfManufacture: Int?
    var taxDueDate: String
    var taxStatus: String
    var dateOfLastV5CIssued: String?
    var motExpiryDate: String?
    var wheelplan: String?
    var monthOfFirstRegistration: String?
}

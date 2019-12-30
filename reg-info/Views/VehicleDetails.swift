//
//  VehicleDetails.swift
//  reg-info
//
//  Created by George Crisan on 29/12/2019.
//  Copyright © 2019 George Crisan. All rights reserved.
//
import Foundation
import SwiftUI

struct VehicleDetails: View {
    
    @State var vehicleDetails: Vehicle
    @EnvironmentObject var showDetails: AppState
    
    var body: some View {
        VStack {
            Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
            Button(action: {
                self.showDetails.showDetails = false;
                print("got vehicle data\(self.vehicleDetails.registrationNumber)")
            }) {
            Text("Done")
            }
        }
        
    }
}

struct VehicleDetails_Previews: PreviewProvider {
    static var previews: some View {
        VehicleDetails(vehicleDetails: Vehicle(registrationNumber:  "blue", co2Emissions: 12, engineCapacity: 12, markedForExport: false, fuelType:  "blue", motStatus:  "blue", revenueWeight: 77, colour:  "blue", make:  "blue", typeApproval:  "blue", yearOfManufacture: 902, taxDueDate:  "blue", taxStatus:  "blue", dateOfLastV5CIssued:  "blue", motExpiryDate:  "blue", wheelplan:  "blue", monthOfFirstRegistration: "blue") ).environmentObject(AppState()) 
    }
}

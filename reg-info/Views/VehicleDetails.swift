//
//  VehicleDetails.swift
//  reg-info
//
//  Created by George Crisan on 29/12/2019.
//  Copyright © 2019 George Crisan. All rights reserved.
//
import Foundation
import SwiftUI

struct BottomLineTextFieldStyle: TextFieldStyle {
    func _body(configuration: TextField<Self._Label>) -> some View {
        VStack() {
            configuration
            Rectangle()
                .frame(height: 0.5, alignment: .bottom)
                .foregroundColor(Color.secondary)
        }
    }
}

struct VehicleDetails: View {
    
    @State var vehicleDetails: Vehicle
    @EnvironmentObject var showDetails: AppState
    let appBlue = UIColor(r: 0, g: 142, b: 207)
    let appYellow = UIColor(r: 255, g: 216, b: 0)
    
    func formatDate(date: String) -> String {

       if(date == "n/a") {
           return "Data unknown"
       }
        
       let months = [01: "Jan",
                     02: "Feb",
                     03: "March",
                     04: "April",
                     05: "May",
                     06: "Jun",
                     07: "July",
                     08: "Aug",
                     09: "Sept",
                     10: "Oct",
                      11: "Nov",
                      12: "Dec"
        ]
    
        let dateNow = date.split(separator: "-")
    
        guard let month = Int(dateNow[1]) else { return "n/a" }
    
        let newDate = "\(dateNow[2]) \(months[month]!) \(dateNow[0]) "
    
        return newDate
    
    }
    
    var body: some View {
        VStack {
            HStack {
                Text("Vehicle Info")
                    .font(.title)
                    .underline()
                      .foregroundColor(.white)
                    .frame(width: 320, height: 60, alignment: .center)
            }
            
            HStack {
                
                Text("RegNr:")
                    .fontWeight(.semibold)
                    .font(.system(size: 14))
                    .foregroundColor(.white)
                    .padding(.leading)
                .frame(width: 116, height: 40, alignment: .leading)
                Divider().background(Color.white)
                Text("\(vehicleDetails.registrationNumber ?? "n/a")")
                      .fontWeight(.semibold)
                    .font(.system(size: 14))
                    .lineLimit(2)
                    .padding()
                    .foregroundColor(Color(appYellow))
                    
                    
            }
            .frame(width: 320, height: 40, alignment: .leading)
            .background(Color.gray)
            .opacity(0.9).cornerRadius(5)
            
            
            
            
            
            HStack {
                Text("Make:")
                    .fontWeight(.semibold)
                    .font(.system(size: 14))
                      .foregroundColor(.white)
                    .padding()
                    .frame(width: 116, height: 40, alignment: .leading)

                    Divider().background(Color.white)
                Text("\(vehicleDetails.make )")
                      .fontWeight(.semibold)
                     .font(.system(size: 14))
                    .lineLimit(2)
                    .padding()
                    .foregroundColor(Color(appYellow))
            }
            .frame(width: 320, height: 40, alignment: .leading)
            .background(Color.gray)
            .opacity(0.9).cornerRadius(5)
            
            
            HStack {
                Text("Colour:")
                    .fontWeight(.semibold)
                    .font(.system(size: 14))
                    .foregroundColor(.white)
                    .padding()
                    .frame(width: 116, height: 40, alignment: .leading)

                Divider().background(Color.white)
                
                Text("\(vehicleDetails.colour ?? "n/a")")
                      .fontWeight(.semibold)
                    .font(.system(size: 14))
                    .lineLimit(2)
                    .padding()
                    .foregroundColor(Color(appYellow))
            }
            .frame(width: 320, height: 40, alignment: .leading)
            .background(Color.gray)
            .opacity(0.9).cornerRadius(5)
            
            HStack {
                Text("MOT Status:")
                    .fontWeight(.semibold)
                    .font(.system(size: 14))
                    .foregroundColor(.white)
                    .padding()
                    .frame(width: 116, height: 40, alignment: .leading)

                    Divider().background(Color.white)
                Text("\(vehicleDetails.motStatus ?? "n/a")")
                      .fontWeight(.semibold)
                    .font(.system(size: 14))
                    .lineLimit(2)
                    .padding()
                    .foregroundColor(Color(appYellow))
            }
            .frame(width: 320, height: 40, alignment: .leading)
            .background(Color.gray)
            .opacity(0.9).cornerRadius(5)
            
            HStack {
                Text("MOT Due:")
                    .fontWeight(.semibold)
                    .font(.system(size: 14))
                      .foregroundColor(.white)
                    .padding()
                    .frame(width: 116, height: 40, alignment: .leading)

                    Divider().background(Color.white)
                Text("\(formatDate(date: vehicleDetails.motExpiryDate ?? "n/a") )")
                      .fontWeight(.semibold)
                    .font(.system(size: 14))
                    .lineLimit(2)
                    .padding()
                    .foregroundColor(Color(appYellow))
            }
            .frame(width: 320, height: 40, alignment: .leading)
            .background(Color.gray)
            .opacity(0.9).cornerRadius(5)
            
            HStack {
                Text("TAX Status:")
                    .fontWeight(.semibold)
                    .font(.system(size: 14))
                      .foregroundColor(.white)
                    .padding()
                    .frame(width: 116, height: 40, alignment: .leading)

                    Divider().background(Color.white)
                Text("\(vehicleDetails.taxStatus )")
                      .fontWeight(.semibold)
                    .font(.system(size: 14))
                    .lineLimit(2)
                    .padding()
                    .foregroundColor(Color(appYellow))
            }
            .frame(width: 320, height: 40, alignment: .leading)
            .background(Color.gray)
            .opacity(0.9).cornerRadius(5)
            
            HStack {
                Text("Tax Due:")
                    .fontWeight(.semibold)
                    .font(.system(size: 14))
                      .foregroundColor(.white)
                    .padding()
                    .frame(width: 116, height: 40, alignment: .leading)

                    Divider().background(Color.white)
                Text("\(formatDate(date: vehicleDetails.taxDueDate) )")
                    .fontWeight(.semibold)
                    .font(.system(size: 14))
                    .lineLimit(2)
                    .padding()
                    .foregroundColor(Color(appYellow))
            }
            .frame(width: 320, height: 40, alignment: .leading)
            .background(Color.gray)
            .opacity(0.9).cornerRadius(5)
            
            
            HStack {
                Text("Some add")
                      .foregroundColor(.white)
                    .frame(width: 320, height: 60, alignment: .center)
            }

            //MARK - Button
            Button(action: {
                self.showDetails.showDetails = false
            }) {
            HStack {
                Text("↜")
                    .font(.system(size: 36))
                Text("Go back")
                    .fontWeight(.semibold)
                    .font(.system(size: 16))
            }
            .frame(width: 260, height: 10, alignment: .center)
            .padding()
            .foregroundColor(Color.white)
            .background(Color(appBlue))
            .cornerRadius(5)
            }
            
            
        }.frame(minWidth: 0, maxWidth: .infinity,
        minHeight: 0, maxHeight: .infinity)
    }
}

struct VehicleDetails_Previews: PreviewProvider {
    static var previews: some View {
        VehicleDetails(vehicleDetails: Vehicle(registrationNumber:  "blue", co2Emissions: 12, engineCapacity: 12, markedForExport: false, fuelType:  "blue", motStatus:  "blue", revenueWeight: 77, colour:  "blue", make:  "blue", typeApproval:  "blue", yearOfManufacture: 902, taxDueDate:  "01-01-2020", taxStatus:  "blue", dateOfLastV5CIssued:  "blue", motExpiryDate:  "01-01-2020", wheelplan:  "blue", monthOfFirstRegistration: "blue") ).environmentObject(AppState())
    }
}

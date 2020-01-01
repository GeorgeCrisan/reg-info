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
    @EnvironmentObject var gState: AppState
    let appBlue = UIColor(r: 0, g: 142, b: 207, a: 0.93)
    let appYellow = UIColor(r: 255, g: 216, b: 0, a: 1)
    let appOrange = UIColor(r: 250, g: 165, b: 0, a: 0.95)
    
    func formatDate(date: String) -> String {

       if(date == "n/a" || date == "Not known") {
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
    
        let dateNow = date.components(separatedBy: "-")
    
        guard let month = Int(dateNow[1]) else { return "n/a" }
    
        let newDate = "\(dateNow[2]) \(months[month]!) \(dateNow[0]) "
    
        return newDate
    
    }
    
    var body: some View {
        VStack {
            //HStack {
            //    Text("Vehicle Info")
            //        .font(.title)
            //        .underline()
            //          .foregroundColor(.white)
            //        .frame(width: 320, height: 60, alignment: .center)
            //}
            
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
                    .foregroundColor(.white)
                    
                    
            }
            .frame(width: 320, height: 40, alignment: .leading)
            .background(Color(appBlue))
            .opacity(0.9).cornerRadius(5).padding(.top, 10)
            
            
            
            
            
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
                    .foregroundColor(.white)
            }
            .frame(width: 320, height: 40, alignment: .leading)
            .background(Color(appBlue))
            .opacity(0.9).cornerRadius(5).padding(.top, 10)
            
            
            
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
                    .foregroundColor(.white)
            }
            .frame(width: 320, height: 40, alignment: .leading)
            .background(Color(appBlue))
            .opacity(0.9).cornerRadius(5).padding(.top, 10)
            
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
                    .foregroundColor(.white)
            }
            .frame(width: 320, height: 40, alignment: .leading)
            .background(Color(vehicleDetails.motStatus == "Valid" ? appBlue : appOrange))
            .opacity(0.9).cornerRadius(5).padding(.top, 10)
            
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
                    .foregroundColor(.white)
            }
            .frame(width: 320, height: 40, alignment: .leading)
            .background(Color(vehicleDetails.motStatus == "Valid" ? appBlue : appOrange))
            .opacity(0.9).cornerRadius(5).padding(.top, 10)
            
            HStack {
                Text("Tax Status:")
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
                    .foregroundColor(.white)
            }
            .frame(width: 320, height: 40, alignment: .leading)
            .background(Color(vehicleDetails.taxStatus == "Taxed" ? appBlue : appOrange))
            .opacity(0.9).cornerRadius(5).padding(.top, 10)
            
            HStack {
                Text("Tax Due:")
                    .fontWeight(.semibold)
                    .font(.system(size: 14))
                      .foregroundColor(.white)
                    .padding()
                    .frame(width: 116, height: 40, alignment: .leading)

                    Divider().background(Color.white)
                Text("\(formatDate(date: vehicleDetails.taxDueDate ?? "Not known") )")
                    .fontWeight(.semibold)
                    .font(.system(size: 14))
                    .lineLimit(2)
                    .padding()
                    .foregroundColor(.white)
            }
            .frame(width: 320, height: 40, alignment: .leading)
            .background(Color(vehicleDetails.taxStatus == "Taxed" ? appBlue : appOrange))
            .opacity(0.9).cornerRadius(5).padding(.top, 10)
            
            
            HStack {
                Text("Some add")
                      .foregroundColor(.white)
                    .frame(width: 320, height: 60, alignment: .center)
            }

            //MARK - Button
            Button(action: {
                self.gState.showDetails = false
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
            .background(Color.blue)
            .cornerRadius(5)
            }
            
            
        }.frame(minWidth: 0, maxWidth: .infinity,
        minHeight: 0, maxHeight: .infinity)
    }
}

struct VehicleDetails_Previews: PreviewProvider {
    static var previews: some View {
        VehicleDetails(vehicleDetails: Vehicle(
            registrationNumber: "EJ11FRO",
            co2Emissions: 0,
            engineCapacity: 50,
            markedForExport: false,
            fuelType: "PETROL",
            motStatus: "No details held by DVLA",
            colour: "WHITE",
            make: "APRILIA",
            typeApproval: "L1",
            yearOfManufacture: 2011,
            taxDueDate: "2012-05-01",
            taxStatus: "Untaxed",
            dateOfLastV5CIssued: "2011-05-20",
            wheelplan: "2 WHEEL",
            monthOfFirstRegistration: "2011-05"
        )).environmentObject(AppState())
 }
}

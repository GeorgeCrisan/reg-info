//
//  ContentView.swift
//  reg-info
//
//  Created by George Crisan on 15/12/2019.
//  Copyright © 2019 George Crisan. All rights reserved.
//

import SwiftUI

extension UIColor {
    convenience init(r: CGFloat, g: CGFloat, b: CGFloat, a: CGFloat ) {
        self.init(red: r/255, green: g/255, blue: b/255, alpha: a)
    }
}

//Indicator Start

struct ActivityIndicator: View {

  @State private var isAnimating: Bool = false

  var body: some View {
    GeometryReader { (geometry: GeometryProxy) in
      ForEach(0..<5) { index in
        Group {
          Circle()
            .frame(width: geometry.size.width / 5, height: geometry.size.height / 5)
            .scaleEffect(!self.isAnimating ? 1 - CGFloat(index) / 5 : 0.2 + CGFloat(index) / 5)
            .offset(y: geometry.size.width / 10 - geometry.size.height / 2)
          }.frame(width: geometry.size.width, height: geometry.size.height)
            .rotationEffect(!self.isAnimating ? .degrees(0) : .degrees(360))
            .animation(Animation
              .timingCurve(0.5, 0.15 + Double(index) / 5, 0.25, 1, duration: 1.5)
              .repeatForever(autoreverses: false))
        }
      }
    .aspectRatio(1, contentMode: .fit)
    .onAppear {
        self.isAnimating = true
    }
  }
}

// Indicator End

struct ContentView: View {
    
    @State private var reg: String = "".uppercased()
    @State private var results = [Vehicle]()
    @State private var errorMsg: String = ""
    @EnvironmentObject var gState: AppState
    
    func toggleShowDetails(into: Bool) {
        self.gState.loading = false;
        self.gState.showDetails = into
        
        
    }
    
    var animation: Animation {
        Animation.default
    }

    
    let appBlue = UIColor(r: 0, g: 142, b: 207, a: 1)
    let appYellow2 = UIColor(r: 255, g: 216, b: 0, a: 0.9)
        
    func fetchJsonData(regNr: String) {
        
        self.gState.loading = true;
        print("loading start")
        
        if (regNr.count == 0) {
            self.gState.loading = false;
            self.errorMsg = "Wrong input, please try again!"
            return
        }
        
          let url = EnvironmentVars.apiURL
          let secret = EnvironmentVars.apiSECRET
          let headerKey = EnvironmentVars.apiKEY
          let session = URLSession.shared
          var request = URLRequest(url: url)
          request.httpMethod = "POST"
          request.setValue("application/json", forHTTPHeaderField: "Content-Type")
          request.setValue(secret, forHTTPHeaderField: headerKey)
          
          let bodyData = [
              "registrationNumber": regNr
          ]
          
          if let jsonData = try? JSONSerialization.data(withJSONObject: bodyData, options: []) {
              session.uploadTask(with: request, from: jsonData) { data, response , error in
                    
                
                if let httpResponse = response as? HTTPURLResponse {
                    if (httpResponse.statusCode != 200) {
                        self.gState.loading = false;
                        self.errorMsg = "Wrong input, please try again!"
                        return
                    } else {
                        self.errorMsg = ""
                    }
                    
                }
                
                  if let data = data {
                    if let decodedResponse = try? JSONDecoder().decode(Vehicle.self, from: data) {
                    
                          DispatchQueue.main.async {
                            self.results = [decodedResponse]
                            self.toggleShowDetails(into: true)
                          }
                      }
                  }
                  return
              }.resume()
          }
      }
    
    public struct CustomTextFieldStyle : TextFieldStyle {
        let appYellow = UIColor(r: 255, g: 216, b: 0, a: 0.8)
           public func _body(configuration: TextField<Self._Label>) -> some View {
               configuration
                .font(.title)
                .padding(14)
                .background(RoundedRectangle(cornerRadius: 5).fill(Color(appYellow))
                    .overlay(RoundedRectangle(cornerRadius: 5).stroke(Color.black, lineWidth: 2))
                )
           }
       }
    
    var body: some View {
        ZStack {
            
            if self.gState.loading == true {
                Image("bgimage")
                VStack {
                    ActivityIndicator().frame(width: 50, height: 50).foregroundColor(Color(appYellow2))
                    Text("Loading ...")
                    .fontWeight(.bold)
                    .multilineTextAlignment(.center)
                    .font(.system(size: 20))
                    .padding()
                    .foregroundColor(Color(appYellow2))
                }
            } else if self.gState.showDetails {
                if self.results.count > 0 {
                    Image("bg399")
                        .resizable()
                        .scaledToFill()
                        .edgesIgnoringSafeArea(.all)
                        .animation(animation)
                        .transition(.move(edge: .top))
                    
                    VehicleDetails(vehicleDetails: self.results[0])
                        .animation(animation)
                        .transition(.move(edge: .top))
                }
            } else {
                Image("bgimage")
                    .resizable()
                    .scaledToFill()
                    .edgesIgnoringSafeArea(.all)
                    .animation(animation)
                    .transition(.move(edge: .bottom))
                   
               
                
                ZStack {
                     VStack {
                        if (self.errorMsg.count  > 0) {
                            HStack(alignment: .center) {
                                Image(systemName: "message")
                                    .padding(.trailing, 10.0)
                                    .font(.title)
                                    
                                Text(self.errorMsg)
                                    .fontWeight(.bold)
                                    .multilineTextAlignment(.center)
                                    .offset(y: 0)
                                    .font(.system(size: 20))
                                    .animation(.easeInOut)
                            
                            }
                            .padding()
                            .frame(width: 250, height: 80, alignment: .center)
                            .foregroundColor(.white)
                            .background(Color.orange)
                            .cornerRadius(5)
                            .offset(y: -16)
                            .animation(animation)
                            .transition(.move(edge: .top))
                        }

                        
                        TextField("Enter Vehicle REG", text: $reg)
                            .foregroundColor(Color.black)
                            .textFieldStyle(CustomTextFieldStyle())
                            .padding()
                            .offset(y: -10)
                            .autocapitalization(UITextAutocapitalizationType.allCharacters)
                            .multilineTextAlignment(.center)
                            .fixedSize()
                        
                   
                     Button(action: {
                            self.fetchJsonData(regNr: self.reg)
                          }) {
                            HStack {
                                Image(systemName: "car")
                                    .font(.title)
                                Text("Get Vehicle Info")
                                    .fontWeight(.semibold)
                                    .font(.system(size: 18))
                            }
                            .frame(width: 210, height: 30, alignment: .center)
                            .padding()
                            .foregroundColor(.white)
                            .background(Color(appBlue))
                            .cornerRadius(5)
                        }
                    }
                        
                    Spacer()
                    VStack {
                        Spacer()
                        HStack {
                            Text("Made with")
                                .fontWeight(.semibold)
                                .foregroundColor(.white)
                                .padding(.top, 30)
                                .accentColor(/*@START_MENU_TOKEN@*/.yellow/*@END_MENU_TOKEN@*/)

                            Image(systemName: "heart")
                                .padding(.top, 34)
                                .foregroundColor(.red)
                                .font(.system(size: 20))
                                
                            
                            Text("by")
                                .fontWeight(.semibold)
                                .foregroundColor(.white)
                                .padding(.top, 30)
                        }
                        .frame(width: 210, height: 50, alignment: .center)
                        
                        
                        HStack {
                            Text("georgecrisan.com")
                            .fontWeight(.semibold)
                            .foregroundColor(.white)
                            .padding(.bottom, 30)
                        }
                    }
                }.frame(minWidth: 0, maxWidth: .infinity,
                minHeight: 0, maxHeight: .infinity)
            }
            
        }
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView().environmentObject(AppState()) 
    }
}

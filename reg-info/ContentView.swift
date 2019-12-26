//
//  ContentView.swift
//  reg-info
//
//  Created by George Crisan on 15/12/2019.
//  Copyright © 2019 George Crisan. All rights reserved.
//

import SwiftUI

extension UIColor {
    convenience init(r: CGFloat, g: CGFloat, b: CGFloat) {
        self.init(red: r/255, green: g/255, blue: b/255, alpha: 1)
    }
}

struct ContentView: View {
    
    @State private var reg: String = "".uppercased();
    
    let appBlue = UIColor(r: 0, g: 142, b: 207)
    
    public func fetchInfo(regNr: String)  {
        print("info fetched \(regNr)")

    }
    
    public struct CustomTextFieldStyle : TextFieldStyle {
            let appYellow = UIColor(r: 255, g: 216, b: 0)
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
            Image("bgimage")
            VStack {
                TextField("Enter Vehicle REG", text: $reg)
                    .foregroundColor(Color.black)
                    .textFieldStyle(CustomTextFieldStyle())
                    .padding()
                    .offset(y: -10)                    .autocapitalization(UITextAutocapitalizationType.allCharacters)
                    .multilineTextAlignment(.center)
                    .fixedSize()
                
                Button(action: {
                    print("Show vehicle Info")
                    self.fetchInfo(regNr: self.reg)
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
        }
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

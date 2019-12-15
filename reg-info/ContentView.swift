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
    
    @State private var reg: String = "";
    
    let appBlue = UIColor(r: 0, g: 142, b: 207)
    
    var body: some View {
        ZStack {
            Image("bgimage")
            VStack {
                TextField("Enter Vehicle REG", text: $reg).foregroundColor(Color(appBlue))
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .padding()
                    .fixedSize()

                Text("\(reg.uppercased())")
                    .font(.custom( "Gill Sans", size: 36))
                    .foregroundColor(Color(appBlue))
            
                
            }
        }
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

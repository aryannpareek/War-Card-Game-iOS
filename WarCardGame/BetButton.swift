//
//  BetButton.swift
//  WarCardGame
//
//  Created by Aryan Pareek on 7/13/20.
//  Copyright © 2020 Aryan Pareek. All rights reserved.
//

import SwiftUI

struct BetButton: View {
    
    @Binding var amount: Int
    
    var body: some View {
        HStack {
            Image("chips").renderingMode(.original).resizable().frame(width: 40.0, height: 40.0)
            Text(String(amount))
                .font(.title)
                .fontWeight(.bold)
                .foregroundColor(Color.red)
        }.padding(.all,10).background(Color.white).cornerRadius(25)
        
    }
}

struct BetButton_Previews: PreviewProvider {
    static var previews: some View {
        BetButton(amount: Binding.constant(0))
    }
}

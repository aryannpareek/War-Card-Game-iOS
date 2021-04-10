//
//  ContentView.swift
//  WarCardGame
//
//  Created by Aryan Pareek on 7/11/20.
//  Copyright © 2020 Aryan Pareek. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    
    @State private var rand1: Int = 0
    @State private var rand2: Int = 0
    @State private var myBalance: Int = 1000
    @State private var cpuBalance: Int = 1000
    
    @State private var bet: Int = 0
    @State private var betAmount1: Int = 10
    @State private var betAmount2: Int = 50
    
    var body: some View {
        ZStack {
            //Image("Background").resizable().edgesIgnoringSafeArea(.all)
            Rectangle().foregroundColor(Color(red: 33/255, green:206/255, blue: 153/255)).edgesIgnoringSafeArea(.all)
            Rectangle().foregroundColor(Color.orange).rotationEffect(Angle(degrees: 45)).edgesIgnoringSafeArea(.all)
            
            VStack {
                Spacer()
                
                Image("logo")
                
                Spacer()
                
                HStack {
                    Image("chips").resizable().frame(width: 50.0, height: 50.0)
                    Text(String(bet))
                        .font(.title)
                        .fontWeight(.bold)
                        .foregroundColor(Color.white)
                }
                
                HStack {
                    Image(String(rand1))
                    Image(String(rand2))
                }
                
                Spacer()
                
                Button(action: {
                    //Randomize cards
                    self.rand1 = Int.random(in: 2...14)
                    self.rand2 = Int.random(in: 2...14)
                    //Update score
                    if self.rand1 > self.rand2 {
                        self.myBalance += self.bet
                        self.cpuBalance -= self.bet
                    }
                    else if self.rand1 < self.rand2 {
                        self.cpuBalance += self.bet
                        self.myBalance -= self.bet
                    }
                    self.bet = 0
                }) {
                    Image("dealbutton").renderingMode(.original).padding(.all,10).background(Color(red: 33/255, green:206/255, blue: 153/255)).cornerRadius(25)
                }
                
                Spacer()
                
                VStack {
                    HStack {
                        Text("YOU").padding(.leading)
                        Image("chips").renderingMode(.original).resizable().frame(width: 40.0, height: 40.0)
                        Text(String(myBalance))
                            .font(.title)
                            .fontWeight(.bold)
                        
                        Spacer()
                        
                        Text(String(cpuBalance))
                            .font(.title)
                            .fontWeight(.bold)
                        Image("chips").renderingMode(.original).resizable().frame(width: 40.0, height: 40.0)
                        Text("BOT").padding(.trailing)
                    }.padding(.bottom).foregroundColor(Color.white)
                    
                    HStack {
                        Button(action: {
                            if self.bet > 0 {
                                self.bet -= 10
                            }
                        }) {
                            //)BetButton(amount: $betAmount1)
                            Image(systemName: "minus.circle").renderingMode(.original).scaleEffect(1.75).padding()
                        }
                        
                        Image("chips").renderingMode(.original).resizable().frame(width: 40.0, height: 40.0)
                        
                        Button(action: {
                            self.bet += 10
                        }) {
                            //BetButton(amount: $betAmount2)
                            Image(systemName: "plus.circle").renderingMode(.original).scaleEffect(1.75).padding()
                        }
                    }.padding(.all, 5).background(Color.white).cornerRadius(35)
                }
                
                Spacer()
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            ContentView()
            ContentView()
        }
    }
}

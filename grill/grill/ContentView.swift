//
//  ContentView.swift
//  grill
//
//  Created by rutik maraskolhe on 07/07/21.
//

import SwiftUI

struct ContentView: View {
    
    @State private var leftVaporizes = false
    @State private var middleVaporizes = false
    @State private var rightVaporizes = false
    @State private var sausageDrops = false
    @State private var sausageFalls = false
    let bg = Color(#colorLiteral(red: 0, green: 0, blue: 0, alpha: 1))
    let sausage = Color(#colorLiteral(red: 0.9997968078, green: 0.3948255777, blue: 0.5153241754, alpha: 1))
    
    var body: some View {
        ZStack {
            bg
                .edgesIgnoringSafeArea(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/)
            
            VStack {
                Text("Grilling Time")
                    .font(.largeTitle)
                    .foregroundColor(Color(#colorLiteral(red: 0.9997968078, green: 0.3948255777, blue: 0.5153241754, alpha: 1)))
                    .offset(y: -300)
                
                Text("Plan Your Next Barbecue")
                    .font(.subheadline)
                    .foregroundColor(Color(#colorLiteral(red: 1, green: 0.7261813283, blue: 0.7231363654, alpha: 1)))
                    .offset(y: -300)
                
                Button(action:{print("Welcome to Stockholm Glilling Center")} ) {
                    Text("GET STARTED")
                        .foregroundColor(Color(#colorLiteral(red: 0.4247963428, green: 0.3888358474, blue: 0.9996649623, alpha: 1)))
                        .offset(y: 350)
                }

            }
                
            HStack(alignment: .bottom)
            {
                Image("vapor_left") // Vapor Left
                    .clipShape(Rectangle().offset(y: leftVaporizes ? 0 : 90))
                    .animation(Animation.timingCurve(0.68, -0.6, 0.32, 1.6).delay(0.1).speed(0.9).repeatForever(autoreverses: false))
                    .onAppear {
                        leftVaporizes.toggle()
                    }
                
                Image("vapor_middle") // Vapor Middle
                    .clipShape(Rectangle().offset(y: middleVaporizes ? 0 : 80))
                    .animation(Animation.timingCurve(0.68, -0.6, 0.32, 1.6).delay(0.2).speed(0.8).repeatForever(autoreverses: false))
                    .onAppear {
                        middleVaporizes.toggle()
                    }
                
                Image("vapor_right") // Vapor Right
                    .clipShape(Rectangle().offset(y: leftVaporizes ? 0 : 45))
                    .animation(Animation.timingCurve(0.68, -0.6, 0.32, 1.6).speed(0.9).repeatForever(autoreverses: false))
                    .onAppear {
                        rightVaporizes.toggle()
                    }
                
            }.blur(radius: 20).blendMode(.saturation).offset(x: 60, y: -65)
          
            Image("barbecue")
                .resizable()
                .aspectRatio(contentMode: .fit)
            
            
            Capsule() // Sausage Drop
                .frame(width: 3, height: 12)
                .opacity(sausageDrops ? 0 : 1)
                .scaleEffect(sausageDrops ? 2 : 1)
                .foregroundColor(sausage)
                .offset(x: 20, y: sausageDrops ? 180 : 20)
                .animation(Animation.easeInOut(duration: 2).delay(2).repeatForever(autoreverses: false))
                .onAppear{
                    sausageDrops.toggle()
                }
            
            Capsule() // Sausage Drop
                .frame(width: 3, height: 8)
                .opacity(sausageFalls ? 0 : 1)
                .scaleEffect(sausageDrops ? 2 : 1)
                .foregroundColor(sausage)
                .offset(x: 80, y: sausageFalls ? 180 : 20)
                .animation(Animation.easeOut(duration: 2).delay(2).repeatForever(autoreverses: false))
                .onAppear{
                    sausageFalls.toggle()
                }
                
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        
        ContentView()
    }
}


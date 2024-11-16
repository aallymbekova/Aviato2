//
//  SettingsScreenView.swift
//  Aviator2
//
//  Created by Aliya Alymbekova on 13/11/24.
//

import SwiftUI

struct SettingsScreenView: View {
    
    @State var show = false
    
    var body: some View {
        ZStack {
            LinearGradient(gradient: Gradient(colors: [Color(#colorLiteral(red: 0.1607843041, green: 0.1607843041, blue: 0.1607843041, alpha: 1)), Color(#colorLiteral(red: 0.1299730837, green: 0.07196713239, blue: 0.07333309203, alpha: 1))]), startPoint: .top, endPoint: .bottom)
                .ignoresSafeArea()
            
            ZStack() {
                Rectangle()
                    .background(.black)
                    .blur(radius: 190)
                    .frame(width: 330, height: 80)
                    .cornerRadius(25)
                
                RoundedRectangle(cornerRadius: 35)
                    .stroke(Color.red, lineWidth: 6)
                    .frame(width:360, height: 100)
                
                HStack() {
                    Text("Vibration")
                        .font(.title)
                        .fontWeight(.heavy)
                        .foregroundColor(.white)
                    
                    Spacer()
                        .frame(width: 100)
                    
                    CustomSwitch(show: $show)
                }
            }
        }
    }
}

struct CustomSwitch: View {
    
    @Binding var show: Bool
    
    var body: some View {
        ZStack(alignment: .trailing) {
            
            if show {
                Capsule().fill(Color(#colorLiteral(red: 0.4959857464, green: 0.09536319226, blue: 0.09187995642, alpha: 1))).frame(width: 83, height: 38)
            } else {
                Capsule().fill(Color(#colorLiteral(red: 0.8627451658, green: 0.8627451658, blue: 0.8627451658, alpha: 1))).frame(width: 83, height: 38)
            }
            
            HStack {
                
                if show {
                    Spacer()
                }
                
                ZStack {
                    Capsule().fill(Color.white).frame(width: 33, height: 33)
                }.onTapGesture {
                    self.show.toggle()
                }
                
                if !show {
                    Spacer()
                }
    
            }.frame(width: 83, height: 38)
        }
    }
}

#Preview {
    SettingsScreenView()
}

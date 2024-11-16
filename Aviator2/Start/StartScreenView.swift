//
//  StartScreenView.swift
//  Aviator2
//
//  Created by Aliya Alymbekova on 13/11/24.
//

import SwiftUI

struct StartScreenView: View {
    var body: some View {
        
        NavigationView {
            ZStack {
                LinearGradient(
                    gradient: Gradient(colors: [
                        Color(#colorLiteral(red: 0.1607843041, green: 0.1607843041, blue: 0.1607843041, alpha: 1)), Color(#colorLiteral(red: 0.1299730837, green: 0.07196713239, blue: 0.07333309203, alpha: 1))
                    ]),
                    startPoint: .top, endPoint: .bottom
                )
                .ignoresSafeArea()
                
                VStack(spacing: 20) {
                    Spacer()
                    Image("aviator")
                    Spacer().frame(height: 20)
                    
                    NavigationButton(title: "Play", destination: ContentView(), color: Color(#colorLiteral(red: 0.551, green: 0.1, blue: 0.1, alpha: 1)))
                    
                    NavigationButton(title: "High score", destination: HighScoreScreenView(), color: LinearGradient(gradient: Gradient(colors: [Color.gray, Color.black]), startPoint: .top, endPoint: .bottom))
                    
                    NavigationButton(title: "Settings", destination: SettingsScreenView(), color: LinearGradient(gradient: Gradient(colors: [Color.gray, Color.black]), startPoint: .top, endPoint: .bottom))
                    
                    Spacer()
                }
            }
        }
    }
}

struct NavigationButton<Destination: View>: View {
    var title: String
    var destination: Destination
    var color: AnyView
    
    var body: some View {
        NavigationLink(destination: destination) {
            Text(title)
                .frame(width: 213, height: 60)
                .font(.headline)
                .foregroundColor(.white)
                .background(color)
                .cornerRadius(30)
        }.navigationTitle("")
            
    }
    
    init(title: String, destination: Destination, color: Color) {
        self.title = title
        self.destination = destination
        self.color = AnyView(color)
    }
    
    init(title: String, destination: Destination, color: LinearGradient) {
        self.title = title
        self.destination = destination
        self.color = AnyView(color)
    }
}


#Preview {
    StartScreenView()
}


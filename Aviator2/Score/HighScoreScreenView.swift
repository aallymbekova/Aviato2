//
//  HighScoreScreenView.swift
//  Aviator2
//
//  Created by Aliya Alymbekova on 13/11/24.
//

import SwiftUI

struct HighScoreScreenView: View {
    var body: some View {
        ZStack {
            LinearGradient(gradient: Gradient(colors: [Color(#colorLiteral(red: 0.1607843041, green: 0.1607843041, blue: 0.1607843041, alpha: 1)), Color(#colorLiteral(red: 0.1299730837, green: 0.07196713239, blue: 0.07333309203, alpha: 1))]), startPoint: .top, endPoint: .bottom)
                .ignoresSafeArea()
            
            ZStack() {
                Rectangle()
                    .background(.black)
                    .blur(radius: 190)
                    .frame(width: 330, height: 130)
                    .cornerRadius(25)
                
                RoundedRectangle(cornerRadius: 35)
                    .stroke(Color.red, lineWidth: 6)
                    .frame(width:360, height: 160)
                
                VStack(alignment: .leading, spacing: 25) {
                    Text("4x4")
                        .font(.title)
                        .fontWeight(.heavy)
                        .foregroundColor(.white)
                    
                    HStack(spacing: 45) {
                        ResultText(title: "Moves")
                        ResultText(title: "0")
                        ResultText(title: "Time")
                        ResultText(title: "0")
                    }
                }
            }
        }
    }
}

struct ResultText: View {
    
    let title: String
    
    var body: some View {
        Text(title)
            .foregroundColor(.white)
    }
}

#Preview {
    HighScoreScreenView()
}

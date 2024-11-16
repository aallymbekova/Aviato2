//
//  SplashScreenView.swift
//  Aviator2
//
//  Created by Aliya Alymbekova on 13/11/24.
//

import SwiftUI

struct SplashScreenView: View {
    @State private var isActive = false
    @State private var showingView = false
    @State private var size = 0.8
    @State private var opacity = 0.5
    
    var body: some View {
        
        ZStack {
            LinearGradient(gradient: Gradient(colors: [Color(#colorLiteral(red: 0.1607843041, green: 0.1607843041, blue: 0.1607843041, alpha: 1)), Color(#colorLiteral(red: 0.1299730837, green: 0.07196713239, blue: 0.07333309203, alpha: 1))]), startPoint: .top, endPoint: .bottom)
                .ignoresSafeArea()
            VStack {
                VStack {
                  SplashContentView(size: size, opacity: opacity)
                }
                .onAppear {
                    animateSplashScreen()
                }
                if isActive {
                    Button(action: {
                        self.showingView.toggle()
                    }, label: {
                        Text("Start")
                            .font(.headline)
                            .foregroundColor(.white)
                            .frame(height: 60)
                            .frame(width: 213)
                            .background(Color(#colorLiteral(red: 0.5514189601, green: 0.1001009569, blue: 0.1004977301, alpha: 1)))
                            .cornerRadius(30)
                    })
                    .fullScreenCover(isPresented: $showingView) {
                        StartScreenView()
                    }
                }
            }
            
            .onAppear {
                animateSplashScreen()
            }
        }
    }
    
    
    private func animateSplashScreen() {
        withAnimation(.easeIn(duration: 1.2)) {
            self.size = 0.9
            self.opacity = 1.0
        }
        DispatchQueue.main.asyncAfter(deadline: .now() + 3.0) {
            withAnimation {
                self.isActive = true
            }
        }
    }
}

struct SplashContentView: View {
    var size: CGFloat
       var opacity: Double
       
       var body: some View {
           VStack {
               Image("vint")
               Spacer().frame(height: 30)
               Image("aviator")
           }
           .scaleEffect(size)
           .opacity(opacity)
       }
}


#Preview {
    SplashScreenView()
}

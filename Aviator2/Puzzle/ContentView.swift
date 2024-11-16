//
//  ContentView.swift
//  Aviator2
//
//  Created by Aliya Alymbekova on 7/11/24.
//

import SwiftUI

struct ContentView: View {
    
    @State var startDate = Date.now
    @State var timeElapsed: Int = 0
    @State var timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
    @State var moves: Int = 0
    
    @ObservedObject var puzzleViewModel = PuzzleViewModel()
    
    var body: some View {
        ZStack {
            LinearGradient(gradient: Gradient(colors: [Color(#colorLiteral(red: 0.1607843041, green: 0.1607843041, blue: 0.1607843041, alpha: 1)), Color(#colorLiteral(red: 0.1299730837, green: 0.07196713239, blue: 0.07333309203, alpha: 1))]), startPoint: .top, endPoint: .bottom)
                .ignoresSafeArea()
            VStack() {
                
                HStack(spacing: 20) {
                    ZStack {
                        Text("Moves:   \(moves) 🃏")
                            .frame(width: 171, height: 47)
                            .foregroundColor(.white)
                            .cornerRadius(27)
                        
                        RoundedRectangle(cornerRadius: 35)
                            .stroke(Color.red, lineWidth: 3)
                            .frame(width: 171, height: 47)
                    }
                    
                    ZStack {
                        
                        Text("Times:   \(timeElapsed) ⏱️")
                            .onReceive(timer) { firedDate in
                                timeElapsed = Int(firedDate.timeIntervalSince(startDate))
                            }
                            .frame(width: 171, height: 47)
                            .foregroundColor(.white)
                            .cornerRadius(27)
                        
                        RoundedRectangle(cornerRadius: 35)
                            .stroke(Color.red, lineWidth: 3)
                            .frame(width: 171, height: 47)
                    }
                }.padding()
                
                ZStack {
                    
                    RoundedRectangle(cornerRadius: 35)
                        .stroke(Color.red, lineWidth: 6)
                        .frame(maxWidth: 370, maxHeight: 400)
                    
                    LazyVGrid(columns: [GridItem(.fixed(80)), GridItem(.fixed(80)), GridItem(.fixed(80)), GridItem(.fixed(80))]) {
                        ForEach(puzzleViewModel.puzzles) { puzzle in
                            CardView(number: puzzle.number, id: puzzle.id)
                                .onTapGesture {
                                    withAnimation {
                                        puzzleViewModel.choose(chosedPuzzle: puzzle)
                                        moves += 1
                                    }
                                }
                        }
                    }
                }
                
                HStack {
                    
                    ZStack {
                        Image("redGlossyPlane")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 100, height: 100)
                            .cornerRadius(35)
                            .padding()
                        
                        RoundedRectangle(cornerRadius: 35)
                            .stroke(Color.red, lineWidth: 3)
                            .frame(width: 110, height: 110)
                    }
                    
                    newGameButton
                    stopGameButton
                    
                }
            }
        }
    }
    
    var newGameButton: some View {
        Button {
            withAnimation {
                puzzleViewModel.newGame()
                startDate = Date.now
                timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
            }
        } label: {
            Text("New Game")
        }.buttonStyle(GameButtonStyle())
    }
    
    var stopGameButton: some View {
        Button("Stop") {
            timer.upstream.connect().cancel()
        }.buttonStyle(GameButtonStyle())
    }
    
}

struct GameButtonStyle: ButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
            configuration.label
                .font(.headline)
                .fontWeight(.heavy)
                .foregroundColor(.white)
                .frame(width: 100, height: 40)
                .background(
                    LinearGradient(gradient: Gradient(colors: [Color.gray, Color.black]),
                                   startPoint: .top,
                                   endPoint: .bottom)
                )
                .cornerRadius(30)
        }
}

struct CardView: View {
    
    var number: String
    var id: Int
    
    var body: some View {
        
        ZStack {
            if (id != 0) {
                Rectangle()
                    .stroke(lineWidth: 3)
                    .padding()
                Image(number)
            }
        }
    }
}


#Preview {
    ContentView()
}

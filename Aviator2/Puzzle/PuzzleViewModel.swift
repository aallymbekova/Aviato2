//
//  PuzzleViewModel.swift
//  Aviator2
//
//  Created by Aliya Alymbekova on 11/11/24.
//

import Foundation

class PuzzleViewModel: ObservableObject {
    
    static var numbers = [ "0" ,"1", "2", "3", "4", "5", "6", "7", "8", "9", "10", "11", "12", "13", "14", "15", "16"]
    
    static  private var imagesRedPlane = ["FirstGlossy","SecondGlossy", "ThirdGlossy", "FourthGlossy", "FifthGlossy","SixthGlossy","SeventhGlossy","EighthGlossy","NinthGlossy","TenthGlossy","EleventhGlossy","TwelfthGlossy","ThirteenthGlossy","ForteenthGlossy","FifteenthGlossy","FourthGlossy","SixteenthGlossy"]
    
    @Published var puzzleModel: PuzzleModel
    
    init() {
        puzzleModel = PuzzleViewModel.setPuzzle()
    }
    
    static func setPuzzle() -> PuzzleModel {
        return PuzzleModel(puzzlesNumber: 16) { index in
//            PuzzleViewModel.numbers[index]
            PuzzleViewModel.imagesRedPlane[index]
        }
    }
    
    var puzzles: Array<PuzzleModel.Puzzle> {
        puzzleModel.puzzles
    }
    
    func newGame() {
        puzzleModel = PuzzleViewModel.setPuzzle()
    }
    
    func choose(chosedPuzzle: PuzzleModel.Puzzle) {
        puzzleModel.choose(chosedPuzzle: chosedPuzzle)
    }
}

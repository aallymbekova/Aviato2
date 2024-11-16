//
//  PuzzleModel.swift
//  Aviator2
//
//  Created by Aliya Alymbekova on 11/11/24.
//

import Foundation

struct PuzzleModel {
    var puzzles: Array<Puzzle>
    
    init(puzzlesNumber: Int, setNumber: (Int) -> String) {
        self.puzzles = Array<Puzzle>()
        
        for index in 0..<puzzlesNumber {
            let number = setNumber(index)
            puzzles.append(Puzzle(number: number, id: index))
        }
        puzzles.shuffle()
        puzzleChosePlace()
    }
    
   mutating func choose(chosedPuzzle: Puzzle) {
        if let someIndex = isInPlace(id: 0) {
            if let chosedPuzzle = isInPlace(id: chosedPuzzle.id) {
                puzzles.swapAt(someIndex, chosedPuzzle)
                puzzleChosePlace()
            }
        }
        
    }
    
    mutating func puzzleChosePlace() {
        for index in puzzles.indices {
            puzzles[index].isInPlace = puzzles[index].id == index + 1 ? true : false 
        }
    }
    
    func isInPlace(id: Int) -> Int? {
        for index in puzzles.indices {
            if puzzles[index].id == id {
                return index
            }
        }
        return nil
    }
    
    struct Puzzle: Identifiable {
        let number: String
        let id: Int
        var isInPlace: Bool = false
    }
}


//
//  Pieces.swift
//  RobertMakesChess
//
//  Created by Robert Fusting on 9/20/26.
//

import Foundation

protocol GamePiece {
    func generateMovePath(currentPosition: (Int, Int), board: Board) -> [(Int,Int)]
    var color : String {get}
    var type: PieceType {get}
    var sightLine: [(Int,Int)] {get set}
    var position: (Int,Int) {get set}
}

struct Rook : GamePiece {
    let color : String
    let type : PieceType = .rook
    var sightLine: [(Int,Int)] = []
    var position: (Int,Int)
    
     func generateMovePath(currentPosition: (Int,Int), board: Board) -> [(Int,Int)] {
        var returnList = [(Int,Int)]()
        
        // this mostly works. The problem here though is we wont return the collision coordinate
        
        //check upwards
        var tmpUp = currentPosition.0 + 1
        while tmpUp < 8 {
            if board.tiles[tmpUp][currentPosition.1].piece != nil {
                returnList.append((tmpUp, currentPosition.1))
                break
            }
            returnList.append((tmpUp, currentPosition.1))
            tmpUp+=1
        }
        
        //check downwards
        var tmpDown = currentPosition.0 - 1
        while tmpDown > -1 {
            if board.tiles[tmpDown][currentPosition.1].piece != nil {
                returnList.append((tmpDown, currentPosition.1))
                break
            }
            returnList.append((currentPosition.0 - 1, currentPosition.1))
            tmpDown-=1
        }
        
        // check lefet
        var tmpLeft = currentPosition.1 - 1
        while tmpLeft > -1 {
            if board.tiles[currentPosition.0][tmpLeft].piece != nil {
                returnList.append((currentPosition.0, tmpLeft))
                break
            }
            returnList.append((currentPosition.0, tmpLeft))
            tmpLeft-=1
        }
        
        // check right
        var tmpRight = currentPosition.1 + 1
        while tmpRight < 8 {
            if board.tiles[currentPosition.0][tmpRight].piece != nil {
                returnList.append((currentPosition.0, tmpRight))
                break
            }
            returnList.append((currentPosition.0, tmpRight))
            tmpRight+=1
        }
        
        return returnList
    }
    
    
    
}

// I think every piece should have a sightline func, where they

enum PieceType {
    case rook 
}





//
//  BoardBrain.swift
//  RobertMakesChess
//
//  Created by Robert Fusting on 9/20/26.
//

import Foundation

class BoardBrain {
    var board = Board().tiles
    
    //on click of a piece a user can click on anywhere on the board and it will either work or not
    // furthermore if a piece occupies that space if it is the opposing color we initatite a capute
    // if it is an inavlid move or the same color we ignore the action and keep it open
    // also invalid if the player moving the piece tries to move a piece that is not their own color
    
    // so the signature of this function will be -> it needs the active player, the piece being moved, the current piece location, and the desired location
    
    func processMove(activePlayer: Player, selectedPiece : GamePiece, currentTile: BoardTile, desiredTile: BoardTile) {
        if canMovePiece(activePlayer: activePlayer, selectedPiece: selectedPiece, currentTile: currentTile, desiredTile: desiredTile) {
            // we can move the piece
            
            // now we need to update the board state to reflect the move
            
            // we now trigger an event -> standardMove, captureMove, check, checkmate, stalemate
            
            // we always know the new position is now valid, which means we need to update the board
            
            let capturedPiece = desiredTile.piece
            
            board[desiredTile.coord.0][desiredTile.coord.1] = BoardTile(color: desiredTile.color, piece: selectedPiece, coord: desiredTile.coord)
            
         
            
            
        }
    }
        

    
    func canMovePiece(activePlayer: Player, selectedPiece : GamePiece, currentTile: BoardTile, desiredTile: BoardTile) -> Bool{
        
        // cant move the opponents pieces
        if selectedPiece.color != activePlayer.color {
            return false
        }
        
        if desiredTile.piece?.color == activePlayer.color {
            return false
        }
        
        var proposedPath = [(Int,Int)]()
        // gather are proposed path
        func generateMovePath(selectedPiece: GamePiece, currentTile: BoardTile) -> [(Int,Int)] {
            var returnList = [(Int,Int)]()
            
            switch selectedPiece.type {
            case .rook:
                returnList = selectedPiece.generateMovePath(currentPosition: currentTile.coord, board: Board(tiles: board))
            }
            
            return returnList
        }
        
        // we have a proposed path,
        // what is left to examine
        
        //we dont need to overcomplcate this func, at the end of the day its just if desiredTile is valid
        //we need to trim proposed path
        // all we actually need to do is examine desiredTile
        
        proposedPath = generateMovePath(selectedPiece: selectedPiece, currentTile: currentTile)
        proposedPath = proposedPath.filter{$0 == desiredTile.coord}
        
        if proposedPath.isEmpty {
            return false
        }
        
        // now we just need to check if this exposes the king
        func doesExposeKing(activePlayer: Player, selectedPiece : GamePiece, currentTile: BoardTile, desiredTile: BoardTile) -> Bool {
            
            // thinking through some cases
            
            // rook sees king but is blocked by a bishop
            // path we returned from rook doesnt include king becuase it stops at the bishop
            
            // so a piece should probably hold its attack path
            // and a piece should hold its block path
            
            // then lets say we go to move the bishop
            // then we update the rook attack path and if the king is now in the attack path we return false
            
            // the one thing that kinda sucks is do we have to make attack paths on board construction?
            // come to think of it we probably do and should because then its cheap to update
            
            // there should maybe also be a dedicated check structure
            
            //anytime  a piece moves it needs to enovke all pieces that it is blocking to recalculate their attack path
            
            // it actually might even make sense for pices not to hold their sightPath or also have an external store
            
            return false
        }
        
        return true
    }
        
        
        func setupBoard() {
            for row in 0..<8 {
                for col in 0..<8 {
                    let color = row + col % 2 == 0 ? "White" : "Black"
                }
            }
        }
    }
    
    struct BoardTile {
        let color : String
        let piece : GamePiece?
        let coord: (Int, Int)
    }
    
    struct Board {
        let rows : Int = 8
        let columns : Int = 8
        var tiles : [[BoardTile]] = []
    }
    
    


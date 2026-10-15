//
//  BoardBrain.swift
//  RobertMakesChess
//
//  Created by Robert Fusting on 9/20/26.
//

import Foundation

class BoardBrain {
    var board = Board().tiles
    
    
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
        
        // cant move to a tile that has one of your pieces on it
        if desiredTile.piece?.color == activePlayer.color {
            return false
        }
            
        var path = selectedPiece.generateMovePath(currentPosition: currentTile.coord, board: Board(tiles: board))
        
        // check if this move would put us in check
        
        
       
        
        return true
    }
    
    func WouldPutInCheck(activePlayer: Player, selectedPiece : GamePiece, currentTile: BoardTile, desiredTile: BoardTile, path: (Int,Int)) -> Bool {
        
        var allPaths = [(Int,Int)]()
        
        // temp move the piece to the new location and see if the king is in check
        
        // run generateMovePath for all of the opponents pieces and see if any of them can attack the king
        // run generate path for every opponent pice and youll get a list of coords
        // filter those cords to see if any match the kings position
        
        // what info am i missing that blocks this logic
        // well we need a way to iterate all of the pieces on the board
        // one way to do that is just go through the board determistically and check each tile for a piece if its the opponents the color run a generate path
        
        // temp move the piece
        board[desiredTile.coord.0][desiredTile.coord.1] = BoardTile(color: desiredTile.color, piece: selectedPiece, coord: desiredTile.coord)
        
        // piece is in new location all we gotta do is run every path
        
        for row in 0..<8 {
            for col in 0..<8{
                if let piece = board[row][col].piece {
                    if piece.color != activePlayer.color {
                        opponentPath = piece.generateMovePath(currentPosition: (row,col), board: Board(tiles: board))
                    }
                }
            }
        }
        
        return false
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
    
    


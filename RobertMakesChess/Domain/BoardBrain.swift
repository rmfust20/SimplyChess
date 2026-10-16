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
            //probably wanna process a capture but not needed for MVP
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
        
        if wouldPutInCheck(activePlayer: activePlayer, selectedPiece: selectedPiece, currentTile: currentTile, desiredTile: desiredTile, path: (desiredTile.coord.0, desiredTile.coord.1)) {
            return false
        }
        
        return true
    }
    
    func wouldPutInCheck(activePlayer: Player, selectedPiece : GamePiece, currentTile: BoardTile, desiredTile: BoardTile, path: (Int,Int)) -> Bool {
        
        //first find the king of the active plyer
        
        var kingPosition = (0,0)
        
        for row in 0..<8 {
            for col in 0..<8 {
                if let piece = board[row][col].piece {
                    if piece.color == activePlayer.color && piece.type == .king {
                        //save this location
                        kingPosition = (row, col)
                    }
                }
            }
        }
        
        //tmp move to update sightlines
 
        board[desiredTile.coord.0][desiredTile.coord.1] = BoardTile(color: desiredTile.color, piece: selectedPiece, coord: desiredTile.coord)

        
        //check all sightlines of the opposing player to see if any of them contain the king position
        for row in 0..<8 {
            for col in 0..<8{
                if let piece = board[row][col].piece {
                    if piece.color != activePlayer.color {
                        let path = piece.generateMovePath(currentPosition: (row, col), board: Board(tiles: board))
                        // if the path contains our king we return true
                        if path.contains(where: { $0 == kingPosition }) {
                            return true
                        }
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
                    board[row][col] = BoardTile(color: color, piece: nil, coord: (row, col))
                }
            }
        }
    }
    

    
    


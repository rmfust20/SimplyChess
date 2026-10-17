//
//  BoardBrain.swift
//  RobertMakesChess
//
//  Created by Robert Fusting on 9/20/26.
//

import Foundation

final class BoardBrain {
    
    static let shared = BoardBrain()
    
    private init() {
        setupBoard()
    }
    
    var board = Board().tiles
    
    
    func processMove(activePlayer: Player, selectedPiece : GamePiece, currentTile: BoardTile, desiredTile: BoardTile) {
        if canMovePiece(activePlayer: activePlayer, selectedPiece: selectedPiece, currentTile: currentTile, desiredTile: desiredTile) {
            
            //probably wanna process a capture but not needed for MVP
            board[desiredTile.coord.0][desiredTile.coord.1].piece = selectedPiece
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
        
        // cant move if it would put you in check
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
        
        let storedPiece = board[desiredTile.coord.0][desiredTile.coord.1].piece
 
        board[desiredTile.coord.0][desiredTile.coord.1].piece = selectedPiece

        
        //check all sightlines of the opposing player to see if any of them contain the king position
        for row in 0..<8 {
            for col in 0..<8{
                if let piece = board[row][col].piece {
                    if piece.color != activePlayer.color {
                        let path = piece.generateMovePath(currentPosition: (row, col), board: Board(tiles: board))
                        // if the path contains our king we return true
                        if path.contains(where: { $0 == kingPosition }) {
                            //before we return true we need to roll back that tmp move
                            board[desiredTile.coord.0][desiredTile.coord.1].piece = storedPiece
                            return true
                        }
                    }
                }
            }
        }
        
        board[desiredTile.coord.0][desiredTile.coord.1].piece = storedPiece
        return false
    }
        
        
        func setupBoard() {
            for row in 0..<8 {
                for col in 0..<8 {
                    let color = row + col % 2 == 0 ? "White" : "Black"
                    //we will want to add the pieces here but for now we will just set up the board with empty tiles
                    board[row][col] = BoardTile(color: color, piece: nil, coord: (row, col))
                }
            }
        }
    }
    

    
    


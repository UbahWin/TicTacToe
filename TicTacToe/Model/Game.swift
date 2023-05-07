//
//  Game.swift
//  TicTacToe
//
//  Created by Иван Вдовин on 07.05.2023.
//

import Foundation

class Game: ObservableObject {
    @Published var board = [[Cell]]()
    @Published var turn = Tile.cross
        
    @Published var victoryAlert: Bool = false
    @Published var victoryMessage: String = ""
    
    init() {
        resetBoard()
    }
    
    func placeTile(row: Int, col: Int) {
        if board[row][col].tile != .empty {
            return
        }
        
        board[row][col].tile = turn == .cross ? .cross : .nought
        
        if victory() {
            if turn == .cross {
                victoryMessage = "Крестики выиграли!"
            } else {
                victoryMessage = "Нолики выиграли!"
            }
            victoryAlert = true
        } else {
            turn = turn == .cross ? .nought : .cross
        }
    }
    
    func victory() -> Bool {
        for i in 0 ..< 3 {
            if turnEqualTile(row: i, col: 0) && turnEqualTile(row: i, col: 1) && turnEqualTile(row: i, col: 2) { // rows
                return true
            }
        }
        for i in 0 ..< 3 {
            if turnEqualTile(row: 0, col: i) && turnEqualTile(row: 1, col: i) && turnEqualTile(row: 2, col: i) { // columns
                return true
            }
        }
        if turnEqualTile(row: 0, col: 0) && turnEqualTile(row: 1, col: 1) && turnEqualTile(row: 2, col: 2) { // diiagonal
            return true
            
        }
        if turnEqualTile(row: 0, col: 2) && turnEqualTile(row: 1, col: 1) && turnEqualTile(row: 2, col: 0) { // diiagonal
            return true
            
        }
        return false
    }
    
    func turnEqualTile(row: Int, col: Int) -> Bool {
        return board[row][col].tile == turn
    }
    
    func resetBoard() {
        
        var newBoard = [[Cell]]()
        
        for _ in 0 ..< 3 {
            
            var row = [Cell]()
            
            for _ in 0 ..< 3 {
                row.append(Cell(tile: .empty))
            }
            newBoard.append(row)
        }
        board = newBoard
    }
}

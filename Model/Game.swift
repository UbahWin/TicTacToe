//
//  Game.swift
//  TicTacToe
//
//  Created by Иван Вдовин on 07.05.2023.
//

import Foundation

class Game: ObservableObject {
    @Published var board = [[Cell]]()
    @Published var turn: Tile = .cross
    @Published var alert: Bool = false
    @Published var message: String = ""
    var move: Int = 0
    
    init() {
        resetBoard()
    }
    
    func placeTile(row: Int, col: Int) { // add simbol
        if board[row][col].tile != .empty {
            return
        }
        move += 1
        board[row][col].tile = turn == .cross ? .cross : .nought
        if victory() {
            if turn == .cross {
                message = "Крестики выиграли!"
            } else {
                message = "Нолики выиграли!"
            }
            alert = true
            move = 0
        } else {
            if move >= 9 {
                message = "Ничья!"
                alert = true
                move = 0
            }
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
        if turnEqualTile(row: 0, col: 0) && turnEqualTile(row: 1, col: 1) && turnEqualTile(row: 2, col: 2) { // diagonal
            return true
        }
        if turnEqualTile(row: 0, col: 2) && turnEqualTile(row: 1, col: 1) && turnEqualTile(row: 2, col: 0) { // diagonal
            return true
        }
        return false
    }
    
    func turnEqualTile(row: Int, col: Int) -> Bool {
        return board[row][col].tile == turn
    }
    
    func resetBoard() {
        turn = .cross
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

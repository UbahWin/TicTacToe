//
//  Cell.swift
//  TicTacToe
//
//  Created by Иван Вдовин on 07.05.2023.
//

import Foundation

struct Cell {
    var tile: Tile
    
    func displayTile() -> String {
        switch tile {
            case .nought:
                return "O"
            case .cross:
                return "X"
            default: // .empty
                return ""
        }
    }
}

enum Tile {
    case nought
    case cross
    case empty
}

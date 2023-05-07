//
//  ContentView.swift
//  TicTacToe
//
//  Created by Иван Вдовин on 07.05.2023.
//

import SwiftUI

struct ContentView: View {
    @StateObject var game = Game()
    
    var body: some View {
        VStack {
            Text("Крестики-Нолики")
                .font(.largeTitle)
            
            VStack {
                
                ForEach(0 ..< 3, id: \.self) { row in
                    
                    HStack {
                        
                        ForEach(0 ..< 3, id: \.self) { col in
                            
                            let cell = game.board[row][col]
                            
                            Text(cell.displayTile())
                                .font(.system(size: 50))
                                .bold()
                                .frame(maxWidth: .infinity, maxHeight: .infinity)
                                .aspectRatio(1, contentMode: .fit)
                                .background(Color(UIColor.systemBackground))
                                .onTapGesture {
                                    game.placeTile(row: row, col: col)
                                }
                        }
                    }
                }
            }
            .background(Color.gray)
            .alert(isPresented: $game.alert) {
                Alert(title: Text(game.message), dismissButton: .default(Text("Заново")) { game.resetBoard() })
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

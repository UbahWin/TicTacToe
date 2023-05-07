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
            Spacer()
            
            Text("Крестики-Нолики")
                .font(.largeTitle)
            
            Spacer()
            
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
            .alert(isPresented: $game.victoryAlert) {
                Alert(title: Text(game.victoryMessage), dismissButton: .default(Text("Заново")) { game.resetBoard() })
            }
            
            Spacer()
            
            Button {
                game.resetBoard()
            } label: {
                Image(systemName: "arrow.clockwise")
                    .resizable()
                    .frame(width: 30, height: 40)
            }
            
            Spacer()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

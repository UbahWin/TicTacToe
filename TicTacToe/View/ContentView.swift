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
            
            Text("TicTacToe")
                .font(.system(size: 60))
            
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
                                .background(Color.white)
                                .onTapGesture {
                                    game.placeTile(row: row, col: col)
                                }
                        }
                    }
                }
            }
            .background(Color.gray)
            .alert(isPresented: $game.victoryAlert) {
                Alert(title: Text(game.victoryMessage), dismissButton: .default(Text("Хорошо")) { game.resetBoard() })
            }
            
            Spacer()
            
            Button {
                game.resetBoard()
            } label: {
                Image(systemName: "arrow.clockwise")
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

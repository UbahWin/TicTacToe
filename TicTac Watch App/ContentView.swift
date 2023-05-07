//
//  ContentView.swift
//  TicTac Watch App
//
//  Created by Иван Вдовин on 07.05.2023.
//

import SwiftUI

struct ContentView: View {
    @StateObject var game = Game()

    var body: some View {
        VStack {
            HStack {
                HStack {
                    let cell = game.board[0][0]
                    Text(cell.displayTile())
                        .font(.system(size: 20))
                        .bold()
                        .frame(maxWidth: .infinity, maxHeight: .infinity)
                        .aspectRatio(1, contentMode: .fit)
                        .background(Color.black)
                        .onTapGesture {
                            game.placeTile(row: 0, col: 0)
                        }
                }
                HStack {
                    let cell = game.board[0][1]
                    Text(cell.displayTile())
                        .font(.system(size: 20))
                        .bold()
                        .frame(maxWidth: .infinity, maxHeight: .infinity)
                        .aspectRatio(1, contentMode: .fit)
                        .background(Color.black)
                        .onTapGesture {
                            game.placeTile(row: 0, col: 1)
                        }
                }
                HStack {
                    let cell = game.board[0][2]
                    Text(cell.displayTile())
                        .font(.system(size: 20))
                        .bold()
                        .frame(maxWidth: .infinity, maxHeight: .infinity)
                        .aspectRatio(1, contentMode: .fit)
                        .background(Color.black)
                        .onTapGesture {
                            game.placeTile(row: 0, col: 2)
                        }
                }
            }
            HStack {
                HStack {
                    let cell = game.board[1][0]
                    Text(cell.displayTile())
                        .font(.system(size: 20))
                        .bold()
                        .frame(maxWidth: .infinity, maxHeight: .infinity)
                        .aspectRatio(1, contentMode: .fit)
                        .background(Color.black)
                        .onTapGesture {
                            game.placeTile(row: 1, col: 0)
                        }
                }
                HStack {
                    let cell = game.board[1][1]
                    Text(cell.displayTile())
                        .font(.system(size: 20))
                        .bold()
                        .frame(maxWidth: .infinity, maxHeight: .infinity)
                        .aspectRatio(1, contentMode: .fit)
                        .background(Color.black)
                        .onTapGesture {
                            game.placeTile(row: 1, col: 1)
                        }
                }
                HStack {
                    let cell = game.board[1][2]
                    Text(cell.displayTile())
                        .font(.system(size: 20))
                        .bold()
                        .frame(maxWidth: .infinity, maxHeight: .infinity)
                        .aspectRatio(1, contentMode: .fit)
                        .background(Color.black)
                        .onTapGesture {
                            game.placeTile(row: 1, col: 2)
                        }
                }
            }
            HStack {
                HStack {
                    let cell = game.board[2][0]
                    Text(cell.displayTile())
                        .font(.system(size: 20))
                        .bold()
                        .frame(maxWidth: .infinity, maxHeight: .infinity)
                        .aspectRatio(1, contentMode: .fit)
                        .background(Color.black)
                        .onTapGesture {
                            game.placeTile(row: 2, col: 0)
                        }
                }
                HStack {
                    let cell = game.board[2][1]
                    Text(cell.displayTile())
                        .font(.system(size: 20))
                        .bold()
                        .frame(maxWidth: .infinity, maxHeight: .infinity)
                        .aspectRatio(1, contentMode: .fit)
                        .background(Color.black)
                        .onTapGesture {
                            game.placeTile(row: 2, col: 1)
                        }
                }
                HStack {
                    let cell = game.board[2][2]
                    Text(cell.displayTile())
                        .font(.system(size: 20))
                        .bold()
                        .frame(maxWidth: .infinity, maxHeight: .infinity)
                        .aspectRatio(1, contentMode: .fit)
                        .background(Color.black)
                        .onTapGesture {
                            game.placeTile(row: 2, col: 2)
                        }
                }
            }
        }
        .frame(width: 130, height: 130)
        .background(Color.gray)
        .alert(isPresented: $game.alert) {
            Alert(title: Text(game.message), dismissButton: .default(Text("Заново")) { game.resetBoard() })
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

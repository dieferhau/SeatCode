//
//  ContentView.swift
//  SeatCode
//
//  Created by Diego on 26/5/22.
//

import SwiftUI

struct ContentView: View {
    
    @ObservedObject
    var viewModel = CharactersVM()
    
    var body: some View {
        NavigationView {
            List(viewModel.heroes) { hero in
                NavigationLink(destination: DetailView(content: hero).environmentObject(viewModel)){
                    HStack {
                        AsyncImage(url: URL(string: "\(hero.thumbnail.path).\(hero.thumbnail.thumbnailExtension)"), content: { image in
                            image.resizable().frame(width: 40, height: 40)
                        }, placeholder: {
                            Color.white.frame(width: 40, height: 40)
                        })
                        Text(hero.name)
                    }
                }
            }
        }.onAppear {
            viewModel.fetch()
        }
    }
}

//
//  DetailView.swift
//  SeatCode
//
//  Created by Diego on 26/5/22.
//

import SwiftUI

struct DetailView: View {
    
    var content: Result
    
    @EnvironmentObject
    var viewModel: CharactersVM
    
    var body: some View {
        VStack {
            AsyncImage(url: URL(string: "\(content.thumbnail.path).\(content.thumbnail.thumbnailExtension)"), content: { image in
                image.resizable().aspectRatio(contentMode: .fit).frame(maxHeight: 100)
            }, placeholder: {
                Color.white.frame(maxHeight: 100)
            })
            Text(content.name)
            Button(viewModel.saved(id: content.id) ? "Unsave" : "Save"){
                viewModel.toggleSave(id: content.id)
            }
            Text("Appears in:")
            List(content.comics.items) { item in
                Text(item.name)
            }
        }
    }
}

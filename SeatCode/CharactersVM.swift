//
//  CharactersVM.swift
//  SeatCode
//
//  Created by Diego on 26/5/22.
//

import Foundation
import Combine

class CharactersVM: ObservableObject {
    
    private var cancellable = Set<AnyCancellable>()
    
    @Published
    var heroes = [Result]()
    
    @Published
    var saved: [Int] = []
    
    init(){
        if let arr = (UserDefaults.standard.array(forKey: "Saved") ?? []) as? [Int] {
            saved = arr
        }
    }
    
    func fetch(){
        URLSession.shared.dataTaskPublisher(for: URL(string: "https://gateway.marvel.com:443/v1/public/characters?apikey=c9bea7bed2678e12c5c9414609f35bdd&ts=1&hash=129b4cbd75440e6445c54443e5cfae14")!)
            .map { $0.data }
            .decode(type: Welcome.self, decoder: JSONDecoder())
            .receive(on: DispatchQueue.main)
            .sink(receiveCompletion: { r in
                print("EEE \(r)")
            }, receiveValue: { res in
                self.heroes = res.data.results
            }).store(in: &cancellable)
    }
    
    func saved(id: Int) -> Bool {
        saved.contains(id)
    }
    
    func toggleSave(id: Int){
        if let ind = saved.firstIndex(of: id) {
            saved.remove(at: ind)
        } else {
            saved.append(id)
        }
        UserDefaults.standard.set(saved, forKey: "Saved")
    }
    
}



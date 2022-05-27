//
//  CharactersVM.swift
//  SeatCode
//
//  Created by Diego on 26/5/22.
//

import Foundation

class CharactersVM: ObservableObject {
    
    @Published
    var heroes = [Result]()

    //We make this private as it shouldn't be altered outside this class, but make it published cause we want to notify observers of changes.
    @Published
    private var saved: [Int] = []
    
    var service = CharacterService()
    
    init(){
        if let arr = (UserDefaults.standard.array(forKey: "Saved") ?? []) as? [Int] {
            saved = arr
        }
    }
    
    @MainActor
    func fetch(){
        Task {
            do {
                heroes = try await service.fetch()
            } catch {
                print("Error")
            }
        }
            
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

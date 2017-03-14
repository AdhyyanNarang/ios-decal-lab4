//
//  SearchViewController.swift
//  PokedexLab
//
//  Created by SAMEER SURESH on 2/25/17.
//  Copyright © 2017 iOS Decal. All rights reserved.
//

import UIKit

class SearchViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate {

    var pokemonArray: [Pokemon] = []
    var filteredArray: [Pokemon] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionOut.delegate = self;
        collectionOut.dataSource = self;
        pokemonArray = PokemonGenerator.getPokemonArray()
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 18
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "collectionCell", for: indexPath) as! PokedexViewCell
        if let name = PokemonGenerator.categoryDict[indexPath.item] {
        cell.imageOut.image =  UIImage.init(named: name)
        }
        return cell;
    }
    
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        filteredArray = filteredPokemon(ofType: indexPath.item)
        performSegue(withIdentifier: "searchToCategory", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "searchToCategory" {
            if let destinationVC = segue.destination as? CategoryViewController {
            destinationVC.pokemonArray = filteredArray
            }
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    
    // Utility function to iterate through pokemon array for a single category
    func filteredPokemon(ofType type: Int) -> [Pokemon] {
        var filtered: [Pokemon] = []
        for pokemon in pokemonArray {
            if (pokemon.types.contains(PokemonGenerator.categoryDict[type]!)) {
                filtered.append(pokemon)
            }
        }
        return filtered
    }

    @IBOutlet weak var collectionOut: UICollectionView!

}

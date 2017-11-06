//
//  LastTableViewController.swift
//  TicTacTo
//
//  Created by SUP'Internet 13 on 06/11/2017.
//  Copyright © 2017 SUP'Internet 13. All rights reserved.
//

import Foundation
import UIKit

//pour utiliser tableview 

// place
// on fiat un segue view contollers sur la navigation pour ajouter un item

//creer un nouveau controller pour cette table

//fait hériter de uItable ...

//Et on rename la tableview coté storyboard, en lui attribuant le nom de notre ocntroller


//le comportement de la tableview controller et dafficher lescell 1 par 1
class LastTableViewController : UITableViewController {
    
    
    //array de dictionnaire Nom winner Nom looser
    var data = Array<[String:String]>()
    
    override func viewDidLoad() {
        super.viewDidLoad()
         data.append(["dead" : "player1", "winner": "player 2"])
         data.append(["dead" : "player1", "winner": "player 2"])
         data.append(["dead" : "player2", "winner": "player 1"])
    }
    
    
    // ======================
    //TO DO : PlayController => dico[String:String] Winner / Looser et le mettre en cache 
    // a faire sur chaque verif (if diagonal vertical etc) ET sur le ragequit
    
    //ensuite sur lasttable get ce dico et le set dans une variable
    //ensuite utiliser cette variable pour faire les affichag
    // ======================

    
    //rajouter ces override method permet de modifier le comportement de notre tableView 
    //par defaut elle aura X section (ligne items) etc
    //et avec ces override on modifie le comportement
    
    //La section c'est un gros bloc qui va contenir X lignes qui elle même vont contenir X column
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1; //return une seule section
    }
    
    //attention si il y a pas de value on ne verra rien (par contre elles existent bien)
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data.count
    }
    
    //pour le style des cells, on va dans le story board et on clic sur le table view controller et on peut modifie
    
    //ceci est pour le comportement de notre cellDisplay au moment du scroll
    //pour la recuperer et de manière général, mettre des identifier sur notre cellule
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "LastCell", for: indexPath)
        cell.textLabel?.text = "Section \(indexPath.section) Row \(indexPath.row)"
        let stat = data[indexPath.row]
        
        cell.textLabel?.text = "\(stat["winner"]!)  ︻デ┳═ー  \(stat["dead"]!)"
        
        return cell;
    }
}

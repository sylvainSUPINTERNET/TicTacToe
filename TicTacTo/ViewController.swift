
//
//  ViewController.swift
//  TicTacTo
//
//  Created by SUP'Internet 13 on 25/10/2017.
//  Copyright © 2017 SUP'Internet 13. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var play: UIButton!
    

    @IBOutlet weak var joueur1: UILabel!
    @IBOutlet weak var joueur2: UILabel!
    
    @IBOutlet weak var score_j1: UILabel!
    @IBOutlet weak var score_j2: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    
        DispatchQueue.main.async { // si probleme d'affichage utiliser cette method
            self.reloadValueStat()

        }

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //reload value method
    
 
    func reloadValueStat(){
        if(UserDefaults.standard.string(forKey: "joueur1") == nil){
             joueur1.text = "NA"
        }else{
              joueur1.text = UserDefaults.standard.string(forKey: "joueur1")
        
        }
        
        if(UserDefaults.standard.string(forKey: "joueur2") == nil){
            joueur2.text = "NA"
        }else{
            joueur2.text = UserDefaults.standard.string(forKey: "joueur2")
        }
        
        
        if(UserDefaults.standard.integer(forKey: "win_j1") == 0){
            score_j1.text = "0"
        }else{
            score_j1.text = UserDefaults.standard.string(forKey: "win_j1")
        }
        
        if(UserDefaults.standard.integer(forKey: "win_j2") == 0){
            score_j2.text = "0"
        }else{
            score_j2.text = UserDefaults.standard.string(forKey: "win_j2")
        }
        

    }

    
    // press play perfomSegue PlayModal
    @IBAction func pressPlay(_ sender: UIButton) {
        self.performSegue(withIdentifier: "PlayModal", sender: nil)
    }
    
    //appeler automatiquement au performSegue, on peut ainsi regarder quel segue a etait choisi pour faire charger le controller correspondant
    override func prepare(for segue: UIStoryboardSegue, sender: Any?){
        if(segue.identifier == "PlayModal"){
            
            //Pour definir les nav bar ou tab bar, selectionne le controller (petit cercle orange sur le controller), puis on clique sur editor embed in et choisi son nav style
            //En suite quand on va lier avec des segue, ne pas oublier le controller va créer et identifier pour la modal ET d'avord passer par le controller du nav choisi
            //Ainsi la destination sera le nav controller plus le controller de la modal directement
            
            //nav Controller
            let nav = segue.destination as!UINavigationController
            // controller de la modal cast avec nav controller
            let myControlller = nav.topViewController as! PlayController
            
            //variable qu'on send (definit dans la classe identifier PlayController)
            myControlller.joueur1 = "sylvain"
            myControlller.joueur2 = "IA"
            myControlller.parentController = self

            
        }
    }


}


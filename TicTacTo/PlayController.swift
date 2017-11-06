//
//  PlayController.swift
//  TicTacTo
//
//  Created by SUP'Internet 13 on 25/10/2017.
//  Copyright © 2017 SUP'Internet 13. All rights reserved.
//


//quand on creer un controller externe 
//de une segue mettre bien l'indentifier
// et pour la classe pas oublier de l'identifier (nom du controller) et la faire correspondre au nom du controller appeler dans le segue
//si on donne pas en idnetifier a la class le nom du controller on a pas access au element du storyBoard

//cmd + shift + h => croix delete => product clear (xcode)

import UIKit

class PlayController: UIViewController {
    
    weak var parentController : ViewController?
    
    //cache data
    let joueur1_cache = UserDefaults.standard.value(forKey: "joueur1") as? String
    let joueur2_cache = UserDefaults.standard.value(forKey: "joueur2") as? String
    
    let win_count_j1_cache = UserDefaults.standard.value(forKey: "win_j1") as? Int
    let win_count_j2_cache = UserDefaults.standard.value(forKey: "win_j2") as? Int
    
    
    //Counter for win (set when view load by data in cache)
    var win_count_j1:Int = 0;
    var win_count_j2:Int = 0;
    

    

    

    
    var joueur1:String = "sylvain";
    var joueur2:String = "IA";
    
    
    //game
    //line1
    @IBOutlet weak var case1: UIButton!
    @IBOutlet weak var case2: UIButton!
    @IBOutlet weak var case3: UIButton!

    //line2
    @IBOutlet weak var case4: UIButton!
    @IBOutlet weak var case5: UIButton!
    @IBOutlet weak var case6: UIButton!
    
    //line3
    @IBOutlet weak var case7: UIButton!
    @IBOutlet weak var case8: UIButton!
    @IBOutlet weak var case9: UIButton!
    
    var turn = 1; //1 j1 / 2 j2
    
    var victory = false;
    var winner = "";
    
    //text win 
    
    @IBOutlet weak var text_win: UILabel!
    
   
    
    
    func checkCase(button: UIButton){
        if(self.victory == false){

        if(button.titleLabel?.text == "X" || button.titleLabel?.text == "O"){
            //do nothing
        }else if(button.titleLabel?.text != "X" || button.titleLabel?.text != "O"){
            if(turn == 1){
                button.titleLabel?.text = "X";
                button.setTitle("X", for: .normal)
                turn += 1;
            }else if(turn == 2){
                button.titleLabel?.text = "O"
                button.setTitle("O", for: .normal)
                turn -= 1;
            }
        

            //BASIC
            if(case1.titleLabel?.text != "-" && case2.titleLabel?.text != "-" && case3.titleLabel?.text != "-"){
                if(case1.titleLabel?.text == case2.titleLabel?.text && case1.titleLabel?.text == case3.titleLabel?.text){
                    print("VICTORY");
                    self.victory = true;
                    if(case1.titleLabel?.text == "O"){
                        self.winner = self.joueur2;
                        self.victory = true;
                        let count = self.win_count_j2 + 1
                         UserDefaults.standard.set(count, forKey: "win_j2")
                        
                    }else{
                        self.winner = self.joueur1;
                        self.victory = true;
                        let count = self.win_count_j1 + 1
                         UserDefaults.standard.set(count, forKey: "win_j1")

                       
                    }
                    
                }
            }else{
                print("en cours ... ")
            }
      
            
            if(case4.titleLabel?.text != "-" && case5.titleLabel?.text != "-" && case6.titleLabel?.text != "-"){
                if(case4.titleLabel?.text == case5.titleLabel?.text && case4.titleLabel?.text == case6.titleLabel?.text){
                    print("VICTORY");
                    self.victory = true;
                    if(case4.titleLabel?.text == "O"){
                        self.winner = self.joueur2;
                        self.victory = true;
                        let count = self.win_count_j2 + 1
                            UserDefaults.standard.set(count, forKey: "win_j2")

                    }else{
                        self.winner = self.joueur1;
                        self.victory = true;
                        let count = self.win_count_j1 + 1
                        UserDefaults.standard.set(count, forKey: "win_j1")

                    }
                }
            }else{
                print("en cours ... ")
            }
            
            
            if(case7.titleLabel?.text != "-" && case8.titleLabel?.text != "-" && case9.titleLabel?.text != "-"){
                if(case6.titleLabel?.text == case7.titleLabel?.text && case6.titleLabel?.text == case8.titleLabel?.text){
                    print("VICTORY");
                    self.victory = true;
                    if(case6.titleLabel?.text == "O"){
                        self.winner = self.joueur2;
                        self.victory = true;
                         let count = self.win_count_j2 + 1
                             UserDefaults.standard.set(count, forKey: "win_j2")

                    }else{
                        self.winner = self.joueur1;
                        self.victory = true;
                         let count = self.win_count_j1 + 1
                        UserDefaults.standard.set(count, forKey: "win_j1")

                    }

                }
            }else{
                print("en cours ...")
            }
            
            
            //vertical
            if(case1.titleLabel?.text != "-" && case4.titleLabel?.text != "-" && case7.titleLabel?.text != "-"){
                if(case1.titleLabel?.text == case4.titleLabel?.text && case1.titleLabel?.text == case7.titleLabel?.text){
                    print("VICTORY");
                    self.victory = true;
                    if(case1.titleLabel?.text == "O"){
                        self.winner = self.joueur2;
                        self.victory = true;
                        let count = self.win_count_j2 + 1
                             UserDefaults.standard.set(count, forKey: "win_j2")

                    }else{
                        self.winner = self.joueur1;
                        self.victory = true;
                        let count = self.win_count_j1 + 1
                         UserDefaults.standard.set(count, forKey: "win_j1")

                    }

                }
            }else{
                print("en cours ... ")
            }

            if(case2.titleLabel?.text != "-" && case5.titleLabel?.text != "-" && case8.titleLabel?.text != "-"){
                if(case2.titleLabel?.text == case5.titleLabel?.text && case2.titleLabel?.text == case8.titleLabel?.text){
                    print("VICTORY");
                    self.victory = true;
                    if(case2.titleLabel?.text == "O"){
                        self.winner = self.joueur2;
                        self.victory = true;
                        let count = self.win_count_j2 + 1
                        UserDefaults.standard.set(count, forKey: "win_j2")

                    }else{
                        self.winner = self.joueur1;
                        self.victory = true;
                        let count = self.win_count_j1 + 1
                         UserDefaults.standard.set(count, forKey: "win_j1")

                    }

                }
            }else{
                print("en cours ... ")
            }

            
            if(case3.titleLabel?.text != "-" && case6.titleLabel?.text != "-" && case9.titleLabel?.text != "-"){
                if(case3.titleLabel?.text == case6.titleLabel?.text && case3.titleLabel?.text == case9.titleLabel?.text){
                    print("VICTORY");
                    self.victory = true;
                    if(case3.titleLabel?.text == "O"){
                        self.winner = self.joueur2;
                        self.victory = true;
                        let count = self.win_count_j2 + 1
                        UserDefaults.standard.set(count, forKey: "win_j2")

                    }else{
                        self.winner = self.joueur1;
                        self.victory = true;
                        let count = self.win_count_j1 + 1
                          UserDefaults.standard.set(count, forKey: "win_j1")

                    }

                }
            }else{
                print("en cours ... ")
            }

            
            //DIAGONALE
            
            if(case1.titleLabel?.text != "-" && case5.titleLabel?.text != "-" && case9.titleLabel?.text != "-"){
                if(case1.titleLabel?.text == case5.titleLabel?.text && case1.titleLabel?.text == case9.titleLabel?.text){
                    self.victory = true;
                    if(case1.titleLabel?.text == "O"){
                        self.winner = self.joueur2;
                        self.victory = true;
                        let count = self.win_count_j2 + 1

                         UserDefaults.standard.set(count, forKey: "win_j2")

                        
                    }else{
                        self.winner = self.joueur1;
                        self.victory = true;
                        let count = self.win_count_j1 + 1

                          UserDefaults.standard.set(count, forKey: "win_j1")

                    }

                }
            }else{
                print("en cours ... ")
            }

            
            if(case3.titleLabel?.text != "-" && case5.titleLabel?.text != "-" && case7.titleLabel?.text != "-"){
                if(case3.titleLabel?.text == case5.titleLabel?.text && case3.titleLabel?.text == case7.titleLabel?.text){
                    self.victory = true;
                    if(case3.titleLabel?.text == "O"){
                        self.winner = self.joueur2;
                        self.victory = true;
                        let count = self.win_count_j2 + 1

                         UserDefaults.standard.set(count, forKey: "win_j2")

                    }else{
                        self.winner = self.joueur1;
                        self.victory = true;
                        let count = self.win_count_j1 + 1

                           UserDefaults.standard.set(count, forKey: "win_j1")

                    }

                }
            }else{
                print("en cours ... ")
            }

            
            print(self.victory);
            print(self.winner);
            if(self.victory == true){
                print("partie terminé : winner \(self.winner)")
                self.text_win.text = "GG \(self.winner)"
                //to do label with winner name
                //++ cache winner sur chaque victoire
                print("---Cache data---")
                print("joueur1 : " + UserDefaults.standard.string(forKey: "joueur1")!);
                print("joueur2 : " + UserDefaults.standard.string(forKey: "joueur2")!);
                
                print("Win j1 = \(UserDefaults.standard.integer(forKey: "win_j1"))")
                self.win_count_j1 = UserDefaults.standard.integer(forKey: "win_j1")
                print("Win j2 = \(UserDefaults.standard.integer(forKey: "win_j2"))")
                self.win_count_j2 = UserDefaults.standard.integer(forKey: "win_j2")
                
                print(self.win_count_j1);
            


                print("---------")
                
            }else{
                self.text_win.text = "Partie en cours . . ."
            }
            
        }
        
            
        }else{
            print("partie terminé : winner \(self.winner)")
            self.text_win.text = "Relancer une partie"
            print("Partie déjà terminé ! => winner \(self.winner)")
            print("---Cache data---")
            print("joueur1 : " + UserDefaults.standard.string(forKey: "joueur1")!);
            print("joueur2 : " + UserDefaults.standard.string(forKey: "joueur2")!);
            
            print("Win j1 = \(UserDefaults.standard.integer(forKey: "win_j1"))")
            self.win_count_j1 = UserDefaults.standard.integer(forKey: "win_j1")
            print("Win j2 = \(UserDefaults.standard.integer(forKey: "win_j2"))")
            self.win_count_j2 = UserDefaults.standard.integer(forKey: "win_j2")
            
            print("winner : " + UserDefaults.standard.string(forKey: "winner")!);

            
            print(self.win_count_j1);
            print("---------")
        }
        
        
    }
    
    
    
    @IBAction func casePressed(_ sender: UIButton) {
        self.checkCase(button: sender)
    }
    
 
    override func viewDidLoad() {
        print("\(self.joueur1) VS \(self.joueur2)");
        
        
    
        UserDefaults.standard.setValue(self.joueur1, forKey: "joueur1")
        UserDefaults.standard.setValue(self.joueur2, forKey: "joueur2")
        print("---Cache data---")
        print("joueur1 : " + UserDefaults.standard.string(forKey: "joueur1")!);
        print("joueur2 : " + UserDefaults.standard.string(forKey: "joueur2")!);
        
        print("Win j1 = \(UserDefaults.standard.integer(forKey: "win_j1"))")
        self.win_count_j1 = UserDefaults.standard.integer(forKey: "win_j1")
        print("Win j2 = \(UserDefaults.standard.integer(forKey: "win_j2"))")
        self.win_count_j2 = UserDefaults.standard.integer(forKey: "win_j2")
        
    
        print("---------")

    }
    
    
    @IBAction func closePlayModal(_ sender: UIBarButtonItem) {
        self.dismiss(animated: true, completion: {
            if(self.victory == false){
                //rage quit
                if(self.turn == 1){
                    //j1 ragequit donc j2 cache win count ++
                    let count = self.win_count_j2 + 1
                    UserDefaults.standard.set(count, forKey: "win_j2")

                }else{
                    //j2 ragequit donc j1 cache win count ++
                    let count = self.win_count_j1 + 1
                    UserDefaults.standard.set(count, forKey: "win_j1")
                }
            }
            self.parentController?.reloadValueStat();
        })
    }

}

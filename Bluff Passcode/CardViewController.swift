//
//  CardViewController.swift
//  Bluff Passcode
//
//  Created by Rishabh Ganesh on 8/23/20.
//

import UIKit

class CardViewController: UIViewController {
    

    @IBOutlet weak var cardAS: UIImageView!
    @IBOutlet weak var card2S: UIImageView!
    @IBOutlet weak var card3S: UIImageView!
    @IBOutlet weak var card4S: UIImageView!
    @IBOutlet weak var card5S: UIImageView!
    @IBOutlet weak var card6S: UIImageView!
    @IBOutlet weak var card7S: UIImageView!
    @IBOutlet weak var card8S: UIImageView!
    @IBOutlet weak var card9S: UIImageView!
    @IBOutlet weak var card10S: UIImageView!
    @IBOutlet weak var cardJS: UIImageView!
    @IBOutlet weak var cardQS: UIImageView!
    @IBOutlet weak var cardKS: UIImageView!
    @IBOutlet weak var cardAH: UIImageView!
    @IBOutlet weak var card2H: UIImageView!
    @IBOutlet weak var card3H: UIImageView!
    @IBOutlet weak var card4H: UIImageView!
    @IBOutlet weak var card5H: UIImageView!
    @IBOutlet weak var card6H: UIImageView!
    @IBOutlet weak var card7H: UIImageView!
    @IBOutlet weak var card8H: UIImageView!
    @IBOutlet weak var card9H: UIImageView!
    @IBOutlet weak var card10H: UIImageView!
    @IBOutlet weak var cardJH: UIImageView!
    @IBOutlet weak var cardQH: UIImageView!
    @IBOutlet weak var cardKH: UIImageView!
    @IBOutlet weak var cardAD: UIImageView!
    @IBOutlet weak var card2D: UIImageView!
    @IBOutlet weak var card3D: UIImageView!
    @IBOutlet weak var card4D: UIImageView!
    @IBOutlet weak var card5D: UIImageView!
    @IBOutlet weak var card6D: UIImageView!
    @IBOutlet weak var card7D: UIImageView!
    @IBOutlet weak var card8D: UIImageView!
    @IBOutlet weak var card9D: UIImageView!
    @IBOutlet weak var card10D: UIImageView!
    @IBOutlet weak var cardJD: UIImageView!
    @IBOutlet weak var cardQD: UIImageView!
    @IBOutlet weak var cardKD: UIImageView!
    @IBOutlet weak var cardAC: UIImageView!
    @IBOutlet weak var card2C: UIImageView!
    @IBOutlet weak var card3C: UIImageView!
    @IBOutlet weak var card4C: UIImageView!
    @IBOutlet weak var card5C: UIImageView!
    @IBOutlet weak var card6C: UIImageView!
    @IBOutlet weak var card7C: UIImageView!
    @IBOutlet weak var card8C: UIImageView!
    @IBOutlet weak var card9C: UIImageView!
    @IBOutlet weak var card10C: UIImageView!
    @IBOutlet weak var cardJC: UIImageView!
    @IBOutlet weak var cardQC: UIImageView!
    @IBOutlet weak var cardKC: UIImageView!
    @IBOutlet weak var label: UILabel!
    @IBOutlet weak var revealButton: UIButton!
    @IBOutlet weak var backButton: UIButton!
    
    var newnum = Int()
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        prepareScreen()
    }
    
    @IBAction func revealCard(_ sender: Any) {
        revealButton.isHidden = true
    }
    
    @IBAction func flip(_ sender: Any) {
        backButton.isHidden = true
    }
    func reveal() {
        if newnum % 100 == 0 {
            revealButton.isHidden = false
        }
        if newnum % 100 % 13 == 0 && newnum % 100 != 0{
            backButton.isHidden = false
        }
    }
    func prepareScreen () {
        reveal()
        if newnum / 100 == 101  {
            cardAS.isHidden = false
        }
        else if newnum / 100 == 102 {
            card2S.isHidden = false
        }
        else if newnum / 100 == 103 {
            card3S.isHidden = false
        }
        else if newnum / 100 == 104 {
            card4S.isHidden = false
        }
        else if newnum / 100 == 105 {
            card5S.isHidden = false
        }
        else if newnum / 100 == 106 {
            card6S.isHidden = false
        }
        else if newnum / 100 == 107 {
            card7S.isHidden = false
        }
        else if newnum / 100 == 108 {
            card8S.isHidden = false
        }
        else if newnum / 100 == 109 {
            card9S.isHidden = false
        }
        else if newnum / 100 == 110 {
            card10S.isHidden = false
        }
        else if newnum / 100 == 111 {
            cardJS.isHidden = false
        }
        else if newnum / 100 == 112 {
            cardQS.isHidden = false
        }
        else if newnum / 100 == 113 {
            cardKS.isHidden = false
        }
        else if newnum / 100 == 201 {
            cardAH.isHidden = false
        }
        else if newnum / 100 == 202 {
            card2H.isHidden = false
        }
        else if newnum / 100 == 203 {
            card3H.isHidden = false
        }
        else if newnum / 100 == 204 {
            card4H.isHidden = false
        }
        else if newnum / 100 == 205 {
            card5H.isHidden = false
        }
        else if newnum / 100 == 206 {
            card6H.isHidden = false
        }
        else if newnum / 100 == 207 {
            card7H.isHidden = false
        }
        else if newnum / 100 == 208 {
            card8H.isHidden = false
        }
        else if newnum / 100 == 209 {
            card9H.isHidden = false
        }
        else if newnum / 100 == 210 {
            card10H.isHidden = false
        }
        else if newnum / 100 == 211 {
            cardJH.isHidden = false
        }
        else if newnum / 100 == 212 {
            cardQH.isHidden = false
        }
        else if newnum / 100 == 213 {
            cardKH.isHidden = false
        }
        else if newnum / 100 == 301 {
            cardAD.isHidden = false
        }
        else if newnum / 100 == 302 {
            card2D.isHidden = false
        }
        else if newnum / 100 == 303 {
            card3D.isHidden = false
        }
        else if newnum / 100 == 304 {
            card4D.isHidden = false
        }
        else if newnum / 100 == 305 {
            card5D.isHidden = false
        }
        else if newnum / 100 == 306 {
            card6D.isHidden = false
        }
        else if newnum / 100 == 307 {
            card7D.isHidden = false
        }
        else if newnum / 100 == 308 {
            card8D.isHidden = false
        }
        else if newnum / 100 == 309 {
            card9D.isHidden = false
        }
        else if newnum / 100 == 310 {
            card10D.isHidden = false
        }
        else if newnum / 100 == 311 {
            cardJD.isHidden = false
        }
        else if newnum / 100 == 312 {
            cardQD.isHidden = false
        }
        else if newnum / 100 == 313 {
            cardKD.isHidden = false
        }
        else if newnum / 100 == 401 {
            cardAC.isHidden = false
        }
        else if newnum / 100 == 402 {
            card2C.isHidden = false
        }
        else if newnum / 100 == 403 {
            card3C.isHidden = false
        }
        else if newnum / 100 == 404 {
            card4C.isHidden = false
        }
        else if newnum / 100 == 405 {
            card5C.isHidden = false
        }
        else if newnum / 100 == 406 {
            card6C.isHidden = false
        }
        else if newnum / 100 == 407 {
            card7C.isHidden = false
        }
        else if newnum / 100 == 408 {
            card8C.isHidden = false
        }
        else if newnum / 100 == 409 {
            card9C.isHidden = false
        }
        else if newnum / 100 == 410 {
            card10C.isHidden = false
        }
        else if newnum / 100 == 411 {
            cardJC.isHidden = false
        }
        else if newnum / 100 == 412 {
            cardQC.isHidden = false
        }
        else if newnum / 100 == 413 {
            cardKC.isHidden = false
        }
        
        label.text = "\(newnum)"
    }
    
}

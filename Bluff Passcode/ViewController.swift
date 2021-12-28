//
//  ViewController.swift
//  Bluff Passcode
//
//  Created by Rishabh Ganesh on 8/20/20.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var animateView: UIImageView!
    @IBOutlet weak var gcircle: UIImageView!
    @IBOutlet weak var flipLock: UIImageView!
    @IBOutlet weak var validator: UILabel!
    @IBOutlet weak var ff: UILabel!
    @IBOutlet weak var circleSIX: UIImageView!
    @IBOutlet weak var circleFIVE: UIImageView!
    @IBOutlet weak var circleFOUR: UIImageView!
    @IBOutlet weak var circleTHREE: UIImageView!
    @IBOutlet weak var circleTWO: UIImageView!
    @IBOutlet weak var circleONE: UIImageView!
    @IBOutlet weak var code: UILabel!
    @IBOutlet weak var press: UILabel!
    @IBOutlet weak var oneButton: UIButton!
    @IBOutlet weak var twoButton: UIButton!
    @IBOutlet weak var threeButton: UIButton!
    @IBOutlet weak var fourButton: UIButton!
    @IBOutlet weak var fiveButton: UIButton!
    @IBOutlet weak var sixButton: UIButton!
    @IBOutlet weak var sevenButton: UIButton!
    @IBOutlet weak var eightButton: UIButton!
    @IBOutlet weak var nineButton: UIButton!
    @IBOutlet weak var zeroButton: UIButton!
    @IBOutlet weak var deleteButton: UIButton!
    
    var circleImages: [UIImage] = []
    var num = 0;
    var presses = 0;
    var isValid = false;
    func printpress() {
        press.isHidden = true
        press.text = "\(presses)"
    }
    
    //create an array of images to animate through
    func createImageArray(total: Int, imagePrefix: String) -> [UIImage] {
        var imageArray: [UIImage] = []
        for imageCount in 0..<total {
            let imageName =  "\(imagePrefix)-\(imageCount).jpeg"
            let image = UIImage(named: imageName)!
            imageArray.append(image)
        }
        return imageArray
    }
    
    //do the animation for a wrong passcode
    func animate(imageView: UIImageView, images: [UIImage])
    {
        imageView.animationImages = images
        imageView.animationDuration = 0.16
        imageView.animationRepeatCount = 2
        imageView.startAnimating()
    }
    
    //unfill the progress circles
    func backToNone() {
        gcircle.isHidden = false
        if gcircle.isHidden == false{
            presses = 0
            num = 0
            circleONE.isHidden = true
            circleTWO.isHidden = true
            circleTHREE.isHidden = true
            circleFOUR.isHidden = true
            circleFIVE.isHidden = true
            circleSIX.isHidden = true
            gcircle.isHidden = true
        }
    }
    
    //if the passcode is a card and a passcode has been fully typed, segue to other VC
    func bigSwitch() {
        unlockLock()
        if codeIsValid() && presses == 6 {
            performSegue(withIdentifier: "switcher", sender: AnyObject.self)
        }
    }
    
    //print the passcode to see if buttons work properly
    func printcode() {
        code.isHidden = true
        if num % 100000 == num && num != 0{
            code.text = "0" + "\(num)"
        }
        else if num == 0{
            code.text = "000000"
        }
        else if num > 100000 {
            code.text = "\(num)"
        }
        else {
            code.text = "\(num)"
        }
        fillPrefix()
    }
    
    //output the number of corresponding card in a text outlet
    func fillPrefix()
    {
        ff.isHidden = true
        ff.text = "\(num/100)"
    }
    
    //show whether inputs are valid as the app runs
    func updateValidator() {
        validator.isHidden = true
        if codeIsValid() {
            validator.text = "true"
        }
        else {
            validator.text = "false"
        }
    }
    
    //fill in or unfill circles at the top of lock screen as passcode buttons are pressed
    func checkProgress() {
        if presses == 0{
            circleONE.isHidden = true
            circleTWO.isHidden = true
            circleTHREE.isHidden = true
            circleFOUR.isHidden = true
            circleFIVE.isHidden = true
            circleSIX.isHidden = true
        }
        if presses == 1 {
            circleONE.isHidden = false
            circleTWO.isHidden = true
            circleTHREE.isHidden = true
            circleFOUR.isHidden = true
            circleFIVE.isHidden = true
            circleSIX.isHidden = true
        }
        if presses == 2 {
            circleONE.isHidden = false
            circleTWO.isHidden = false
            circleTHREE.isHidden = true
            circleFOUR.isHidden = true
            circleFIVE.isHidden = true
            circleSIX.isHidden = true
        }
        if presses == 3 {
            circleONE.isHidden = false
            circleTWO.isHidden = false
            circleTHREE.isHidden = false
            circleFOUR.isHidden = true
            circleFIVE.isHidden = true
            circleSIX.isHidden = true
        }
        if presses == 4 {
            circleONE.isHidden = false
            circleTWO.isHidden = false
            circleTHREE.isHidden = false
            circleFOUR.isHidden = false
            circleFIVE.isHidden = true
            circleSIX.isHidden = true
        }
        if presses == 5 {
            circleONE.isHidden = false
            circleTWO.isHidden = false
            circleTHREE.isHidden = false
            circleFOUR.isHidden = false
            circleFIVE.isHidden = false
            circleSIX.isHidden = true
        }
        if presses == 6 {
            if codeIsValid() {
                circleONE.isHidden = false
                circleTWO.isHidden = false
                circleTHREE.isHidden = false
                circleFOUR.isHidden = false
                circleFIVE.isHidden = false
                circleSIX.isHidden = false
            }
            else {
                deleteButton.isHidden = true
                animateView.isHidden = false
                animate(imageView: animateView, images: circleImages)
                presses = 0
                num = 0
                circleONE.isHidden = true
                circleTWO.isHidden = true
                circleTHREE.isHidden = true
                circleFOUR.isHidden = true
                circleFIVE.isHidden = true
                circleSIX.isHidden = true
            }
        }

    }
    
    //change the number that represents a card as user presses buttons
    func updateNum(ber: Int) {
        presses = presses + 1;
        deleteButton.isHidden = true
        if presses > 0{
            deleteButton.isHidden = false
            if presses == 1{
                num = num + (ber*100000)
            }
            if presses == 2 {
                num = num + (ber*10000)
            }
            if presses == 3{
                num = num + (ber*1000)
            }
            if presses == 4{
                num = num + (ber*100)
            }
            if presses == 5{
                num = num + (ber*10)
            }
            if presses == 6{
                num = num + (ber*1)
            }
        }
        bigSwitch()
        updateValidator()
        checkProgress()
        controlPress()
        controlNum()
        printpress()
        printcode()
        
    }
    
    //make sure the input number is 0 if it does not correspond to a card
    func controlNum(){
        if presses > 6 {
            num = 0;
        }
    }
    
    //make sure number of presses is always between 0 and 6 inclusive
    func controlPress(){
        if presses < 0 {
            presses = 0
        }
        if presses > 6 {
            presses = 6
        }
    }
    
    //this "animates" the lock at the top of the lock screen
    func unlockLock(){
        if presses == 6 && codeIsValid(){
            flipLock.isHidden = false
        }
    }
    
    //check if the input corresponds to a card
    func codeIsValid() -> Bool
    {
        var check = 0
        if (num / 100 > 100 && num / 100 < 414)
        {
            if (num/100 % 100 <= 13 && num/100 % 100 >= 1)
            {
                check = check + 1
            }
            else
            {
                check = check + 0;
            }
        }
        if presses > 5 {
        }
        if check > 0
        {
            isValid = true
            return true
        }
        else
        {
            isValid = false
            return false
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        circleImages = createImageArray(total: 18, imagePrefix: "circle")
    }
    
    //perform segue to the card VC
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "switcher" {
            let destVC = segue.destination as! CardViewController
            destVC.newnum = num
        }
    }
    
    @IBAction func deleteNum(_ sender: UIButton) {
        if presses > 0 {
            if presses == 1 {
                presses = presses - 1
                checkProgress()
                num = 0
            }
            else if presses == 2 {
                presses = presses - 1
                checkProgress()
                num = num - num % 100000
            }
            else if presses == 3 {
                presses = presses - 1
                checkProgress()
                num = num - num % 10000
            }
            else if presses == 4 {
                presses = presses - 1
                checkProgress()
                num = num - num % 1000
            }
            else if presses == 5 {
                presses = presses - 1
                checkProgress()
                num = num - (num%100)
            }
            else {
                presses = presses - 1
                checkProgress()
                num = num - num % 10
            }
        }
        if presses == 0 {
            deleteButton.isHidden = true;
        }
        updateValidator()
        printpress()
        printcode()
        
    }
    

    @IBAction func tapOne(_ sender: UIButton) {
        if sender.isSelected {
            sender.isOpaque = false
        }
        sender.showsTouchWhenHighlighted = true;
        updateNum(ber: 1)
    }
    @IBAction func tapTwo(_ sender: UIButton) {
        sender.showsTouchWhenHighlighted = true;
        updateNum(ber: 2)
    }
    @IBAction func tapThree(_ sender: UIButton) {
        sender.showsTouchWhenHighlighted = true;
        updateNum(ber: 3)
    }
    @IBAction func tapFour(_ sender: UIButton) {
        sender.showsTouchWhenHighlighted = true;
        updateNum(ber: 4)
    }
    @IBAction func tapFive(_ sender: UIButton) {
        sender.showsTouchWhenHighlighted = true;
        updateNum(ber: 5)
    }
    @IBAction func tapSix(_ sender: UIButton) {
        sender.showsTouchWhenHighlighted = true;
        updateNum(ber: 6)
    }
    @IBAction func tapSeven(_ sender: UIButton) {
        sender.showsTouchWhenHighlighted = true;
        updateNum(ber: 7)
    }
    @IBAction func tapEight(_ sender: UIButton) {
        sender.showsTouchWhenHighlighted = true;
        updateNum(ber: 8)
    }
        
    @IBAction func tapNine (_ sender: UIButton) {
        sender.showsTouchWhenHighlighted = true
        updateNum(ber: 9)
    }
        
    @IBAction func tapZero(_ sender: UIButton) {
        sender.showsTouchWhenHighlighted = true;
        updateNum(ber: 0)
    }
    
}

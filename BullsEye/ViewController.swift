//
//  ViewController.swift
//  BullsEye
//
//  Created by Pawan on 03/12/17.
//  Copyright © 2017 Pawan. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var currentValue:Int = 0
    //MARK:IBOutlets
    @IBOutlet weak var slider:UISlider!
    @IBOutlet weak var targetLabel:UILabel!
    @IBOutlet weak var scoreLabel:UILabel!
    @IBOutlet weak var roundLabel:UILabel!
    var targetValue:Int = 0
    var scores = 0
    var ctr = 0
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let thumbImageNormal = UIImage(named:"SliderThumb-Normal")
        slider.setThumbImage(thumbImageNormal, for: .normal)
        
        let thumbImageHighlighted = UIImage(named:"SliderThumb-Highlidhted")
        slider.setThumbImage(thumbImageHighlighted, for: .highlighted)
        
        let insets = UIEdgeInsets(top: 0, left: 14, bottom: 0, right: 14)
        let trackLeftImage = UIImage(named:"SliderTrackLeft")
        let trackleftResizable = trackLeftImage?.resizableImage(withCapInsets: insets)
        slider.setMinimumTrackImage(trackleftResizable, for: .normal)
        
        
        let trackRightImage = UIImage(named:"SliderTrackRight")
        let trackRightResizable = trackRightImage?.resizableImage(withCapInsets: insets)
        slider.setMaximumTrackImage(trackRightResizable, for: .normal)
        
        
        currentValue = lroundf(slider.value)
        startOver()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    func startNewRound(){
        targetValue = 1 + Int(arc4random_uniform(100))
        targetLabel.text = String(targetValue)
         currentValue = 50
         slider.value = Float(currentValue)
        ctr += 1
        updateLabels()
        
    }

    
    
    @IBAction func startOver(){
        scores = 0
        ctr = 0
        startNewRound()
    }
    func updateLabels(){
        targetLabel.text = String(targetValue)
        scoreLabel.text = String(scores)
        roundLabel.text = String(ctr)
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    @IBAction func sliderMoved(_ slider:UISlider){
        print("The value of the slider is \(slider.value)")
        currentValue = lroundf(slider.value)
    }
    
    @IBAction func showAlert(){
        
        let difference:Int = abs(targetValue - currentValue)
//
//        difference = targetValue - currentValue
//
//        if difference < 0 {
//            difference = difference * (-1)
//        }
//
        var points = 100 - difference
       
        let title:String
        if difference == 0 {
            title = "Perfect!"
            points += 100
            
        } else if   difference < 5    {
            title = "You had it"
            if difference == 1 {
            points += 50
            }
        } else if difference < 10 {
            title = "Pretty good"
        } else {
            title = "You are too far keep trying..."
        }
        
        
         scores += points
//        if targetValue > currentValue {
//            difference = targetValue - currentValue
//        } else if targetValue < currentValue {
//            difference = currentValue - targetValue
//        } else {
//            difference = 0
//        }
        
        let message = "You scored \(points) points"
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let action = UIAlertAction(title: "Awesome", style: .default, handler: { action in self.startNewRound()
        }
        )
        alert.addAction(action)
        present(alert, animated: true, completion: nil)
        
    }


}


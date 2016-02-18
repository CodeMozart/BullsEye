//
//  ViewController.swift
//  BullsEye
//
//  Created by Minghe on 9/28/15.
//  Copyright © 2015 Minghor. All rights reserved.
//

import UIKit
import QuartzCore

class ViewController: UIViewController {
    
    @IBOutlet weak var slider: UISlider!
    @IBOutlet weak var targetLabel: UILabel!
    @IBOutlet weak var scoreLabel: UILabel!
    @IBOutlet weak var roundLabel: UILabel!
    
    // "var" used to "variable"
    
    var currentValue: Int = 0
    var targetValue: Int = 0
    var score = 0
    var round = 0

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let thumbImageNormal = UIImage(named: "SliderThumb-Normal")
        slider.setThumbImage(thumbImageNormal, forState: .Normal)
        
        let thumbImageHighlighted = UIImage(named: "SliderThumb-Highlighted")
        slider.setThumbImage(thumbImageHighlighted, forState: .Highlighted)
        
        let insets = UIEdgeInsets(top: 0, left: 14, bottom: 0, right: 14)
        
        if let trackLeftImage = UIImage(named: "SliderTrackLeft") {
            let trackLeftResizable = trackLeftImage.resizableImageWithCapInsets(insets)
            slider.setMinimumTrackImage(trackLeftResizable, forState: .Normal)
        }
        if let trackRightImage = UIImage(named: "SliderTrackRight") {
            let trackRightResizable = trackRightImage.resizableImageWithCapInsets(insets)
            slider.setMaximumTrackImage(trackRightResizable, forState: .Normal)
        }
        
        
        startNewRound()
    }


    @IBAction func showAlert(){
        
        // "let" used to "object"
        let difference = abs(targetValue - currentValue)
        var points = 100 - difference
        let title: String
        
        if difference == 0 {
            title = "Perfect!\nAnother 100 points bonous!"
            points += 100
        } else if difference < 5 {
            title = "You almost had it!"
        } else if difference < 10 {
            title = "Pretty good!"
        } else {
            title = "Not even close..."
        }
        score += points
        
        
        let message = "You scored \(points) points"
        
        let alert = UIAlertController(title: title, message: message, preferredStyle: .Alert)
        
        let action = UIAlertAction(title: "OK", style: .Default, handler: {
            // in "swift", you have to use "self" when you call a method in block("closure")
            action in self.startNewRound()
        })
        
        
        
        alert.addAction(action)
        
        presentViewController(alert, animated: true, completion: nil)

    }
    
    

    
    @IBAction func sliderMoved(slider: UISlider) {
        currentValue = lroundf(slider.value)
    }
    

    @IBAction func startOver(sender: AnyObject) {
        score = 0
        round = 0
        startNewRound()
        
        let transition = CATransition()
        transition.type = kCATransitionFade
        transition.duration = 1
        transition.timingFunction = CAMediaTimingFunction(name: kCAMediaTimingFunctionEaseOut)
        view.layer.addAnimation(transition, forKey: nil)
        
    }
    
    
    func startNewRound() {
        round++
        targetValue = 1 + Int(arc4random_uniform(100))
        currentValue = 50;
        // something’ is not convertible to ‘something else’
        // Swift is a so-called strongly typed language,you couldn't put a integer into a float type var.
        slider.value = Float(currentValue);
        
        updateLabels()
    }
    
    func updateLabels() {
        targetLabel.text = String(targetValue)
        //        targetLabel.text = "\(targetValue)"
        scoreLabel.text = String(score)
        roundLabel.text = "\(round)"
    }
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
}

















































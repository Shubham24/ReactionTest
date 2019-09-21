//
//  ViewController.swift
//  ReactionTest
//
//  Created by Machintosh on 7/20/19.
//  Copyright © 2019 Machintosh. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    var randomTime = Int.random(in: 1...5)
    var countdownTimer: Timer!
    var testRunning = false
    var stopWatch: Timer!
    var time: Double = 0.0
    
    

    @IBOutlet weak var resultLabel: UILabel!
    @IBOutlet weak var Button: UIButton!
    @IBAction func buttonPress(_ sender: Any) {
        if (!testRunning)
        {
            waitTime()
            testRunning = true
            randomTime = Int.random(in: 1...5)
            time = 0.0
            resultLabel.text = "Result: N/A"
        }
        else
        {
            Button.backgroundColor = UIColor(red:88/255, green: 86/255, blue: 214/255, alpha: 1)
            Button.setTitle("Tap to Start Test", for: .normal)
            testRunning = false
            stopWatch.invalidate()
            resultLabel.text = String(format: "Result: %.4f s", time)
            
        }
        
    }
    
    func startWatch()
    {
        stopWatch = Timer.scheduledTimer(timeInterval: 0.0001, target: self, selector: #selector(countTime), userInfo: nil, repeats: true)
    }
    
    func startTimer() {
        countdownTimer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(updateTime), userInfo: nil, repeats: true)
    }
    
    @objc func countTime()
    {
        time += 0.0001
    }
    
    @objc func updateTime() {
        
        
        if randomTime != 0 {
            randomTime -= 1
        } else {
            turnGreen()
        }
    }
    
    func waitTime()
    {
        Button.backgroundColor = UIColor(red:255/255, green: 59/255, blue: 48/255, alpha: 1)
        Button.setTitle("Wait for Green", for: .normal)
        Button.isEnabled = false
        startTimer()
    }
    
    @objc func turnGreen()
    {
        countdownTimer.invalidate()
        Button.isEnabled = true
        Button.backgroundColor = UIColor(red:76/255, green: 217/255, blue: 100/255, alpha: 1)
        Button.setTitle("Tap Button", for: .normal)
        startWatch()
        
    }
    
    
    
}


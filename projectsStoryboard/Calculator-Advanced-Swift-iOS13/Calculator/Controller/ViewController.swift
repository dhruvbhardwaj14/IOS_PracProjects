//
//  ViewController.swift
//  Calculator
//
//  Created by Angela Yu on 10/09/2019.
//  Copyright © 2019 London App Brewery. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var displayLabel: UILabel!
    
    private var isFinishedTypingNum:Bool=true
    
    private var displayValue:Double{
        get{
            guard let number=Double(displayLabel.text!) else{
                fatalError("Cannot Convert Display text to a Double.")
            }
            return number
        }
        set{
            displayLabel.text=String(newValue)
        }
    }
    private var calculator=CalculatorLogic()
    @IBAction func calcButtonPressed(_ sender: UIButton) {
        
        //What should happen when a non-number button is pressed
        isFinishedTypingNum=true
        calculator.setNumber(displayValue)
        if let calcmethod=sender.currentTitle{
            if let result=calculator.calculate(symbol: calcmethod){
                displayValue=result
            }
            
        }
        
    }

    
    @IBAction func numButtonPressed(_ sender: UIButton) {
        
        //What should happen when a number is entered into the keypad
        if let numValue=sender.currentTitle{
            if isFinishedTypingNum{
                displayLabel.text=numValue
                isFinishedTypingNum=false
            }else{
                if numValue=="."{
                    let isInt=floor(displayValue)==displayValue
                    if !isInt{return}
                }
                displayLabel.text=displayLabel.text!+numValue
            }
            
        }
    
    }

}


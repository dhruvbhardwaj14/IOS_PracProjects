//
//  ViewController.swift
//  Tipsy
//
//  Created by Angela Yu on 09/09/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit

class CalculatorViewController: UIViewController {

    @IBOutlet weak var billTextField: UITextField!
    @IBOutlet weak var zeroPctButton: UIButton!
    @IBOutlet weak var tenPctButton: UIButton!
    @IBOutlet weak var twentyPctButton: UIButton!
    @IBOutlet weak var splitNumberLabel: UILabel!
    
    var tip=0.10
    var numberOfPeople = 2
    var totalAmount=0.0
    
    @IBAction func tipChanged(_ sender: UIButton) {
        zeroPctButton.isSelected = false
       tenPctButton.isSelected = false
       twentyPctButton.isSelected = false
        sender.isSelected=true
    //Get the current title of the button that was pressed.
    let buttonTitle = sender.currentTitle!
    
    //Remove the last character (%) from the title then turn it back into a String.
    let buttonTitleMinusPercentSign =  String(buttonTitle.dropLast())
    
    //Turn the String into a Double.
    let buttonTitleAsANumber = Double(buttonTitleMinusPercentSign)!
    
    //Divide the percent expressed out of 100 into a decimal e.g. 10 becomes 0.1
    tip = buttonTitleAsANumber / 100
        
        //ending textfield keyboard
        billTextField.endEditing(true)
        
    }
    @IBAction func stepperValueChanged(_ sender: UIStepper) {
        splitNumberLabel.text = String(format: "%.0f", sender.value)
        
        numberOfPeople = Int(sender.value)
    }
    @IBAction func calculatePressed(_ sender: UIButton) {
        let bill=billTextField.text!
        if bill != ""{
            totalAmount=Double(bill)!
            
            let result=totalAmount*(1+tip)/Double(numberOfPeople)
            
            let resultTo2DecimalPlaces=String(format: "%.2f", result)
            print(resultTo2DecimalPlaces)
            totalAmount=Double(resultTo2DecimalPlaces) ?? 0.0
        }
        
        self.performSegue(withIdentifier: "goToResult", sender: self)
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "goToResult"{
            let destinationVc=segue.destination as! ResultsViewController
            destinationVc.share=String(totalAmount)
            destinationVc.tip=Int(tip*100)
            destinationVc.people=numberOfPeople
        }
    }
    
}


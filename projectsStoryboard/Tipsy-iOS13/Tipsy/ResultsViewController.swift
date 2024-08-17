//
//  ResultsViewController.swift
//  Tipsy
//
//  Created by Dhruv Bhardwaj on 05/11/22.
//  Copyright © 2022 The App Brewery. All rights reserved.
//

import UIKit

class ResultsViewController: UIViewController {
    
    @IBOutlet weak var totalLabel: UILabel!
    @IBOutlet weak var settingsLabel: UILabel!
    
    var share="0.0"
    var people=2
    var tip=10
    override func viewDidLoad() {
        super.viewDidLoad()
        totalLabel.text=share
        settingsLabel.text="Split between \(people) people, with \(tip)% tip"
    }
    @IBAction func recalculatePressed(_ sender: UIButton) {
        self.dismiss(animated: true)
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}

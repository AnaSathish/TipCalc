//
//  ViewController.swift
//  TipCalc
//
//  Created by Nandhana Sathish on 8/29/18.
//  Copyright © 2018 Nandhana Sathish. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var tipLabel: UILabel!
    @IBOutlet weak var totalLabel: UILabel!
    @IBOutlet weak var billField: UITextField!
    @IBOutlet weak var tipControl: UISegmentedControl!
    @IBOutlet weak var numOfPpl: UITextField!
    @IBOutlet weak var totalPerPerson: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor = UIColor.black
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


    @IBAction func onTap(_ sender: AnyObject) {
        view.endEditing(true)
    }
    
    @IBAction func calcTip(_ sender: AnyObject) {
    
    //Calculating bill per group
        let tipPercentages = [0.15, 0.20, 0.25]
        
        let bill = Double(billField.text!) ?? 0
        let tip = bill * tipPercentages[tipControl.selectedSegmentIndex]
        let total = bill + tip
        
        tipLabel.text = String(format: "$%.2f", tip)
        totalLabel.text = String(format: "$%.2f", total)
        
    //Calculating bill per person
        let numberOfPeople = Double(numOfPpl.text!) ?? 0
        
        if numOfPpl.text == "" {
            totalPerPerson.text = String(format: "$%.2f", (total))
        }
        else{
            totalPerPerson.text = String(format: "$%.2f", (total)/(numberOfPeople))
        }
        
    }
}


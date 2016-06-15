//
//  ViewController.swift
//  tippy
//
//  Created by Shea Ketsdever on 6/14/16.
//  Copyright © 2016 Shea Ketsdever. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var billField: UITextField!
    @IBOutlet weak var tipLabel: UILabel!
    @IBOutlet weak var totalLabel: UILabel!
    @IBOutlet weak var tipControl: UISegmentedControl!
    
   // @IBOutlet weak var tipPercentageLabel: UILabel!
   // @IBOutlet weak var tipSlider: UISlider!
    
    @IBOutlet weak var fourLabel: UILabel!
    @IBOutlet weak var threeLabel: UILabel!
    @IBOutlet weak var twoLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        //self.title = "Tip Calculator"
        billField.becomeFirstResponder()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func onTap(sender: AnyObject) {
        view.endEditing(true)
    }

    @IBAction func calculateTip(sender: AnyObject) {
        
        let tipPercentages = [0.18, 0.2, 0.25]
        
        let bill = Double(billField.text!) ?? 0
        let tip = bill * tipPercentages[tipControl.selectedSegmentIndex]
        let total = bill + tip
        tipLabel.text = String(format: "$%.2f", tip)
        totalLabel.text = String(format: "$%.2f", total)
        twoLabel.text = String(format: "$%.2f", (total / 2))
        threeLabel.text = String(format: "$%.2f", (total / 3))
        fourLabel.text = String(format: "$%.2f", (total / 4))
    }
    /*
    @IBAction func calculateTipSlider(sender: AnyObject) {
        
        tipPercentageLabel.text = String(format: "%3.0f", (100 * Double(tipSlider.value)))
        
        let bill = Double(billField.text!) ?? 0
        let tip = bill * Double(round(100*(tipSlider.value))/100)
        let total = bill + tip
        tipLabel.text = String(format: "$%.2f", tip)
        totalLabel.text = String(format: "$%.2f", total)
        twoLabel.text = String(format: "$%.2f", (total / 2))
        threeLabel.text = String(format: "$%.2f", (total / 3))
        fourLabel.text = String(format: "$%.2f", (total / 4))
        
    }*/
    
}


//
//  ViewController.swift
//  TipCalc
//
//  Created by Ivor D. Addo on 1/12/17.
//  Copyright © 2017 deHao. All rights reserved.
//

import UIKit

class ViewController: UIViewController {


    @IBOutlet weak var lblTotal: UILabel!
    @IBOutlet weak var lblTipAmount: UILabel!
    @IBOutlet weak var lblTipPercent: UILabel!
    @IBOutlet weak var txtBillAmount: UITextField!
    @IBOutlet weak var stpTip: UIStepper!
    
    @IBAction func stpTip_ValueChanged(_ sender: UIStepper) {

        // get the tip% and bill amount
        let tipPercent = Int(sender.value)
        
        // update the tip% label
        lblTipPercent.text = "\(tipPercent)% Tip"
        
        // calculate the total cost if bill amount is not the default
        if !(txtBillAmount.text ?? "").isEmpty
        {
            // use "!" to unwrap
            let billAmount = Double(txtBillAmount.text!)!
            let tipAmount = Double(sender.value/100) * billAmount
            let total = billAmount + tipAmount
            
            lblTipAmount.text = String(format: "$%.2f", tipAmount)
            lblTotal.text = String(format: "$%.2f", total)
        }
    }
    
    @IBAction func txtBillAmount_EditingChanged(_ sender: UITextField) {
        if !(txtBillAmount.text ?? "").isEmpty
        {
            let billAmount = Double(txtBillAmount.text!)!
            let tipAmount = Double(stpTip.value/100) * billAmount
            let total = billAmount + tipAmount
            
            lblTipAmount.text = String(format: "$%.2f", tipAmount)
            lblTotal.text = String(format: "$%.2f", total)
        }
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
}


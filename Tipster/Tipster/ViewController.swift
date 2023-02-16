//
//  ViewController.swift
//  Tipster
//
//  Created by Nuha Alharbi on 10/11/2022.
//

import UIKit

class ViewController: UIViewController {
    
    // MARK: - Outlets
    
    @IBOutlet weak var totalLabel: UILabel!
    @IBOutlet weak var groupSizeLabel: UILabel!
    @IBOutlet var TipPercentageLabels: [UILabel]!
    @IBOutlet var TipAmountLabels: [UILabel]!
    @IBOutlet var totalPlusTipLabels: [UILabel]!
    @IBOutlet weak var tipSlider: UISlider!
    @IBOutlet weak var groupSizeSlider: UISlider!
    
    // MARK: - Actions
    
    @IBAction func buttonPressed(_ sender: UIButton){
        updateTotalValue(pressedNumber: (sender.titleLabel?.text)!)
    }
    
    @IBAction func clearButtonPressed(_ sender: UIButton) {
        totalLabel.text = "0"
        updateValues()
    }
    
    @IBAction func tipSliderChanged(_ sender: UISlider) {
        var differentTipValue = 0
        TipPercentageLabels.forEach({ percent in
            percent.text = String(Int(tipSlider.value) + differentTipValue ) + "%"
            differentTipValue += 5
        })
        updateValues()
        
    }
    
    @IBAction func groupSizeSliderChanged(_ sender: UISlider) {
        groupSizeLabel.text? = "Group Size: \(Int(groupSizeSlider.value))"
        updateValues()
    }
    
    // MARK: - Functions
    
    func updateTotalValue(pressedNumber: String){
        totalLabel.text = totalLabel.text == "0" ? pressedNumber : (totalLabel.text!) + pressedNumber
        updateValues()
    }
    
    func updateValues(){
        
        let totalinDouble = Double(totalLabel.text!) ?? 0.0
        let groupSize = Double(Int(groupSizeSlider.value))
        var index = 0
        
        while index < 3 {
            
            let tipValue = Double((TipPercentageLabels[index].text?.dropLast(1))!)! // drop %
            let tipInFraction = tipValue / 100
            let tipAmount = totalinDouble * tipInFraction
            
            TipAmountLabels[index].text = String(format:"%.2f" , tipAmount / groupSize)
            totalPlusTipLabels[index].text = String(format:"%.2f",  (tipAmount + totalinDouble) / groupSize)
            index += 1
            
        }
    }
}


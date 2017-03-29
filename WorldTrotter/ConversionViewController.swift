//
//  ConversionViewController.swift
//  WorldTrotter
//
//  Created by Ashwani on 3/29/17.
//  Copyright © 2017 com.ashwani. All rights reserved.
//

import UIKit

class ConversionViewController: UIViewController, UITextFieldDelegate{
    
    @IBOutlet var celsiusLabel: UILabel!
    //var fahrenheitValue:Measurement<UnitTemperature>?
    @IBOutlet var textField: UITextField!
    
    var fahrenheitValue: Measurement<UnitTemperature>?{
        didSet{
            updateCelsiusLabel()
        }
    }
    
    var celsiusValue: Measurement<UnitTemperature>?{
        if let fahrenheitValue = fahrenheitValue{
            return fahrenheitValue.converted(to: .celsius)
        }else{
            return nil
        }
    }
    
    let numberFormatter: NumberFormatter = {
        let nf = NumberFormatter()
        nf.numberStyle = .decimal
        nf.minimumFractionDigits = 0
        nf.maximumFractionDigits = 1
        return nf
    }()
    
    func  textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange,
                    replacementString string: String) -> Bool{
       // print("Current text: \(textField.text)")
        //print("Replacement text: \(string)")
        //return true
        
        let existingTextHasDecimalSeparater = textField.text?.range(of: ".")
        let replacementTextHasDecimalSeparater = string.range(of: ".")
        
        if existingTextHasDecimalSeparater != nil,
            replacementTextHasDecimalSeparater != nil{
            return false
        }else{
            return true
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateCelsiusLabel()
    }
    
    func updateCelsiusLabel(){
        if let celsiusValue = celsiusValue{
            //celsiusLabel.text = "\(celsiusValue.value)"
            celsiusLabel.text = numberFormatter.string(from: NSNumber(value: celsiusValue.value))
        }else{
            celsiusLabel.text = "???"
        }
    }
    
    @IBAction func fahrenheitFieldEditingChanged(_ textField: UITextField){
        //celsiusLabel.text = textField.text
        
        //if let text = textField.text, !text.isEmpty {
        //    celsiusLabel.text = text
        //}else {
         //   celsiusLabel.text = "???"
        //}
        
        if let text = textField.text, let value = Double(text){
            fahrenheitValue = Measurement(value: value, unit: .fahrenheit)
        }else{
            fahrenheitValue = nil
        }
    }
    
    @IBAction func dismissKeyBoard(_ sender: UITapGestureRecognizer){
        textField.resignFirstResponder()
    }
}

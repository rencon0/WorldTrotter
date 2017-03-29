//
//  ConversionViewController.swift
//  WorldTrotter
//
//  Created by Ashwani on 3/29/17.
//  Copyright © 2017 com.ashwani. All rights reserved.
//

import UIKit

class ConversionViewController: UIViewController{
    
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
    
    
    
    func updateCelsiusLabel(){
        if let celsiusValue = celsiusValue{
            celsiusLabel.text = "\(celsiusValue.value)"
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

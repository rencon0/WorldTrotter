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
    @IBAction func fahrenheitFieldEditingChanged(_ textField: UITextField){
        //celsiusLabel.text = textField.text
        
        if let text = textField.text, !text.isEmpty {
            celsiusLabel.text = text
        }else {
            celsiusLabel.text = "???"
        }
    }
}

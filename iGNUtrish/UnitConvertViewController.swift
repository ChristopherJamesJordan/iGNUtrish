//
//  UnitConvertViewController.swift
//  iGNUtrish
//
//  Created by Jeremy S Granger on 3/25/15.
//  Copyright (c) 2015 Jeremy Granger. All rights reserved.
//

import UIKit

class UnitConvertViewController: UIViewController {
	
	var teaspoon = Unit(name: "Teaspoon", tablespoonRatio: 3, computedVal: 0)
	var tablespoon = Unit(name: "Tablespoon", tablespoonRatio: 1, computedVal: 0)
	var cup = Unit(name: "Cup", tablespoonRatio: 0.0625, computedVal: 0)
	var pint = Unit(name: "Pint", tablespoonRatio: 0.03125, computedVal: 0)
	var quart = Unit(name: "Quart", tablespoonRatio: 0.015625, computedVal: 0)
	var gallon = Unit(name: "Gallon", tablespoonRatio: 0.003906, computedVal: 0)
	var fluidOunce = Unit(name: "Fluid Ounce", tablespoonRatio: 0.5, computedVal: 0)

	@IBOutlet weak var tspnTextField: UITextField!
	@IBOutlet weak var tblspnTextField: UITextField!
	@IBOutlet weak var cpTextField: UITextField!
	@IBOutlet weak var ptTextField: UITextField!
	@IBOutlet weak var qtTextField: UITextField!
	@IBOutlet weak var gllnTextField: UITextField!
	@IBOutlet weak var flozTextField: UITextField!
	
	
    override func viewDidLoad() {
        super.viewDidLoad()
		
		tspnTextField.text = teaspoon.getTablespoonRatioString()
		tblspnTextField.text = tablespoon.getTablespoonRatioString()
		cpTextField.text = cup.getTablespoonRatioString()
		ptTextField.text = pint.getTablespoonRatioString()
		qtTextField.text = quart.getTablespoonRatioString()
		gllnTextField.text = gallon.getTablespoonRatioString()
		flozTextField.text = fluidOunce.getTablespoonRatioString()
		
		tspnTextField.addTarget(self, action:"edited", forControlEvents:UIControlEvents.EditingChanged)
		tblspnTextField.addTarget(self, action:"edited", forControlEvents:UIControlEvents.EditingChanged)
		cpTextField.addTarget(self, action:"edited", forControlEvents:UIControlEvents.EditingChanged)
		ptTextField.addTarget(self, action:"edited", forControlEvents:UIControlEvents.EditingChanged)
		qtTextField.addTarget(self, action:"edited", forControlEvents:UIControlEvents.EditingChanged)
		gllnTextField.addTarget(self, action:"edited", forControlEvents:UIControlEvents.EditingChanged)
		flozTextField.addTarget(self, action:"edited", forControlEvents:UIControlEvents.EditingChanged)
		

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
	
	func edited() {
		
		println("Edited \(tspnTextField.text)")
	}
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}

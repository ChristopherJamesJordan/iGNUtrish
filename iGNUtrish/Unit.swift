//
//  Unit.swift
//  iGNUtrish
//
//  Created by Jeremy S Granger on 3/29/15.
//  Copyright (c) 2015 Jeremy Granger. All rights reserved.
//

import Foundation

class Unit {
	var name: String? = ""
	var tablespoonRatio: Double = 0
	var computedVal: Double = 0
	
	init(name: String?, tablespoonRatio: Double, computedVal: Double) {
		self.name = name
		self.tablespoonRatio = tablespoonRatio
		self.computedVal = computedVal
	}
	
	func getTablespoonRatioString() -> String {
		
		let ratio = self.tablespoonRatio
		
		if (ratio % 1 == 0)
		{
			return String(format: "%.0f", ratio)
		}
		else
		{
			return String(format: "%.4f", ratio)
		}
	}
	
	
	
}

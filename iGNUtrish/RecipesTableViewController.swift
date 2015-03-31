//
//  RecipesTableViewController.swift
//  iGNUtrish
//
//  Created by Jeremy S Granger on 3/25/15.
//  Copyright (c) 2015 Jeremy Granger. All rights reserved.
//

import UIKit

class RecipesTableViewController: UITableViewController, UITableViewDelegate, UITableViewDataSource, UISearchBarDelegate, UISearchDisplayDelegate {
	
	var recipes = [String]()
	var filteredRecipes = [String]()
	var rec_images = [UIImage]()

    override func viewDidLoad() {
        super.viewDidLoad()
		
		tableView.registerNib(UINib(nibName: "RecipeTableCell", bundle: nil), forCellReuseIdentifier: "Cell")
		self.tableView.rowHeight = 78

		recipes = ["Egg Benedict", "Mushroom Risotto", "Full Breakfast", "Hamburger", "Ham and Egg Sandwich", "Creme Brelee", "White Chocolate Donut", "Starbucks Coffee", "Vegetable Curry", "Instant Noodle with Egg", "Noodle with BBQ Pork", "Japanese Noodle with Pork", "Green Tea", "Thai Shrimp Cake", "Angry Birds Cake", "Ham and Cheese Panini"] as Array
		
		rec_images.append(UIImage(named: "egg_benedict.jpg")!)
		rec_images.append(UIImage(named: "mushroom_risotto.jpg")!)
		rec_images.append(UIImage(named: "full_breakfast.jpg")!)
		rec_images.append(UIImage(named: "hamburger.jpg")!)
		rec_images.append(UIImage(named: "ham_and_egg_sandwich.jpg")!)
		rec_images.append(UIImage(named: "creme_brelee.jpg")!)
		rec_images.append(UIImage(named: "white_chocolate_donut.jpg")!)
		rec_images.append(UIImage(named: "starbucks_coffee.jpg")!)
		rec_images.append(UIImage(named: "vegetable_curry.jpg")!)
		rec_images.append(UIImage(named: "instant_noodle_with_egg.jpg")!)
		rec_images.append(UIImage(named: "noodle_with_bbq_pork.jpg")!)
		rec_images.append(UIImage(named: "japanese_noodle_with_pork.jpg")!)
		rec_images.append(UIImage(named: "green_tea.jpg")!)
		rec_images.append(UIImage(named: "thai_shrimp_cake.jpg")!)
		rec_images.append(UIImage(named: "angry_birds_cake.jpg")!)
		rec_images.append(UIImage(named: "ham_and_cheese_panini.jpg")!)
		
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        // #warning Potentially incomplete method implementation.
        // Return the number of sections.
        return 1
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete method implementation.
        // Return the number of rows in the section.
		if tableView == self.searchDisplayController!.searchResultsTableView {
			return self.filteredRecipes.count
		} else {
			return self.recipes.count
		}
		
    }

	
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("Cell", forIndexPath: indexPath) as RecipeTableCell

		var recipeChosen : String
		if tableView == self.searchDisplayController!.searchResultsTableView {
			recipeChosen = filteredRecipes[indexPath.row]
		} else {
			recipeChosen = recipes[indexPath.row]
		}
		cell.recipeName.text = recipeChosen as String
		cell.calories.text = "none"
		cell.recipeThumbnail.image = rec_images[indexPath.row]

        return cell
    }
	
	override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {

		let alertView = UIAlertController(title: "Row Selected", message: "You have selected a row", preferredStyle: .Alert)
		alertView.addAction(UIAlertAction(title: "Ok", style: .Default, handler: nil))
		presentViewController(alertView, animated: true, completion: nil)
		
	}
	
	override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
		recipes.removeAtIndex(indexPath.row)
		tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: UITableViewRowAnimation.Automatic)
	}
	
	// MARK: - Methods for Search Bar
	
	func filterContentForSearchText(searchText: String) {
		// Filter the array using the filter method
		self.filteredRecipes = self.recipes.filter({(recipe: String) -> Bool in
			let stringMatch = recipe.rangeOfString(searchText)
			return (stringMatch != nil)
		})
	}
	
	func searchDisplayController(controller: UISearchDisplayController!, shouldReloadTableForSearchString searchString: String!) -> Bool {
		filterContentForSearchText(searchString)
		return true
	}
 
	func searchDisplayController(controller: UISearchDisplayController!, shouldReloadTableForSearchScope searchOption: Int) -> Bool {
		filterContentForSearchText(self.searchDisplayController!.searchBar.text)
		return true
	}
	

    /*
    // Override to support conditional editing of the table view.
    override func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return NO if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        if editingStyle == .Delete {
            // Delete the row from the data source
            tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Fade)
        } else if editingStyle == .Insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(tableView: UITableView, moveRowAtIndexPath fromIndexPath: NSIndexPath, toIndexPath: NSIndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(tableView: UITableView, canMoveRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return NO if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using [segue destinationViewController].
        // Pass the selected object to the new view controller.
    }
    */

}

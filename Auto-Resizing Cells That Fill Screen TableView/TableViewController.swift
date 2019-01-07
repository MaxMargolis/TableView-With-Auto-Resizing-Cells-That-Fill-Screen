//
//  TableViewController.swift
//  Auto-Resizing Cells That Fill Screen TableView
//
//  Created by Max Margolis on 1/7/19.
//  Copyright © 2019 Max Margolis. All rights reserved.
//

import UIKit

class TableViewController: UITableViewController {
	
	private let dataArray : [String] = ["It was the best of times", "All happy families", "It is a truth universally acknowledged", "My name is Ishmael"]
	
	override func viewDidLoad() {
		super.viewDidLoad()
		
		//Needed for supporting Dynamic Type. Tells the TableView to use the Auto Layout constraints and the contents of its cells to determine each cell's height
		tableView.rowHeight = UITableView.automaticDimension
		
	}
	
	// MARK: - Table view data source
	
	override func numberOfSections(in tableView: UITableView) -> Int {
		return 1
	}
	
	override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
		return dataArray.count
	}
	
	
	override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
	let cell = tableView.dequeueReusableCell(withIdentifier: "ARMHTVCell", for: indexPath) as! AutoResizingMinHeightTableViewCell
	
	cell.cellLabel.text = dataArray[indexPath.row]
	cell.minHeight = minCellHeight()
	
	return cell
	}
	
	// MARK: - Table view delegate
	//Improves performance when using auto-resizing cells
	override func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {

		return minCellHeight()
	}
	
	
	// MARK: - Minimum Cell Height Calculation
	func minCellHeight() -> CGFloat {
		
		/*  Calculate the minimum cell height so that the cells of the tableview always at least fill the screen. Tableviews are often embedded in navigation controllers, so that is the implementation used in this sample project.
		*/
		let bottomOfNav = navigationController!.navigationBar.frame.maxY
		let tableHeight = tableView.frame.height - bottomOfNav
		
		return tableHeight / CGFloat(dataArray.count)
	}
	
}

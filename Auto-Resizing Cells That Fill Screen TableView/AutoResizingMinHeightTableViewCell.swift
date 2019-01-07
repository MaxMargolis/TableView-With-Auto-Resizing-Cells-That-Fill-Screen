//
//  AutoResizingMinHeightTableViewCell.swift
//  Auto-Resizing Cells That Fill Screen TableView
//
//  Created by Max Margolis on 1/7/19.
//  Copyright © 2019 Max Margolis. All rights reserved.
//

import UIKit

class AutoResizingMinHeightTableViewCell: UITableViewCell {
	
	@IBOutlet weak var cellLabel : UILabel!
	
	var minHeight: CGFloat?

    override func awakeFromNib() {
        super.awakeFromNib()
		
		//Uncomment below to figure out custom font names
//		UIFont.familyNames.forEach({ familyName in
//			let fontNames = UIFont.fontNames(forFamilyName: familyName)
//			print(familyName, fontNames)
//		})
		
		guard let futura = UIFont(name: "Futura-MediumItalic", size:30.0) else {
			fatalError("Failed to load custom font. Make sure the font file is included in the project and the font name is spelled corectly.")
		}
		
		//Set base font size
		cellLabel.font = UIFontMetrics(forTextStyle:.largeTitle).scaledFont(for: futura)
		
		//This setting tells the text control to adjust the text size based on the Dynamic Type setting provided by the user.
		cellLabel.adjustsFontForContentSizeCategory = true
		
		//allow text to take up more than one line
		cellLabel.numberOfLines = 0
    }
	
	// This is where the magic is for setting minimum cell heights on an auto-resizing cell
	override func systemLayoutSizeFitting(_ targetSize: CGSize, withHorizontalFittingPriority horizontalFittingPriority: UILayoutPriority, verticalFittingPriority: UILayoutPriority) -> CGSize {

		let size = super.systemLayoutSizeFitting(targetSize, withHorizontalFittingPriority: horizontalFittingPriority, verticalFittingPriority: verticalFittingPriority)
		guard let cellHeight = minHeight else {
			return size }
		return CGSize(width: size.width, height: max(size.height, cellHeight))
	}

	

}

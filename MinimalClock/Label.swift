/*
 *  Created by Mattia Rossini
 *  September 2018
 */

import AppKit

// Background
final class Label: NSTextField {
	override init(frame: NSRect) {
		super.init(frame: frame)
		drawsBackground = false
		isBezeled = false
		isSelectable = false
	}
	
	required init?(coder: NSCoder) {
		fatalError("Error")
	}
}

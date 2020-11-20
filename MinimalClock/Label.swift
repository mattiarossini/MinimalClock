import AppKit

/**
 Class for background
 - Author:  Mattia Rossini
 - Date:    November 2020
 - Version: 1.0
 */
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

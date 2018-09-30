/*
 *  Created by Mattia Rossini
 *  September 2018
 */

import AppKit

// Numbers and texts
final class View: NSView {

    // Numbers
	let textLabel: Label = {
		let label = Label()
		label.translatesAutoresizingMaskIntoConstraints = false
		label.textColor = .white
		label.alignment = .center
		return label
	}()
    
    // Text: hours and minutes
	let detailLabel: Label = {
		let label = Label()
		label.translatesAutoresizingMaskIntoConstraints = false
		label.textColor = .gray             // or use NSColor(white: 1, alpha: 0.5)
		label.alignment = .center
		return label
	}()


	// Initializers
	init() {
		super.init(frame: .zero)

		addSubview(textLabel)
		addSubview(detailLabel)

		NSLayoutConstraint.activate([
			textLabel.leadingAnchor.constraint(equalTo: leadingAnchor),
			textLabel.topAnchor.constraint(equalTo: topAnchor),
			textLabel.trailingAnchor.constraint(equalTo: trailingAnchor),
			textLabel.bottomAnchor.constraint(equalTo: detailLabel.topAnchor),
			detailLabel.leadingAnchor.constraint(equalTo: leadingAnchor),
			detailLabel.bottomAnchor.constraint(equalTo: bottomAnchor),
			detailLabel.trailingAnchor.constraint(equalTo: trailingAnchor) ])
	}
	
	required init?(coder: NSCoder) {
		fatalError("Error")
	}
}

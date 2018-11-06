import ScreenSaver

/**
 - Author:  Mattia Rossini
 - Date:    September 2018
 - Version: 1.0
 */
final class MinimalClockView: ScreenSaverView {

	private let hoursView: View = {
		let view = View()
		view.translatesAutoresizingMaskIntoConstraints = false
		view.detailLabel.stringValue = "HOURS"
		return view
	}()

	private let minutesView: View = {
		let view = View()
		view.translatesAutoresizingMaskIntoConstraints = false
		view.detailLabel.stringValue = "MINUTES"
		return view
	}()

	private let placesView: NSStackView = {
		let view = NSStackView()
		view.translatesAutoresizingMaskIntoConstraints = false
		view.isHidden = true
		return view
	}()


	// Initializers

	convenience init() {
		self.init(frame: .zero, isPreview: false)
	}

	override init!(frame: NSRect, isPreview: Bool) {
		super.init(frame: frame, isPreview: isPreview)
		initialize()
	}

	required init?(coder: NSCoder) {
		super.init(coder: coder)
		initialize()
	}
    

	// NSView

	override func draw(_ rect: NSRect) {
		NSColor.black.setFill()     // or use white
		NSBezierPath.fill(bounds)
	}


	// ScreenSaverView

	override func animateOneFrame() {
		placesView.isHidden = false

        let date = Date()
        let calendar = Calendar.current
        
        hoursView.textLabel.stringValue = String(format: "%02d", calendar.component(.hour, from: date))
        minutesView.textLabel.stringValue = String(format: "%02d", calendar.component(.minute, from: date))
    }

	private func initialize() {
		placesView.addArrangedSubview(hoursView)
		placesView.addArrangedSubview(minutesView)
		addSubview(placesView)

		updateFonts()

		addConstraints([ placesView.centerXAnchor.constraint(equalTo: centerXAnchor), placesView.centerYAnchor.constraint(equalTo: centerYAnchor) ])
	}

    
	// Update the font
	private func updateFonts() {
		placesView.spacing = floor(bounds.width * 0.05)

		let places = [hoursView, minutesView]
        let textFont = font(withSize: round(bounds.width / 6), weight: .ultraLight)
        let detailFont = font(withSize: floor(bounds.width / 30))

		for place in places {
			place.textLabel.font = textFont
			place.detailLabel.font = detailFont
		}
	}

	// Font
    private func font(withSize fontSize: CGFloat, weight: NSFont.Weight = .thin, isMonospace monospace: Bool = true) -> NSFont {
        let font = NSFont.systemFont(ofSize: fontSize, weight: weight)

		let fontDescriptor: NSFontDescriptor
		if monospace {
            fontDescriptor = font.fontDescriptor.addingAttributes([ .featureSettings: [[
                    NSFontDescriptor.FeatureKey.typeIdentifier: kNumberSpacingType,
                    NSFontDescriptor.FeatureKey.selectorIdentifier: kMonospacedNumbersSelector ]]
			])
		} else {
			fontDescriptor = font.fontDescriptor
		}

		return NSFont(descriptor: fontDescriptor, size: max(4, fontSize))!
	}
}

//
//  Coalition.swift
//  Project-01
//
//  Created by Anton Ivanov on 15.08.2022.
//

import UIKit

//   MARK: - Coalition
enum Coalition {

	case honeyBadger
	case salamander
	case alpaca
	case capybara

	var color: UIColor {
		switch self {
		case .honeyBadger:
			return #colorLiteral(red: 0.3224513531, green: 0.6428016424, blue: 0.7660235763, alpha: 1)
		case .salamander:
			return #colorLiteral(red: 0.6676233411, green: 0.3222340643, blue: 0.7639862299, alpha: 1)
		case .alpaca:
			return #colorLiteral(red: 0.4161266387, green: 0.765271306, blue: 0.3229559958, alpha: 1)
		case .capybara:
			return #colorLiteral(red: 0.7176463008, green: 0.1120086536, blue: 0.1088650599, alpha: 1)
		}
	}


}


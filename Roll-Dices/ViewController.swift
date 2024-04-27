//
//  ViewController.swift
//  Roll-Dices
//
//  Created by Илья Сичкаренко on 27.04.2024.
//

import UIKit

class ViewController: UIViewController {
	
	@IBOutlet private weak var diceFirstUIImageView: UIImageView!
	@IBOutlet private weak var diceSecondUIImageView: UIImageView!
	@IBOutlet private weak var rollUIButton: UIButton!
	@IBOutlet private weak var historyLogUITextView: UITextView!
	
	override func viewDidLoad() {
		super.viewDidLoad()
		historyLogUITextView.text = newDateFormatter() + ": Добро пожаловать!"
	}
	
	private func randomRoll(_ dices: UIImageView...) {
		for dice in dices {
			switch Int.random(in: 1...6) {
				case 1: dice.image = UIImage(named: "diceOne")
				case 2: dice.image = UIImage(named: "diceTwo")
				case 3: dice.image = UIImage(named: "diceThree")
				case 4: dice.image = UIImage(named: "diceFour")
				case 5: dice.image = UIImage(named: "diceFive")
				case 6: dice.image = UIImage(named: "diceSix")
				default: break
			}
			
			
		}
	}
	
	private func isWin() {
		if diceFirstUIImageView.image == diceSecondUIImageView.image {
			historyLogUITextView.text = "\(newDateFormatter()): ТЫ ПОБЕДИЛ!" + historyLogUITextView.text
		} else { historyLogUITextView.text = "\(newDateFormatter()): Ты проиграл!" + historyLogUITextView.text
			
		}
	}
	
	private func newDateFormatter() -> String {
		var date = Date()
		var currentDate = DateFormatter()
		currentDate.dateFormat = "dd:MM:yy hh:mm:ss"
		var resDate = currentDate.string(from: date)
		return resDate
	}
	
	@IBAction func roll(_ sender: Any) {
		randomRoll(diceFirstUIImageView,diceSecondUIImageView)
		isWin()
	}
	
	
}


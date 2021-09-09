//
//  ViewController.swift
//  Kadai6Sauna
//
//  Created by KS on 2021/09/04.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak private var questionLabel: UILabel!
    @IBOutlet weak private var questionSlider: UISlider!
    @IBOutlet weak private var resultButton: UIButton!
    @IBOutlet weak private var lowerLabel: UILabel!
    @IBOutlet weak private var upperLabel: UILabel!

    private var randomNum = 0
    private static let randomRange = 1...100

    override func viewDidLoad() {
        super.viewDidLoad()
        questionSlider.minimumValue = Float(Self.randomRange.lowerBound)
        questionSlider.maximumValue = Float(Self.randomRange.upperBound)

        lowerLabel.text = String(Self.randomRange.lowerBound)
        upperLabel.text = String(Self.randomRange.upperBound)
        
        resetGame()
    }

    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        resultButton.layer.cornerRadius = 20
    }

    @IBAction private func resultButtonDidTapped(_ sender: Any) {
        let selectSliderNum = Int(questionSlider.value)
        showResultAlert(selectSliderNum: selectSliderNum)
    }

    private func showResultAlert(selectSliderNum: Int) {
        if randomNum == selectSliderNum {
            alert(message: "あたり！  \n あなたの値: \(selectSliderNum)")
        } else {
            alert(message: "はずれ！  \n あなたの値:\(selectSliderNum)")
        }
        resetGame()
    }

    private func alert(message: String) {
        let alertController = UIAlertController(title: "結果", message: message, preferredStyle: .alert)
        let alertAction = UIAlertAction(title: "再挑戦", style: .default)
        alertController.addAction(alertAction)
        present(alertController, animated: true, completion: nil)
    }

    private func resetGame() {
          randomNum = Int.random(in: 1...100)
          questionLabel.text = String(randomNum)
      }
}

//
//  ViewController.swift
//  Kadai6Sauna
//
//  Created by KS on 2021/09/04.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var questionLabel: UILabel!
    @IBOutlet weak var questionSlider: UISlider!
    @IBOutlet weak var resultButton: UIButton!

    private var randomNum = arc4random_uniform(100)

    override func viewDidLoad() {
        super.viewDidLoad()
        questionLabel.text = String(randomNum)
    }

    override func viewDidLayoutSubviews() {
        resultButton.layer.cornerRadius = 20
    }

    @IBAction func resultButtonDidTapped(_ sender: Any) {
        let selectSliderNum = Int(questionSlider.value * 100)
        showResultAlert(selectSliderNum: selectSliderNum)
    }

    private func showResultAlert(selectSliderNum:Int){

        if randomNum == selectSliderNum{
            alert(message: "あたり！ + \n あなたの値: \(selectSliderNum)")
        }else{
            alert(message: "はずれ！ + \n あなたの値:\(selectSliderNum)")
        }
        randomNum = arc4random_uniform(100)
        questionLabel.text = String(randomNum)
    }

    private func alert(message:String){
        let alertController = UIAlertController(title: "結果", message: message, preferredStyle: .alert)
        let alertAction = UIAlertAction(title: "再挑戦", style: .default)
        alertController.addAction(alertAction)
        present(alertController, animated: true, completion: nil)
    }
}


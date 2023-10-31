//
//  ViewController.swift
//  Counter
//
//  Created by Oleg Startsev on 29.10.2023.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet fileprivate weak var buttonPlus: UIButton!
    @IBOutlet fileprivate weak var buttonMinus: UIButton!
    @IBOutlet fileprivate weak var buttonRefresh: UIButton!
    @IBOutlet fileprivate weak var labelCounterValue: UILabel!
    @IBOutlet fileprivate weak var textViewHistory: UITextView!
    fileprivate var counter: uint = 0
    fileprivate var text = "0"
    fileprivate var time = Date().formatted(date: .abbreviated, time: .shortened)
    fileprivate var history = "История изменений:"
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction fileprivate func plusButtonPushed(_ sender: Any) {
        
        time = Date().formatted(date: .abbreviated, time: .shortened)
        
        if counter < uint.max {
            counter += 1
            history.append("\n[\(time)]: значение изменено на +1")
            
            text = "Значение счётчика: \(counter)"
            labelCounterValue.text = text
        } else {
            history.append("\n[\(time)]: попытка увеличить значение счётчика выше максимального значения")
        }
        textViewHistory.text = history
    }
    
    
    @IBAction fileprivate func minusButtonPushed(_ sender: Any) {
        
        time = Date().formatted(date: .abbreviated, time: .shortened)
        
        if counter > 0 {
            counter -= 1
            history.append("\n[\(time)]: значение изменено на -1")
            
            text = "Значение счётчика: \(counter)"
            labelCounterValue.text = text
            
        } else {
            history.append("\n[\(time)]: попытка уменьшить значение счётчика ниже 0")
        }
        textViewHistory.text = history
    }
    
    @IBAction fileprivate func refreshButtonDidTap(_ sender: Any) {
        counter = 0
        
        time = Date().formatted(date: .abbreviated, time: .shortened)
        history.append("\n[\(time)]: значение сброшено")
        textViewHistory.text = history
        
        text = "Значение счётчика: \(counter)"
        labelCounterValue.text = text
    }
}


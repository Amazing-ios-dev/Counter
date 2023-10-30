//
//  ViewController.swift
//  Counter
//
//  Created by Oleg Startsev on 29.10.2023.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var UIButtonPlus: UIButton!
    @IBOutlet weak var UIButtonMinus: UIButton!
    @IBOutlet weak var UIButtonRefresh: UIButton!
    @IBOutlet weak var UILabelCounterValue: UILabel!
    @IBOutlet weak var UITextViewHistory: UITextView!
    
    private var counter: uint = 0
    private var text = "0"
    private var time = Date().formatted(date: .abbreviated, time: .shortened)
    private var history = "История изменений:"
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func plusButtonPushed(_ sender: Any) {
        
        time = Date().formatted(date: .abbreviated, time: .shortened)
        
        if counter < uint.max {
            counter += 1
            history.append("\n[\(time)]: значение изменено на +1")
            
            text = "Значение счётчика: \(counter)"
            UILabelCounterValue.text = text
        } else {
            history.append("\n[\(time)]: попытка увеличить значение счётчика выше максимального значения")
        }
        UITextViewHistory.text = history
    }
    
    
    @IBAction func minusButtonPushed(_ sender: Any) {
        
        time = Date().formatted(date: .abbreviated, time: .shortened)
        
        if counter > 0 {
            counter -= 1
            history.append("\n[\(time)]: значение изменено на -1")
            
            text = "Значение счётчика: \(counter)"
            UILabelCounterValue.text = text
            
        } else {
            history.append("\n[\(time)]: попытка уменьшить значение счётчика ниже 0")
        }
        UITextViewHistory.text = history
    }
    
    @IBAction func refreshButtonDidTap(_ sender: Any) {
        counter = 0
        
        time = Date().formatted(date: .abbreviated, time: .shortened)
        history.append("\n[\(time)]: значение сброшено")
        UITextViewHistory.text = history
        
        text = "Значение счётчика: \(counter)"
        UILabelCounterValue.text = text
    }
}


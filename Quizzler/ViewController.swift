//
//  ViewController.swift
//  Quizzler
//
//  Created by verebes on 25/08/2017.
//  Copyright (c) 2017 AD Progress. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    //Place your instance variables here
    let allQuestions = QuestionBank()
    var currentQuestion = 0
    var score = 0 {
        didSet {
            updateUI()
        }
    }
    
    
    @IBOutlet weak var questionLabel: UILabel!
    @IBOutlet weak var scoreLabel: UILabel!
    @IBOutlet var progressBar: UIView!
    @IBOutlet weak var progressLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateUI()
    }
    
    
    @IBAction func answerPressed(_ sender: AnyObject) {
        let pickedAnswer: Bool
        if sender.tag == 1 {
            pickedAnswer = true
        } else {
            pickedAnswer = false
        }
        checkAnswer(selectedAnswer: pickedAnswer)
    }
    
    
    func updateUI() {
        questionLabel.text = allQuestions.list[currentQuestion].questionText
        progressLabel.text = "\(currentQuestion + 1)/13"
        scoreLabel.text = "Score: \(score)"
        progressBar.frame.size.width = (view.frame.size.width / 13) * CGFloat(currentQuestion + 1)
    }
    
    
    func nextQuestion() {
        if currentQuestion < 12 {
            currentQuestion += 1
            updateUI()
        } else {
            let alert = UIAlertController(title: "Great", message: "You have finished the quiz do you want to start over?", preferredStyle: .alert)
            
            let restartAction = UIAlertAction(title: "Restart", style: .default, handler: { (UIAlertAction) in
                self.startOver()
            })
            alert.addAction(restartAction)
            present(alert, animated: true, completion: nil)
        }
        
    }
    
    
    func checkAnswer(selectedAnswer: Bool) {
        if allQuestions.list[currentQuestion].answer == selectedAnswer {
            ProgressHUD.showSuccess("Correct") //This is an imported ObjC library in supporting files
            score += 1
            nextQuestion()
        } else {
            ProgressHUD.showError("Wrong")
            nextQuestion()
        }
    }
    
    
    func startOver() {
        currentQuestion = 0
        score = 0
        updateUI()
    }
    
    
    
}

//
//  ViewController.swift
//  QuestionBotProgramaticamente
//
//  Created by Luis Servicio on 17/01/18.
//  Copyright © 2018 Luis Morelos. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    let responseLabel: UILabel = {
        let response = UILabel()
        response.text = "Soy la caracola Mágica \rHazme una pregunta"
        response.font = UIFont.systemFont(ofSize: 17)

        response.translatesAutoresizingMaskIntoConstraints = false
        response.numberOfLines = 0
        return response
    }()
    
    let askButton: UIButton = {
        let button = UIButton()
        button.setTitle("Ask", for: .normal)
        button.layer.cornerRadius = 5.0
        button.isEnabled = false
        button.backgroundColor = UIColor(displayP3Red: 0, green: 0, blue: 255, alpha: 0.39)
        button.addTarget(self, action: #selector(askButtonTapped), for: .touchUpInside)
        
        return button
    }()
    
    let questionField: UITextField = {
        let field = UITextField()
        field.backgroundColor = .white
        field.placeholder = "Preguntale a la caracola..."
        field.font = UIFont.systemFont(ofSize: 14)
        field.textColor = UIColor.black
        field.layer.cornerRadius = 5.0
        field.addTarget(self, action: #selector(editingChanged), for: .editingChanged)
        return field
    }()
    
    let questionAnswerer = MyQuestionAnswerer()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.title = "Caracola Mágica"
        questionField.becomeFirstResponder()
        
        view.backgroundColor = UIColor.lightGray
        let robotLabel: UILabel = {
            let labelR = UILabel()
            labelR.text = "🐚"
            labelR.font = UIFont.systemFont(ofSize: 50)
            labelR.translatesAutoresizingMaskIntoConstraints = false
            labelR.layer.borderColor = UIColor.blue.cgColor
            return labelR
        }()
        
        let horizontalStack: UIStackView = {
            let stackH = UIStackView()
            stackH.addArrangedSubview(robotLabel)
            stackH.addArrangedSubview(responseLabel)
            stackH.translatesAutoresizingMaskIntoConstraints = false
            stackH.axis = .horizontal
            
            return stackH
        }()
        
        let verticalStack: UIStackView = {
            let stackV = UIStackView()
            stackV.addArrangedSubview(horizontalStack)
            stackV.addArrangedSubview(questionField)
            stackV.addArrangedSubview(askButton)
            stackV.translatesAutoresizingMaskIntoConstraints = false
            stackV.axis = .vertical
            stackV.spacing = 5
            stackV.alignment = .fill
            stackV.distribution = .equalSpacing
            stackV.contentMode = .scaleToFill
            return stackV
        }()
        
        view.addSubview(verticalStack)
        
        askButton.heightAnchor.constraint(equalToConstant: 44).isActive = true
        questionField.heightAnchor.constraint(equalToConstant: 100).isActive = true
        responseLabel.heightAnchor.constraint(lessThanOrEqualToConstant: 100).isActive = true
        verticalStack.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 5).isActive = true
        verticalStack.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -5).isActive = true
        
        
        verticalStack.topAnchor.constraint(equalTo: view.topAnchor, constant: 90).isActive = true
        robotLabel.heightAnchor.constraint(equalToConstant: 60).isActive = true
        robotLabel.widthAnchor.constraint(equalToConstant: 54).isActive = true
        
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    func respondToQuestion(_ question: String) {
        let answer = questionAnswerer.responseTo(question: question)
        
        displayAnswerTextOnScreen(answer)
        questionField.placeholder = "Ask another question..."
        questionField.text = nil
        askButton.isEnabled = false
        askButton.backgroundColor = UIColor(displayP3Red: 0, green: 0, blue: 255, alpha: 0.39)
        
        print("questionAnswered")
        
    }
    
    @objc func askButtonTapped(_ sender: AnyObject) {
        guard questionField.text != nil else {
            return
        }
        
        textFieldDidEndEditing(questionField)
        questionField.resignFirstResponder()
        print("buttontaped")
    }
    
    
    
    func displayAnswerTextOnScreen(_ answer: String) {
        responseLabel.text = answer
    }
}
extension ViewController: UITextFieldDelegate {
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return false
    }
    func textFieldDidEndEditing(_ textField: UITextField) {
        guard let text = textField.text else {
            return
        }
            
        respondToQuestion(text)
        
    }
        
    @objc func editingChanged(_ textField: UITextField) {
        guard let text = textField.text else {
            askButton.isEnabled = false
            askButton.backgroundColor = UIColor(displayP3Red: 0, green: 0, blue: 255, alpha: 0.39)
            return
        }
        if text.isEmpty == true{
            askButton.isEnabled = false
            askButton.backgroundColor = UIColor(displayP3Red: 0, green: 0, blue: 255, alpha: 0.39)
        }else {
            askButton.isEnabled = true
            askButton.backgroundColor = UIColor.blue
        }
    }
}








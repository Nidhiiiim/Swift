//
//  ViewController.swift
//  CalculatorWithoutStoryboard
//
//  Created by Nidhi Mishra on 3/20/23.
//

import UIKit

enum Operations {
    case add
    case subtract
    case mod
    case divide
    case multiply
}

class ViewController: UIViewController {
    // to save operations
    var storedbuttonVal = 0
    var savedOperations: Operations?
    var operationPressed: Bool = false
    
    let label: UILabel = {
        let l = UILabel()
        //giving constraints
        l.translatesAutoresizingMaskIntoConstraints =  false
        l.textAlignment = .right
        // stops giving all default constraints
        l.text = "0"
    
        return l
    }()
    // declaring a label closure instance of class UILabel
    
    let mainStackView: UIStackView = {
        let mainStack = UIStackView()
        mainStack.axis = .vertical
        mainStack.alignment = .fill
        mainStack.distribution = .fillEqually
        mainStack.spacing = 1
        mainStack.translatesAutoresizingMaskIntoConstraints =  false
        return mainStack
    }()
    
    let firstStackView: UIStackView = {
        let mainStack = UIStackView()
        mainStack.axis = .horizontal
        mainStack.alignment = .fill
        mainStack.distribution = .fillEqually
        mainStack.spacing = 1
        return mainStack
    }()
    
    let secondStackView: UIStackView = {
        let mainStack = UIStackView()
        mainStack.axis = .horizontal
        mainStack.alignment = .fill
        mainStack.distribution = .fillEqually
        mainStack.spacing = 1
        return mainStack
    }()
    
    let thirdStackView: UIStackView = {
        let mainStack = UIStackView()
        mainStack.axis = .horizontal
        mainStack.alignment = .fill
        mainStack.distribution = .fillEqually
        mainStack.spacing = 1
        return mainStack
    }()
    
    let forthStackView: UIStackView = {
        let mainStack = UIStackView()
        mainStack.axis = .horizontal
        mainStack.alignment = .fill
        mainStack.distribution = .fillEqually
        mainStack.spacing = 1
        return mainStack
    }()
    
    let fifthStackView: UIStackView = {
        let mainStack = UIStackView()
        mainStack.axis = .horizontal
        mainStack.alignment = .fill
        mainStack.distribution = .fillEqually
        mainStack.spacing = 1
        return mainStack
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        //self.view.backgroundColor = .black
        view.addSubview(label)
        //adding button to first stack view
        firstStackView.addArrangedSubview(createButton(title: "%", color: .gray, action: #selector(operationAction)))
        firstStackView.addArrangedSubview(createButton(title: "+/-", color: .gray, action: #selector(operationAction)))
        firstStackView.addArrangedSubview(createButton(title: "AC", color: .gray, action: #selector(operationAction)))
        firstStackView.addArrangedSubview(createButton(title: "/", color: .orange, action: #selector(operationAction)))
        
        mainStackView.addArrangedSubview(label)
        // adding first stack into main stack
        mainStackView.addArrangedSubview(firstStackView)
        
        //adding button to first stack view
        secondStackView.addArrangedSubview(createButton(title: "7"))
        secondStackView.addArrangedSubview(createButton(title: "8"))
        secondStackView.addArrangedSubview(createButton(title: "9"))
        secondStackView.addArrangedSubview(createButton(title: "x", color: .orange, action: #selector(operationAction)))
        
        // adding first stack into main stack
        mainStackView.addArrangedSubview(secondStackView)

        
        //adding button to first stack view
        thirdStackView.addArrangedSubview(createButton(title: "4"))
        thirdStackView.addArrangedSubview(createButton(title: "5"))
        thirdStackView.addArrangedSubview(createButton(title: "6"))
        thirdStackView.addArrangedSubview(createButton(title: "-", color: .orange, action: #selector(operationAction)))
        
        // adding first stack into main stack
        mainStackView.addArrangedSubview(thirdStackView)
        
        //adding button to first stack view
        forthStackView.addArrangedSubview(createButton(title: "1"))
        forthStackView.addArrangedSubview(createButton(title: "2"))
        forthStackView.addArrangedSubview(createButton(title: "3"))
        forthStackView.addArrangedSubview(createButton(title: "+", color: .orange, action: #selector(operationAction)))
        
        // adding first stack into main stack
        mainStackView.addArrangedSubview(forthStackView)
        
        let sixthStackView = UIStackView()
        sixthStackView.axis = .horizontal
        sixthStackView.alignment = .fill
        sixthStackView.distribution = .fillEqually
        sixthStackView.addArrangedSubview(createButton(title: "."))
        sixthStackView.addArrangedSubview(createButton(title: "=", color: .orange, action: #selector(operationAction)))
        
        fifthStackView.addArrangedSubview(createButton(title: "0"))
        fifthStackView.addArrangedSubview(sixthStackView)
        
        mainStackView.addArrangedSubview(fifthStackView)
        
        //Adding main stack in view
        self.view.addSubview(mainStackView)
        
        //Constraints
        let safeArea = self.view.safeAreaLayoutGuide
        NSLayoutConstraint.activate([
            mainStackView.topAnchor.constraint(equalTo: safeArea.topAnchor),
            mainStackView.bottomAnchor.constraint(equalTo: safeArea.bottomAnchor),
            mainStackView.trailingAnchor.constraint(equalTo: safeArea.trailingAnchor),
            mainStackView.leadingAnchor.constraint(equalTo: safeArea.leadingAnchor),
        ])
    }
    
    func createButton(title:String, color: UIColor = .blue, action: Selector = #selector(numPadAction)) -> UIButton{
        let button = UIButton()
        button.setTitle(title, for: .normal)
        button.backgroundColor =  color
        //like to implement an action we use
        button.addTarget(self, action: action , for: .touchUpInside)
        return button
        
    }
    
    @objc func numPadAction(_ sender: UIButton){
        if operationPressed {
            operationPressed = false
            label.text = "0"
        }
        let firstValue = label.text == "0" ? "" : (label.text ?? "")
        label.text = firstValue + (sender.titleLabel?.text ?? "")
        
    }
    
    @objc func operationAction(_ sender: UIButton){
        guard let text = sender.titleLabel?.text,
              let firstStringVal = label.text,
              let intFirstVal = Int(firstStringVal) else{
            return
        }
        
        switch text{
        case "+":
            savedOperations = .add
            storedbuttonVal = intFirstVal
            operationPressed = true
            
        case "-":
            savedOperations = .subtract
            storedbuttonVal = intFirstVal
            operationPressed = true
        case "/":
            savedOperations = .divide
            storedbuttonVal = intFirstVal
            operationPressed = true
        case "*":
            savedOperations = .multiply
            storedbuttonVal = intFirstVal
            operationPressed = true
        case "%":
            savedOperations = .mod
            storedbuttonVal = intFirstVal
            operationPressed = true
        case "AC":
            label.text = "0"
        case "+/-":
            storedbuttonVal = -1 * intFirstVal
        case "=":
            handleResult(firstValue: intFirstVal, SecondValue: storedbuttonVal)
        default:
            return
        }
    }

    func handleResult(firstValue:Int, SecondValue:Int){
        guard let savedOperations = savedOperations else{
            return
        }
        
        switch savedOperations {
        case .add:
            label.text = String(describing: firstValue + SecondValue)
        case .subtract:
            label.text = String(describing: firstValue - SecondValue)
        case .mod:
            label.text = String(describing: firstValue % SecondValue)
        case .divide:
            label.text = String(describing: firstValue / SecondValue)
        case .multiply:
            label.text = String(describing: firstValue * SecondValue)
        }
        storedbuttonVal = 0
    }
}


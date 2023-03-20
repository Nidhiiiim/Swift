//
//  ViewController.swift
//  Calculator
//
//  Created by Nidhi Mishra on 3/10/23.
// Method ONE - BASIC CALCULATOR

import UIKit

class ViewController: UIViewController {
    var mySecondVariable: String = ""
    var myOperation: String = "" {
        didSet{
            operationPerformed()
        }
    }
    var myFirstVariable: String = "" {
        didSet{
            labelSet()
            
        }
    }
    @IBOutlet weak var labelReference: UILabel!
    
    func labelSet() {
        labelReference.text = myFirstVariable
        
    }
    
    func operationPerformed(){
        mySecondVariable = myFirstVariable
        myFirstVariable = "0"
    }
    


    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    
// Operations
    @IBAction func resetPressed(_ sender: UIButton) {
        myFirstVariable = "0"
        labelReference.text = myFirstVariable
    }
    @IBAction func negatePressed(_ sender: UIButton) {
        sender.backgroundColor = .white
        sender.tintColor = .black
        myOperation = "Negate"
    }
    @IBAction func modPressed(_ sender: UIButton) {
        sender.backgroundColor = .white
        sender.tintColor = .black
        myOperation = "mod"
        
    }
    @IBAction func dividePressed(_ sender: UIButton) {
        sender.backgroundColor = .white
        sender.tintColor = .black
        myOperation = "divide"
    }
    @IBAction func multiplyPressed(_ sender: UIButton) {
        sender.backgroundColor = .white
        sender.tintColor = .black
        myOperation = "multiply"
    }
    @IBAction func subtractPressed(_ sender: UIButton) {
        sender.backgroundColor = .white
        sender.tintColor = .black
        myOperation = "subtract"
    }
    @IBAction func addPressed(_ sender: UIButton) {
        sender.backgroundColor = .white
        sender.tintColor = .black
        myOperation = "add"
        
    }
    
    
    @IBAction func equalPressed(_ sender: UIButton) {
        
        switch myOperation{
        case "add":
            labelReference.text = "\(Int(myFirstVariable)! + Int(mySecondVariable)!)"
            sender.isHighlighted = false
        case "multiply":
            myFirstVariable = "\(Int(myFirstVariable)! * Int(mySecondVariable)!)"
            sender.isHighlighted = false
        case "divide":
            myFirstVariable = "\(Int(myFirstVariable)! / Int(mySecondVariable)!)"
            sender.isHighlighted = false
        case "mod":
            myFirstVariable = "\(Int(myFirstVariable)! % Int(mySecondVariable)!)"
            sender.isHighlighted = false
        case "subtract":
            myFirstVariable = "\(Int(myFirstVariable)! - Int(mySecondVariable)!)"
            sender.isHighlighted = false
        case "Negate":
            myFirstVariable = "\(Int(myFirstVariable)! * -1)"
            sender.isHighlighted = false
        default:
            return
        }
    }
    
    
//Numbers
    
    @IBAction func onePressed(_ sender: UIButton) {
        myFirstVariable += "1"
    }
    
    @IBAction func twoPressed(_ sender: UIButton) {
        myFirstVariable += "2"
    }
    @IBAction func threePressed(_ sender: UIButton) {
        myFirstVariable += "3"
        
    }
    @IBAction func fourPressed(_ sender: UIButton) {
        myFirstVariable += "4"
    }
    @IBAction func fivePressed(_ sender: UIButton) {
        myFirstVariable += "5"
    }
    @IBAction func sixPressed(_ sender: UIButton) {
        myFirstVariable += "6"
    }
    @IBAction func sevenPressed(_ sender: UIButton) {
        myFirstVariable += "7"
    }
    @IBAction func eightPressed(_ sender: UIButton) {
        myFirstVariable += "8"
    }
    @IBAction func ninePressed(_ sender: UIButton) {
        myFirstVariable += "9"
    }
    @IBAction func zeroPressed(_ sender: UIButton) {
        myFirstVariable += "0"
    }
    @IBAction func decimalPressed(_ sender: UIButton) {
        myFirstVariable += "."
    }
}



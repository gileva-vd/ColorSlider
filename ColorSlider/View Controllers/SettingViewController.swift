//
//  ViewController.swift
//  ColorSlider
//
//  Created by Валерия Гилева on 30.10.2022.
//

import UIKit

class SettingViewController: UIViewController {
    
    @IBOutlet var colorView: UIView!
    
    @IBOutlet var redValueLabel: UILabel!
    @IBOutlet var greenValueLabel: UILabel!
    @IBOutlet var blueValueLabel: UILabel!
    
    @IBOutlet var redSlider: UISlider!
    @IBOutlet var greenSlider: UISlider!
    @IBOutlet var blueSlider: UISlider!
    
    var delegate: SettingViewControllerDelegate!
    var mainColorView: UIColor!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        colorView.layer.cornerRadius = 12
        colorView.backgroundColor = mainColorView
        
        setStartSliders()
        
        setValue(for: redValueLabel, greenValueLabel, blueValueLabel)
    }
    
    @IBAction func changeColorSlider(_ sender: UISlider) {
        setColor()
        switch sender {
        case redSlider:
            redValueLabel.text = string(from: redSlider)
        case greenSlider:
            greenValueLabel.text = string(from: greenSlider)
        default:
            blueValueLabel.text = string(from: blueSlider)
        }
    }
    
    @IBAction func doneButtonPressed() {
        delegate?.setColor(colorView.backgroundColor ?? .purple)
        dismiss(animated: true)
    }

    //MARK: - Private Methods
    private func setStartSliders(){
        let ciColor = CIColor(color: mainColorView)
        
        redSlider.value = Float(ciColor.red)
        greenSlider.value = Float(ciColor.green)
        blueSlider.value = Float(ciColor.blue)
    }
    
    private func setColor() {
        colorView.backgroundColor = UIColor(
            red: CGFloat(redSlider.value),
            green: CGFloat(greenSlider.value),
            blue: CGFloat(blueSlider.value),
            alpha: 1
        )
    }
    
    private func setValue(for colorValues: UILabel...) {
        colorValues.forEach{ colorValue in
            switch colorValue{
            case redValueLabel:
                redValueLabel.text = string(from: redSlider)
            case greenValueLabel:
                greenValueLabel.text = string(from: greenSlider)
            default:
                blueValueLabel.text = string(from: blueSlider)
            }
        }
    }
    
    private func string(from slider: UISlider) -> String {
        String(format: "%.2f", slider.value)
    }
}



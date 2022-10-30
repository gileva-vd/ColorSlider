//
//  ViewController.swift
//  ColorSlider
//
//  Created by Валерия Гилева on 30.10.2022.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet var colorView: UIView!
    
    @IBOutlet var redValue: UILabel!
    @IBOutlet var greenValue: UILabel!
    @IBOutlet var blueValue: UILabel!
    
    @IBOutlet var redSlider: UISlider!
    @IBOutlet var greenSlider: UISlider!
    @IBOutlet var blueSlider: UISlider!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        colorView.layer.cornerRadius = 10
        
        setStertSlider()
        setStartValue()
        setColor()
        setValue(for: redValue, greenValue, blueValue)
    }
    
    @IBAction func changeColorSlider(_ sender: UISlider) {
        setColor()
        
        let valueColor = round(sender.value * 100) / 100.0
        
        switch sender.tag{
        case 0: redValue.text = valueColor.formatted()
        case 1:  greenValue.text = valueColor.formatted()
        case 2:  blueValue.text = valueColor.formatted()
        default:
           break
        }
    }
    
//MARK: - Start Methods
    func setStartValue () {
        redValue.text = redSlider.value.formatted()
        greenValue.text = greenSlider.value.formatted()
        blueValue.text = blueSlider.value.formatted()
    }
    
    func setStertSlider(){
        redSlider.minimumTrackTintColor = .red
        greenSlider.minimumTrackTintColor = .green
        redSlider.value = 0.8
        greenSlider.value = 0.2
        blueSlider.value = 0.6
        redSlider.tag = 0
        greenSlider.tag = 1
        blueSlider.tag = 2
    }
    
//MARK: - Private Methods
    private func setColor (){
        colorView.backgroundColor = UIColor(
            red: CGFloat((redSlider.value)),
            green: CGFloat((greenSlider.value)),
            blue: CGFloat((blueSlider.value)),
            alpha: 1
        )
    }
    
    private func setValue(for colorValues: UILabel...) {
        colorValues.forEach{ colorValue in
            switch colorValue.tag{
            case 0: redValue.text = redSlider.value.formatted()
            case 1: greenValue.text = greenSlider.value.formatted()
            case 2: blueValue.text = blueSlider.value.formatted()
            default:
                break
            }
        }
    }
}



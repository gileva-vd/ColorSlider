//
//  MainViewController.swift
//  ColorSlider
//
//  Created by Валерия Гилева on 15.11.2022.
//

import UIKit

protocol SettingViewControllerDelegate {
    func setColor(_ color: UIColor)
}

class MainViewController: UIViewController {

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let settingVC = segue.destination as? SettingViewController else { return }
        settingVC.delegate = self
        settingVC.mainColorView = view.backgroundColor
        
    }
}

// MARK: - SettingViewControllerDelegate
extension MainViewController: SettingViewControllerDelegate {
    func setColor(_ color: UIColor) {
        view.backgroundColor = color
    }
}

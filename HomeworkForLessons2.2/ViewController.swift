//
//  ViewController.swift
//  HomeworkForLessons2.2
//
//  Created by Федор Еронин on 18.06.2022.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var changeButton: UIButton!
    @IBOutlet weak var greenLight: UIView!
    @IBOutlet weak var yellowLight: UIView!
    @IBOutlet weak var redLight: UIView!
    var trafficLightState: TraficLightState = .off
    
    enum TraficLightState {
        case off
        case red
        case yellow
        case green
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        trafficLightState = .off
        setupLights()
        setupButton()
    }

    @IBAction func changeButtonTapped() {
        switch trafficLightState {
        case .off:
            trafficLightState = .red
            redLight.alpha = 1
        case .red:
            trafficLightState = .yellow
            redLight.alpha = 0.3
            yellowLight.alpha = 1
        case .yellow:
            trafficLightState = .green
            greenLight.alpha = 1
            yellowLight.alpha = 0.3
        case .green:
            trafficLightState = .red
            redLight.alpha = 1
            greenLight.alpha = 0.3
        }
    }
    private func setupLights() {
        redLight.layer.cornerRadius = 64
        yellowLight.layer.cornerRadius = 64
        greenLight.layer.cornerRadius = 64
        redLight.alpha = 0.3
        greenLight.alpha = 0.3
        yellowLight.alpha = 0.3
    }
    
    private func setupButton() {
        changeButton.setTitle("START", for: .normal)
        changeButton.layer.cornerRadius = 10
    }
    

}


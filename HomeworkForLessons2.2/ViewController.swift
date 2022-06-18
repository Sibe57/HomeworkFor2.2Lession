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
   
    enum TraficLightState {
        case off
        case red
        case yellow
        case green
    }
    
    private var trafficLightState: TraficLightState = .off
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupButton()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        setupLights() //Пришлось переопределить этот метод что бы расчитать правильно радиусы закруглений, во viewDidLoad я так понял информации и ширине фрейма светофора еще нет
    }

    @IBAction func changeButtonTapped() {
        changeButton.setTitle("NEXT", for: .normal)
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
        let halfOfWidth = redLight.layer.frame.width / 2
        redLight.layer.cornerRadius = halfOfWidth
        yellowLight.layer.cornerRadius = halfOfWidth
        greenLight.layer.cornerRadius = halfOfWidth
        redLight.alpha = 0.3
        greenLight.alpha = 0.3
        yellowLight.alpha = 0.3
    }
    
    private func setupButton() {
        changeButton.setTitle("START", for: .normal)
        changeButton.layer.cornerRadius = 10
    }
    

}


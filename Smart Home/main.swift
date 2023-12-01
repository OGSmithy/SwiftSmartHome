//
//  main.swift
//  Smart Home
//
//  Created by Smith, Oli (AMM) on 29/11/2023.
//

import Foundation

class SmartHome {
    
    private var devices = [Devices]()
    
    func getDevicesStatuses() {
        print([Devices].self)
    }
    func turnOnLights() {
        Lights(isOn: true, colour: "Blue", type: "LED")
    }
    func changeHeatersIntensity(newIntensity: Int) {
        Heaters(isOn: true, type: "Log Fire", intensity: newIntensity)
    }
}

class Devices: SmartHome {
    private var isOn: Bool
    private let type: String
    
    init (isOn: Bool, type: String) {
        self.isOn = isOn
        self.type = type
    }
}

class Lights: Devices {
    let colour: String
    
    init (isOn: Bool, colour: String, type: String) {
        self.colour = colour
        super.init(isOn: isOn, type: type)
    }
}

class Heaters: Devices {
    var intensity: Int
    
    init(isOn: Bool, type: String, intensity: Int) {
        self.intensity = intensity
        super.init(isOn: isOn, type: type)
    }
    
}

let mySmartHome = SmartHome()
mySmartHome.getDevicesStatuses()

print("""

    What would you like to do?
    1 : Toggle lights
    2 : Change Heater Intensity
p
""")

if let userChoice = readLine() {
    switch userChoice {
    case "1":
        print("The lights have been toggled")
    case "2":
        print("What intensity would you like? (0-10) ")
        if let newIntensityStr = readLine() {
            if let newIntensity = Int(newIntensityStr) {
                print("The heaters no have an intensity of \(mySmartHome.changeHeatersIntensity(newIntensity: newIntensity))")
            }
        }
    default:
        print("You did nothing")
        }
}

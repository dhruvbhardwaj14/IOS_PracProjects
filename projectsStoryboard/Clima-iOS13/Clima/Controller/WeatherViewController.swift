//
//  ViewController.swift
//  Clima
//
//  Created by Angela Yu on 01/09/2019.
//  Copyright © 2019 App Brewery. All rights reserved.
//

import UIKit
import CoreLocation

class WeatherViewController: UIViewController{

    @IBOutlet weak var conditionImageView: UIImageView!
    @IBOutlet weak var temperatureLabel: UILabel!
    @IBOutlet weak var cityLabel: UILabel!
    @IBOutlet weak var searchTextField: UITextField!
    
    @IBOutlet weak var weatherInfoLabel: UILabel!
    var weatherManager=WeatherManager()
    var locationManager=CLLocationManager()
    override func viewDidLoad() {
        super.viewDidLoad()
        //set the delegates
        locationManager.delegate=self
        //show pop up for permission but also go to info.plist
        locationManager.requestWhenInUseAuthorization()
        //request location once
        locationManager.requestLocation()
        
        
        weatherManager.delegate=self
        //textfield should report back to user
        //used to show textfieldshouldreturn func
        searchTextField.delegate = self
    }
    @IBAction func locationButtonPressed(_ sender: UIButton) {
        locationManager.requestLocation()//only possible when we stopped location down there
    }
}

//MARK: - UITEXTFIELD DELGATE
extension WeatherViewController:UITextFieldDelegate{
    @IBAction func searchPressed(_ sender: UIButton) {
        searchTextField.endEditing(true)
        print(searchTextField.text ?? "  ")
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        searchTextField.endEditing(true)
        print(searchTextField.text ?? "nil")
        return true
    }
    
    func textFieldShouldEndEditing(_ textField: UITextField) -> Bool {
        if textField.text != "" {
            return true
        }
        
        else{
            textField.placeholder="Type Something"
            return false
        }
    }
    
        //when go is pressed this runs
    func textFieldDidEndEditing(_ textField: UITextField) {
        if let city=searchTextField.text{
            weatherManager.fetchWeather(cityName: city)
        }
        
        searchTextField.text=""
    }
}

//MARK: - WEATHER MANAGER DELEGATE
extension WeatherViewController:WeatherManagerDelegate{
    func didUpdateWeather(_ weatherManager:WeatherManager,weather:WeatherModel){
        DispatchQueue.main.async {//used to update data from the internet in the UI
            self.temperatureLabel.text=weather.temperatureString
            self.conditionImageView.image=UIImage(systemName: weather.conditionName)
            self.cityLabel.text=weather.cityname
            self.weatherInfoLabel.text=weather.info
        }
    }
    func didFailWithError(error: Error) {
        print(error)
    }
}

//MARK: -LOCATION DELEGATE
extension WeatherViewController:CLLocationManagerDelegate{
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
//        print("Got location")
        if let location=locations.last{
            //stop locationupdation to use request method again
            locationManager.stopUpdatingLocation()
            let latitude=location.coordinate.latitude
            let longitude=location.coordinate.longitude
            weatherManager.fetchWeather(latitude:latitude,longitude:longitude)
        }
    }
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        print("\(error) in location")
    }
}

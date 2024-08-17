//
//  WratherManager.swift
//  Clima
//
//  Created by Dhruv Bhardwaj on 06/11/22.
//  Copyright © 2022 App Brewery. All rights reserved.
//
//api key-5a27f037ac8a3fc2c61a0f636e417dbb
import Foundation
import CoreLocation
protocol WeatherManagerDelegate{
    func didUpdateWeather(_ weatherManager:WeatherManager,weather:WeatherModel)
    func didFailWithError(error:Error)
}

struct WeatherManager{
    let weatherURL="https://api.openweathermap.org/data/2.5/weather?appid=5a27f037ac8a3fc2c61a0f636e417dbb&units=metric"
    
    var delegate:WeatherManagerDelegate?
    func fetchWeather(cityName:String){
        let urlString="\(weatherURL)&q=\(cityName)"
        performRequest(with:urlString)
    }
    func fetchWeather(latitude:CLLocationDegrees,longitude:CLLocationDegrees){
        let urlString="\(weatherURL)&lat=\(latitude)&lon=\(longitude)"
        performRequest(with:urlString)
    }
    func performRequest(with urlString:String){
        //1.Create a URL
        if let url=URL(string: urlString){
            //2.create a urlsession
            let session=URLSession(configuration: .default)
            
            //3.Give session a task
            //            let task=session.dataTask(with: url, completionHandler: handle(data:response:error:))
            //the task will call the handle by itself so we need not give any values in it's call
            
            //wrting above task using closures
            //click the completion handler blue button and hit enter to auto convert closure
            let task=session.dataTask(with: url) { data, response, error in
                if error != nil{
                    self.delegate?.didFailWithError(error: error!)
                    return
                }
                if let safeData = data {
                    if let weather=self.parseJson(safeData){
                        self.delegate?.didUpdateWeather(self,weather: weather)
                    }
                }
            }
            
            
            //4.start the task
            task.resume()
        }
    }
    
    func parseJson(_ weatherData:Data)->WeatherModel?{
        let decoder=JSONDecoder()
//        using .self is for creating weatherData struct into a data type
        do{
            let decodedData=try decoder.decode(WeatherData.self, from: weatherData)
//            print(decodedData.name)
//            print(decodedData.main.temp)
//            print(decodedData.weather[0].id)
//            print(decodedData.weather[0].description)
            let id=decodedData.weather[0].id
            let temp=decodedData.main.temp
            let name=decodedData.name
            let info=decodedData.weather[0].main
            
            let weather=WeatherModel(conditionId: id, cityname: name, temperature: temp,info: info)
            return weather
//            print(weather.conditionName)
//            print(weather.temperatureString)
        }catch{
            delegate?.didFailWithError(error: error)
            return nil
        }
        
    }
    
    
    
//    func handle(data:Data?,response:URLResponse?,error:Error?){
//        if error != nil{
//            print(error!)
//            return
//        }
//        if let safeData = data {
//            let dataString=String(data: safeData, encoding: .utf8)
//            print(dataString)
//        }
//    }
}

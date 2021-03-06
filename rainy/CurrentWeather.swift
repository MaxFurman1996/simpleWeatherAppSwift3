//
//  CurrentWeather.swift
//  rainy
//
//  Created by Max Furman on 5/29/17.
//  Copyright © 2017 Max Furman. All rights reserved.
//

import Foundation
import Alamofire

class CurrentWeather {
    var _cityName:String!
    var _date:String!
    var _weatherType:String!
    var _currentTemp:Double!
    
    var cityName: String {
        if _cityName == nil{
            return ""
        }
        return _cityName
    }
    
    var date: String{
        if _date == nil{
            _date = ""
        }
        
        let dateFormatter = DateFormatter()
        dateFormatter.dateStyle = .long
        dateFormatter.timeStyle = .none
        let currentDate = dateFormatter.string(from: Date())
        self._date = "Today, \(currentDate)"
        return _date
    }
    
    var weatherType: String{
        if _weatherType == nil{
            return ""
        }
        return _weatherType
    }
    
    var currentTemp: Double{
        if _currentTemp == nil{
            return 0.0
        }
        return _currentTemp
    }
    
    func downloadWeatherDetails(completed: @escaping DownloadComplete){
        //Alamofire download
        //let currentWeatherURL = URL(string: CURRENT_WEATHER_URL)
        Alamofire.request(CURRENT_WEATHER_URL, method: .get).responseJSON{ response in
            let result = response.result
            
            if let dict = result.value as? Dictionary<String,AnyObject>{
                if let name = dict["name"] as? String{
                    self._cityName = name.capitalized
                }
                
                if let weather = dict["weather"] as? [Dictionary<String,AnyObject>]{
                    if let main = weather[0]["main"] as? String{
                        self._weatherType = main.capitalized
                    }
                }
                
                if let main = dict["main"] as? Dictionary<String,AnyObject>{
                    if let temp = main["temp"] as? Double{
                        
//                        let kelvinToFarenheitPreDivision = (temp * (9/5) - 459.67)
//                        let kelvinToFarenheit = Double(round(10 * kelvinToFarenheitPreDivision/10))
                        let roundedTemp = ((temp - 273.15)*10).rounded()/10
                        self._currentTemp = roundedTemp
                    }
                }
            }
           completed()
        }
    }
}

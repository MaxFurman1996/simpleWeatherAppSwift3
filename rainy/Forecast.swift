//
//  Forecast.swift
//  rainy
//
//  Created by Max Furman on 5/29/17.
//  Copyright © 2017 Max Furman. All rights reserved.
//

import Foundation
import Alamofire

class Forecast{
    
    var _date: String!
    var _weatherType: String!
    var _highTemp: Double!
    var _lowTemp: Double!
    
    var date: String{
        if _date == nil{
            return ""
        }
        return _date
    }
    
    var weatherType: String{
        if _weatherType == nil{
            return ""
        }
        return _weatherType
    }
    
    var highTemp: Double{
        if _highTemp == nil {
            return 0.0
        }
        return _highTemp
    }
    
    var lowTemp: Double{
        if _lowTemp == nil {
            return 0.0
        }
        return _lowTemp
    }
    
    init(weatherDict: Dictionary<String,AnyObject>){
        if let temp = weatherDict["temp"] as? Dictionary<String,AnyObject>{
            
            if let min = temp["min"] as? Double{
                let kelvinToFarenheitPreDivision = (min * (9/5) - 459.67)
                let kelvinToFarenheit = Double(round(10 * kelvinToFarenheitPreDivision/10))
                self._lowTemp = kelvinToFarenheit
            }
            
            if let max = temp["max"] as? Double{
                let kelvinToFarenheitPreDivision = (max * (9/5) - 459.67)
                let kelvinToFarenheit = Double(round(10 * kelvinToFarenheitPreDivision/10))
                self._highTemp = kelvinToFarenheit
            }
        }
        
        if let weather = weatherDict["weather"] as? [Dictionary<String,AnyObject>]{
            if let main = weather[0]["main"] as? String{
                self._weatherType = main.capitalized
            }
        }
        
        if let date = weatherDict["dt"] as? Double{
            let unixToDate = Date(timeIntervalSince1970: date)
            let dateFormatter = DateFormatter()
            dateFormatter.dateStyle = .full
            dateFormatter.timeStyle = .none
            dateFormatter.dateFormat = "EEEE"
            self._date = dateFormatter.string(from: unixToDate)
        }
    }
}

//extension Date{
//    func dayOfTheWeek() -> String{
//        let dateFormatter = DateFormatter()
//        dateFormatter.dateFormat = "EEEE"
//        return dateFormatter.string(from: self)
//    }
//}

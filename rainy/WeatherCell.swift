//
//  WeatherCell.swift
//  rainy
//
//  Created by Max Furman on 5/26/17.
//  Copyright © 2017 Max Furman. All rights reserved.
//

import UIKit

class WeatherCell: UITableViewCell {

    @IBOutlet weak var weatherImg: UIImageView!
    @IBOutlet weak var dayLbl: UILabel!
    @IBOutlet weak var weatherType: UILabel!
    @IBOutlet weak var highTemp: UILabel!
    @IBOutlet weak var lowTemp: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    
    }
    
    func configureCell(forecast: Forecast){
        lowTemp.text = "\(forecast.lowTemp)"
        highTemp.text = "\(forecast.highTemp)"
        weatherType.text = forecast.weatherType
        dayLbl.text = forecast.date.capitalized
        weatherImg.image = UIImage(named : forecast.weatherType)
    }


}

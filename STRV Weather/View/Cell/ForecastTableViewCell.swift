//
//  ForecastTableViewCell.swift
//  STRV Weather
//
//  Created by Bruno Garcia on 07/03/19.
//  Copyright © 2019 Bruno Garcia. All rights reserved.
//

import UIKit

class ForecastTableViewCell: UITableViewCell {

    // MARK: - IBOutlets
    @IBOutlet weak var ivWeather: UIImageView!
    @IBOutlet weak var lblHour: UILabel!
    @IBOutlet weak var lblWeatherDesc: UILabel!
    @IBOutlet weak var lblTemp: UILabel!
    
    // MARK: - Main Methods
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    // MARK: - Methods
    func prepare(with weather: WeatherResponse){
        ivWeather.setImgWeather(weather: weather)
        lblHour.text = weather.getHour()
        lblWeatherDesc.text = weather.weather[0].main
        lblTemp.text = "\(weather.getTempCelsius())º"
    }

}

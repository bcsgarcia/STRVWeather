//
//  ForecastViewController.swift
//  STRV Weather
//
//  Created by Bruno Garcia on 06/03/19.
//  Copyright © 2019 Bruno Garcia. All rights reserved.
//

import UIKit

class ForecastViewController: BaseViewController {

    // MARK: - IBOutlets
    @IBOutlet weak var tableview: UITableView!
    @IBOutlet weak var lblTitle: UILabel!
    @IBOutlet weak var v1: UIView!
    @IBOutlet weak var v2: UIView!
    @IBOutlet weak var v3: UIView!
    @IBOutlet weak var v4: UIView!
    @IBOutlet weak var v5: UIView!
    @IBOutlet weak var v6: UIView!
    
    // MARK: - Properties
    var retrieveForecastTimer: Timer!
    let retrieveForecastTimeInterval : TimeInterval = 10
    let forecastController = ForecastController()
    var forecastList = [Forecast]()
    
    // MARK: - Main Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        lblTitle.text = "--"
        super.arrViews = [ v1, v2, v3, v4, v5, v6 ]
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        if retrieveForecastTimer == nil {
            retrieveForecastTimer = Timer.scheduledTimer(timeInterval: retrieveForecastTimeInterval, target: self, selector: #selector(retrieveForecast), userInfo: nil, repeats: true)
        }
        retrieveForecast()
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        if retrieveForecastTimer != nil {
            retrieveForecastTimer!.invalidate()
            retrieveForecastTimer = nil
        }
    }
    
    // MARK: - Methods
    @objc func retrieveForecast(){
        
        if UserDefaultsManager.getCity() != "" {
            toggleLoading()
            lblTitle.text = UserDefaultsManager.getCity()
            forecastController.callUrlRequest(onComplete: { (forecastList) in
                self.forecastList = []
                for i in forecastList {
                    self.forecastList.append(i)
                }
                self.tableview.reloadData()
                self.toggleLoading()
                
            }) { (weatherError) in
                switch weatherError {
                case .httpError(code: let code):
                    print("Error de HTTP. Codigo \(code)")
                default:
                    print(weatherError)
                    break
                }
                self.toggleLoading()
                self.forecastList = [Forecast(weekDay: "Please check your Internet connection")]
                self.tableview.reloadData()
            }
        }
    }
    
}

// MARK: - TableView DataSource & Delegate
extension ForecastViewController: UITableViewDataSource, UITableViewDelegate {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return forecastList.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return forecastList[section].list.count
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let view = UIView()
        view.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        let label = UILabel()
        label.frame = CGRect(x: 10, y: 5, width: tableView.layer.bounds.size.width - 10, height: 40)
        label.tintColor = #colorLiteral(red: 0.1947149634, green: 0.1947149634, blue: 0.1947149634, alpha: 1)
        label.font = UIFont (name: "Montserrat-SemiBold", size: 15)
        label.text = forecastList[section].weekDay.uppercased()
        view.addSubview(label)
        view.layer.borderWidth = 1
        view.layer.borderColor = #colorLiteral(red: 0.8709999919, green: 0.8709999919, blue: 0.8709999919, alpha: 1)
        return view
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 50
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as? ForecastTableViewCell else { return UITableViewCell() }
        
        let weather = forecastList[indexPath.section].list[indexPath.row]
        cell.prepare(with: weather)
        return cell
    }
    
}

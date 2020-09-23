//
//  BuscarXCIController.swift
//  Control de Ingreso2
//
//  Created by Esteban Choque Villalobos on 9/21/20.
//  Copyright © 2020 Esteban Choque Villalobos. All rights reserved.
//

import UIKit

class BuscarXCIController: UIViewController, UITableViewDataSource, UITableViewDelegate, UITextFieldDelegate {

    @IBOutlet weak var txtSearchBar: UITextField!
    @IBOutlet weak var tblCountryList: UITableView!
    
    var countries:[String] = Array()
    var originalCountriesList:[String] = Array()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        countries.append("Australia")
        countries.append("India")
        countries.append("South Africa")
        countries.append("Ghana")
        countries.append("China")
        countries.append("USA")
        countries.append("Canada")
        countries.append("United Kingdom")
        countries.append("Germany")
        countries.append("Russia")
        countries.append("New Zealand")
        countries.append("Saudi Arabia")
        countries.append("Yemen")

        
        for country in countries {
            originalCountriesList.append(country)
        }
        // Do any additional setup after loading the view.
        tblCountryList.delegate = self
        tblCountryList.dataSource = self
        txtSearchBar.delegate = self
        txtSearchBar.addTarget(self, action: #selector(searchRecords(_ :)), for: .editingChanged)
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        txtSearchBar.resignFirstResponder()
        return true
    }
    
    @objc func searchRecords(_ textField: UITextField){
        self.countries.removeAll()
        if textField.text?.count != 0 {
            for country in originalCountriesList {
                if let countryToSearch = textField.text{
                    let range = country.lowercased().range(of: countryToSearch, options: .caseInsensitive, range: nil, locale: nil)
                    if range != nil{
                        self.countries.append(country)
                    }
                }
                
            }
        }
        else{
            for country in originalCountriesList {
                countries.append(country)
            }
        }
        tblCountryList.reloadData()
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return countries.count
        }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var cell = tableView.dequeueReusableCell(withIdentifier: "cointry")
        if cell == nil
        {
            cell = UITableViewCell(style: .default, reuseIdentifier: "country")
        }
        cell?.textLabel?.text = countries[indexPath.row]
        return cell!
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        let detVC = self.storyboard?.instantiateViewController(withIdentifier: "DetailsViewController") as! DetailsViewController
        detVC.strCountryName = countries[indexPath.row]
        self.navigationController?.pushViewController(detVC, animated: true)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}

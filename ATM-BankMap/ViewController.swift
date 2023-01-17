//
//  ViewController.swift
//  ATM-BankMap
//
//  Created by Кирилл Жогальский on 12.01.23.
//

import UIKit
import GoogleMaps
import CoreLocation

class ViewController: UIViewController {
    
    
    var marker = GMSMarker()
    
    @IBOutlet weak var mapView: GMSMapView!
    
    var data = [Model]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        mapView.delegate = self
        
        getData()
    }
    
    private func getData (){
        Provider().getATM(success: { [weak self] result in
            guard let self else { return }
            self.data = result
            
        } ,failure: { errorString in
            print(errorString)
        })
    }
    
    
    func drawMarkers(position: CLLocationCoordinate2D) {
   
        for cordinates in Model {
            marker = GMSMarker(position: cordinate.cordinate)
            marker.map = GoogleMapsView
        }
        
    }
    
}




extension ViewController: GMSMapViewDelegate {
    func  mapView(_ mapView: GMSMapView, didTapAt coordinate: CLLocationCoordinate2D) {
        <#code#>
    }
}

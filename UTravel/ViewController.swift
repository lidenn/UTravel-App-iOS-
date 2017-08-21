//
//  ViewController.swift
//  UTravel
//
//  Created by Dennis Li on 8/14/17.
//  Copyright © 2017 Lidennis62. All rights reserved.
//

import UIKit
import GoogleMaps
import GooglePlaces

class vacationDestination: NSObject{
    let destinationName:String
    let location: CLLocationCoordinate2D
    let zoom: Float
    
    
    init(destinationName:String, location: CLLocationCoordinate2D, zoom:Float){
        self.destinationName = destinationName
        self.location=location
        self.zoom=zoom

    }
}

class cities: NSObject{
    let cityName:String
    let sites:[vacationDestination]
    init(cityName:String, sites:[vacationDestination]){
        self.cityName = cityName
        self.sites = sites
    }
}



class ViewController: UIViewController {
    var row_selected = -1;
    var index = 0;
    var city = 0;
    var citiesTable = [cities]()
    
    @IBOutlet weak var PhotoView: UIImageView!
    @IBOutlet weak var TextView: UITextView!

    
    
    let portlandDestinations = [  //input destinations as array
        vacationDestination(destinationName:"PDX Airport",location:CLLocationCoordinate2D(latitude: 45.589769, longitude: -122.595094), zoom: 12),
        vacationDestination(destinationName:"Salt and Straw",location:CLLocationCoordinate2D(latitude: 45.528949, longitude: -122.698316), zoom: 12)
    ]
    
    let losangelesDestinations = [
        vacationDestination(destinationName: "LAX Airport", location: CLLocationCoordinate2D(latitude: 33.943917, longitude: -118.404898), zoom: 12),
        vacationDestination(destinationName: "Pie Hole", location: CLLocationCoordinate2D(latitude: 34.045390, longitude: -118.236260), zoom:12)
    ]
    
    let seattleDestinations = [
        vacationDestination(destinationName: "Sea-Tac AirPort", location: CLLocationCoordinate2D(latitude: 47.450250, longitude: -122.308817), zoom: 12),
        vacationDestination(destinationName: "Din Tai Fung", location: CLLocationCoordinate2D(latitude: 47.661565, longitude: -122.299717), zoom: 12)
    ]

    
    
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        GMSServices.provideAPIKey("AIzaSyDcnMwJtsrI83sU4PWd1Y3MLyc7CsYF5Uc")
        GMSPlacesClient.provideAPIKey("AIzaSyDcnMwJtsrI83sU4PWd1Y3MLyc7CsYF5Uc")
        initializeCities()
        print(row_selected)
        changeView()

        
    
    }
    
    
    @IBAction func Next(_ sender: UIButton) {
        index = index+1
        if (index==citiesTable[row_selected].sites.capacity){
            index=0
        }
        changeView()
    }
    
    func initializeCities(){
            citiesTable.append(cities(cityName: "Portland", sites: portlandDestinations))
            citiesTable.append(cities(cityName: "Los Angeles", sites: losangelesDestinations))
            citiesTable.append(cities(cityName: "Seattle", sites: seattleDestinations))
    }

    
    func changeView(){
        print(citiesTable[row_selected].cityName)
        let camera = GMSCameraPosition.camera(withTarget: citiesTable[row_selected].sites[index].location, zoom: citiesTable[row_selected].sites[index].zoom)
        let mapView = GMSMapView.map(withFrame: CGRect.zero, camera: camera)
        view = mapView
        
        
        
        let marker = GMSMarker(position: citiesTable[row_selected].sites[index].location)
        marker.title = citiesTable[row_selected].sites[index].destinationName
        marker.map = mapView
    }
    
}


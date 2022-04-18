//
//  MapViewController.swift
//  Naturely
//
//  Created by Luis Mora on 4/9/22.
//

import UIKit
import MapKit
import CoreLocation

class MapViewController: UIViewController {

    @IBOutlet weak var mapView: MKMapView!
    
    let mapRefresh = UIRefreshControl()
    var hikesArray: [Hike] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let centerLocation = CLLocation(latitude: 37.3022, longitude: -120.4830)
        goToLocation(location: centerLocation)
        getAPIData()
        mapRefresh.addTarget(self, action: #selector(getAPIData), for: .valueChanged)
        addAnnotationAtCoordinate(dicts: hikesArray)
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        mapRefresh.addTarget(self, action: #selector(getAPIData), for: .valueChanged)
        addAnnotationAtCoordinate(dicts: hikesArray)
    }
    
    @objc func getAPIData(){
        API.getHikes() {(hikes) in
            guard let hikes = hikes else {
                return
            }
            self.hikesArray = hikes
            self.addAnnotationAtCoordinate(dicts: self.hikesArray)
            self.mapRefresh.endRefreshing()
        }
    }
    
    
    //location to center the mapview
    func goToLocation(location: CLLocation) {
        let span = MKCoordinateSpan(latitudeDelta: 0.5, longitudeDelta: 0.5)
        let region = MKCoordinateRegion(center: location.coordinate, span: span)
        mapView.setRegion(region, animated: false)
    }
    
    func addAnnotationAtCoordinate(dicts: [Hike]) {
        //add an Anotation to for hike
        for hike in dicts {
            let annotation = MKPointAnnotation()
            let lat = Double(hike.coordinates["latitude"]!)
            let long = Double(hike.coordinates["longitude"]!)
            let coordinate = CLLocationCoordinate2D.init(latitude: lat, longitude: long)
            annotation.coordinate = coordinate
            annotation.title = hike.name
            mapView.addAnnotation(annotation)
        }
        
    }
    
    func mapView(mapView: MKMapView, viewForAnnotation annotation: MKAnnotation) -> MKAnnotationView? {
        let identifier = "customAnnotationView"
            // custom pin annotation
        var annotationView = mapView.dequeueReusableAnnotationView(withIdentifier: identifier) as? MKPinAnnotationView
            if (annotationView == nil) {
                annotationView = MKPinAnnotationView(annotation: annotation, reuseIdentifier: identifier)
            }
            else {
                annotationView!.annotation = annotation
            }
            //annotationView!.pinTintColor = UIColor.green
        
            return annotationView
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}

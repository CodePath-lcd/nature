//
//  PostDetailsViewController.swift
//  Naturely
//
//  Created by Ditry D'ateain on 4/27/22.
//

import UIKit
import MapKit
import CoreLocation

class PostDetailsViewController: UIViewController {
    
    
    @IBOutlet weak var postImage: UIImageView!
    
    @IBOutlet weak var trainNameLabel: UILabel!
    
    @IBOutlet weak var locationDetailsLabel: UILabel!
    
    @IBOutlet weak var location: MKMapView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
}

//
//  ViewController.swift
//  mbtile-ios-reader
//
//  Created by s1m-0n on 07/17/2019.
//  Copyright (c) 2019 s1m-0n. All rights reserved.
//

import UIKit
import MapKit
import mbtile_ios_reader

class ViewController: UIViewController, MKMapViewDelegate {
    
    @IBOutlet weak var mapView: MKMapView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        mapView.delegate = self
        mapView.showsUserLocation = true;
        setupTileRenderer()
    }
    
    func setupTileRenderer() {
        let template = "https://tile.openstreetmap.org/{z}/{x}/{y}.png"
        let tilesURL : URL = Bundle.main.url(forResource: "countries-raster", withExtension: "mbtiles")!
        let overlay = CustomTileOverlay(urlTemplate: template, mbtileURL: tilesURL)
        overlay.canReplaceMapContent = true
        mapView.addOverlay(overlay, level: .aboveLabels)
    }
    
    func mapView(_ mapView: MKMapView, rendererFor overlay: MKOverlay) -> MKOverlayRenderer {
        
        let tileOverlay = overlay as? MKTileOverlay
        
        if (tileOverlay == nil){
            return MKOverlayRenderer()
        }
        
        return MKTileOverlayRenderer(tileOverlay: tileOverlay!)
    }
}


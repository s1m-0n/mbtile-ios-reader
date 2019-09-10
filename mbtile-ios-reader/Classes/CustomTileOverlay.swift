//
//  CustomTileOverlay.swift
//  mbtile
//
//  Created by Juan Jose Labella on 25/11/15.
//  Copyright (c) 2015 mbtile. All rights reserved.
//

import Foundation
import UIKit
import MapKit

public class CustomTileOverlay : MKTileOverlay {
    let cache = NSCache<AnyObject, AnyObject>()
    let operationQueue = OperationQueue()
    let tilesURL : URL!
    
    public init(urlTemplate URLTemplate: String?, mbtileURL: URL) {
        tilesURL = mbtileURL
        super.init(urlTemplate: URLTemplate)
    }
    
    //Initializer for ObjC
    @objc public init(urlTemplate URLTemplate: NSString?, mbtileURL: NSURL) {
        tilesURL = URL(string: mbtileURL.absoluteString!)
        super.init(urlTemplate: URLTemplate as String?)
    }
    
//     override public func url(forTilePath path: MKTileOverlayPath) -> URL {
//         print("OpenStreetMap access")
//         return URL(string: String(format: "http://tile.openstreetmap.org/%i/%i/%i.png", path.z, path.x, path.y))!
        
//     }
    
    

    override public func loadTile(at path: MKTileOverlayPath,
                                  result: @escaping ((Data?, Error?) -> Void)) {
        
        
        
        let tilesDB : MBTilesDB = MBTilesDB(dburl: tilesURL)
        let zz : NSInteger = path.z
        let xx : NSInteger = path.x
        let yy : NSInteger = path.y
        print("\(xx) - \(yy) - \(zz)")
        let tileData = tilesDB.tile(forZoomLevel: zz, tileColumn:xx, tileRow: yy)
        
        if (tileData != nil){
            result(tileData as Data?, nil)
        } else {
            super.loadTile(at: path, result: result)
        }
    }
    
}

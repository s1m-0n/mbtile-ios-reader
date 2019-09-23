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
    let tilesURLArray : [URL]!
    
    public init(urlTemplate URLTemplate: String?, mbtileURL: [URL]) {
        tilesURLArray = mbtileURL
        super.init(urlTemplate: URLTemplate)
    }
    
    //Initializer for ObjC
    @objc public init(urlTemplate URLTemplate: NSString?, mbtileURL: [NSURL]) {
        tilesURLArray = mbtileURL as [URL]//URL(string: mbtileURL.absoluteString!)
        super.init(urlTemplate: URLTemplate as String?)
    }
    

    override public func loadTile(at path: MKTileOverlayPath,
                                  result: @escaping ((Data?, Error?) -> Void)) {
        var tileData: Data?
        for tileURL in tilesURLArray {
            let tilesDB : MBTilesDB = MBTilesDB(dburl: tileURL)
            let zz : NSInteger = path.z
            let xx : NSInteger = path.x
            let yy : NSInteger = path.y
            print("\(xx) - \(yy) - \(zz)")
            let tmpTileData = tilesDB.tile(forZoomLevel: zz, tileColumn:xx, tileRow: yy)
            if tmpTileData != nil {
                print("mbtile-file: \(tileURL))")
                tileData = tmpTileData
                break
            }
        }
        
        if (tileData != nil){
            result(tileData as Data?, nil)
        } else {
            super.loadTile(at: path, result: result)
        }
    }
    
}

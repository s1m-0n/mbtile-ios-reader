//
//  GoogleMapsTileOverlay.swift
//  mbtile-ios-reader
//
//  Created by Simon Wicha on 27/11/20.
//

import Foundation
import GoogleMaps

public class GoogleMapsMBtileLayer: GMSSyncTileLayer {
    
    var tilesURLArray: [URL]!
    
    init(_ tileURLArray: [URL]) {
        self.tilesURLArray = tileURLArray
        super.init()
    }
    
    public override func tileFor(x: UInt, y: UInt, zoom: UInt) -> UIImage? {
        for tileURL in tilesURLArray {
            let tilesDB : MBTilesDB = MBTilesDB(dburl: tileURL)
            let zz : NSInteger = NSInteger(bitPattern: zoom)
            let xx : NSInteger = NSInteger(bitPattern: x)
            let yy : NSInteger = NSInteger(bitPattern: y)
            let tmpTileData = tilesDB.tile(forZoomLevel: zz, tileColumn:xx, tileRow: yy)
            if let _tmpTileData = tmpTileData {
                let image = UIImage(data: _tmpTileData)
                return image
            } else {
                return nil
            }
        }
        return nil
    }
}

//
//  QRConstants.swift
//  QRScanner
//
//  Created by Rahim Siahpoosh on 2018-08-03.
//  Copyright © 2018 Rahim Siahpoosh. All rights reserved.
//

import Foundation
import AVFoundation

class QRConstants {
    
    var QRCodeTypes = [AVMetadataObject.ObjectType.upce,
                       AVMetadataObject.ObjectType.code39,
                       AVMetadataObject.ObjectType.code39Mod43,
                       AVMetadataObject.ObjectType.code93,
                       AVMetadataObject.ObjectType.code128,
                       AVMetadataObject.ObjectType.ean8,
                       AVMetadataObject.ObjectType.ean13,
                       AVMetadataObject.ObjectType.aztec,
                       AVMetadataObject.ObjectType.pdf417,
                       AVMetadataObject.ObjectType.itf14,
                       AVMetadataObject.ObjectType.dataMatrix,
                       AVMetadataObject.ObjectType.interleaved2of5,
                       AVMetadataObject.ObjectType.qr]
}

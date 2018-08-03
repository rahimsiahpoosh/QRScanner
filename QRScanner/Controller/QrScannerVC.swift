//
//  QrScannerVC.swift
//  QRScanner
//
//  Created by Rahim Siahpoosh on 2018-08-02.
//  Copyright © 2018 Rahim Siahpoosh. All rights reserved.
//

import UIKit
import AVFoundation

class QrScannerVC: UIViewController {
    
    var captureSession = AVCaptureSession()
    var qrConstants = QRConstants()
    var videoPreviewLayer: AVCaptureVideoPreviewLayer?
    var qrCodeTargetFrame: UIView?
    
    @IBOutlet weak var messageLbl: UILabel!
    @IBOutlet weak var dissmisBtn: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let deviceDiscoverySession = AVCaptureDevice.DiscoverySession(deviceTypes: [.builtInWideAngleCamera], mediaType: AVMediaType.video, position: .back)

        if let captureDevice = deviceDiscoverySession.devices.first {
            print("Din telefon har en kamera")
            do {
                let input = try AVCaptureDeviceInput(device: captureDevice )
                captureSession.addInput(input)
                let captureMetDataOutput = AVCaptureMetadataOutput()
                captureSession.addOutput(captureMetDataOutput)
                captureMetDataOutput.setMetadataObjectsDelegate(self, queue: DispatchQueue.main)
                captureMetDataOutput.metadataObjectTypes = qrConstants.QRCodeTypes
            } catch {
            print(error)
            return
        }
            videoPreviewLayer = AVCaptureVideoPreviewLayer(session: captureSession)
            videoPreviewLayer?.videoGravity = AVLayerVideoGravity.resizeAspectFill
            videoPreviewLayer?.frame = view.layer.bounds
            view.layer.addSublayer(videoPreviewLayer!)
            captureSession.startRunning()
            view.bringSubview(toFront: messageLbl)
            view.bringSubview(toFront: dissmisBtn)

            qrCodeTargetFrame = UIView()
            guard let qrCodeFrameView = qrCodeTargetFrame else {
                print("Den är tom, ingen vy")
                return
            }

            qrCodeFrameView.layer.borderColor = UIColor.red.cgColor
            qrCodeFrameView.layer.borderWidth = 2
            view.addSubview(qrCodeFrameView)
            view.bringSubview(toFront: qrCodeFrameView)

    } else {
    print("Din telefon har ingen kamera")
    return
    }

    }
}

extension QrScannerVC: AVCaptureMetadataOutputObjectsDelegate {
    func metadataOutput(_ output: AVCaptureMetadataOutput, didOutput metadataObjects: [AVMetadataObject], from connection: AVCaptureConnection) {

        guard metadataObjects.count > 0 else {
            qrCodeTargetFrame?.frame = CGRect.zero
            messageLbl.text = "Ingen upptäck QR kod"
            return
        }

        let metadataObj = metadataObjects[0] as! AVMetadataMachineReadableCodeObject
        
        if qrConstants.QRCodeTypes.contains(metadataObj.type){

            let qrCodeObject = videoPreviewLayer?.transformedMetadataObject(for: metadataObj)
            qrCodeTargetFrame?.frame = qrCodeObject!.bounds

            guard metadataObj.stringValue != nil else {
                return
            }
            messageLbl.text = metadataObj.stringValue
        }
    }
}










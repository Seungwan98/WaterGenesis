//
//  ScannerVC.swift
//  WaterGenesis
//
import Foundation
import UIKit
import AVFoundation
import RxSwift

import SnapKit
import Then
import Vision

protocol ScannerView: AnyObject {
    func endedScanned(result: Bool)
}

class ScannerViewController: UIViewController, ScannerView {
    func endedScanned(result: Bool) {
        print("성공 실패")
    }
    
    var presenter: ScannerPresenter?
    
    private let focusImage = UIImageView(image: UIImage(named: "focus"))
    
    lazy private var btnstack = UIStackView(arrangedSubviews: [flashlightbtn, helpbtn]).then {
        $0.axis = .horizontal
        $0.distribution = .fillEqually
        $0.spacing = 60
    }
    

    
    
    
    private var flashlightbtn = UIButton().then {
        
        $0.isSelected = false
        $0.setImage(UIImage(named: "flashlight"), for: .normal)
        $0.setImage(UIImage(named: "flashlightoff"), for: .selected)
    }
    
    private var helpbtn = UIButton().then {
        $0.setImage(UIImage(named: "helpbtn"), for: .normal)
    }
    
    
    

    
    private var infolabel = PaddingLabel().then {
        $0.numberOfLines = 0
        $0.lineBreakMode = .byWordWrapping
        $0.textColor = .white
        $0.font = UIFont.systemFont(ofSize: 16, weight: .regular)
        $0.textAlignment = .center
        $0.text = "infolabel_scanner"
    }
    

    lazy private var infopopup = ScannerUsePopUp(frame: self.view.frame).then {
        $0.alpha = 0
    }
    
 
    
  
    
    let videoOutput = AVCaptureVideoDataOutput()
    var input: AVCaptureDeviceInput?
    var previewLayer = AVCaptureVideoPreviewLayer()
    let session = AVCaptureSession()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.addSubview(focusImage)
        focusImage.snp.makeConstraints {
            $0.centerX.equalToSuperview()
            $0.centerY.equalToSuperview()
            $0.width.height.equalTo(220)
       
        }
        focusImage.transform = CGAffineTransform(scaleX: 0.5, y: 0.5)

  
        self.view.addSubview(infopopup)
        
        helpbtn.addTarget(self, action: #selector(infobtnpressed(sender:)), for: .touchUpInside)
        flashlightbtn.addTarget(self, action: #selector(flashlighbtnpressed(sender:)), for: .touchUpInside)
        
        self.previewLayer = AVCaptureVideoPreviewLayer(session: self.session)

        setPreviewLayer(previewLayer: previewLayer)

        makebtnstack()
        setCamera()


        self.startSession()
        self.view.bringSubviewToFront(focusImage)

        
    }
    
    
    func startSession() {
        DispatchQueue.global(qos: .background).async {
            self.session.startRunning()

        }
    }
    func stopSession() {
        DispatchQueue.global(qos: .background).async {
            self.session.stopRunning()

        }
    }
    
    
    private func makebtnstack() {
        self.view.addSubview(btnstack)
        self.view.addSubview(infolabel)

    
        
 
        self.btnstack.snp.makeConstraints {
            $0.top.equalTo(self.view.safeAreaLayoutGuide).inset(10)
            $0.leading.trailing.equalToSuperview().inset(30)
            $0.height.equalTo(30)
            
        }

    }
    
    
    func setCamera() {
        
        
        guard let device = AVCaptureDevice.default( .builtInWideAngleCamera, for: AVMediaType.video, position: .back) else {
            print("device failed.")
            return
        }
        
        do {
            input = try AVCaptureDeviceInput.init(device: device)
            
        } catch {
            print("device input failed")
        }
        guard let inputdone = input else {
            print("input failed")
            return
        }
        session.addInput(inputdone)

        if session.canAddOutput(videoOutput) {
            let metaOutput = AVCaptureMetadataOutput()
            
            metaOutput.setMetadataObjectsDelegate(self, queue: DispatchQueue.main)

            session.addOutput(metaOutput)
            
            metaOutput.metadataObjectTypes = [.qr]
        }
    }

    
    func setPreviewLayer(previewLayer: AVCaptureVideoPreviewLayer) {
        previewLayer.frame = self.view.bounds
        self.previewLayer = previewLayer
        self.view.layer.addSublayer(previewLayer)
    }

    @objc func infobtnpressed(sender: UIButton) {
        self.view.bringSubviewToFront(self.infopopup)
        UIView.animate(withDuration: 0.2) { [unowned self] in
            self.infopopup.alpha = 1
        }
    }

    @objc func flashlighbtnpressed(sender: UIButton) {
        sender.isSelected = !sender.isSelected
        guard let device = AVCaptureDevice.default(for: .video) else { return }
        
        // 디바이스 플래시 사용 유무 판별
        if device.hasTorch {
            do {
                try device.lockForConfiguration()
                
                if sender.isSelected == true {
                    device.torchMode = .on
                } else {
                    device.torchMode = .off
                }
                
                device.unlockForConfiguration()
            } catch {
                print("Torch could not be used")
            }
        } else {
            print("Torch is not available")
        }
    }
   
    
    
}

extension ScannerViewController: AVCaptureMetadataOutputObjectsDelegate {
    func metadataOutput(_ output: AVCaptureMetadataOutput, didOutput metadataObjects: [AVMetadataObject], from connection: AVCaptureConnection) {
        
      
        var detectionString: String?
        let barCodeType = AVMetadataObject.ObjectType.qr
        
        
        
        
        if let metadata = metadataObjects.first {
   

            if metadata.type == barCodeType {
             
                if let qrCodeObject = self.previewLayer.transformedMetadataObject(for: metadata) as? AVMetadataMachineReadableCodeObject {
                    
                    detectionString = qrCodeObject.stringValue
                
                if let code = detectionString {
                    presenter?.getQrCode(codeText: code)
                }
            }
                
            }
        }
        
        
        
        
    }
    
    
    
}

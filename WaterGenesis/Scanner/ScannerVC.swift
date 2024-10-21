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

class ScannerViewController: UIViewController {
    
    lazy private var btnstack: UIStackView = {
        let stack = UIStackView(arrangedSubviews: [flashlightbtn, helpbtn])
        stack.axis = .horizontal
        stack.distribution = .fillEqually
        stack.spacing = 60
        return stack
    }()
    

    private var fillLayer = CAShapeLayer()
    
    
    
    private var flashlightbtn = UIButton()
    
    private var camerachangebtn = UIButton()
    
    private var helpbtn = UIButton()
    
    private var settingbtn = UIButton()
    
    

    
    private var infolabel = PaddingLabel().then {
        $0.numberOfLines = 0
        $0.lineBreakMode = .byWordWrapping
        $0.textColor = .white
        $0.font = UIFont.systemFont(ofSize: 16, weight: .regular)
        $0.textAlignment = .center
        $0.text = "infolabel_scanner"
    }
    
    private var smartlensbtn = ScannerBtn()
    
    private var barcodelensbtn = ScannerBtn()
    
    lazy private var scannerbtnstack: UIStackView = {
        let stack = UIStackView(arrangedSubviews: [smartlensbtn, barcodelensbtn])
        stack.axis = .horizontal
        stack.alignment = .center
        stack.distribution = .fillEqually
        return stack
    }()
    
    
    lazy private var infopopup = ScannerUsePopUp(frame: self.view.frame)
    
    
    var codeFrameView = UIView().then {
        $0.layer.borderColor = UIColor.green.cgColor
        $0.layer.borderWidth = 2
        $0.layer.cornerRadius = 8
        $0.clipsToBounds = true
        $0.isHidden = true
    }
    
    var codeStringLabel = UILabel().then {
        $0.font = .boldSystemFont(ofSize: 12)
        $0.numberOfLines = 0
        $0.textColor = .green
        $0.isHidden = true
        
    }
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor = .clear
        
        
        
       

        makebtnstack()
        makeinfolabel()
        
        helpbtn.addTarget(self, action: #selector(infobtnpressed(sender:)), for: .touchUpInside)
        flashlightbtn.addTarget(self, action: #selector(flashlighbtnpressed(sender:)), for: .touchUpInside)
        
        self.view.addSubview(infopopup)
        infopopup.alpha = 0
        makescannerbtnstack()
       
   

        view.addSubview(codeFrameView)
        view.addSubview(codeStringLabel)
        
    }
    
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
    
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        somelayer()
        
    }
    
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        
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

extension ScannerViewController {
  

  
    
}



// layouts
extension ScannerViewController {
    
 
    
    private func makebtnstack() {
        self.view.addSubview(btnstack)
        
        
        //  snp 추가
        self.btnstack.snp.makeConstraints {
            $0.top.equalTo(self.view.safeAreaLayoutGuide).inset(10)
            $0.leading.trailing.equalToSuperview().inset(30)
            $0.height.equalTo(30)
            
            
        }
        
        
        
        
        flashlightbtn.isSelected = false
        flashlightbtn.setImage(UIImage(named: "flashlight"), for: .normal)
        flashlightbtn.setImage(UIImage(named: "flashlightoff"), for: .selected)
        camerachangebtn.setImage(UIImage(named: "camerachangebtn"), for: .normal)
        helpbtn.setImage(UIImage(named: "helpbtn"), for: .normal)
        settingbtn.setImage(UIImage(named: "settingbtn"), for: .normal)
        
        camerachangebtn.isSelected = true
        
        
        
    }
    
    
   
    private func makeinfolabel() {
        self.view.addSubview(infolabel)
        
       
        
        
        
        
        
        
        
    }
    
    private func makescannerbtnstack() {
        self.view.addSubview(scannerbtnstack)
        
        
        smartlensbtn.setlabel(label: "smartlens_scanner")
        smartlensbtn.isSelected = false
        
        barcodelensbtn.setlabel(label: "barcodelens_scanner")
        barcodelensbtn.isSelected = true
        
        self.scannerbtnstack.snp.makeConstraints {
            $0.centerX.equalTo(self.view.safeAreaLayoutGuide)
            $0.top.equalTo(self.btnstack.snp.bottom).offset(10)
            $0.height.equalTo(80)
            $0.width.equalTo(200)
        }
        
    }
    
    
}

// camera modules
extension ScannerViewController {
    
    func getVideoOrientation() -> AVCaptureVideoOrientation {
        let deviceOrientation = UIDevice.current.orientation
        switch deviceOrientation {
        case .portrait:
            return .portrait
        case .landscapeRight:
            return .landscapeLeft
        case .landscapeLeft:
            return .landscapeRight
        case .portraitUpsideDown:
            return .portraitUpsideDown
        default:
            return .portrait
        }
    }
    
    

    
    
 
    
  

    
    
    func somelayer() {
        
        let pathBigRect = UIBezierPath(rect: self.view.bounds)
        //         let pathSmallRect = UIBezierPath(rect: CGRect(x: self.view.bounds.midX - 100, y: self.view.bounds.midY - 100, width: 200, height: 200))
        //
        //         pathBigRect.append(pathSmallRect)
        //         pathBigRect.usesEvenOddFillRule = true
        
        
        fillLayer.path = pathBigRect.cgPath
        fillLayer.fillRule = CAShapeLayerFillRule.evenOdd
        fillLayer.fillColor = UIColor.black.withAlphaComponent(0.2).cgColor
        // fillLayer.opacity = 0.4
        view.layer.addSublayer(fillLayer)
    }
    
    
    
}

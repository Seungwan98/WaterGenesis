//
//  ViewController.swift
//  WaterGenesis
//
//  Created by 이노프렌즈 on 10/18/24.
//

import UIKit
import Then
import SnapKit
class MainVC: UIViewController, UIScrollViewDelegate {
    
    var pageCount = 0
    
    let scrollView = UIScrollView()
    let contentView = UIView()
    
    
    let face = UIImageView(image: UIImage(named: "face")).then {
        $0.contentMode = .scaleAspectFill
    }
    let welcome = UILabel().then {
        $0.text = "안녕하세요, 노혜인님!"
        $0.numberOfLines = 0
        $0.font = .boldSystemFont(ofSize: 22)
    }
    let pointInform = UILabel().then {
        $0.text = "노혜인님의 탄소 포인트"
        $0.font = .boldSystemFont(ofSize: 22)
    }

    let topView = ShadowView().then {
        $0.shadowcolor = UIColor(red: 0.82, green: 0.82, blue: 0.82, alpha: 0.8)
        $0.shadowopacity = 1
        $0.shadowradius = 8
        $0.shadowoffset = CGSize(width: 0, height: 3)
        $0.backgroundColor = .white
        $0.layer.cornerRadius = 20
    }
    let middleView = ShadowView().then {
        $0.shadowcolor = UIColor(red: 0.82, green: 0.82, blue: 0.82, alpha: 0.8)
        $0.shadowopacity = 1
        $0.shadowradius = 8
        $0.shadowoffset = CGSize(width: 0, height: 3)
        $0.backgroundColor = .white
        $0.layer.cornerRadius = 20

    } 
    
    let leaves = UIImageView(image: UIImage(named: "leaves"))
    
    let bottomView = ShadowView().then {
        $0.shadowcolor = UIColor(red: 0.82, green: 0.82, blue: 0.82, alpha: 0.8)
        $0.shadowopacity = 1
        $0.shadowradius = 8
        $0.shadowoffset = CGSize(width: 0, height: 3)
        $0.backgroundColor = .white
        $0.layer.cornerRadius = 20

    }
    let guide = UILabel().then {
        $0.text = "사용법"
        $0.font = WDFont.medium(size: 18)
        
    }
    let layerScrollView = UIScrollView().then {
        $0.isPagingEnabled = true
        $0.isScrollEnabled = true
        $0.showsHorizontalScrollIndicator = false
        $0.showsVerticalScrollIndicator = false
        
    }
    
    let leftBtn = UIButton().then {
        $0.setImage(UIImage(systemName: "chevron.left"), for: .normal)
        $0.tintColor = .lightGray

    }
    let rightBtn = UIButton().then {
        $0.setImage(UIImage(systemName: "chevron.right"), for: .normal)
        $0.tintColor = .lightGray

    }
    
    
    @objc
    func rightBtnTapped() {
        if pageCount + 1 < 3 {
            setPageControlSelectedPage(currentPage:  self.pageCount + 1)
            scrollToSelected(page: pageCount)
            

        }

    }
    @objc
    func leftBtnTapped() {
        if pageCount - 1 >= 0 {
            setPageControlSelectedPage(currentPage:  self.pageCount - 1)
            scrollToSelected(page: pageCount)


        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setUI()
        
        layerScrollView.delegate = self
        
        setImageViews()
        setPageControlSelectedPage(currentPage: pageCount)
    }
    
    var imageViews = [UIImageView(), UIImageView(), UIImageView()]
    
    var layerViews = [UIView(), UIView(), UIView()]
    
    var imageRects = [CGSize(width: getWidth(width: 190), height: getHeight(height: 106)),CGSize(width: getWidth(width: 140), height: getHeight(height: 117)), CGSize(width: getWidth(width: 122.5), height: getHeight(height: 113.5))]
    
    var pageControl = UIPageControl().then {
        $0.numberOfPages = 3
        $0.tintColor = maincolor
        $0.currentPageIndicatorTintColor = maincolor
        $0.pageIndicatorTintColor = .lightGray
        $0.isUserInteractionEnabled = false
    }
    
    func setImageViews() {
        DispatchQueue.main.async {

            for i in 0..<self.layerViews.count {
                
                
                let xPos = self.layerScrollView.frame.width * CGFloat(i)
                self.layerViews[i].frame = CGRect(x: xPos, y: 0, width: self.layerScrollView.bounds.width, height: self.layerScrollView.bounds.height)
                
                
                
                self.layerScrollView.addSubview(self.layerViews[i])
              
                self.layerScrollView.contentSize.width = self.layerViews[i].frame.width * CGFloat(i + 1)
                
            }
            
            _ = self.imageViews.enumerated().map { count, image in
                image.image = UIImage(named: "Layer_1-\(count)")
         
                self.layerViews[count].addSubview(self.imageViews[count])
                self.imageViews[count].snp.makeConstraints {
                    $0.width.height.equalTo(self.imageRects[count])
                    $0.center.equalTo(self.layerViews[count])
                }
                
                }
        }
    }
    
      
    
    
    private func setPageControlSelectedPage(currentPage: Int) {
        self.pageCount = currentPage
        pageControl.currentPage = currentPage
    }
    
    private func scrollToSelected(page: Int) {
        let xPos = self.layerScrollView.frame.width * CGFloat(page)
        let centerOffset = CGPoint(x: xPos, y: 0)
        layerScrollView.setContentOffset(centerOffset, animated: true)
    }
    
    func scrollViewDidScroll(_ layerScrollView: UIScrollView) {
        let value = layerScrollView.contentOffset.x/layerScrollView.frame.size.width
        setPageControlSelectedPage(currentPage: Int(round(value)))
    }
    
    
    
    
    func setUI() {
       

        self.view.addSubview(self.scrollView)
        self.scrollView.addSubview(self.contentView)
        
        self.contentView.addSubview(self.topView)
        self.topView.addSubview(self.face)
        self.topView.addSubview(self.welcome)

        
        self.contentView.addSubview(self.middleView)
        self.middleView.addSubview(self.pointInform)
        self.middleView.addSubview(self.leaves)
        
        self.contentView.addSubview(self.bottomView)
        self.bottomView.addSubview(self.layerScrollView)
        self.contentView.addSubview(self.guide)
        
        self.contentView.addSubview(self.rightBtn)
        self.contentView.addSubview(self.leftBtn)
        
        self.contentView.addSubview(self.pageControl)
        
        rightBtn.addTarget(self, action: #selector(rightBtnTapped), for: .touchUpInside)
        leftBtn.addTarget(self, action: #selector(leftBtnTapped), for: .touchUpInside)

        
        scrollView.snp.makeConstraints {
            $0.top.bottom.leading.trailing.equalTo(self.view.safeAreaLayoutGuide)
        }
        
        contentView.snp.makeConstraints {
            $0.top.bottom.leading.trailing.width.equalToSuperview()
            $0.height.equalTo(getHeight(height: 590))
        }
     
        
        topView.snp.makeConstraints {
            $0.width.equalTo(getWidth(width: 326))
            $0.height.equalTo(getHeight(height: 109))
            $0.centerX.equalToSuperview()
            $0.top.equalToSuperview()
        }
        face.snp.makeConstraints {
            $0.width.equalTo(getWidth(width: 82))
            $0.height.equalTo(getHeight(height: 82))
            $0.top.equalToSuperview().inset(getHeight(height: 11))
            $0.leading.equalToSuperview().inset(getHeight(height: 29))
        }
        welcome.snp.makeConstraints {
            $0.width.equalTo(getWidth(width: 156))
            $0.height.equalTo(getHeight(height: 64))
            $0.leading.equalTo(face.snp.trailing).offset(getWidth(width: 29))
            $0.centerY.equalTo(face)
        }
        
        
        
        middleView.snp.makeConstraints {
            $0.width.equalTo(getWidth(width: 324))
            $0.height.equalTo(getHeight(height: 166))
            $0.centerX.equalToSuperview()
            $0.top.equalTo(topView.snp.bottom).offset(getHeight(height: 30))

        }
        pointInform.snp.makeConstraints {
            $0.top.equalToSuperview().inset(getHeight(height: 26))
            $0.centerX.equalToSuperview()
        }
        leaves.snp.makeConstraints {
            $0.leading.equalTo(getWidth(width: 98))
            $0.centerY.equalToSuperview()
            $0.width.equalTo(getWidth(width: 18.67))
            $0.height.equalTo(getHeight(height: 33.7))
        }
        
        guide.snp.makeConstraints {
            $0.bottom.equalTo(bottomView.snp.top).offset(getHeight(height: -7))
            $0.centerX.equalToSuperview()
        }
        
        bottomView.snp.makeConstraints {
            $0.width.equalTo(getWidth(width: 282))
            $0.height.equalTo(220)
            $0.centerX.equalToSuperview()
            $0.top.equalTo(middleView.snp.bottom).offset(getHeight(height: 50))

        }
        
        layerScrollView.snp.makeConstraints {
            $0.trailing.leading.equalTo(self.bottomView)
            $0.top.equalTo(self.bottomView)
            $0.height.equalTo(bottomView)
        }
        
        pageControl.snp.makeConstraints {
            $0.trailing.leading.equalToSuperview()
            $0.top.equalTo(bottomView.snp.bottom)
            $0.height.equalTo(40)
            
            
        }
        
        leftBtn.snp.makeConstraints {
            $0.width.height.equalTo(40)
            $0.trailing.equalTo(bottomView.snp.leading)
            $0.centerY.equalTo(bottomView)
        }
        
        rightBtn.snp.makeConstraints {
            $0.width.height.equalTo(40)
            $0.leading.equalTo(bottomView.snp.trailing)
            $0.centerY.equalTo(bottomView)

        }
        
        
        
        


      

        


    }

}

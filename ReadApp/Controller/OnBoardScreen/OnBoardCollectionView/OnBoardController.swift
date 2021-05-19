//
//  OnBoardController.swift
//  ReadApp
//
//  Created by Soda on 5/17/21.
//

import UIKit

class OnBoardController: UIViewController {
    
    //MARK:-> outlet
    @IBOutlet weak var onBoardCollectionView: UICollectionView!
    @IBOutlet weak var pageController: UIPageControl!
    @IBOutlet weak var nextButtonOutlet: UIButton!
    
    //MARK:-> properties
    
    var onBoardSlide:[OnBoardDataModel] = []
    var currentPage = 0 {
        didSet {
            pageController.currentPage = currentPage
            if currentPage == onBoardSlide.count - 1 {
                nextButtonOutlet.setTitle("Get Started", for: .normal)
            }
            else {
                nextButtonOutlet.setTitle("Next", for: .normal)
            }
        }
    }
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        SetupCollectionView()
        assignValueToArray()
        
    }
    
    func assignValueToArray() {
        onBoardSlide = [
            OnBoardDataModel(title: "Reading is very important to strengthen the mind",  images: #imageLiteral(resourceName: "1")),
            OnBoardDataModel(title: "An important hobby",  images:#imageLiteral(resourceName: "3")),
            OnBoardDataModel(title: "Reading is able to change ideas",  images: #imageLiteral(resourceName: "2"))
        ]
    }
    
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        
        let width = scrollView.frame.width
        currentPage = Int(scrollView.contentOffset.x / width)
        pageController.currentPage = currentPage
    }
    
    
    @IBAction func nextButtonAction(_ sender: Any) {
        UserDefaults.standard.set(true, forKey: "NewUser9")
        
        if currentPage == onBoardSlide.count - 1 {
            
            Core.Shared.notNewUser()
            dismiss(animated: true, completion: nil)
            print("Go to Another Page 🚀")
        }
        
        else {
            currentPage += 1
            let indexpath = IndexPath(item: currentPage, section: 0)
            onBoardCollectionView.scrollToItem(at: indexpath, at: .centeredHorizontally, animated: true)
        }
        
    }
}




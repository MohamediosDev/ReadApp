//
//  BookDetailVc.swift
//  ReadApp
//
//  Created by Mohamed on 2/18/21.
//

import UIKit
import Alamofire
import SDWebImage
import JGProgressHUD
import SafariServices
import Cosmos

class BookDetailVc: UIViewController {
    
    //MARK:- Outlet
    @IBOutlet weak var backImage: UIImageView!
    @IBOutlet weak var mainImage: UIImageView!
    @IBOutlet weak var titleimage: UILabel!
    @IBOutlet weak var authoursTitle: UILabel!
    @IBOutlet weak var discriptionText:UILabel!
    
    @IBOutlet weak var publisherNametext: UILabel!
    @IBOutlet weak var publisherDate: UILabel!
    @IBOutlet weak var readButton: UIButton!
    @IBOutlet weak var bookTitleLabel: UILabel!
    @IBOutlet weak var subTitleText: UILabel!
    @IBOutlet weak var pageCountLabel: UILabel!
    @IBOutlet weak var catogryLabel: UILabel!
    @IBOutlet weak var rateView: CosmosView!
    
    
    
    
    //MARK:- properties
    
    var bookID:String?
    var bookDetail:BookModal?
    var bookDefine:VolumeInfo?
    
    
    
    
    //MARK:- App Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        getBookdetail()
        mainImage.layer.cornerRadius = 15
        rateView.settings.fillMode = .half
        
        
    }
    
    //MARK:- Class Methods
    func getBookdetail() {
        
        let hud = JGProgressHUD()
        hud.textLabel.text = "Loading"
        hud.show(in: self.view)
        
        let url = "https://www.googleapis.com/books/v1/volumes?q=\(bookID!)"
        ApiService.Shared.fetchData(url: url, parms: nil  , headers: nil, method:.get) { [weak self](getBook:BookModal?, failBook:BookModal?, error) in
            
            guard let self = self else {return}
            if let error = error {
                print(error.localizedDescription)
                hud.dismiss()
            }
            
            else {
                self.bookDetail = getBook
                hud.dismiss()
                assignValueToLabels()
            }
        }
        
        func assignValueToLabels() {
            
            guard let itemArray = self.bookDetail?.items else {return}
            for item in itemArray {
                self.titleimage.text = item.volumeInfo?.title
                self.bookTitleLabel.text = item.volumeInfo?.title
                self.subTitleText.text = item.volumeInfo?.subtitle
                self.readButton.layer.cornerRadius = readButton.frame.height / 2
                self.authoursTitle.text = item.volumeInfo?.authors?[0]
                self.discriptionText.text = item.volumeInfo?.volumeInfoDescription
                self.publisherNametext.text = item.volumeInfo?.publisher
                self.publisherDate.text = item.volumeInfo?.publishedDate
                self.pageCountLabel.text = "\(item.volumeInfo?.pageCount ?? 0) pages"
                self.catogryLabel.text = item.volumeInfo?.categories?[0]
                self.backImage.sd_imageIndicator = SDWebImageActivityIndicator.gray
                self.backImage.sd_setImage(with:URL(string:item.volumeInfo?.imageLinks?.thumbnail ?? "" ),placeholderImage: UIImage(named: "placeholder") ,completed: nil )
                self.mainImage.sd_imageIndicator = SDWebImageActivityIndicator.gray
                self.mainImage.sd_setImage(with:URL(string:item.volumeInfo?.imageLinks?.thumbnail ?? "" ),placeholderImage: UIImage(named: "placeholder") ,completed: nil )
                    self.rateView.rating = Double(item.volumeInfo?.averageRating ?? 0)
                
               
               
            }
        }
    }
    
    func readBook() {
        
       
        
        
        
            }
    
    //MARK:- IB Actions
    
    @IBAction func readButtonTapped(_ sender: Any) {
    
            
           
    
  }
}

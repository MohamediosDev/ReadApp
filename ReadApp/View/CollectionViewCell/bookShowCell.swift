//
//  bookShowCell.swift
//  ReadApp
//
//  Created by Mohamed on 2/17/21.
//

import UIKit

class bookShowCell: UICollectionViewCell {
    
    
    @IBOutlet weak var bookImage: UIImageView!
    @IBOutlet weak var bookName: UILabel!
    @IBOutlet weak var backView: UIView!
    

    override func awakeFromNib() {
        super.awakeFromNib()
        bookImage.layer.cornerRadius = 10
        bookImage.layer.masksToBounds = true
    }
    

}

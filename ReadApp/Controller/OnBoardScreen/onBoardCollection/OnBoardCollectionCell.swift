//
//  OnBoardCollectionCell.swift
//  ReadApp
//
//  Created by Soda on 5/17/21.
//

import UIKit

class OnBoardCollectionCell: UICollectionViewCell {
    
    
    @IBOutlet weak var imageShow: UIImageView!
    @IBOutlet weak var titleText: UILabel!
    
    func ConfigureCell(_ onBoard:OnBoardDataModel) {
        
        imageShow.image = onBoard.images
        titleText.text = onBoard.title
    }
    
}

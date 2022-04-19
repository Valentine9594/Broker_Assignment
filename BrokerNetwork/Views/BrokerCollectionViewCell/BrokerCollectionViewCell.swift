//
//  BrokerCollectionViewCell.swift
//  BrokerNetwork
//
//  Created by neosoft on 18/04/22.
//

import UIKit

class BrokerCollectionViewCell: UICollectionViewCell {
//    Broker Views elated
    @IBOutlet weak var brokerProfileImage: UIImageView!
    @IBOutlet weak var brokerName: UILabel!
    @IBOutlet weak var brokerAttributes: UILabel!
    @IBOutlet weak var brokerDescription: UILabel!
    
//    Broker Client related views
    @IBOutlet weak var bottomView: UIView!
    @IBOutlet weak var brokerClientProfileImage: UIImageView!
    @IBOutlet weak var brokerClientName: UILabel!
    @IBOutlet weak var brokerClientCompany: UILabel!
    @IBOutlet weak var cancelButton: UIButton!
    @IBOutlet weak var callButton: UIButton!
    @IBOutlet weak var writeMessageTextField: UITextField!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    private func setupUI(){
        DispatchQueue.main.async {
            self.bottomView.layer.cornerRadius = cornerRadius
            self.brokerProfileImage.layer.cornerRadius = cornerRadius
            self.brokerClientProfileImage.layer.cornerRadius = cornerRadius
            self.brokerClientProfileImage.layer.borderWidth = borderWidth
            self.brokerClientProfileImage.layer.borderColor = profileImageBorderColor
            self.brokerDescription.numberOfLines = 0
            self.brokerDescription.lineBreakMode = .byWordWrapping
            self.brokerProfileImage.clipsToBounds = true
            self.brokerClientProfileImage.clipsToBounds = true
            self.writeMessageTextField.layer.cornerRadius = cornerRadius
            self.callButton.layer.cornerRadius = cornerRadius
            
            if let sendImage = UIImage(systemName: "paperplane.fill"){
                self.writeMessageTextField.setRightView(image: sendImage)
            }
        }
    }
    
    func setupHorizontalCells(horizontalCellsData: HorizontalCards?){
        guard horizontalCellsData != nil else{ return }
        setupUI()
        
        DispatchQueue.main.async {
            self.brokerName.text = horizontalCellsData?.title
            self.brokerDescription.text = horizontalCellsData?.info
            self.brokerAttributes.text = addAllTextWithSpacedBlackDots(stringArray: horizontalCellsData?.subInfo ?? [SubInfoInHorizontalCards]())
            
            let profileImageURL = URL(string: horizontalCellsData?.assignedTo?.profilePictureURL ?? "")
            self.brokerClientProfileImage.sd_setImage(with: profileImageURL, completed: nil)
            self.brokerClientName.text = horizontalCellsData?.assignedTo?.name
            self.brokerClientCompany.text = horizontalCellsData?.assignedTo?.orgName
        }
    }
    
    
    @IBAction func clickedCancelButton(_ sender: UIButton) {
    }
    
    @IBAction func clickedCallButton(_ sender: UIButton) {
    }
    
}

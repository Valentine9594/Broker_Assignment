//
//  BrokerTableViewCell.swift
//  BrokerNetwork
//
//  Created by neosoft on 15/04/22.
//

import UIKit
import SDWebImage

class BrokerTableViewCell: UITableViewCell {
    
    @IBOutlet weak var brokerProfilePicture: UIImageView!
    @IBOutlet weak var brokerName: UILabel!
    @IBOutlet weak var brokerSummary: UILabel!
    @IBOutlet weak var brokerDescription: UILabel!
    
    @IBOutlet weak var propertyCollectionView: UICollectionView!
    @IBOutlet weak var propertyPageControl: UIPageControl!
    
    let brokerCollectionViewCellReuseIdentifier = "BrokerCollectionViewCell"
    var brokerHorizontalCardsData: [HorizontalCards]?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        contentView.frame = contentView.frame.inset(by: UIEdgeInsets(top: 10, left: 5, bottom: 10, right: 5))
        contentView.layer.cornerRadius = cornerRadius
    }
    
    private func setupUI(){
        DispatchQueue.main.async {
            self.propertyCollectionView.delegate = self
            self.propertyCollectionView.dataSource = self
            self.propertyCollectionView.isScrollEnabled = true
            
            let collectionViewCellNib = UINib(nibName: "BrokerCollectionViewCell", bundle: nil)
            self.propertyCollectionView.register(collectionViewCellNib, forCellWithReuseIdentifier: self.brokerCollectionViewCellReuseIdentifier)
            
            self.brokerProfilePicture.layer.cornerRadius = cornerRadius
            self.brokerProfilePicture.clipsToBounds = true
            self.brokerDescription.numberOfLines = 0
            self.brokerDescription.lineBreakMode = .byWordWrapping
        }
    }
    
    func setupBrokerDataCell(brokerData: CardData?){
        guard brokerData != nil else{ return }
        setupUI()
        self.brokerHorizontalCardsData = brokerData?.horizontalCards
        
        DispatchQueue.main.async {
//            let urlOfProfileImage = URL(string: brokerData?.mainPost?.assignedTo?.profilePictureURL ?? "")
//            self.brokerProfilePicture.sd_setImage(with: urlOfProfileImage, completed: nil)
            self.brokerName.text = brokerData?.mainPost?.title
            if brokerData?.mainPost?.title?.lowercased() == ClientType.Rental.description{
                self.brokerProfilePicture.image?.withTintColor(.blue)
                self.brokerName.textColor = .blue
            }
            else if  brokerData?.mainPost?.title?.lowercased() == ClientType.Resale.description{
                self.brokerProfilePicture.image?.withTintColor(.red)
                self.brokerName.textColor = .red
            }
            self.brokerDescription.text = brokerData?.mainPost?.info
            let brokerAttributes = addAllTextWithSpacedBlackDots(stringArray: brokerData?.mainPost?.subInfo ?? [SubInfoInMainPost]())
            self.brokerSummary.text = brokerAttributes
            self.setupPageControl()
        }
    }
    
    private func setupPageControl(){
//        setting the page control and indicator with slideshow
        self.propertyPageControl.numberOfPages = self.brokerHorizontalCardsData?.count ?? 0
        self.propertyPageControl.pageIndicatorTintColor = .casualBlack
        self.propertyPageControl.currentPageIndicatorTintColor = .blue
        self.propertyPageControl.transform = CGAffineTransform(scaleX: 1.1, y: 1.1)
        self.propertyPageControl.currentPage = 0
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
    }
}

extension BrokerTableViewCell: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return brokerHorizontalCardsData?.count ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: brokerCollectionViewCellReuseIdentifier, for: indexPath) as! BrokerCollectionViewCell
        let brokerMatchedData = self.brokerHorizontalCardsData?[indexPath.row]
        cell.setupHorizontalCells(horizontalCellsData: brokerMatchedData)
        cell.layer.cornerRadius = cornerRadius
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.frame.size.width - 40, height: collectionView.frame.size.height)
    }
    
    private func setCurrentCollectionViewCellIndex(){
        let visibleRect = CGRect(origin: propertyCollectionView.contentOffset, size: propertyCollectionView.bounds.size)
        let visiblePoint = CGPoint(x: visibleRect.midX, y: visibleRect.midY)
        let visibleIndexpath = propertyCollectionView.indexPathForItem(at: visiblePoint)
        self.propertyPageControl.currentPage = visibleIndexpath?.item ?? 0
    }
    
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        setCurrentCollectionViewCellIndex()
    }
    
    func scrollViewWillBeginDecelerating(_ scrollView: UIScrollView) {
        setCurrentCollectionViewCellIndex()
    }
}

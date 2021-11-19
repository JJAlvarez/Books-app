import Foundation
import UIKit
import AlamofireImage

class DetailsController : UIViewController {
    
    var book: Book?
    
    @IBOutlet weak var image: UIImageView!
    @IBOutlet weak var bookTitle: UILabel!
    @IBOutlet weak var bookAuthor: UILabel!
    @IBOutlet weak var scroll: UIScrollView!
    @IBOutlet weak var content: UIView!
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setData()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        self.setBarStyle(traslucent: true)
        
        let shareButton = UIButton(type: .custom)
        shareButton.setImage(UIImage(systemName: "square.and.arrow.up.fill"), for: .normal)
        shareButton.addTarget(self, action: #selector(share), for: .touchUpInside)
        shareButton.frame = CGRect(x: 0, y: 0, width: 50, height: 50)
        let barButton = UIBarButtonItem(customView: shareButton)
        
        navigationItem.rightBarButtonItem = barButton
    }
    
    
    
    @objc func share(_ sender: UIButton?) {
        if let book = self.book {
            let title = "Title:" + book.title
            var bookAuthor = ""
            
            if let author = book.author {
                bookAuthor = "Author: " + author
            }
            
            let activityViewController : UIActivityViewController = UIActivityViewController(
                activityItems: [title, bookAuthor], applicationActivities: nil)
            
            // This lines is for the popover you need to show in iPad
            activityViewController.popoverPresentationController?.sourceView = (sender!)
            
            // This line remove the arrow of the popover to show in iPad
            activityViewController.popoverPresentationController?.sourceRect = CGRect(x: 10, y: 20, width: 0, height: 0)
            
            // Pre-configuring activity items
            activityViewController.activityItemsConfiguration = [
                UIActivity.ActivityType.message
            ] as? UIActivityItemsConfigurationReading
            
            
            // Anything you want to exclude
            activityViewController.excludedActivityTypes = [
                UIActivity.ActivityType.postToWeibo,
                UIActivity.ActivityType.print,
                UIActivity.ActivityType.assignToContact,
                UIActivity.ActivityType.saveToCameraRoll,
                UIActivity.ActivityType.addToReadingList,
                UIActivity.ActivityType.postToFlickr,
                UIActivity.ActivityType.postToVimeo,
                UIActivity.ActivityType.postToTencentWeibo
            ]
            
            self.present(activityViewController, animated: true, completion: nil)
        }
    }
    
    func setData() {
        if let book = self.book {
            self.bookTitle.text = book.title
            if let author = book.author {
                self.bookAuthor.text = author
            }
            
            self.image.setImage(url: book.imageURL)
        }
        
    }
    
    
    
}


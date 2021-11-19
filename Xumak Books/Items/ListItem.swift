import Foundation
import UIKit

class ListItem: UITableViewCell {
    
    @IBOutlet weak var backgroundImage: UIImageView!
    @IBOutlet weak var title: UILabel!
    @IBOutlet weak var author: UILabel!
    
    func setData(book: Book) {
        self.title.text = book.title
        if let author = book.author {
            self.author.text = author
        }
        
        self.backgroundImage.layer.cornerRadius = 8.0
        self.backgroundImage.clipsToBounds = true
        
        self.backgroundImage.setImage(url: book.imageURL)
        
    }
    
}


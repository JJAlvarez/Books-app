import Foundation
import UIKit
import AlamofireImage

extension UIImageView {
    
    func setImage (url: String?) {
        self.image = UIImage(named: Constants.PLACEHOLDER_IDENTIFIER)
        if self.image != nil {
            if let url = url {
                if let imageURL = URL(string: url) {
                    self.af.setImage(withURL: imageURL, imageTransition: .crossDissolve(0.2),
                                           completion: nil) //set image automatically when download compelete.
                }
            }
        }
    }
}

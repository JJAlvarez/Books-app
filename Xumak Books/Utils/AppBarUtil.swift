import Foundation
import UIKit

extension UIViewController {
    
    func setBarStyle(traslucent: Bool) {
        
        self.navigationController?.navigationBar.setBackgroundImage(UIImage(), for: .default)
        self.navigationController?.navigationBar.shadowImage = UIImage()
        self.navigationController?.navigationBar.isTranslucent = traslucent
        self.navigationController?.navigationBar.tintColor = .white
    }
}

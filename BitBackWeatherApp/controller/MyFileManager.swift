


import Foundation
import SwiftUI

struct MyFileManager {
    
    static func getDocumentDirectory() -> URL {
        let paths = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask);
        return paths[0];
    }
    
    static func saveImage(imageName: String, image: UIImage)  {
        let url = self.getDocumentDirectory().appendingPathComponent(imageName)
        
        let data = image.pngData()
        try? data?.write(to: url)
    }
    
    static func readImage(name:String) -> Data? {
        
        let url = self.getDocumentDirectory().appendingPathComponent(name)
        if let data = try? Data(contentsOf: url){
            return data
        }
        print(" failed: reading url from: \(url.absoluteString)")
        return nil
    }
    
    
}

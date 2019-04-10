import UIKit
class FlagModel {
    var imageName:String = ""
    var continentName:String = ""
    var url:URL
    init(imgName:String,cntName:String,imgUrl:URL) {
        self.imageName=imgName
        self.continentName=cntName
        self.url=imgUrl
    }
}

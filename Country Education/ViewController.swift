import UIKit

class ViewController: UICollectionViewController, UICollectionViewDelegateFlowLayout {
    
    var cellID: String {
        return "%CELLID%"
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.collectionView.backgroundColor = .white
        self.collectionView.register(CollectionViewCell.self, forCellWithReuseIdentifier:
            self.cellID)
        
        let formatter = DateFormatter()
        formatter.dateStyle = .full
        formatter.timeStyle = .full
        formatter.timeZone = TimeZone(abbreviation: "GMT")
        formatter.locale = Locale(identifier: "en_In")
        let seconds = convertHoursMinutesToSeconds(houres: 11, minutes: 00)
        
        let date = Date().addingTimeInterval(TimeInterval(-seconds))
        
        print(formatter.string(from: date))
        
        print(self.secondsToHoursMinutesSeconds(seconds: seconds))
        
    }
    
    func convertHoursMinutesToSeconds (houres: Int, minutes: Int) -> Int {
        return ((houres * 3600) + (minutes * 60))
    }
    
    func secondsToHoursMinutesSeconds (seconds : Int) -> (Int, Int, Int) {
        return (seconds / 3600, (seconds % 3600) / 60, (seconds % 3600) % 60)
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 10;
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: self.cellID, for: indexPath) as! CollectionViewCell
        cell.layer.cornerRadius = 20
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: self.collectionView.frame.width - 20, height: 230)
    }

}


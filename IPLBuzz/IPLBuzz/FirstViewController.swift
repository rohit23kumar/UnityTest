//
//  FirstViewController.swift
//  IPLBuzz
//
//  Created by Candidate on 01/04/19.
//  Copyright © 2019 Candidate. All rights reserved.
//

import UIKit

class FirstViewController: UIViewController{
    
    @IBOutlet weak var PlayerPicCollection: UICollectionView!
    
    @IBOutlet weak var battingListView: UITableView!
    
    @IBOutlet weak var bowlingListView: UITableView!
    
    var battingOrderList: [BattingOrder] = []
    
    var bowlingOrderList: [BowlingOrder] = []
    
    var playerArray: [Player] = []

    var data = DataModels()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        bowlingListView.delegate = self
        bowlingListView.dataSource = self
        refreshPage()
    }
    
    func refreshPage() {
        loadBattingView(index: (tabBarController?.selectedIndex)!)
        loadBowlingView(index: (tabBarController?.selectedIndex)!)
        loadPlayers(index: (tabBarController?.selectedIndex)!)
    }
    
    func loadBattingView(index: Int){
        battingListView.allowsSelection = false
        battingListView.rowHeight = 80
        if(index == 0){
            self.battingOrderList = data.getTeamABattingOrder()
        }
        else if(index == 1){
            self.battingOrderList = data.getTeamBBattingOrder()
        }
        battingListView.reloadData()
    }
    
    func loadBowlingView(index: Int){
        bowlingListView.allowsSelection = false
        if(index == 0){
            self.bowlingOrderList = data.getTeamABowlingOrder()
        }
        else if(index == 1){
            self.bowlingOrderList = data.getTeamBBowlingOrder()
        }
        bowlingListView.reloadData()
    }
    
    func loadPlayers(index: Int){
        
        if(index == 0){
            self.playerArray = data.getPlayerForTeamA()
        }
        else if(index == 1){
            self.playerArray = data.getPlayerForTeamB()
        }
        self.PlayerPicCollection.reloadData()
    }


}

extension FirstViewController: UICollectionViewDelegate, UICollectionViewDataSource{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.playerArray.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "customCell", for: indexPath) as! CustomCollectionViewCell
//        let img = UIImage (imageLiteralResourceName: self.playerArray[indexPath.row].image)
        cell.playerImgView.downloaded(from: self.playerArray[indexPath.row].image)
        return cell
    }
    
    //8736
    
}

extension FirstViewController: UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        var cellCount = 0
        
        if tableView == battingListView{
            cellCount = battingOrderList.count
        }else if tableView == bowlingListView{
            cellCount = bowlingOrderList.count
        }
        return cellCount
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if tableView == battingListView,
            let cell = tableView.dequeueReusableCell(withIdentifier: "BattingCell") as?  CustomCellTableViewCell{
            setupBattingCell(obj: battingOrderList[indexPath.row], cell: cell)
            return cell
        } else if tableView == bowlingListView,
            let cell = tableView.dequeueReusableCell(withIdentifier: "BowlingCell") as? BowlerTableViewCell {
            setupBowlingCell(obj: bowlingOrderList[indexPath.row], cell: cell)
            return cell
        }
        
        return UITableViewCell()
        
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        if tableView == battingListView {
            return "Fall Of Wickets"
        }else if tableView == bowlingListView{
            return "Run Conceded"
        }else{
            return ""
        }
    }
    
    func setupBattingCell(obj: BattingOrder, cell: CustomCellTableViewCell) {
        cell.playerLbl.text = obj.name
        cell.ballLbl.text = obj.outOnBall?.description
        cell.outLbl.text = "B \(obj.bowledBy ?? "") C \(obj.caughtby ?? "")"
    }
    
    func setupBowlingCell(obj: BowlingOrder, cell: BowlerTableViewCell) {
        cell.bowlerLbl.text = obj.name
        cell.economyLbl.text = "\(obj.runs ?? 0)/\(obj.wickets ?? 0)"
    }
    
}

extension UIImageView {
    func downloaded(from url: URL, contentMode mode: UIView.ContentMode = .scaleAspectFit) {
        contentMode = mode
        URLSession.shared.dataTask(with: url) { data, response, error in
            guard
                let httpURLResponse = response as? HTTPURLResponse, httpURLResponse.statusCode == 200,
                let mimeType = response?.mimeType, mimeType.hasPrefix("image"),
                let data = data, error == nil,
                let image = UIImage(data: data)
                else { return }
            DispatchQueue.main.async() {
                self.image = image
            }
            }.resume()
    }
    func downloaded(from link: String, contentMode mode: UIView.ContentMode = .scaleAspectFit) {
        guard let url = URL(string: link) else { return }
        downloaded(from: url, contentMode: mode)
    }
}

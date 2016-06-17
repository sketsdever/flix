//
//  DetailedViewController.swift
//  flix
//
//  Created by Shea Ketsdever on 6/15/16.
//  Copyright © 2016 Shea Ketsdever. All rights reserved.
//

import UIKit

class DetailedViewController: UIViewController {

    @IBOutlet weak var posterImageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var overviewLabel: UILabel!
    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var infoView: UIView!
    @IBOutlet weak var releaseDateLabel: UILabel!
    @IBOutlet weak var webButton: UIButton!
    
    var movie: NSDictionary!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let title = movie["title"] as? String
        titleLabel.text = title
        titleLabel.sizeToFit()
        
        let overview = movie["overview"] as? String
        overviewLabel.text = overview
        overviewLabel.sizeToFit()
        
        let releaseDate = movie["release_date"] as? String
        //releaseDate = releaseDate?.substringFromIndex(1)
        //releaseDate = releaseDate?.substringToIndex(10)
        releaseDateLabel.text = releaseDate
        releaseDateLabel.sizeToFit()
        
        infoView.bringSubviewToFront(webButton)
        
        infoView.sizeToFit()
        
        let newFrame = CGRectMake(infoView.frame.origin.x, infoView.frame.origin.y, infoView.frame.size.width, titleLabel.frame.size.height + overviewLabel.frame.size.height + releaseDateLabel.frame.size.height + 50)
        infoView.frame = newFrame;
        
        scrollView.contentSize = CGSize(width:scrollView.frame.size.width, height: infoView.frame.origin.y + infoView.frame.size.height)
        
        
        let baseUrl = "http://image.tmdb.org/t/p/w500"
        if let posterPath = movie["poster_path"] as? String {
            let imageUrl = NSURL(string: baseUrl + posterPath)
            posterImageView.setImageWithURL(imageUrl!)
        }

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    @IBAction func loadWebPage(sender: AnyObject) {
        let url : NSURL = NSURL(string: "http://www.fandango.com/")!
        if UIApplication.sharedApplication().canOpenURL(url) {
            UIApplication.sharedApplication().openURL(url)
        }
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}

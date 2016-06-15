//
//  MoviesViewController.swift
//  flix
//
//  Created by Shea Ketsdever on 6/15/16.
//  Copyright © 2016 Shea Ketsdever. All rights reserved.
//


// for detail view: segue, prepareforsegue

import UIKit
import AFNetworking
import MBProgressHUD

class MoviesViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    @IBOutlet var screenView: UIView!
    @IBOutlet weak var networkErrorView: UIView!
    @IBOutlet weak var tableView: UITableView!
    var movies: [NSDictionary]?
    
    let CellIdentifier = "TableCellView"
    var checked: [Bool]!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // hide the network error message
        self.networkErrorView.hidden = true
        self.tableView.frame.origin.y = 0
        
        /*checked = [Bool](count: tableView.numberOfRowsInSection(<#T##section: Int##Int#>), repeatedValue: false)
        tableView.registerClass(UITableViewCell.self, forCellReuseIdentifier: CellIdentifier)*/
        
        // Initialize a UIRefreshControl
        let refreshControl = UIRefreshControl()
        refreshControl.addTarget(self, action: #selector(refreshControlAction(_:)), forControlEvents: UIControlEvents.ValueChanged)
        tableView.insertSubview(refreshControl, atIndex: 0)
        
        tableView.dataSource = self
        tableView.delegate = self
        
        let apiKey = "1d3134ee9fc0c2080bc1733793c9dd52"
        let url = NSURL(string: "https://api.themoviedb.org/3/movie/now_playing?api_key=\(apiKey)")
        let request = NSURLRequest(
            URL: url!,
            cachePolicy: NSURLRequestCachePolicy.ReloadIgnoringLocalCacheData,
            timeoutInterval: 10)
        
        let session = NSURLSession(
            configuration: NSURLSessionConfiguration.defaultSessionConfiguration(),
            delegate: nil,
            delegateQueue: NSOperationQueue.mainQueue()
        )
        
        // Display HUD right before the request is made
        MBProgressHUD.showHUDAddedTo(self.view, animated: true)
        
        let task: NSURLSessionDataTask = session.dataTaskWithRequest(request, completionHandler: { (dataOrNil, response, error) in
                if let data = dataOrNil {
            
                    if let responseDictionary = try! NSJSONSerialization.JSONObjectWithData( data, options:[]) as? NSDictionary {
                    
                        self.movies = responseDictionary["results"] as? [NSDictionary]
                    }
                } else {
                    //if error?.code == 503 {
                    // bring to front and un-hide view
                self.screenView.bringSubviewToFront(self.networkErrorView)
                self.tableView.frame.origin.y = self.tableView.frame.origin.y + self.networkErrorView.frame.height
                self.networkErrorView.hidden = false
                }
            
            // Hide HUD once the network request comes back (must be done on main UI thread)
            MBProgressHUD.hideHUDForView(self.view, animated: true)
            
            self.tableView.reloadData()
            
            })
        
        task.resume()
    }
    
    // Makes a network request to get updated data
    // Updates the tableView with the new data
    // Hides the RefreshControl
    func refreshControlAction(refreshControl: UIRefreshControl) {
        
        // hide the network error message
        self.networkErrorView.hidden = true
        self.tableView.frame.origin.y = 0
        
        // Create the NSURLRequest (myRequest)
        let apiKey = "1d3134ee9fc0c2080bc1733793c9dd52"
        let url = NSURL(string: "https://api.themoviedb.org/3/movie/now_playing?api_key=\(apiKey)")
        let request = NSURLRequest(
            URL: url!,
            cachePolicy: NSURLRequestCachePolicy.ReloadIgnoringLocalCacheData,
            timeoutInterval: 10)
        
        // Configure session so that completion handler is executed on main UI thread
        let session = NSURLSession(
            configuration: NSURLSessionConfiguration.defaultSessionConfiguration(),
            delegate: nil,
            delegateQueue: NSOperationQueue.mainQueue()
        )
        
        let task : NSURLSessionDataTask = session.dataTaskWithRequest(request, completionHandler: { (dataOrNil, response, error) in
            if let data = dataOrNil {
                
                if let responseDictionary = try! NSJSONSerialization.JSONObjectWithData( data, options:[]) as? NSDictionary {
                    
                    // Use the new data to update the data source
                    self.movies = responseDictionary["results"] as? [NSDictionary]
                    
                    
                    // Reload the tableView now that there is new data
                    self.tableView.reloadData()
                    
                }
            } else {
                self.screenView.bringSubviewToFront(self.networkErrorView)
                self.tableView.frame.origin.y = self.tableView.frame.origin.y + self.networkErrorView.frame.height
                self.networkErrorView.hidden = false
            }
            
            self.tableView.reloadData()
            
            // Hide HUD once the network request comes back (must be done on main UI thread)
            MBProgressHUD.hideHUDForView(self.view, animated: true)
            
            // Tell the refreshControl to stop spinning
            refreshControl.endRefreshing()
        });
        task.resume()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    /*func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        tableView.deselectRowAtIndexPath(indexPath, animated: true)
        checked[indexPath.row] = !checked[indexPath.row]
        tableView.reloadRowsAtIndexPaths([indexPath], withRowAnimation: .Automatic)
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier(CellIdentifier, forIndexPath: indexPath) as UITableViewCell
        cell.textLabel?.text = data[indexPath.row]
        if checked[indexPath.row] {
            cell.accessoryType = .Checkmark
        } else {
            cell.accessoryType = .None
        }
        return cell
    }*/
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if let movies = movies {
            return movies.count
        } else {
            return 0
        }
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        /*let cell = UITableViewCell()
        let row = indexPath.row
        let section = indexPath.section
        cell.textLabel?.text = "Section: \(section), Row \(row)"
        print(row)
        return cell*/
    
        let cell = tableView.dequeueReusableCellWithIdentifier("movieCell", forIndexPath: indexPath) as! movieCell
        let movie = movies![indexPath.row]
        let title = movie["title"] as!  String
        let overview = movie["overview"] as! String
        
        let baseUrl = "http://image.tmdb.org/t/p/w500"
        let posterPath = movie["poster_path"] as! String
        let imageUrl = NSURL(string: baseUrl + posterPath)
        
        
        cell.titleLabel.text = title
        cell.overviewLabel.text = overview
        cell.posterView.setImageWithURL(imageUrl!)
        
        return cell
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

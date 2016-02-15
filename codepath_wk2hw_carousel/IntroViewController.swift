//
//  IntroViewController.swift
//  codepath_wk2hw_carousel
//
//  Created by Ariel Liu on 2/8/16.
//  Copyright © 2016 Ariel Liu. All rights reserved.
//

import UIKit

class IntroViewController: UIViewController, UIScrollViewDelegate {

    @IBOutlet weak var introImageView: UIImageView!
    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var introTileView1: UIImageView!
    @IBOutlet weak var introTileView2: UIImageView!
    @IBOutlet weak var introTileView3: UIImageView!
    @IBOutlet weak var introTileView4: UIImageView!
    @IBOutlet weak var introTileView5: UIImageView!
    @IBOutlet weak var introTileView6: UIImageView!
    
    var tileOriginalY:CGFloat!
    var introTiles = [(
        imageView: UIImageView,
        origin: CGPoint,
        destination: CGPoint,
        initialScale: CGFloat,
        initialRotation: CGFloat
    )]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        scrollView.contentSize = introImageView.image!.size
        
        scrollView.delegate = self
        
        let tileViews = [
            (
                imageView: introTileView1,
                destination: CGPoint(x: 45.0, y: 753.0),
                initialScale: CGFloat(0.7),
                initialRotation: CGFloat(-20.0)
            ),
            (
                imageView: introTileView2,
                destination: CGPoint(x: 199, y: 753),
                initialScale: CGFloat(1.4),
                initialRotation: CGFloat(20.0)
            ),
            (
                imageView: introTileView3,
                destination: CGPoint(x: 199, y: 829),
                initialScale: CGFloat(1.4),
                initialRotation: CGFloat(-20.0)
            ),
            (
                imageView: introTileView4,
                destination: CGPoint(x: 122,y: 906),
                initialScale: CGFloat(1.4),
                initialRotation: CGFloat(20.0)
            ),
            (
                imageView: introTileView5,
                destination: CGPoint(x: 45, y: 906),
                initialScale: CGFloat(1.4),
                initialRotation: CGFloat(20.0)
            ),
            (
                imageView: introTileView6,
                destination: CGPoint(x: 199, y: 907),
                initialScale: CGFloat(1.4),
                initialRotation: CGFloat(-20.0)
            )
        ]
        
        for tile in tileViews {
            introTiles.append((
                imageView: tile.imageView,
                origin: tile.imageView.frame.origin,
                destination: tile.destination,
                initialScale: tile.initialScale,
                initialRotation: tile.initialRotation
            ))
        }
        
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
    }
    
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func scrollViewDidScroll(scrollView: UIScrollView) {
        
        for tile in introTiles {
            let y = convertValue(
                scrollView.contentOffset.y,
                r1Min: 0,
                r1Max: 568,
                r2Min: tile.origin.y,
                r2Max: tile.destination.y
            )
            let x = convertValue(
                scrollView.contentOffset.y,
                r1Min: 0,
                r1Max: 568,
                r2Min: tile.origin.x,
                r2Max: tile.destination.x
            )
            
            let rotate = convertValue(
                scrollView.contentOffset.y,
                r1Min: 0,
                r1Max: 568,
                r2Min: tile.initialRotation,
                r2Max: 0
            )
            
            let scale = convertValue(
                scrollView.contentOffset.y,
                r1Min: 0,
                r1Max: 568,
                r2Min: tile.initialScale,
                r2Max: 1
            )
            
            tile.imageView.transform = CGAffineTransformMakeScale(scale, scale)
            tile.imageView.transform = CGAffineTransformTranslate(tile.imageView.transform, x - tile.origin.x, y - tile.origin.y)
            tile.imageView.transform = CGAffineTransformRotate(tile.imageView.transform, CGFloat(Double(rotate) * M_PI / 180))
            
//            tile.imageView.frame.origin = CGPoint(x: x, y: y)
            
//            tile.imageView.transform = CGAffineTransformMakeScale(scale, scale)
            

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

//
//  SleepMarkerView.swift
//  Meum
//
//  Created by fanrong on 2017/11/29.
//  Copyright © 2017年 huangwei. All rights reserved.
//

//
//  XYMarkerView.swift
//  ChartsDemo
//  Copyright © 2016 dcg. All rights reserved.
//

import Foundation
import Charts


@objc protocol TYMarkerViewDelegate {
    @objc func tyMarkerViewRefreshContentAttString(mark:TYMarkerView, entry: ChartDataEntry, highlight: Highlight) -> NSAttributedString
}

open class TYMarkerView: BalloonMarker
{
    @objc weak var delegate: TYMarkerViewDelegate?
    
    fileprivate var yFormatter = NumberFormatter()
    
    @objc public override init(color: UIColor, font: UIFont, textColor: UIColor, insets: UIEdgeInsets)
    {
        super.init(color: color, font: font, textColor: textColor, insets: insets)
        yFormatter.minimumFractionDigits = 0
        yFormatter.maximumFractionDigits = 0
    }
    
    open override func refreshContent(entry: ChartDataEntry, highlight: Highlight)
    {
        if let delegate = delegate {
            let attString = delegate.tyMarkerViewRefreshContentAttString(mark: self, entry: entry, highlight: highlight)
            setAttLabel(attString);
        }
    }
}


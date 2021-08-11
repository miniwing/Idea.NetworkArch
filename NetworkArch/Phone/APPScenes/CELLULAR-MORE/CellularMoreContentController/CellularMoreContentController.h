//
//  CellularMoreContentController.h
//  NetworkArch
//
//  Created by Harry on 2021/8/1.
//  Copyright © 2021 Harry. All rights reserved.
//
//  Mail: miniwing.hz@gmail.com
//

#import <IDEAUIVendor/IDEAUIVendor.h>

#import "CellularMoreCell.h"

NS_ASSUME_NONNULL_BEGIN

IDEA_ENUM(NSInteger, CellularSection) {
   
   CellularSectionDetail      = 0,
   CellularSectionDataUsage   = 1,
   CellularSectionWarning     = 2,
   CellularSectionNumber
};

IDEA_ENUM(NSInteger, CellularDetail) {
   
   CellularDetailCarrier      = 0,
   CellularDetailISO          = 1,
   CellularDetailCountry      = 2,
   CellularDetailNetwork      = 3,
   CellularDetailRadio        = 4,
   CellularDetailIPV4         = 5,
   CellularDetailIPV6         = 6,
   CellularDetailVoIP         = 7,
   CellularDetailNumber
};

@interface CellularMoreContentController : IDEATableViewController

@property (nonatomic, strong) IBOutletCollection(CellularMoreCell)   NSArray<CellularMoreCell *>   * detailCells;
@property (nonatomic, strong) IBOutletCollection(UIView)          NSArray<UIView *>          * detailCellContainerViews;
@property (nonatomic, weak)   IBOutlet       UIImageView                                     * interfacesImageView;

@property (nonatomic, strong) IBOutletCollection(CellularMoreCell)   NSArray<CellularMoreCell *>   * dataUsageCells;
@property (nonatomic, strong) IBOutletCollection(UIView)          NSArray<UIView *>          * dataUsageCellContainerViews;

@property (nonatomic, strong) IBOutletCollection(CellularMoreCell)   NSArray<CellularMoreCell *>   * warningCells;
@property (nonatomic, strong) IBOutletCollection(UIView)          NSArray<UIView *>          * warningCellContainerViews;

@property (nonatomic, strong) IBOutletCollection(UIView)          NSArray<UIView *>          * separatorViews;

@end

@interface CellularMoreContentController ()

@end

NS_ASSUME_NONNULL_END

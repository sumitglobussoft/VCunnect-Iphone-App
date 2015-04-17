//
//  LocationSearchVIewController.h
//  Vconnect
//
//  Created by Sumit on 13/03/15.
//  Copyright (c) 2015 globussoft. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface LocationSearchVIewController : UITableViewController<UISearchBarDelegate, UISearchDisplayDelegate,UISearchControllerDelegate,UISearchResultsUpdating>{
     NSArray *arr;
  //  NSMutableArray *searchData;
//    UISearchBar *searchBar;
//    UISearchDisplayController *searchDisplayController;
    NSMutableArray * searchResults;
}
//@property(nonatomic,strong)UISearchDisplayController *searchDisplayController;
@end

//
//  LocationSearchVIewController.m
//  Vconnect
//
//  Created by Sumit on 13/03/15.
//  Copyright (c) 2015 globussoft. All rights reserved.
//

#import "LocationSearchVIewController.h"

@interface LocationSearchVIewController ()


@end

@implementation LocationSearchVIewController


- (void)viewDidLoad
{
    [super viewDidLoad];
    arr=[[NSArray alloc] initWithObjects:@"HHDH",@"KDJJ" ,@"SDFS",@"DFD",@"SDFS",@"SDFE",nil];
    searchResults=[[NSMutableArray alloc]init];
    UISearchBar * searchBar = [[UISearchBar alloc] initWithFrame:CGRectMake(0, 150, 320, 44)];
    searchBar.backgroundColor = [UIColor redColor];
    
  [self.view addSubview:searchBar];
    
    searchBar.delegate=self;
    
    UISearchDisplayController *searchBarDC=[[UISearchDisplayController alloc]initWithSearchBar:searchBar contentsController:self];
    searchBarDC.delegate=self;
    searchBarDC.searchResultsDataSource=self;
    searchBarDC.searchResultsDelegate=self;
//self.tableView.tableHeaderView=searchBar;
   // [self loadTableView];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

//default
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    //return [self.tableDataList count];page 214
   // return self->arr.count;
    
    
    if (tableView == self.searchDisplayController.searchResultsTableView) {
        return [searchResults count];
    } else {
        return [arr count];
    }
}

-(void)filterContentForSearchText:(NSString*)searchText scope:(NSString*)scope {
    // Update the filtered array based on the search text and scope.
    // Remove all objects from the filtered search array
    NSLog(@"search text is %@",searchText);
    [searchResults removeAllObjects];
    // Filter the array using NSPredicate
    NSPredicate *predicate = [NSPredicate predicateWithFormat:@"SELF.name contains[c] %@",searchText];
    searchResults = [NSMutableArray arrayWithArray:[arr filteredArrayUsingPredicate:predicate]];
}


#pragma mark - UISearchDisplayController Delegate Methods
-(BOOL)searchDisplayController:(UISearchDisplayController *)controller shouldReloadTableForSearchString:(NSString *)searchString {
    // Tells the table data source to reload when text changes
    [self filterContentForSearchText:searchString scope:
     [[self.searchDisplayController.searchBar scopeButtonTitles] objectAtIndex:[self.searchDisplayController.searchBar selectedScopeButtonIndex]]];
    // Return YES to cause the search result table view to be reloaded.
    return YES;
}

-(BOOL)searchDisplayController:(UISearchDisplayController *)controller shouldReloadTableForSearchScope:(NSInteger)searchOption {
    // Tells the table data source to reload when scope bar selection changes
    [self filterContentForSearchText:self.searchDisplayController.searchBar.text scope:
     [[self.searchDisplayController.searchBar scopeButtonTitles] objectAtIndex:searchOption]];
    // Return YES to cause the search result table view to be reloaded.
    return YES;
}


//default method-2
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    static NSString *CellIdentifier=@"Cell";
    
    UITableViewCell *cell=[tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if(cell==nil){
        cell=[[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
    }
    
    cell.textLabel.text=[arr objectAtIndex:indexPath.row];
    
    
    if (tableView == self.searchDisplayController.searchResultsTableView) {
      cell.textLabel.text=[searchResults objectAtIndex:indexPath.row];       //  cell.textLabel.text=[searchResults objectAtIndex:indexPath.row];
    } else {
     cell.textLabel.text=[arr objectAtIndex:indexPath.row];       //  cell.textLabel.text=[arr objectAtIndex:indexPath.row];
    }
    
    return cell;
}

//to alert the user of selecting the data.
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:nil message:[NSString stringWithFormat:@"You selected %@!", arr] delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil];
    [alert show];
    
    
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
}

@end

//
//  TableViewController.m
//  39WKWebViewHW
//
//  Created by Eduard Galchenko on 5/7/19.
//  Copyright © 2019 Eduard Galchenko. All rights reserved.
//

#import "TableViewController.h"
#import "WebViewController.h"

@interface TableViewController ()

@property (strong, nonatomic) NSArray *sectionsArray;
@property (strong, nonatomic) NSArray *urlArray;
@property (strong, nonatomic) NSArray *pdfArray;

@end

@implementation TableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.myTableView.delegate = self;
    self.myTableView.dataSource = self;
    
    self.pdfArray = [[NSArray alloc] initWithObjects:@"ipad.pdf", @"iphone.pdf", @"iwatch.pdf", nil];
    self.urlArray = [[NSArray alloc] initWithObjects:@"https://www.apple.com/", @"https://developer.apple.com/swift/", @"https://developer.apple.com/", nil];
    
    self.sectionsArray = [NSArray arrayWithObjects:self.pdfArray, self.urlArray, nil];
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    
    return [self.sectionsArray count];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    return 3;
}

- (nullable NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section {
    
    if (section == 0) {
        
        return @"PDF Files";
    }
    
    return @"URLs";
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    NSString *identifier = @"identifier";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    
    if (!cell) {
        
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifier];
    }
    
    NSArray *temp = [self.sectionsArray objectAtIndex:indexPath.section];
    
    cell.textLabel.text = [temp objectAtIndex:indexPath.row];
    
    return cell;
}

#pragma mark - Segue

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    
    if ([segue.identifier isEqualToString:@"SendPdfOrUrl"]) {
        
        WebViewController *controller = (WebViewController *)segue.destinationViewController;
        
        NSIndexPath *index = self.tableView.indexPathForSelectedRow;
        
        if (index.section == 0) {
            
            controller.pdfOrUrlPath = [self.pdfArray objectAtIndex:index.row];
            
        } else if (index.section == 1) {
            
            controller.pdfOrUrlPath = [self.urlArray objectAtIndex:index.row];
        }
    }
}

@end

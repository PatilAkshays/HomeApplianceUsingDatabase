//
//  ListViewController.h
//  HomeAppliance
//
//  Created by Mac on 17/08/1938 Saka.
//  Copyright © 1938 Saka Aksh. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <Firebase/Firebase.h>
#import <FirebaseDatabase/FirebaseDatabase.h>

@interface ListViewController : UIViewController<UITableViewDelegate,UITableViewDataSource>
{
    FIRDatabaseReference *rootDatabaseRef;
    NSMutableArray *allDeviceDictionary;
    UISegmentedControl *mySegement;

}
@property (strong, nonatomic) IBOutlet UIButton *buttonDismiss;

@property (strong, nonatomic) IBOutlet UITableView *listTableView;
- (IBAction)segment:(id)sender;




@end

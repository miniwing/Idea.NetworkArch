//
//  HomeContentController.m
//  NetworkArch
//
//  Created by Harry on 2021/6/25.
//  Copyright © 2021 Harry. All rights reserved.
//
//  Mail: miniwing.hz@gmail.com
//  TEL : +(852)53054612
//

#import "HomeContentController.h"

@interface HomeContentController ()

@end

@implementation HomeContentController

- (void)dealloc {

   __LOG_FUNCTION;

   // Custom dealloc

   __SUPER_DEALLOC;

   return;
}

- (instancetype)initWithCoder:(NSCoder *)aCoder {

   int                            nErr                                     = EFAULT;
   
   __TRY;
   
   self  = [super initWithCoder:aCoder];
   
   if (self) {
            
   } /* End if () */
   
   __CATCH(nErr);
   
   return self;
}

- (void)viewDidLoad {

   int                            nErr                                     = EFAULT;

   __TRY;

   [super viewDidLoad];

    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;

    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;

   __CATCH(nErr);

   return;
}

- (void)didReceiveMemoryWarning {

   int                            nErr                                     = EFAULT;

   __TRY;

   [super didReceiveMemoryWarning];
   // Dispose of any resources that can be recreated.

   __CATCH(nErr);

   return;
}

- (void)viewWillAppear:(BOOL)aAnimated {

   int                            nErr                                     = EFAULT;

   __TRY;

   [super viewWillAppear:aAnimated];

   __CATCH(nErr);

   return;
}

- (void)viewDidAppear:(BOOL)aAnimated {

   int                            nErr                                     = EFAULT;

   __TRY;

   [super viewDidAppear:aAnimated];

   __CATCH(nErr);

   return;
}

- (void)viewWillDisappear:(BOOL)aAnimated {

   int                            nErr                                     = EFAULT;

   __TRY;

   [super viewWillDisappear:aAnimated];

   __CATCH(nErr);

   return;
}

- (void)viewDidDisappear:(BOOL)aAnimated {

   int                            nErr                                     = EFAULT;

   __TRY;

   [super viewDidDisappear:aAnimated];

   __CATCH(nErr);

   return;
}

#pragma mark - UITableViewDataSource
- (NSInteger)numberOfSectionsInTableView:(UITableView *)aTableView {

#warning Incomplete implementation, return the number of sections
    return 0;
}

- (NSInteger)tableView:(UITableView *)aTableView numberOfRowsInSection:(NSInteger)aSection {

#warning Incomplete implementation, return the number of rows
    return 0;
}

/*
- (UITableViewCell *)tableView:(UITableView *)aTableView cellForRowAtIndexPath:(NSIndexPath *)aIndexPath {

   UITableViewCell *cell = [aTableView dequeueReusableCellWithIdentifier:<#@"reuseIdentifier"#> forIndexPath:aIndexPath];

   // Configure the cell...

   return cell;
}
*/

/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)aTableView canEditRowAtIndexPath:(NSIndexPath *)aIndexPath {

   // Return NO if you do not want the specified item to be editable.
   return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)aTableView commitEditingStyle:(UITableViewCellEditingStyle)aEditingStyle forRowAtIndexPath:(NSIndexPath *)aIndexPath {

   if (aEditingStyle == UITableViewCellEditingStyleDelete) {

      // Delete the row from the data source
      [aTableView deleteRowsAtIndexPaths:@[aIndexPath] withRowAnimation:UITableViewRowAnimationFade];
      
   }
   else if (aEditingStyle == UITableViewCellEditingStyleInsert) {

      // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
   }

   return;
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)aTableView moveRowAtIndexPath:(NSIndexPath *)aFromIndexPath toIndexPath:(NSIndexPath *)aToIndexPath {

   return;
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)aTableView canMoveRowAtIndexPath:(NSIndexPath *)aIndexPath {

   // Return NO if you do not want the item to be re-orderable.
   return YES;
}
*/

@end

#pragma mark - IBAction
@implementation HomeContentController (IBACTION)

- (IBAction)onAction:(id)aSender {

   int                            nErr                                     = EFAULT;

   __TRY;

   __CATCH(nErr);

   return;
}

@end

#pragma mark - UIStoryboard
@implementation HomeContentController (UIStoryboard)

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)aSegue sender:(id)aSender {

   int                            nErr                                     = EFAULT;

   __TRY;

   // Get the new view controller using [aSegue destinationViewController].
   // Pass the selected object to the new view controller.

   __CATCH(nErr);

   return;
}

+ (NSString *)storyboard {
   
#warning Incomplete implementation, Name of the Stroyboard.
   return @"";
}

@end

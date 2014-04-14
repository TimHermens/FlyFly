//
//  SimpleTableCell.h
//  FlyFly
//
//  Created by Tim on 06/04/2014.
//  Copyright (c) 2014 edu.fontys.sm. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SimpleTableCell : UITableViewCell

@property (nonatomic, weak) IBOutlet UILabel *nameLabel;
@property (nonatomic, weak) IBOutlet UILabel *scoreLabel;

@end

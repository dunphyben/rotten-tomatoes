//
//  MovieCellTableViewCell.h
//  Rotten Tomatoes
//
//  Created by Benjamin Dunphy on 7/19/14.
//  Copyright (c) 2014 Benjamin Dunphy. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MovieCellTableViewCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UILabel *titleLabel;
@property (weak, nonatomic) IBOutlet UILabel *synopsisLabel;
@property (weak, nonatomic) IBOutlet UIImageView *imageLabel;

@end

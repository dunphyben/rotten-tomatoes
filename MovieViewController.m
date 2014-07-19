//
//  MovieViewController.m
//  Rotten Tomatoes
//
//  Created by Benjamin Dunphy on 7/19/14.
//  Copyright (c) 2014 Benjamin Dunphy. All rights reserved.
//

#import "MovieViewController.h"
#import "MovieCellTableViewCell.h"

@interface MovieViewController ()
@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (nonatomic, strong) NSArray *movies; //creates an array called movies
// nonatomic means no lock on the variable. Nonatomic means not thread safe. App runs in a UI Main thread. Nonatomic means that it's only safe to run on one thread. Atomic mens it's safe to run on multiple threads at the same time. Atomic threads have a trade-off on performance.
@end

@implementation MovieViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    self.tableView.rowHeight = 180;
    NSString *url = @"http://api.rottentomatoes.com/api/public/v1.0/lists/movies/box_office.json?apikey=duxgbnqmvd37e5m7xdv8w9xw";
    [self.tableView registerNib:[UINib nibWithNibName:@"MovieCellTableViewCell" bundle:nil] forCellReuseIdentifier:@"MovieCellTableViewCell"];
    
    NSURLRequest *request = [NSURLRequest requestWithURL:[NSURL URLWithString:url]];
                              [NSURLConnection sendAsynchronousRequest:request queue:[NSOperationQueue mainQueue] completionHandler:^(NSURLResponse *response, NSData *data, NSError * connectionError) {
        id object = [NSJSONSerialization JSONObjectWithData: data options:0 error:nil]; //^ indicates a block is about to follow. Blocks are functions inside of functions. The argument after the carrot ^() is waht's inside the block.
        self.movies = object[@"movies"];
        [self.tableView reloadData];
                              }];
    
    // po self.movies[0][@"year"] --> Type this in the debugger
        
    // Do any additional setup after loading the view from its nib.
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 10;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    MovieCellTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"MovieCellTableViewCell"];
    NSDictionary *movie = self.movies[indexPath.row];
    
    cell.titleLabel.text = movie[@"title"];
    cell.synopsisLabel.text = movie[@"synopsis"];
    
    return cell;
}

// If get "Use of undeclared identifier 'foo', resolve by:


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end




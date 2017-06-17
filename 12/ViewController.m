//
//  ViewController.m
//  12
//
//  Created by 吴灶洲 on 2017/5/21.
//  Copyright © 2017年 吴灶洲. All rights reserved.
//

#import "ViewController.h"
#import "DrawTouchPointView.h"
#import "DrawBackgoupImageView.h"

@interface ViewController ()
@property (weak, nonatomic) DrawTouchPointView *drawView;
@property (weak, nonatomic)  DrawBackgoupImageView *drawBackgourp;
@property (weak, nonatomic) IBOutlet UIImageView *imageView;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.edgesForExtendedLayout = UIRectEdgeNone;
    
    DrawBackgoupImageView *drawBackgourp = [DrawBackgoupImageView initWithImage:[UIImage imageNamed:@"1.jpg"] frame:CGRectMake(0, 100, 320, 200) lineWidth:1.0 lineColor:[UIColor yellowColor]];
    [self.view addSubview:drawBackgourp];
    _drawBackgourp = drawBackgourp;
}
- (IBAction)clickBakcGroup:(UIButton *)sender {
    [_drawBackgourp setStrokeColor:sender.backgroundColor];
}
- (IBAction)setLineWidth:(UISlider *)sender {
    [_drawBackgourp setStrokeWidth:sender.value];
}

- (IBAction)clearAction:(id)sender {
    [_drawBackgourp clearScreen];
}
- (IBAction)eraseAction:(id)sender {
    [_drawBackgourp eraseSreen];
}

- (IBAction)undoAction:(UIButton *)sender {
    [_drawBackgourp revokeScreen];
}

- (void)viewWillDisappear:(BOOL)animated {
    [super viewWillDisappear:animated];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (void)dealloc {
    NSLog(@"===============");
}


@end

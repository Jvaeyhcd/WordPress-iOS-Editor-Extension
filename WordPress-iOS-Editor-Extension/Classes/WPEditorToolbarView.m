//
//  WPEditorToolbarView.m
//  Pods
//
//  Created by Jvaeyhcd on 27/12/2016.
//
//

#import "WPEditorToolbarView.h"

@interface WPEditorToolbarView()

@property (nonatomic, strong) UIButton *imageBtn;
@property (nonatomic, strong) UIButton *cameraBtn;
@property (nonatomic, strong) UILabel *postLbl;
@property (nonatomic, strong) UIImageView *arrowImg;

@end

@implementation WPEditorToolbarView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self baseInit];
    }
    return self;
}

- (void)baseInit
{
    NSBundle* editorBundle = [NSBundle bundleForClass:[self class]];
    
    if (nil == _imageBtn) {
        _imageBtn = [[UIButton alloc]initWithFrame:CGRectMake(0, 0, 44, 44)];
        
        UIImage* image = [UIImage imageNamed:@"publish_btn_pic" inBundle:editorBundle compatibleWithTraitCollection:nil];
        UIImage* buttonImage = [image imageWithRenderingMode:UIImageRenderingModeAlwaysTemplate];
        _imageBtn.tag = 1001;
        [_imageBtn addTarget:self action:@selector(btnClicked:) forControlEvents:UIControlEventTouchUpInside];
        [_imageBtn setImage:buttonImage forState: UIControlStateNormal];
        
        [self addSubview:_imageBtn];
    }
    
    if (nil == _cameraBtn) {
        _cameraBtn = [[UIButton alloc]initWithFrame:CGRectMake(44, 0, 44, 44)];
        UIImage* image = [UIImage imageNamed:@"publish_btn_camera" inBundle:editorBundle compatibleWithTraitCollection:nil];
        UIImage* buttonImage = [image imageWithRenderingMode:UIImageRenderingModeAlwaysTemplate];
        _cameraBtn.tag = 1002;
        [_cameraBtn addTarget:self action:@selector(btnClicked:) forControlEvents:UIControlEventTouchUpInside];
        [_cameraBtn setImage:buttonImage forState: UIControlStateNormal];
        
        [self addSubview:_cameraBtn];
    }
    
    if (nil == _postLbl) {
        _postLbl = [[UILabel alloc]initWithFrame:CGRectMake(88, 0, self.frame.size.width - 88 - 25, 44)];
        _postLbl.textAlignment = NSTextAlignmentRight;
        _postLbl.font = [UIFont systemFontOfSize:14];
        _postLbl.textColor = [UIColor colorWithRed:153 / 255.0 green:153 / 255.0 blue:153 / 255.0 alpha:1.0];
        _postLbl.text = @"发表于：";
        [self addSubview:_postLbl];
    }
    
    if (nil == _arrowImg) {
        _arrowImg = [[UIImageView alloc] initWithFrame:CGRectMake(self.frame.size.width - 8 - 10, 15, 8, 14)];
        [_arrowImg setImage:[UIImage imageNamed:@"com_icon_arow" inBundle:editorBundle compatibleWithTraitCollection:nil]];
        [self addSubview:_arrowImg];
    }
    
    UIView *topView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, self.frame.size.width, 1)];
    topView.backgroundColor = [UIColor colorWithRed:235 / 255.0 green:235 / 255.0 blue:235 / 255.0 alpha:1.0];
    [self addSubview:topView];
    
    UIView *tapView = [[UIView alloc]initWithFrame:CGRectMake(88, 0, self.frame.size.width - 88 - 15, 44)];
    tapView.backgroundColor = [UIColor clearColor];
    [self addSubview:tapView];
    
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tapSelectCategory)];
    tap.cancelsTouchesInView = NO;
    [tapView addGestureRecognizer:tap];
}

- (void)tapSelectCategory
{
    NSLog(@"点击了选择发表");
    [self.delegate selectBBSCategory];
}

- (void)btnClicked: (UIButton *)button
{
    switch (button.tag) {
        case 1001:
            [self.delegate insertLibaryPhotoImage];
            break;
        case 1002:
            [self.delegate insterCameraPhotoImage];
            break;
        default:
            break;
    }
}

- (void)setItemTintColor:(UIColor *)itemTintColor
{
    _itemTintColor = itemTintColor;
    self.imageBtn.tintColor = _itemTintColor;
    self.cameraBtn.tintColor = _itemTintColor;
}

- (void)setSelectedBBsCategory:(NSString *)selectedBBsCategory
{
    _selectedBBsCategory = [selectedBBsCategory copy];
    
    NSString *text = [NSString stringWithFormat:@"发表于：%@", _selectedBBsCategory];
    
    if (self.postLbl) {
        if ([self.postLbl respondsToSelector:@selector(setAttributedText:)]) {
            
            // Define general attributes for the entire text
            NSDictionary *attribs = @{
                                      NSForegroundColorAttributeName: self.postLbl.textColor,
                                      NSFontAttributeName: self.postLbl.font
                                      };
            NSMutableAttributedString *attributedText =
            [[NSMutableAttributedString alloc] initWithString:text
                                                   attributes:attribs];
            
            UIColor *blueColor = [UIColor colorWithRed:3 / 255.0 green:169 / 255.0 blue:245 / 255.0 alpha:1.0];
            NSRange contentRange = [text rangeOfString:_selectedBBsCategory];
            [attributedText setAttributes:@{NSForegroundColorAttributeName:blueColor}
                                    range:contentRange];
            
            self.postLbl.attributedText = attributedText;
        }
    } else {
        self.postLbl.text = text;
    }
}

- (void)setToolBarEnable:(BOOL)enable
{
    self.imageBtn.enabled = enable;
    self.cameraBtn.enabled = enable;
}

@end

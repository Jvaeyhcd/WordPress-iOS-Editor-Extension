//
//  WPEditorToolbarView.h
//  Pods
//
//  Created by Jvaeyhcd on 27/12/2016.
//
//

#import <UIKit/UIKit.h>

@protocol WPEditorToolbarViewDelegate <NSObject>
@required

- (void)insertLibaryPhotoImage;
- (void)insterCameraPhotoImage;
- (void)selectBBSCategory;

@end

@interface WPEditorToolbarView : UIView

#pragma mark - Properties: delegate

/**
 *  @brief      The toolbar delegate.
 */
@property (nonatomic, weak, readwrite) id<WPEditorToolbarViewDelegate> delegate;

@property (nonatomic, strong) UIColor *itemTintColor UI_APPEARANCE_SELECTOR;

@property (nonatomic, copy) NSString *selectedBBsCategory;

@end

//
//  OTSBigImageBrowserPC.m
//  OneStore
//
//  Created by airspuer on 5/25/15.
//  Copyright (c) 2015 OneStore. All rights reserved.
//

#import "OTSBigImageBrowserPC.h"

#import "OTSBigImageItemCVC.h"

//Tool
#import "OTSSizeDefine.h"
#import "OTSFont.h"
#import "UIView+loading.h"
#import "UIView+Extension.h"
#import "UIView+Sizes.h"

#import "OTSPlaceholderImageView.h"

#import "OTSFuncDefine.h"

#import "UIView+loading.h"

#import "OTSSizeDefine.h"

#import "BigImageCustomScrollview.h"

@interface OTSBigImageBrowserPC ()<UICollectionViewDelegate, UICollectionViewDataSource,bigImageScrollDelegate>

@property(nonatomic, strong)UIView *sourceView;
@property(nonatomic, assign)CGRect sourceRect;

//@property(nonatomic, strong)UIImageView *currentImageView;

//@property(nonatomic, strong)UICollectionView *pageImageView;

//@property(nonatomic, assign)NSInteger showIndex;

@property(nonatomic, strong)UILabel *indexLabel;

//@property(nonatomic, assign)NSInteger dataCount;
//@property (nonatomic, assign)NSInteger pageCount;

@property (nonatomic, assign) CGSize imageViewSize;
//UI是否可以布局
@property (nonatomic, assign) BOOL isNeedLayout;

@property (nonatomic,strong)UIImageView *showImageview;

@property (nonatomic,strong)UICollectionViewFlowLayout *flowLayout;

@end

@implementation OTSBigImageBrowserPC

- (id)initWithSourceView:(UIView *)sourceView withSourceFrame:(CGRect)sourceRect
{
    self = [self initWithNibName:nil bundle:nil];
    if (self) {
        self.sourceRect = sourceRect;
        self.sourceView = sourceView;
    }
    
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self setupData];
    [self setupMainView];
    
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)viewDidLayoutSubviews
{
    [super viewDidLayoutSubviews];
    if (self.isNeedLayout) {
        self.pageImageView.center = self.view.center;
        CGRect currentImageRect = [self.sourceView convertRect:self.sourceRect toView:self.view];
        self.currentImageView.frame = currentImageRect;
        self.indexLabel.width = UI_CURRENT_SCREEN_WIDTH;
        self.indexLabel.top = self.view.height / 2 + self.pageImageView.width /2  + 20;
        if (IS_LANDSCAPE) {
            self.indexLabel.top = self.pageImageView.bottom - 30;
        }
        self.isNeedLayout = NO;
    }
}

- (void)setupMainView
{
    //添加collectionview
    [self.view addSubview:self.pageImageView];
    self.currentImageView = [[UIImageView alloc] init];
    self.currentImageView.contentMode = UIViewContentModeScaleAspectFit;
    NSString *defaultImageString = [self.delegate bigImageBrowserPC:self placeholderImageForIndex:self.showIndex];
    
//    [self.currentImageView sd_setImageWithURL:[NSURL URLWithString:defaultImageString]];
    [self.currentImageView sd_setImageWithURL:[NSURL URLWithString:defaultImageString] placeholderImage:[UIImage imageNamed:@"默认图片750x750"]];
    [self.view addSubview:self.currentImageView];
    self.pageImageView.hidden = YES;
    
    [self.view addSubview:self.indexLabel];
    [self updateIndexInfo];
}

- (void)setupData
{
    self.isNeedLayout = YES;
    
    if ([self.delegate respondsToSelector:@selector(numberOfItemInBigImageBrowser:)]) {
        self.dataCount = [self.delegate numberOfItemInBigImageBrowser:self];
    }
}

- (void)updateIndexInfo
{
    NSInteger itemTotalCount = 0;
    if ([self.delegate respondsToSelector:@selector(numberOfItemInBigImageBrowser:)]) {
        itemTotalCount = [self.delegate numberOfItemInBigImageBrowser:self];
    }
    if (itemTotalCount <= 0) {
        self.indexLabel.hidden = YES;
    }else{
        self.indexLabel.hidden = NO;
    }
    
    NSString *string = [NSString stringWithFormat:@"%@/%@",@(self.showIndex + 1),@(itemTotalCount)];
    NSMutableAttributedString *attributedString = [[NSMutableAttributedString alloc] initWithString:string attributes:@{NSFontAttributeName:[OTSFont medium],NSForegroundColorAttributeName:[UIColor whiteColor]}];
    
    [attributedString setAttributes:@{NSFontAttributeName:[UIFont systemFontOfSize:20],NSForegroundColorAttributeName:[UIColor whiteColor]} range:[string rangeOfString:@(self.showIndex + 1).stringValue]];
    
    self.indexLabel.attributedText = attributedString;
}

#pragma mark- Property
- (UICollectionView *)pageImageView
{
    if (_pageImageView == nil) {
        if (_pageImageView == nil) {
            _flowLayout = [[UICollectionViewFlowLayout alloc] init];
            _flowLayout.scrollDirection = UICollectionViewScrollDirectionHorizontal;
           _flowLayout.minimumLineSpacing = 0;
            _flowLayout.itemSize = CGSizeMake(UI_CURRENT_SCREEN_WIDTH, UI_CURRENT_SCREEN_HEIGHT);
            _pageImageView = [[UICollectionView alloc] initWithFrame:CGRectZero collectionViewLayout:_flowLayout];
            _pageImageView.backgroundColor = [UIColor clearColor];
            _pageImageView.pagingEnabled = YES;
            _pageImageView.delegate = self;
            _pageImageView.dataSource = self;
            _pageImageView.showsHorizontalScrollIndicator = NO;
            [_pageImageView registerClass:[OTSBigImageItemCVC class] forCellWithReuseIdentifier:[OTSBigImageItemCVC cellReuseIdentifier]];
            _pageImageView.size = CGSizeMake(UI_CURRENT_SCREEN_WIDTH, UI_CURRENT_SCREEN_HEIGHT);
            
        }
    }
    return _pageImageView;
}

- (void)setShowIndex:(NSInteger)showIndex
{
    
     _showIndex  =showIndex;
     [self updateIndexInfo];
}

- (UILabel *)indexLabel
{
    if (_indexLabel == nil) {
        _indexLabel = [[UILabel alloc] initWithFrame:CGRectZero];
        _indexLabel.textAlignment = NSTextAlignmentCenter;
        _indexLabel.width = self.imageViewSize.width;
        _indexLabel.height = 30;
        _indexLabel.backgroundColor = [UIColor clearColor];
        ;
        _indexLabel.tag = 999;
    }
    return _indexLabel;
    
}

- (CGSize)imageViewSize
{
    if (CGSizeEqualToSize(_imageViewSize, CGSizeZero)) {
        CGFloat viewWidth = UI_CURRENT_SCREEN_WIDTH;
        if (IS_LANDSCAPE) {
            viewWidth = UI_CURRENT_SCREEN_HEIGHT;
        }
        return  CGSizeMake(viewWidth, viewWidth);
    }
    return _imageViewSize;
}

#pragma mark- 
- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView
{
    [collectionView.collectionViewLayout invalidateLayout];
    return 1;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    OTSBigImageItemCVC *itemCVC = [collectionView dequeueReusableCellWithReuseIdentifier:[OTSBigImageItemCVC cellReuseIdentifier] forIndexPath:indexPath];

        if ([[itemCVC.contentView.subviews lastObject] isKindOfClass:[UIView class]]) {
        [[itemCVC.contentView.subviews lastObject] removeFromSuperview];
    }
    
    BigImageCustomScrollview *scroll = [[BigImageCustomScrollview alloc]initForAutoLayout];
    scroll.bigImageDelegate = self;
    [itemCVC.contentView addSubview:scroll];
    [scroll autoPinEdgesToSuperviewEdgesWithInsets:UIEdgeInsetsMake(0, 0, 0, 0)];
     
    NSString *defaultImageUrl = [self.delegate bigImageBrowserPC:self placeholderImageForIndex:indexPath.row % self.dataCount];
    NSString *hightImageUrl = defaultImageUrl;
    if ([self.delegate respondsToSelector:@selector(bigImageBrowserPC:highQualityImageURLForIndex:)]) {
        hightImageUrl = [self.delegate bigImageBrowserPC:self highQualityImageURLForIndex: indexPath.row % self.dataCount];
    } //itemCVC

    [scroll updateWithDeafaultImageUrl:defaultImageUrl highQualityImageURL:hightImageUrl];
    
    self.showImageview = scroll.imageView;
    
    return itemCVC;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    NSInteger itemCount = 0;
    if ([self.delegate respondsToSelector:@selector(numberOfItemInBigImageBrowser:)]) {
      itemCount = [self.delegate numberOfItemInBigImageBrowser:self];
    }
    self.dataCount = itemCount;
    
//    if (itemCount > 1) {
//        itemCount += 2;
//    }
    self.pageCount = itemCount;
    return itemCount;
    
}

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{

    [self dismissViewControllerAnimated:YES completion:nil];
}

#pragma mark
-(void)sendBackDissVC{
 
    [self dismissViewControllerAnimated:YES completion:nil];
}

#pragma mark - <UIScrollViewDelegate>
- (void)scrollViewEnded:(UIScrollView *)scrollView
{
    
//    NSIndexPath *indexPath = [self.pageImageView indexPathForItemAtPoint:scrollView.contentOffset];
//    if (self.dataCount > 1) {
//        if (indexPath.row == self.pageCount - 1) {
//            [self.pageImageView scrollToItemAtIndexPath:[NSIndexPath indexPathForItem:1 inSection:0] atScrollPosition:UICollectionViewScrollPositionLeft animated:NO];
//        }else if (indexPath == 0){
//            [self.pageImageView scrollToItemAtIndexPath:[NSIndexPath indexPathForItem:self.dataCount inSection:0] atScrollPosition:UICollectionViewScrollPositionLeft animated:NO];
//        }
//    }
    
//    self.showIndex = indexPath.row % self.dataCount;
    
    self.showIndex = (int)self.pageImageView.contentOffset.x/self.pageImageView.frame.size.width;
}

//- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView
//{
//    
//    //[self scrollViewEnded:scrollView];
//}


-(void)scrollViewDidEndScrollingAnimation:(UIScrollView *)scrollView{

    //获取当前页数的代理
    if ([self.delegate respondsToSelector:@selector(remenberChoosePageNum)]) {
        [self.delegate remenberChoosePageNum];
    }
}

- (void)scrollViewWillBeginDragging:(UIScrollView *)scrollView
{
    NSIndexPath *indexPath = [self.pageImageView indexPathForItemAtPoint:scrollView.contentOffset];
    if (indexPath.row == 0 && self.dataCount > 1) {
//        [self.pageImageView scrollToItemAtIndexPath:[NSIndexPath indexPathForItem:self.dataCount inSection:0]
//                                   atScrollPosition:UICollectionViewScrollPositionLeft
//                                           animated:NO];
    }
}

-(void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView{
    
     [self scrollViewEnded:scrollView];
    
    if ([self.delegate respondsToSelector:@selector(remenberChoosePageNum)]) {
        [self.delegate remenberChoosePageNum];
    }
}

#pragma mark - OTSContainerController  overwwrite
- (void)presentViewControllerAnimated:(BOOL)animated completion:(void (^)(void))completion
{
    [super presentViewControllerAnimated:animated completion:completion];
    
    [self.pageImageView reloadData];
    [self.pageImageView layoutIfNeeded];
    [self.pageImageView selectItemAtIndexPath:[NSIndexPath indexPathForItem:self.showIndex inSection:0] animated:NO scrollPosition:UICollectionViewScrollPositionLeft];
    WEAK_SELF;
    [UIView animateWithDuration:self.duration animations:^{
        STRONG_SELF;
        self.currentImageView.bounds = (CGRect){CGPointZero, self.imageViewSize};
        self.currentImageView.center = self.view.center;
    }completion:^(BOOL finished) {
        STRONG_SELF;
        self.pageImageView.hidden = NO;
        [self.currentImageView removeFromSuperview];
    }];
}

- (void)dismissViewControllerAnimated:(BOOL)animated completion:(void (^)(void))completion
{
    [super dismissViewControllerAnimated:animated completion:completion];
//    OTSBigImageItemCVC *itemCVC = (OTSBigImageItemCVC*)[self.pageImageView cellForItemAtIndexPath:[NSIndexPath indexPathForRow:self.showIndex inSection:0]];
//    self.currentImageView.image = itemCVC.itemImageView.image;
    
    self.currentImageView.image = self.showImageview.image;
    
    //添加当前图片
    [self.view addSubview:self.currentImageView];
    self.pageImageView.hidden = YES;
    //备注新加入的
    self.view.backgroundColor = [UIColor clearColor];
    [UIView animateWithDuration:self.duration animations:^{
        CGRect currentImageRect = [self.sourceView convertRect:self.sourceRect toView:self.view];
        
        self.currentImageView.frame = currentImageRect;
    }];
    if (self.delegate && [self.delegate respondsToSelector:@selector(dismissBigImageBrowserPC:)]) {
        [self.delegate dismissBigImageBrowserPC:self];
    }
}

#pragma mark -Roate Screen
- (void)willRotateToInterfaceOrientation:(UIInterfaceOrientation)toInterfaceOrientation duration:(NSTimeInterval)duration//for  ios7
{
    [super willRotateToInterfaceOrientation:toInterfaceOrientation duration:duration];
     self.isNeedLayout = YES;
}

- (void)viewWillTransitionToSize:(CGSize)size withTransitionCoordinator:(id<UIViewControllerTransitionCoordinator>)coordinator//for ios8 up
{
    [super viewWillTransitionToSize:size withTransitionCoordinator:coordinator];
    self.isNeedLayout = YES;
}

@end

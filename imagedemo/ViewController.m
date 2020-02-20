//
//  ViewController.m
//  imagedemo
//
//  Created by KyleWong on 2020/2/20.
//  Copyright © 2020 KyleWong. All rights reserved.
//

#import "ViewController.h"
#import <SDWebImage/SDWebImage.h>

@interface STGoodItemCell : UITableViewCell
@property (nonatomic, strong) UIImageView* imgview;
@end

@implementation STGoodItemCell
- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {

    }
    return self;
}

- (UIImageView *)imgview {
    if(_imgview)
        return _imgview;
    self.imgview = [[UIImageView alloc] initWithFrame:self.bounds];
    self.imgview.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
    [self.contentView addSubview:self.imgview];
    return self.imgview;
}

- (void)setImgUrl:(NSString *)aUrl {
    [self.imgview sd_setImageWithURL:[NSURL URLWithString:aUrl]];
}
@end

@interface ViewController ()<UITableViewDataSource, UITableViewDelegate>
@property (nonatomic, strong) UITableView *tableView;
@property (nonatomic, strong) NSArray *picUrls;
@end

@implementation ViewController
- (instancetype)init {
    if(self = [super init]) {
        self.picUrls = @[@"https://img.alicdn.com/imgextra/i3/3246773875/O1CN01IpG7ON1eUnKmS2dGn_!!3246773875.jpg",
        @"https://img.alicdn.com/imgextra/i1/3246773875/O1CN01yFbGrn1eUnKommu7N_!!3246773875.jpg",
        @"https://img.alicdn.com/imgextra/i2/3246773875/O1CN01uZINut1eUnKn3lSu1_!!3246773875.jpg",
        @"https://img.alicdn.com/imgextra/i1/3246773875/O1CN01zDdthZ1eUnKqTSX8a_!!3246773875.jpg",
        @"https://img.alicdn.com/imgextra/i1/3246773875/O1CN011I9oUs1eUnKpHX7e4_!!3246773875.jpg",
        @"https://img.alicdn.com/imgextra/i2/3246773875/O1CN01vmkHAz1eUnKpJdQwa_!!3246773875.jpg",
        @"https://img.alicdn.com/imgextra/i4/3246773875/O1CN01rUr9Eh1eUnKoUZQpL_!!3246773875.jpg",
        @"https://img.alicdn.com/imgextra/i1/3246773875/O1CN01v9Lg7p1eUnKmS21sZ_!!3246773875.jpg",
        @"https://img.alicdn.com/imgextra/i4/3246773875/O1CN012P5ofU1eUnL2YEOMR_!!3246773875.jpg",
        @"https://img.alicdn.com/imgextra/i2/3246773875/O1CN014ayYGN1eUnKoyeQ9E_!!3246773875.jpg",
        @"https://img.alicdn.com/imgextra/i4/3246773875/O1CN01i72YQo1eUnKoC6Jvj_!!3246773875.jpg",
        @"https://img.alicdn.com/imgextra/i4/3246773875/O1CN01QaIChJ1eUnKmS1lFO_!!3246773875.jpg",
        @"https://img.alicdn.com/imgextra/i2/3246773875/O1CN01LMArFN1eUnKogU2hS_!!3246773875.jpg",
        @"https://img.alicdn.com/imgextra/i4/3246773875/O1CN01wJcUiv1eUnKrhx2y6_!!3246773875.jpg",
        //第二个商品
        @"https://img.alicdn.com/imgextra/i4/2913857998/O1CN018VR2cS28x8JRCp4pf_!!2913857998.jpg",
        @"https://img.alicdn.com/imgextra/i2/2913857998/O1CN010DgJeC28x8JHTHH1M_!!2913857998.jpg",
        @"https://img.alicdn.com/imgextra/i1/2913857998/O1CN01IEoJQl28x8JNOxMdJ_!!2913857998.jpg",
        @"https://img.alicdn.com/imgextra/i2/2913857998/O1CN01YIVh6p28x8JQQHdYK_!!2913857998.jpg",
        @"https://img.alicdn.com/imgextra/i3/2913857998/O1CN01Kvhino28x8JTYWQYS_!!2913857998.jpg",
        @"https://img.alicdn.com/imgextra/i3/2913857998/O1CN01vrn5U828x8JPkY4hH_!!2913857998.jpg",
        @"https://img.alicdn.com/imgextra/i3/2913857998/O1CN01Il0oDV28x8JRCoTRe_!!2913857998.jpg",
        @"https://img.alicdn.com/imgextra/i4/2913857998/O1CN01pl8g0V28x8JRzoNK4_!!2913857998.jpg",
        @"https://img.alicdn.com/imgextra/i2/2913857998/O1CN01qU7fgU28x8JNOuTrK_!!2913857998.jpg",
        @"https://img.alicdn.com/imgextra/i3/2913857998/O1CN01w6pVFU28x8JSX0v0d_!!2913857998.jpg",
        //第三个商品
        @"https://img.alicdn.com/imgextra/i4/2188980830/O1CN01nxrGLe1I0BJWOQxyF_!!2188980830.jpg",
        @"https://img.alicdn.com/imgextra/i2/2188980830/O1CN011H4QjV1I0BJWhwnjI_!!2188980830.jpg",
        @"https://img.alicdn.com/imgextra/i3/2188980830/O1CN01VS9fNG1I0BJbtuJ0g_!!2188980830.jpg",
        @"https://img.alicdn.com/imgextra/i3/2188980830/O1CN01S0Nb6X1I0BJYctePJ_!!2188980830.jpg",
        @"https://img.alicdn.com/imgextra/i4/2188980830/O1CN010PWkWR1I0BJcWIQPv_!!2188980830.jpg",
        @"https://img.alicdn.com/imgextra/i1/2188980830/O1CN01y1Lnpe1I0BJpWC9Mo_!!2188980830.jpg",
        @"https://img.alicdn.com/imgextra/i1/2188980830/O1CN01tUfKTI1I0BJY8Hpbz_!!2188980830.jpg",
        @"https://img.alicdn.com/imgextra/i3/2188980830/O1CN011nuK9e1I0BJWhwjYa_!!2188980830.jpg",
        //第四个商品
        @"https://img.alicdn.com/imgextra/i1/437697693/O1CN01S60c0726hRW4ta9Vc_!!437697693.jpg",
        @"https://img.alicdn.com/imgextra/i4/437697693/O1CN01zGypoN26hRVrqixvl_!!437697693.jpg",
        @"https://img.alicdn.com/imgextra/i4/437697693/O1CN01ALZfnF26hRW5Gd3f3_!!437697693.jpg",
        @"https://img.alicdn.com/imgextra/i2/437697693/O1CN01g3d0aH26hRVt6YBno_!!437697693.jpg",
        @"https://img.alicdn.com/imgextra/i3/437697693/O1CN0109SRrO26hRW9IvKXt_!!437697693.jpg",
        @"https://img.alicdn.com/imgextra/i3/437697693/O1CN01EC4LvR26hRWG7TuAK_!!437697693.jpg",
        @"https://img.alicdn.com/imgextra/i3/437697693/O1CN01CVf2kA26hRVuWsY4e_!!437697693.jpg",
        @"https://img.alicdn.com/imgextra/i2/437697693/O1CN01hVbqmu26hRW6twQXl_!!437697693.jpg",
        @"https://img.alicdn.com/imgextra/i2/437697693/O1CN01ImtpsD26hRVupictr_!!437697693.jpg",
        @"https://img.alicdn.com/imgextra/i2/437697693/O1CN01ZNNBIi26hRVzM0WrI_!!437697693.jpg",
        @"https://img.alicdn.com/imgextra/i2/437697693/TB2zzwnmRTH8KJjy0FiXXcRsXXa_!!437697693.jpg",
        @"https://img.alicdn.com/imgextra/i4/437697693/TB29TXZeFTM8KJjSZFlXXaO8FXa_!!437697693.jpg",
        @"https://img.alicdn.com/imgextra/i4/437697693/O1CN01dHwIoF26hRVv1Wv5w_!!437697693.jpg",
        @"https://img.alicdn.com/imgextra/i3/437697693/O1CN01pjHnI626hRVuWpvtM_!!437697693.jpg",
        @"https://img.alicdn.com/imgextra/i1/437697693/O1CN011OPcLY26hRVxkpkTL_!!437697693.jpg",
        @"https://img.alicdn.com/imgextra/i2/437697693/O1CN01BS3UY326hRVpK3yHe_!!437697693.jpg",
        @"https://img.alicdn.com/imgextra/i1/437697693/O1CN01GInfIq26hRW7gL8Tb_!!437697693.jpg",
        @"https://img.alicdn.com/imgextra/i3/437697693/O1CN015hEUOo26hRVxkqkrn_!!437697693.jpg",
        @"https://img.alicdn.com/imgextra/i4/437697693/O1CN01HdBGTd26hRW5GczU6_!!437697693.jpg",
        @"https://img.alicdn.com/imgextra/i3/437697693/O1CN01wbGlKk26hRVnAhYc2_!!437697693.jpg",
        @"https://img.alicdn.com/imgextra/i1/437697693/O1CN0126hROgjLqUyxIE9_!!437697693.jpg",
        //循环一次
        @"https://img.alicdn.com/imgextra/i3/3246773875/O1CN01IpG7ON1eUnKmS2dGn_!!3246773875.jpg",
        @"https://img.alicdn.com/imgextra/i1/3246773875/O1CN01yFbGrn1eUnKommu7N_!!3246773875.jpg",
        @"https://img.alicdn.com/imgextra/i2/3246773875/O1CN01uZINut1eUnKn3lSu1_!!3246773875.jpg",
        @"https://img.alicdn.com/imgextra/i1/3246773875/O1CN01zDdthZ1eUnKqTSX8a_!!3246773875.jpg",
        @"https://img.alicdn.com/imgextra/i1/3246773875/O1CN011I9oUs1eUnKpHX7e4_!!3246773875.jpg",
        @"https://img.alicdn.com/imgextra/i2/3246773875/O1CN01vmkHAz1eUnKpJdQwa_!!3246773875.jpg",
        @"https://img.alicdn.com/imgextra/i4/3246773875/O1CN01rUr9Eh1eUnKoUZQpL_!!3246773875.jpg",
        @"https://img.alicdn.com/imgextra/i1/3246773875/O1CN01v9Lg7p1eUnKmS21sZ_!!3246773875.jpg",
        @"https://img.alicdn.com/imgextra/i4/3246773875/O1CN012P5ofU1eUnL2YEOMR_!!3246773875.jpg",
        @"https://img.alicdn.com/imgextra/i2/3246773875/O1CN014ayYGN1eUnKoyeQ9E_!!3246773875.jpg",
        @"https://img.alicdn.com/imgextra/i4/3246773875/O1CN01i72YQo1eUnKoC6Jvj_!!3246773875.jpg",
        @"https://img.alicdn.com/imgextra/i4/3246773875/O1CN01QaIChJ1eUnKmS1lFO_!!3246773875.jpg",
        @"https://img.alicdn.com/imgextra/i2/3246773875/O1CN01LMArFN1eUnKogU2hS_!!3246773875.jpg",
        @"https://img.alicdn.com/imgextra/i4/3246773875/O1CN01wJcUiv1eUnKrhx2y6_!!3246773875.jpg",
        //第二个商品
        @"https://img.alicdn.com/imgextra/i4/2913857998/O1CN018VR2cS28x8JRCp4pf_!!2913857998.jpg",
        @"https://img.alicdn.com/imgextra/i2/2913857998/O1CN010DgJeC28x8JHTHH1M_!!2913857998.jpg",
        @"https://img.alicdn.com/imgextra/i1/2913857998/O1CN01IEoJQl28x8JNOxMdJ_!!2913857998.jpg",
        @"https://img.alicdn.com/imgextra/i2/2913857998/O1CN01YIVh6p28x8JQQHdYK_!!2913857998.jpg",
        @"https://img.alicdn.com/imgextra/i3/2913857998/O1CN01Kvhino28x8JTYWQYS_!!2913857998.jpg",
        @"https://img.alicdn.com/imgextra/i3/2913857998/O1CN01vrn5U828x8JPkY4hH_!!2913857998.jpg",
        @"https://img.alicdn.com/imgextra/i3/2913857998/O1CN01Il0oDV28x8JRCoTRe_!!2913857998.jpg",
        @"https://img.alicdn.com/imgextra/i4/2913857998/O1CN01pl8g0V28x8JRzoNK4_!!2913857998.jpg",
        @"https://img.alicdn.com/imgextra/i2/2913857998/O1CN01qU7fgU28x8JNOuTrK_!!2913857998.jpg",
        @"https://img.alicdn.com/imgextra/i3/2913857998/O1CN01w6pVFU28x8JSX0v0d_!!2913857998.jpg",
        //第三个商品
        @"https://img.alicdn.com/imgextra/i4/2188980830/O1CN01nxrGLe1I0BJWOQxyF_!!2188980830.jpg",
        @"https://img.alicdn.com/imgextra/i2/2188980830/O1CN011H4QjV1I0BJWhwnjI_!!2188980830.jpg",
        @"https://img.alicdn.com/imgextra/i3/2188980830/O1CN01VS9fNG1I0BJbtuJ0g_!!2188980830.jpg",
        @"https://img.alicdn.com/imgextra/i3/2188980830/O1CN01S0Nb6X1I0BJYctePJ_!!2188980830.jpg",
        @"https://img.alicdn.com/imgextra/i4/2188980830/O1CN010PWkWR1I0BJcWIQPv_!!2188980830.jpg",
        @"https://img.alicdn.com/imgextra/i1/2188980830/O1CN01y1Lnpe1I0BJpWC9Mo_!!2188980830.jpg",
        @"https://img.alicdn.com/imgextra/i1/2188980830/O1CN01tUfKTI1I0BJY8Hpbz_!!2188980830.jpg",
        @"https://img.alicdn.com/imgextra/i3/2188980830/O1CN011nuK9e1I0BJWhwjYa_!!2188980830.jpg",
        //第四个商品
        @"https://img.alicdn.com/imgextra/i1/437697693/O1CN01S60c0726hRW4ta9Vc_!!437697693.jpg",
        @"https://img.alicdn.com/imgextra/i4/437697693/O1CN01zGypoN26hRVrqixvl_!!437697693.jpg",
        @"https://img.alicdn.com/imgextra/i4/437697693/O1CN01ALZfnF26hRW5Gd3f3_!!437697693.jpg",
        @"https://img.alicdn.com/imgextra/i2/437697693/O1CN01g3d0aH26hRVt6YBno_!!437697693.jpg",
        @"https://img.alicdn.com/imgextra/i3/437697693/O1CN0109SRrO26hRW9IvKXt_!!437697693.jpg",
        @"https://img.alicdn.com/imgextra/i3/437697693/O1CN01EC4LvR26hRWG7TuAK_!!437697693.jpg",
        @"https://img.alicdn.com/imgextra/i3/437697693/O1CN01CVf2kA26hRVuWsY4e_!!437697693.jpg",
        @"https://img.alicdn.com/imgextra/i2/437697693/O1CN01hVbqmu26hRW6twQXl_!!437697693.jpg",
        @"https://img.alicdn.com/imgextra/i2/437697693/O1CN01ImtpsD26hRVupictr_!!437697693.jpg",
        @"https://img.alicdn.com/imgextra/i2/437697693/O1CN01ZNNBIi26hRVzM0WrI_!!437697693.jpg",
        @"https://img.alicdn.com/imgextra/i2/437697693/TB2zzwnmRTH8KJjy0FiXXcRsXXa_!!437697693.jpg",
        @"https://img.alicdn.com/imgextra/i4/437697693/TB29TXZeFTM8KJjSZFlXXaO8FXa_!!437697693.jpg",
        @"https://img.alicdn.com/imgextra/i4/437697693/O1CN01dHwIoF26hRVv1Wv5w_!!437697693.jpg",
        @"https://img.alicdn.com/imgextra/i3/437697693/O1CN01pjHnI626hRVuWpvtM_!!437697693.jpg",
        @"https://img.alicdn.com/imgextra/i1/437697693/O1CN011OPcLY26hRVxkpkTL_!!437697693.jpg",
        @"https://img.alicdn.com/imgextra/i2/437697693/O1CN01BS3UY326hRVpK3yHe_!!437697693.jpg",
        @"https://img.alicdn.com/imgextra/i1/437697693/O1CN01GInfIq26hRW7gL8Tb_!!437697693.jpg",
        @"https://img.alicdn.com/imgextra/i3/437697693/O1CN015hEUOo26hRVxkqkrn_!!437697693.jpg",
        @"https://img.alicdn.com/imgextra/i4/437697693/O1CN01HdBGTd26hRW5GczU6_!!437697693.jpg",
        @"https://img.alicdn.com/imgextra/i3/437697693/O1CN01wbGlKk26hRVnAhYc2_!!437697693.jpg",
        @"https://img.alicdn.com/imgextra/i1/437697693/O1CN0126hROgjLqUyxIE9_!!437697693.jpg",

         //更多商品
        @"https://img.alicdn.com/imgextra/i1/2408239898/O1CN01iU2DfI2MzKqLeSkNw_!!2408239898.jpg",
        @"https://img.alicdn.com/imgextra/i4/2408239898/O1CN01Auflbw2MzKqSORGx7_!!2408239898.jpg",
        @"https://img.alicdn.com/imgextra/i3/2408239898/O1CN01K8aSh12MzKmzR3JRq_!!2408239898.jpg",
        @"https://img.alicdn.com/imgextra/i2/2408239898/O1CN01E5BZuj2MzKqQlweXN_!!2408239898.jpg",
        @"https://img.alicdn.com/imgextra/i2/2408239898/O1CN01K6wlPY2MzKqRWQoM3_!!2408239898.jpg",
        @"https://img.alicdn.com/imgextra/i4/2408239898/O1CN01H48q392MzKqPz0z2z_!!2408239898.jpg",
        @"https://img.alicdn.com/imgextra/i1/2408239898/O1CN010Sf7Ac2MzKk2X9S8c_!!2408239898.jpg",
        @"https://img.alicdn.com/imgextra/i4/2408239898/O1CN01UjHU4p2MzKqNmF1Fx_!!2408239898.jpg",
        @"https://img.alicdn.com/imgextra/i1/2408239898/O1CN01zuzXgs2MzKk6rrSON_!!2408239898.jpg",
        @"https://img.alicdn.com/imgextra/i4/2408239898/O1CN01fZOqaX2MzKqNC8cD7_!!2408239898.jpg",
        @"https://img.alicdn.com/imgextra/i1/2408239898/O1CN01V03LrZ2MzKptD2mh9_!!2408239898.jpg",
        @"https://img.alicdn.com/imgextra/i4/2408239898/O1CN01IVIEwx2MzKk7UqZ6u_!!2408239898.jpg",
        @"https://img.alicdn.com/imgextra/i4/2408239898/O1CN01Vi7vJv2MzKofOVj1j_!!2408239898.jpg",
        @"https://img.alicdn.com/imgextra/i1/2408239898/O1CN01R8fD8J2MzKqPmwQg3_!!2408239898.jpg",
        @"https://img.alicdn.com/imgextra/i4/2408239898/O1CN01brm2xS2MzKqLeRTRF_!!2408239898.jpg",
        @"https://img.alicdn.com/imgextra/i4/2408239898/O1CN01hi6nev2MzKmDFWWJB_!!2408239898.jpg",
        @"https://img.alicdn.com/imgextra/i1/2408239898/O1CN01tSLIiB2MzKpveZ4wc_!!2408239898.jpg",
        @"https://img.alicdn.com/imgextra/i3/2963921524/O1CN01sTQ7hQ1N82AW2iWso_!!2963921524.jpg",
        @"https://img.alicdn.com/imgextra/i1/2963921524/O1CN01ove9PW1N827jdii8u_!!2963921524.jpg",
        @"https://img.alicdn.com/imgextra/i1/2963921524/O1CN01X5z3mT1N82AVKpUqo_!!2963921524.jpg",
        @"https://img.alicdn.com/imgextra/i2/2963921524/O1CN01fpu05T1N82AXYzWnW_!!2963921524.jpg",
        @"https://img.alicdn.com/imgextra/i4/2963921524/O1CN01GykzKX1N827mTLo7m_!!2963921524.jpg",
        @"https://img.alicdn.com/imgextra/i1/2963921524/O1CN01qWRRi21N82AVKcLJd_!!2963921524.jpg",
        @"https://img.alicdn.com/imgextra/i4/2963921524/O1CN017Xa3OB1N82AS3IpQU_!!2963921524.jpg",
        @"https://img.alicdn.com/imgextra/i3/2963921524/O1CN01dQXGfe1N827hdpB8T_!!2963921524.jpg",
        @"https://img.alicdn.com/imgextra/i2/2963921524/O1CN015HAm3B1N82AYcI4ij_!!2963921524.jpg",
        @"https://img.alicdn.com/imgextra/i4/2963921524/O1CN012Jvn9h1N82Bn2GoUH_!!2963921524.jpg",
        @"https://img.alicdn.com/imgextra/i2/2963921524/O1CN01OlbOUv1N827jdiZpI_!!2963921524.jpg",
        @"https://img.alicdn.com/imgextra/i2/2963921524/O1CN01iYdvMd1N82AV7pfmw_!!2963921524.jpg",
        @"https://img.alicdn.com/imgextra/i4/2963921524/O1CN01pQYU8M1N82AVKnLpC_!!2963921524.jpg",
        @"https://img.alicdn.com/imgextra/i1/2963921524/O1CN01cMYrv01N82AV7q8uT_!!2963921524.jpg",
        @"https://img.alicdn.com/imgextra/i1/2963921524/O1CN01wcssoV1N827hdpB8a_!!2963921524.jpg",
        @"https://img.alicdn.com/imgextra/i2/2963921524/O1CN01W4TSKK1N827inUsXc_!!2963921524.jpg",
        @"https://img.alicdn.com/imgextra/i2/2963921524/O1CN01R9lloY1N827mTN593_!!2963921524.jpg",
        @"https://img.alicdn.com/imgextra/i2/2963921524/O1CN01QjSupG1N82AVKbGoX_!!2963921524.jpg",
        @"https://img.alicdn.com/imgextra/i1/2963921524/O1CN01mKHXuh1N82AUZhw8k_!!2963921524.jpg",
        @"https://img.alicdn.com/imgextra/i3/2963921524/O1CN01HH2C6i1N82AW2jGaN_!!2963921524.jpg",
        @"https://img.alicdn.com/imgextra/i2/2963921524/O1CN01V3wIQ21N827n5GrRm_!!2963921524.jpg",
        @"https://img.alicdn.com/imgextra/i4/2963921524/O1CN01MKnEwn1N827mgzhgQ_!!2963921524.jpg",];
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.tableView = [[UITableView alloc] initWithFrame:self.view.bounds];
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    [self.view addSubview:self.tableView];
    // Do any additional setup after loading the view.
}

#pragma mark - UITableViewDataSource
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.picUrls.count;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 600;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *reuseIdentifier = @"sgGoodItemCell";
    STGoodItemCell *cell = [tableView dequeueReusableCellWithIdentifier:reuseIdentifier];
    if (!cell) {
        cell = [[STGoodItemCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:reuseIdentifier];
    }
    [cell setImgUrl:self.picUrls[indexPath.row]];
    return cell;
}
@end

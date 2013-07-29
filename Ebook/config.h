//
//  config.h
//  Ebook
//
//  Created by ydf on 13-7-20.
//  Copyright (c) 2013年 openkava. All rights reserved.
//

#ifndef Ebook_config_h
#define Ebook_config_h

#define HEADBAR_HEIGHT         44
#define TOTAL_IMAGES           28
#define IPHONE_INITIAL_IMAGES  3
#define IPAD_INITIAL_IMAGES    11

#define ROW_SIZE               (CGSize){304, 44}

#define IPHONE_PORTRAIT_PHOTO  (CGSize){148, 148}
#define IPHONE_LANDSCAPE_PHOTO (CGSize){152, 152}

#define IPHONE_PORTRAIT_GRID   (CGSize){312, 0}
#define IPHONE_LANDSCAPE_GRID  (CGSize){160, 0}
#define IPHONE_TABLES_GRID     (CGSize){320, 0}

#define IPAD_PORTRAIT_PHOTO    (CGSize){128, 128}
#define IPAD_LANDSCAPE_PHOTO   (CGSize){122, 122}

#define IPAD_PORTRAIT_GRID     (CGSize){136, 0}
#define IPAD_LANDSCAPE_GRID    (CGSize){390, 0}
#define IPAD_TABLES_GRID       (CGSize){624, 0}

#define HEADER_FONT            [UIFont fontWithName:@"HelveticaNeue" size:16]

#endif

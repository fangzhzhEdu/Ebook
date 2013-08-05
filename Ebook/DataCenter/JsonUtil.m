//
//  JsonUtil.m
//  Ebook
//
//  Created by ydf on 13-8-4.
//  Copyright (c) 2013年 openkava. All rights reserved.
//

#import "JsonUtil.h"

@implementation JsonUtil




+ (NSString *) jsonFromDic: (NSDictionary *) dic
{
    NSError *error=nil;
    NSString *jsonString =nil;
    NSData *jsonData= [NSJSONSerialization dataWithJSONObject:dic options: NSJSONWritingPrettyPrinted error:&error];
    
    if([jsonData length] >0 && error == nil)
    {
        DLog(@"success serialized data to json");
        jsonString = [[NSString alloc] initWithData:jsonData encoding: NSUTF8StringEncoding];
        DLog(@" json :%@",jsonString);
    }
    else if ([jsonData length ] >0  && error == nil)
    {
        DLog(@"No data to json");
    }
    if ( error != nil)
    {
        DLog(@"Error  to json");
    }
    return jsonString;
}

+ (id ) getFromJson : (NSString *) fileName
{
        NSError *error=nil;
        @try {
            NSString  *filePathname = [[NSBundle mainBundle] pathForResource:fileName  ofType:@"json"];
            
    //       NSString *source =[ NSString stringWithContentsOfFile:filePathname encoding:NSUTF8StringEncoding error:nil];
            NSData *jsonData = [NSData dataWithContentsOfFile:filePathname];
          id  dataSet = [NSJSONSerialization JSONObjectWithData:  jsonData options:NSJSONReadingMutableLeaves error:&error];
          if([dataSet isKindOfClass: [NSArray class]] )
          {
              NSArray *n = (NSArray*) dataSet ;
              NSLog (@" total array : %i", n.count );
                  
              }
            if([dataSet isKindOfClass:[NSDictionary class]])
            {
                NSDictionary *d = (NSDictionary*) dataSet ;
                
              NSLog (@" total array : %i",d.count );
            }
            
           
            NSLog(@" json :%@",dataSet );
            return dataSet ;
        }
        @catch (NSException *exception) {
            NSLog(@"Error read saved data: %@",exception);
        
            return nil ;
        }
        @finally {
        }
     
    
    
    
}



@end

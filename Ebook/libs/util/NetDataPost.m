
#import "NetDataPost.h"
#import "App.h"
#import "MyUtil.h" 
#import "MKNetworkKit/MKNetworkKit.h" 

@implementation NetDataPost

-(MKNetworkOperation*) postGetDataWithRequestData: (NSString*) server_path requestData: (NSDictionary *) requestData method:(NSString*) method  usingBlockObject:(postGetDataBlock) paramBlockObject
{
    MKNetworkOperation *op = [self operationWithPath:server_path
                            params:@{@"RequestKey": appInstance.requestKey , @"RequestData":[MyUtil jsonFromDic:requestData], @"RequestMethod":method ,}
                            httpMethod:@"POST"];
    [op addCompletionHandler:^(MKNetworkOperation *operation) {
        
        @autoreleasepool {
            
            
            NSError *error=nil;
            NSDictionary *dataSet=nil;
            //NSLog(@"json:%@",operation.responseJSON);
            @try {
                dataSet = [NSJSONSerialization JSONObjectWithData:operation.responseData options:NSJSONReadingMutableLeaves error:&error];
                
                
            }
            @finally {
                paramBlockObject(dataSet);
            }
        }
        
    } errorHandler:^(MKNetworkOperation *errorOp, NSError* error) {
        NSLog(@"netpostdata error:%@",error);
    }];
    [self enqueueOperation:op];
    return op;
}

 @end

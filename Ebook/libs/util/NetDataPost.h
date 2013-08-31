





#import "MKNetworkKit/MKNetworkKit.h"
@interface NetDataPost : MKNetworkEngine


typedef void (^postGetDataBlock)(NSDictionary *dataSet);
-(MKNetworkOperation*) postGetDataWithRequestData: (NSString*) server_path requestData:  (NSDictionary *) requestData method:(NSString*) method  usingBlockObject:(postGetDataBlock) paramBlockObject;

@end

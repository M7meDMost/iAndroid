//
//  This class was created by Nonnus, multi select by Colin
//  who graciously decided to share it with the CocoaHTTPServer community.
//

#import "MyHTTPConnection.h"
#import "HTTPServer.h"
#import "HTTPResponse.h"


@implementation MyHTTPConnection

/**
 * Returns whether or not the requested resource is browseable.
**/
- (BOOL)isBrowseable:(NSString *)path
{
    // Override me to provide custom configuration...
    // You can configure it for the entire server, or based on the current request
    
    return YES;
}

/**
 * This method creates a html browseable page.
 * Customize to fit your needs
**/
- (NSString *) createBrowseableIndex:(NSString *)path
{
    NSArray *array = [[NSFileManager defaultManager] contentsOfDirectoryAtPath:path error:NULL];
    
    NSMutableString *outdata = [NSMutableString new];
    [outdata appendString:@"<!DOCTYPE html>"];
    [outdata appendString:@"<html><head>"];
    [outdata appendString:@"<title>openFileBrowser</title>"];
    [outdata appendString:@"<style>html {background-color:#eeeeee} body { background-color:#FFFFFF; font-family:Tahoma,Arial,Helvetica,sans-serif; font-size:18x; margin-left:15%; margin-right:15%; border:3px groove #006600; padding:15px; } </style>"];
    [outdata appendString:@"</head><body>"];
    [outdata appendString:@"<h1>Welcome to the iPhone/iPad openFileBrowser</h1>"];
    [outdata appendFormat:@"<bq>Listing %@</bq>", path];
    [outdata appendString:@"<p>"];
    [outdata appendFormat:@"<a href=\"..\">..</a><br />\n"];
    for (NSString *fname in array)
    {
        NSDictionary *fileDict = [[NSFileManager defaultManager] attributesOfItemAtPath:[path stringByAppendingPathComponent:fname] error:NULL];
        NSString *modDate = [NSDateFormatter localizedStringFromDate:[fileDict objectForKey:NSFileModificationDate]
            dateStyle:NSDateFormatterMediumStyle
            timeStyle:NSDateFormatterShortStyle];
        
        if ([[fileDict objectForKey:NSFileType] isEqualToString: @"NSFileTypeDirectory"]) fname = [fname stringByAppendingString:@"/"];
        [outdata appendFormat:@"<a href=\"%@\">%@</a>       (%8.1f Kb, %@)<br />\n", fname, fname, [[fileDict objectForKey:NSFileSize] floatValue] / 1024, modDate];
    }
    [outdata appendString:@"</p>"];
    
    if ([self supportsPOST:path withSize:0])
    {
        [outdata appendString:@"<form action=\"\" method=\"post\" enctype=\"multipart/form-data\" name=\"form1\" id=\"form1\">"];
        [outdata appendString:@"<label>Select file(s) to upload, use ctrl/shift to multi select (HTML5 enabled browser required, IE9 not yet!)<br>"];
        [outdata appendString:@"<input type=\"file\" name=\"file[]\" multiple />"];
        [outdata appendString:@"</label>"];
        [outdata appendString:@"<label>"];
        [outdata appendString:@"<input type=\"submit\" name=\"button\" id=\"button\" value=\"Submit\" />"];
        [outdata appendString:@"</label>"];
        [outdata appendString:@"</form>"];
    }
    
    [outdata appendString:@"</body></html>"];
    
    return [outdata autorelease];
}

/**
 * Returns whether or not the server will accept POSTs.
 * That is, whether the server will accept uploaded data for the given URI.
**/
- (BOOL)supportsPOST:(NSString *)path withSize:(UInt64)contentLength
{
//  NSLog(@"POST:%@", path);
    
    dataStartIndex = 0;
    multipartData = [[[NSMutableArray alloc] init] retain];
    filecount = 0;
    redflag = false;
    
    return YES;
}

/**
 * This method is called to get a response for a request.
 * You may return any object that adopts the HTTPResponse protocol.
 * The HTTPServer comes with two such classes: HTTPFileResponse and HTTPDataResponse.
 * HTTPFileResponse is a wrapper for an NSFileHandle object, and is the preferred way to send a file response.
 * HTTPDataResopnse is a wrapper for an NSData object, and may be used to send a custom response.
**/
- (NSObject<HTTPResponse> *)httpResponseForURI:(NSString *)path
{   
    @try 
    {
        if (postContentLength > 0)  
        {
            [multipartData release];
            [mykey release];
            postContentLength = 0;
            
        }
        
        NSString *filePath = [self filePathForURI:path];
        
        if([[NSFileManager defaultManager] fileExistsAtPath:filePath])
        {
            return [[[HTTPFileResponse alloc] initWithFilePath:filePath] autorelease];
        }
        else
        {
            NSString *folder = [path isEqualToString:@"/"] ? [[server documentRoot] path] : [NSString stringWithFormat: @"%@%@", [[server documentRoot] path], path];
            if ([self isBrowseable:folder])
            {
                NSData *browseData = [[self createBrowseableIndex:folder] dataUsingEncoding:NSUTF8StringEncoding];
                return [[[HTTPDataResponse alloc] initWithData:browseData] autorelease];
            }
        }
    }
    @catch (NSException *theException) 
    {
        NSLog(@"httpResponseForURI: %@", [theException reason]);
    }
    
    return nil;
}

/**
 * Check if chunk has a separator
**/

- (BOOL) haskey:(NSData *)postDataChunk
{
    @try 
    {
        NSRange sr = {0, [postDataChunk length]};
        
        NSRange r = [postDataChunk rangeOfData:mykey options:(NSDataSearchOptions)NULL range:sr];
        
        return r.location != NSNotFound;
        
    }
    @catch (NSException *theException) 
    {
        NSLog(@"haskey: %@", [theException reason]);
    }
    
    return false;
    
}

/**
 * When chunk has a separator, write data prior to separator string, get new file name, create blank file with that name, drop data of previous file from chunk.
**/

- (void) setmultipart:(NSData **) postDataChunk
{
    NSRange sr = {0, [*postDataChunk length]};
    NSRange r = [*postDataChunk rangeOfData:mykey options:(NSDataSearchOptions)NULL range:sr];

    @try 
    {
        if (redflag)  // if separator block was right at end of chunk and got truncated, need to continue processing separator data.
        {
            r = NSMakeRange(0, 0);
        }
        else if (filecount > 0)
        {
            NSFileHandle* dfile = [multipartData lastObject];
            
            NSRange r2 = {0, r.location - 2};
            
            [dfile writeData:[*postDataChunk subdataWithRange:r2]];  // write ending file data.
            
            [dfile closeFile];
            
            [multipartData release];
            
            multipartData = [[[NSMutableArray alloc] init] retain];  // get ready for new file.
            
        }
    }
    @catch (NSException *theException) {
        NSLog(@"setmulipart 1: %@", [theException reason]);
    }
    
    UInt16 separatorBytes = 0x0A0D;
    NSData* separatorData = [NSData dataWithBytes:&separatorBytes length:2];
    
    dataStartIndex = r.location;
    
    int l = [separatorData length];
    redflag = true;
    
    NSRange keeprange;
    
    @try
    {
        for (int i = r.location; i < [*postDataChunk length] - l; i++)
        {
            NSRange searchRange = {i, l};
            if ([[*postDataChunk subdataWithRange:searchRange] isEqualToData:separatorData])
            {
                NSRange newDataRange = {dataStartIndex, i - dataStartIndex};
                dataStartIndex = i + l;
                i += l - 1;
                NSData *newData = [*postDataChunk subdataWithRange:newDataRange];
                
                if ([newData length])  // still separator data?
                {
                    [multipartData addObject:newData];
                    
                }
                else
                {
                    NSString* postInfo = [[NSString alloc] initWithBytes:[[multipartData objectAtIndex:1] bytes] length:[[multipartData objectAtIndex:1] length] encoding:NSUTF8StringEncoding];
                    NSArray* postInfoComponents = [postInfo componentsSeparatedByString:@"; filename="];  // extract file name from separator
                    int cnt = [postInfoComponents count];
                    postInfoComponents = [[postInfoComponents lastObject] componentsSeparatedByString:@"\""];
                    postInfoComponents = [[postInfoComponents objectAtIndex:1] componentsSeparatedByString:@"\\"];
                    
                    if (cnt < 2 || [[postInfoComponents lastObject] isEqualToString:@""])
                    { 
                        *postDataChunk = [NSData data];
                        return;
                    }   
                    
                    NSString* filename = [[[server documentRoot] path] stringByAppendingPathComponent:[postInfoComponents lastObject]];
                    
                    [[NSFileManager defaultManager] createFileAtPath:filename contents:nil attributes:nil];  // create blank new file.
                    
                    NSFileHandle *file = [[NSFileHandle fileHandleForUpdatingAtPath:filename] retain];
                    if (file)
                    {
                        [file seekToEndOfFile];
                        [multipartData addObject:file];
                    }
                    
                    [postInfo release];
                    
                    filecount++;
                    
                    keeprange = NSMakeRange(i + 1, [*postDataChunk length] - (i + 1));  // part of chunk to keep.
                    
                    redflag = false;
                    
                    break;
                }
            }
        }
    }
    @catch (NSException *theException) {
        NSLog(@"setmulipart 2: %@", [theException reason]);
    }
    
    @try 
    {
        NSData *tmpd;
        
        if (redflag)  // separator was truncated at end of chunk.
            tmpd = [NSData data];
        else 
            tmpd = [NSData dataWithData:[*postDataChunk subdataWithRange:keeprange]];
        
        *postDataChunk = [NSData dataWithData:tmpd];   // drop data of previous file from chunk.
        
    }
    @catch (NSException *theException) 
    {
        NSLog(@"setmulipart 3: %@", [theException reason]);
    }
    
}

/**
 * Get the separator key.
**/

- (void) setkey:(NSData *)postDataChunk
{
    @try 
    {
        UInt16 separatorBytes = 0x0A0D;
        NSData* separatorData = [NSData dataWithBytes:&separatorBytes length:2];
        
        int l = [separatorData length];
        for (int i = 0; i < [postDataChunk length] - l; i++)
        {
            NSRange searchRange = {i, l};
            if ([[postDataChunk subdataWithRange:searchRange] isEqualToData:separatorData])
            {
                NSRange newDataRange = {0, i};
                
                mykey = [[postDataChunk subdataWithRange:newDataRange] retain];
                
                break;
            }
        }
    }
    @catch (NSException *theException) 
    {
        NSLog(@"setkey: %@", [theException reason]);
    }
    
}

/**
 * This method is called to handle data read from a POST.
 * The given data is part of the POST body.
 - (NSRange)rangeOfData:(NSData *)dataToFind options:(NSDataSearchOptions)mask range:(NSRange)searchRange
**/
- (void)processPostDataChunk:(NSData *)postDataChunk
{
    // Override me to do something useful with a POST.
    // If the post is small, such as a simple form, you may want to simply append the data to the request.
    // If the post is big, such as a file upload, you may want to store the file to disk.
    // 
    // Remember: In order to support LARGE POST uploads, the data is read in chunks.
    // This prevents a 50 MB upload from being stored in RAM.
    // The size of the chunks are limited by the POST_CHUNKSIZE definition.
    // Therefore, this method may be called multiple times for the same POST request.
    
    //NSLog(@"processPostDataChunk");
    
    @try 
    {
        if (filecount == 0)  // get separator key only once
            [self setkey:postDataChunk];
        
        while ([self haskey:postDataChunk])  // while has file separator
        {
            [self setmultipart:&postDataChunk];  // pass address, ending file data written then dropped, separator parsed and dropped too.
        }
        
        if ([postDataChunk length] > 0)
            [(NSFileHandle*)[multipartData lastObject] writeData:postDataChunk];  // write chunk to file.
    }
    @catch (NSException *theException) 
    {
        NSLog(@"processPostDataChunk: %@", [theException reason]);
    }
}

@end

#import <Foundation/Foundation.h>
#import "Employee.h"
#import "Asset.h"

NSMutableArray* createEmployees() {
    NSMutableArray *employees = [[NSMutableArray alloc] init];
    
    for (int i =0; i < 10; i++) {
        Employee *emp = [[Employee alloc] init];
        
        [emp setEmployeeId:i];            
        [employees addObject:emp];
    }
    
    return employees;
}

NSMutableDictionary * addManagers(NSMutableArray *employees) {
    // Add CEO and CTO
    NSMutableDictionary *execs = [NSMutableDictionary dictionary];
    [execs setObject:employees[0] forKey:@"CEO"];
    [execs setObject:employees[1] forKey:@"CTO"];
    return execs;
}

NSMutableArray * createAssets(NSMutableArray *employees) {
    
    NSMutableArray *assets = [[NSMutableArray alloc] init];
    for (int i = 0; i < 10; i++) {
        Asset *asset = [[Asset alloc] init];
        [asset setResaleValue:i*17];
        NSString *label = [NSString stringWithFormat:@"Laptop %d", i];
        [asset setLabel:label];
        
        [assets addObject:asset];
    }
    return assets;
}

void addAssetsToEmployees(NSMutableArray *employees, NSMutableArray *assets) {
    
    for (Asset *asset in assets) {
        NSUInteger randIndex = random() % [employees count];
        Employee *randEmployee = employees[randIndex];
        [randEmployee addAssetsObject:asset];
        asset.owner = randEmployee;
    }
}

void sortEmployeesByAssets(NSMutableArray *employees) {
    NSSortDescriptor *voa = [NSSortDescriptor sortDescriptorWithKey:@"valueOfAssets" ascending:YES];
    NSSortDescriptor *ei = [NSSortDescriptor sortDescriptorWithKey:@"employeeId" ascending:YES];
    [employees sortUsingDescriptors:[NSArray arrayWithObjects:voa, ei, nil]];
}

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        
        NSMutableArray *employees = createEmployees();
        
        NSMutableDictionary *execs = addManagers(employees);
        NSMutableArray *allAssets = createAssets(employees);
        addAssetsToEmployees(employees, allAssets);
        
        sortEmployeesByAssets(employees);
        NSLog(@"Sorted employees by assets %@", employees);
        
        NSLog(@"Giving up ownership of employee %@", employees[5]);
        [employees removeObjectAtIndex:5];
        
        NSLog(@"allAssets: %@", allAssets);
        NSLog(@"execs %@", execs);
        execs = nil;
        
        // filter assets
        NSPredicate *pred = [NSPredicate predicateWithFormat:@"owner.valueOfAssets > 70"];
        NSArray *filtered = [allAssets filteredArrayUsingPredicate:pred];
        NSLog(@"filtered: %@", filtered);
        filtered = nil;
        
        NSLog(@"Giving up ownership of array");
        
        allAssets = nil;
        employees = nil;
    }
    return 0;
}

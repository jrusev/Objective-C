//
//  main.m
//  SpiralMatrix
//

#import <Foundation/Foundation.h>

void printMatrix(NSArray *matrix) {
    NSMutableString *buffer = [[NSMutableString alloc] init];
    for (NSArray *row in matrix) {
        for (NSNumber *cell in row) {
            [buffer appendFormat:@"%3d", [cell intValue]];
        }
        [buffer appendString:@"\n"];
    }
    
    NSLog(@"\n%@", buffer);
}

NSMutableArray* createSpiralMatrix(int n) {
    
    int dx = 1;
    int dy = 0;
    int x = 0;
    int y = 0;
    
    // Initialize matrix
    NSMutableArray *matrix = [[NSMutableArray alloc] initWithCapacity:n];
    for (int i = 0; i < n; i++) {
        matrix[i] = [[NSMutableArray alloc] init];
        for (int j = 0; j < n; j++) {
            matrix[i][j] = [NSNull null];
        }
    }
    
    // Fill matrix
    for (int i = 0; i < n * n; i++) {
        matrix[y][x] = [NSNumber numberWithInt:i+1];
        int nx = x + dx;
        int ny = y + dy;
        if (0 <= nx && nx < n && 0 <= ny && ny < n && [matrix[ny][nx] isEqual:[NSNull null]]) {
            x = nx;
            y = ny;
        } else {
            int temp = dy;
            dy = dx;
            dx = -temp;
            x = x + dx;
            y = y + dy;
        }
    }
    
    return matrix;
}

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        
        // hard-coded
        NSArray *spiral = @[
                            @[@1, @2, @3],
                            @[@8, @9, @4],
                            @[@7, @6, @5]
                            ];
        printMatrix(spiral);
        
        // by given size N
        NSMutableArray *matrix = createSpiralMatrix(4);
        printMatrix(matrix);
    }
    return 0;
}

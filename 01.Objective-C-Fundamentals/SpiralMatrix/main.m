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

NSArray* createSpiralMatrix(int n) {
    
    // Initialize matrix
    NSMutableArray *matrix = [[NSMutableArray alloc] initWithCapacity:n];
    for (int i = 0; i < n; i++) {
        matrix[i] = [[NSMutableArray alloc] initWithCapacity:n];
        for (int j = 0; j < n; j++) {
            matrix[i][j] = [NSNull null];
        }
    }
    
    // Fill matrix
    int x = 0;
    int y = 0;
    int dx = 0;
    int dy = 1;
    
    for (int i = 0; i < n * n; i++) {
        matrix[x][y] = [NSNumber numberWithInt:i+1];
        int nx = x + dx;
        int ny = y + dy;
        // if (nx, ny) is inside matrix and is empty
        if (0 <= nx && nx < n && 0 <= ny && ny < n && [matrix[nx][ny] isEqual:[NSNull null]]) {
            x = nx;
            y = ny;
        } else {
            // change direction (swap dx and dy)
            int temp = dx;
            dx = dy;
            dy = -temp;
            x = x + dx;
            y = y + dy;
        }
    }
    
    return matrix;
}

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        
        // hard-codedr
        NSArray *spiral = @[
                            @[@1, @2, @3],
                            @[@8, @9, @4],
                            @[@7, @6, @5]
                            ];
        printMatrix(spiral);
        
        // by given size N
        NSArray *matrix = createSpiralMatrix(4);
        printMatrix(matrix);
    }
    return 0;
}

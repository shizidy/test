//
//  Reverse.c
//  test
//
//  Created by wdyzmx on 2018/5/5.
//  Copyright © 2018年 wdyzmx. All rights reserved.
//

#include "Reverse.h"
void reverse(char s[]) {
    // p指向字符串头部
    char *p = s ;
    
    // q指向字符串尾部
    char *q = s ;
    while('\0' != *q) {
        q++ ;
    }
    q-- ;
    
    // 交换并移动指针，直到p和q交叉
    while(q > p) {
        char t = *p;
        char m = *q;
        *p = m;
        *q = t;
        p++;
        q--;
    }
    printf("%s", s);
}

//
//  main.m
//  toyVI
//
//  Created by duanqinglun on 16/1/28.
//  Copyright © 2016年 duanqinglun. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <curses.h>
#import <locale.h>

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        initscr();
        cbreak();
        nonl();
        noecho();
        intrflush(stdscr,false);
        keypad(stdscr,true);
        refresh();
        
        int ch, x, y;
        box(stdscr,'|','-');
        attron(A_REVERSE);
        mvaddstr(0,20,"curses program");
        attroff(A_REVERSE);
        move(x,y);
        getyx(stdscr, y, x); /*获得当前逻辑光标位置*/
        do{
            ch = getch();
            //            NSLog(@"%d", ch);
            switch(ch)
            {
                case KEY_UP:
                    --y;
                    break;
                case KEY_DOWN:
                    ++y;
                    break;
                case KEY_RIGHT:
                    ++x;
                    break;
                case KEY_LEFT:
                    --x;
                    break;
                case KEY_ENTER:
                    ++y;
                    x=0;
                    break;
                case 9:  //tab
                    x+=7;
                    break;
                case KEY_BACKSPACE:
                    mvaddch(y,--x,' ');
                    break;
                case 27: //esc
                    endwin();
                    exit(1);
                default:
                    //                    addch(ch);
                    //                    x++;
                    break;
            }
            move(y,x);
        }while(1);
    }
    return 0;
}

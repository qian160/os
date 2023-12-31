org 07c00h ; 告诉编译器程序加载到7c00处
mov ax, cs
mov ds, ax
mov es, ax
call DispStr ; 调用显示字符串例程
jmp $ ; 无限循环    ;$表示当前行被汇编后的地址
DispStr:
mov ax, BootMessage
mov bp, ax ; ES:BP = 串地址
mov cx, 16 ; CX = 串长度
mov ax, 01301h ; AH = 13, AL = 01h 
mov bx, 000ch ; 页号为0 (BH = 0) 黑底红字(BL = 0Ch,高亮)
mov dl, 0
int 10h ; 10h 号中断
ret
BootMessage: db "Hello, OS world!"  ; db = define byte
times 510 - ($-$$) db 0 ; 填充剩下的空间，使生成的二进制代码恰好为512字节 $$表示一个节section的开始处被汇编后的地址
dw 0xaa55 ; 结束标志



;当计算机电源被打开时，它会先进行加电自检（POST），然后寻找启动盘，如果是选择从软盘启动，计算机就会检
;查软盘的0面0磁道1扇区，如果发现它以'0xAA55'结束，则BIOS认为它是一个引导扇区。当然，一个正确的引导扇区除了以0xAA55
;结束之外，还应该包含一段少于512字节的执行码。

;一旦BIOS发现了引导扇区，就会将这512字节的内容装载到内存地址0000:7c00处，然后跳转到0000:7c00处将控制权彻
;底交给这段引导代码。到此为止，计算机不再由BIOS中固有的程序来控制，而变成由操作系统的一部分来控制。

;$-$$表示本行距离程序开始处的相对距离

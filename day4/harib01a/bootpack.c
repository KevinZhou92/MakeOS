void io_hlt(void);
void write_mem8(int addr, int data);

void HariMain(void)
{
	int i; /* 变量声明, i是一个32位整数 */

	int color = 15;
	for (i = 0xa0000; i <= 0xaffff; i++) {
		write_mem8(i, color--); /* MOV BYTE [i],15 */
		if (color == 0) {
			color = 15;
		}
	}

	fin:
		io_hlt();
		goto fin;

	// for (;;) {
	// 	io_hlt();
	// }
}

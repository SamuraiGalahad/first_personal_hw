```bash
zadira@LAPTOP-U66ALVGC:~/first_personal_hw/for4$ gcc -S -O0 main.c
zadira@LAPTOP-U66ALVGC:~/first_personal_hw/for4$ gcc -O0 -Wall -masm=intel -S -fno-asynchronous-unwind-tables -fcf-protection=none main.c -o clear_main.s
zadira@LAPTOP-U66ALVGC:~/first_personal_hw/for4$ gcc -Os -Wall -masm=intel -S -fno-asynchronous-unwind-tables -fcf-protection=none main.c -o mega_clear_main.s
main.c: In function ‘main’:
main.c:11:5: warning: ignoring return value of ‘scanf’ declared with attribute ‘warn_unused_result’ [-Wunused-result]
   11 |     scanf("%d", &n);
      |     ^~~~~~~~~~~~~~~
main.c:13:9: warning: ignoring return value of ‘scanf’ declared with attribute ‘warn_unused_result’ [-Wunused-result]
   13 |         scanf("%d", &a[ind]);
      |         ^~~~~~~~~~~~~~~~~~~~
zadira@LAPTOP-U66ALVGC:~/first_personal_hw/for4$ gcc -O2 -flto -Wall -masm=intel -S -fno-asynchronous-unwind-tables -fcf-protection=none main.c -o giga_clear_main.s
main.c: In function ‘main’:
main.c:11:5: warning: ignoring return value of ‘scanf’ declared with attribute ‘warn_unused_result’ [-Wunused-result]
   11 |     scanf("%d", &n);
      |     ^~~~~~~~~~~~~~~
main.c:13:9: warning: ignoring return value of ‘scanf’ declared with attribute ‘warn_unused_result’ [-Wunused-result]
   13 |         scanf("%d", &a[ind]);
      |         ^~~~~~~~~~~~~~~~~~~~
zadira@LAPTOP-U66ALVGC:~/first_personal_hw/for4$ cat main.s | awk '/^\t./ { print $ 1 }' | sort | uniq > main_macros.txt
zadira@LAPTOP-U66ALVGC:~/first_personal_hw/for4$ cat clear_main.s | awk '/^\t./ { print $ 1 }' | sort | uniq > clear_main_macros.txt
zadira@LAPTOP-U66ALVGC:~/first_personal_hw/for4$ cat mega_clear_main.s | awk '/^\t./ { print $ 1 }' | sort | uniq > mega_clear_main_macros.txt
zadira@LAPTOP-U66ALVGC:~/first_personal_hw/for4$ cat giga_clear_main.s | awk '/^\t./ { print $ 1 }' | sort | uniq > giga_clear_main_macros.txt
zadira@LAPTOP-U66ALVGC:~/first_personal_hw/for4$ gcc -O0 main.s -o main.out
zadira@LAPTOP-U66ALVGC:~/first_personal_hw/for4$ gcc -O0 clear_main.s -o clear_main.out
zadira@LAPTOP-U66ALVGC:~/first_personal_hw/for4$ gcc -O0 mega_clear_main.s -o mega_clear_main.out
zadira@LAPTOP-U66ALVGC:~/first_personal_hw/for4$ gcc -O0 giga_clear_main.s -o giga_clear_main.out
```
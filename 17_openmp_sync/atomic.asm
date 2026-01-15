
1_atomic.out:     file format elf64-x86-64


Disassembly of section .init:

0000000000001000 <_init>:
    1000:	f3 0f 1e fa          	endbr64
    1004:	48 83 ec 08          	sub    $0x8,%rsp
    1008:	48 8b 05 d9 2f 00 00 	mov    0x2fd9(%rip),%rax        # 3fe8 <__gmon_start__@Base>
    100f:	48 85 c0             	test   %rax,%rax
    1012:	74 02                	je     1016 <_init+0x16>
    1014:	ff d0                	call   *%rax
    1016:	48 83 c4 08          	add    $0x8,%rsp
    101a:	c3                   	ret

Disassembly of section .plt:

0000000000001020 <.plt>:
    1020:	ff 35 8a 2f 00 00    	push   0x2f8a(%rip)        # 3fb0 <_GLOBAL_OFFSET_TABLE_+0x8>
    1026:	ff 25 8c 2f 00 00    	jmp    *0x2f8c(%rip)        # 3fb8 <_GLOBAL_OFFSET_TABLE_+0x10>
    102c:	0f 1f 40 00          	nopl   0x0(%rax)
    1030:	f3 0f 1e fa          	endbr64
    1034:	68 00 00 00 00       	push   $0x0
    1039:	e9 e2 ff ff ff       	jmp    1020 <_init+0x20>
    103e:	66 90                	xchg   %ax,%ax
    1040:	f3 0f 1e fa          	endbr64
    1044:	68 01 00 00 00       	push   $0x1
    1049:	e9 d2 ff ff ff       	jmp    1020 <_init+0x20>
    104e:	66 90                	xchg   %ax,%ax
    1050:	f3 0f 1e fa          	endbr64
    1054:	68 02 00 00 00       	push   $0x2
    1059:	e9 c2 ff ff ff       	jmp    1020 <_init+0x20>
    105e:	66 90                	xchg   %ax,%ax

Disassembly of section .plt.got:

0000000000001060 <__cxa_finalize@plt>:
    1060:	f3 0f 1e fa          	endbr64
    1064:	ff 25 8e 2f 00 00    	jmp    *0x2f8e(%rip)        # 3ff8 <__cxa_finalize@GLIBC_2.2.5>
    106a:	66 0f 1f 44 00 00    	nopw   0x0(%rax,%rax,1)

Disassembly of section .plt.sec:

0000000000001070 <__stack_chk_fail@plt>:
    1070:	f3 0f 1e fa          	endbr64
    1074:	ff 25 46 2f 00 00    	jmp    *0x2f46(%rip)        # 3fc0 <__stack_chk_fail@GLIBC_2.4>
    107a:	66 0f 1f 44 00 00    	nopw   0x0(%rax,%rax,1)

0000000000001080 <__assert_fail@plt>:
    1080:	f3 0f 1e fa          	endbr64
    1084:	ff 25 3e 2f 00 00    	jmp    *0x2f3e(%rip)        # 3fc8 <__assert_fail@GLIBC_2.2.5>
    108a:	66 0f 1f 44 00 00    	nopw   0x0(%rax,%rax,1)

0000000000001090 <GOMP_parallel@plt>:
    1090:	f3 0f 1e fa          	endbr64
    1094:	ff 25 36 2f 00 00    	jmp    *0x2f36(%rip)        # 3fd0 <GOMP_parallel@GOMP_4.0>
    109a:	66 0f 1f 44 00 00    	nopw   0x0(%rax,%rax,1)

Disassembly of section .text:

00000000000010a0 <main>:
    10a0:	f3 0f 1e fa          	endbr64
    10a4:	48 83 ec 28          	sub    $0x28,%rsp
    10a8:	31 c9                	xor    %ecx,%ecx
    10aa:	ba 08 00 00 00       	mov    $0x8,%edx
    10af:	64 48 8b 04 25 28 00 	mov    %fs:0x28,%rax
    10b6:	00 00 
    10b8:	48 89 44 24 18       	mov    %rax,0x18(%rsp)
    10bd:	31 c0                	xor    %eax,%eax
    10bf:	48 8d 74 24 10       	lea    0x10(%rsp),%rsi
    10c4:	48 8d 44 24 0c       	lea    0xc(%rsp),%rax
    10c9:	c7 44 24 0c 00 00 00 	movl   $0x0,0xc(%rsp)
    10d0:	00 
    10d1:	48 8d 3d 48 01 00 00 	lea    0x148(%rip),%rdi        # 1220 <main._omp_fn.0>
    10d8:	48 89 44 24 10       	mov    %rax,0x10(%rsp)
    10dd:	e8 ae ff ff ff       	call   1090 <GOMP_parallel@plt>
    10e2:	81 7c 24 0c 00 00 10 	cmpl   $0x100000,0xc(%rsp)
    10e9:	00 
    10ea:	75 17                	jne    1103 <main+0x63>
    10ec:	48 8b 44 24 18       	mov    0x18(%rsp),%rax
    10f1:	64 48 2b 04 25 28 00 	sub    %fs:0x28,%rax
    10f8:	00 00 
    10fa:	75 26                	jne    1122 <main+0x82>
    10fc:	31 c0                	xor    %eax,%eax
    10fe:	48 83 c4 28          	add    $0x28,%rsp
    1102:	c3                   	ret
    1103:	48 8d 0d fa 0e 00 00 	lea    0xefa(%rip),%rcx        # 2004 <_IO_stdin_used+0x4>
    110a:	ba 19 00 00 00       	mov    $0x19,%edx
    110f:	48 8d 35 f9 0e 00 00 	lea    0xef9(%rip),%rsi        # 200f <_IO_stdin_used+0xf>
    1116:	48 8d 3d ff 0e 00 00 	lea    0xeff(%rip),%rdi        # 201c <_IO_stdin_used+0x1c>
    111d:	e8 5e ff ff ff       	call   1080 <__assert_fail@plt>
    1122:	e8 49 ff ff ff       	call   1070 <__stack_chk_fail@plt>
    1127:	66 0f 1f 84 00 00 00 	nopw   0x0(%rax,%rax,1)
    112e:	00 00 

0000000000001130 <_start>:
    1130:	f3 0f 1e fa          	endbr64
    1134:	31 ed                	xor    %ebp,%ebp
    1136:	49 89 d1             	mov    %rdx,%r9
    1139:	5e                   	pop    %rsi
    113a:	48 89 e2             	mov    %rsp,%rdx
    113d:	48 83 e4 f0          	and    $0xfffffffffffffff0,%rsp
    1141:	50                   	push   %rax
    1142:	54                   	push   %rsp
    1143:	45 31 c0             	xor    %r8d,%r8d
    1146:	31 c9                	xor    %ecx,%ecx
    1148:	48 8d 3d 51 ff ff ff 	lea    -0xaf(%rip),%rdi        # 10a0 <main>
    114f:	ff 15 83 2e 00 00    	call   *0x2e83(%rip)        # 3fd8 <__libc_start_main@GLIBC_2.34>
    1155:	f4                   	hlt
    1156:	66 2e 0f 1f 84 00 00 	cs nopw 0x0(%rax,%rax,1)
    115d:	00 00 00 

0000000000001160 <deregister_tm_clones>:
    1160:	48 8d 3d a9 2e 00 00 	lea    0x2ea9(%rip),%rdi        # 4010 <__TMC_END__>
    1167:	48 8d 05 a2 2e 00 00 	lea    0x2ea2(%rip),%rax        # 4010 <__TMC_END__>
    116e:	48 39 f8             	cmp    %rdi,%rax
    1171:	74 15                	je     1188 <deregister_tm_clones+0x28>
    1173:	48 8b 05 66 2e 00 00 	mov    0x2e66(%rip),%rax        # 3fe0 <_ITM_deregisterTMCloneTable@Base>
    117a:	48 85 c0             	test   %rax,%rax
    117d:	74 09                	je     1188 <deregister_tm_clones+0x28>
    117f:	ff e0                	jmp    *%rax
    1181:	0f 1f 80 00 00 00 00 	nopl   0x0(%rax)
    1188:	c3                   	ret
    1189:	0f 1f 80 00 00 00 00 	nopl   0x0(%rax)

0000000000001190 <register_tm_clones>:
    1190:	48 8d 3d 79 2e 00 00 	lea    0x2e79(%rip),%rdi        # 4010 <__TMC_END__>
    1197:	48 8d 35 72 2e 00 00 	lea    0x2e72(%rip),%rsi        # 4010 <__TMC_END__>
    119e:	48 29 fe             	sub    %rdi,%rsi
    11a1:	48 89 f0             	mov    %rsi,%rax
    11a4:	48 c1 ee 3f          	shr    $0x3f,%rsi
    11a8:	48 c1 f8 03          	sar    $0x3,%rax
    11ac:	48 01 c6             	add    %rax,%rsi
    11af:	48 d1 fe             	sar    $1,%rsi
    11b2:	74 14                	je     11c8 <register_tm_clones+0x38>
    11b4:	48 8b 05 35 2e 00 00 	mov    0x2e35(%rip),%rax        # 3ff0 <_ITM_registerTMCloneTable@Base>
    11bb:	48 85 c0             	test   %rax,%rax
    11be:	74 08                	je     11c8 <register_tm_clones+0x38>
    11c0:	ff e0                	jmp    *%rax
    11c2:	66 0f 1f 44 00 00    	nopw   0x0(%rax,%rax,1)
    11c8:	c3                   	ret
    11c9:	0f 1f 80 00 00 00 00 	nopl   0x0(%rax)

00000000000011d0 <__do_global_dtors_aux>:
    11d0:	f3 0f 1e fa          	endbr64
    11d4:	80 3d 35 2e 00 00 00 	cmpb   $0x0,0x2e35(%rip)        # 4010 <__TMC_END__>
    11db:	75 2b                	jne    1208 <__do_global_dtors_aux+0x38>
    11dd:	55                   	push   %rbp
    11de:	48 83 3d 12 2e 00 00 	cmpq   $0x0,0x2e12(%rip)        # 3ff8 <__cxa_finalize@GLIBC_2.2.5>
    11e5:	00 
    11e6:	48 89 e5             	mov    %rsp,%rbp
    11e9:	74 0c                	je     11f7 <__do_global_dtors_aux+0x27>
    11eb:	48 8b 3d 16 2e 00 00 	mov    0x2e16(%rip),%rdi        # 4008 <__dso_handle>
    11f2:	e8 69 fe ff ff       	call   1060 <__cxa_finalize@plt>
    11f7:	e8 64 ff ff ff       	call   1160 <deregister_tm_clones>
    11fc:	c6 05 0d 2e 00 00 01 	movb   $0x1,0x2e0d(%rip)        # 4010 <__TMC_END__>
    1203:	5d                   	pop    %rbp
    1204:	c3                   	ret
    1205:	0f 1f 00             	nopl   (%rax)
    1208:	c3                   	ret
    1209:	0f 1f 80 00 00 00 00 	nopl   0x0(%rax)

0000000000001210 <frame_dummy>:
    1210:	f3 0f 1e fa          	endbr64
    1214:	e9 77 ff ff ff       	jmp    1190 <register_tm_clones>
    1219:	0f 1f 80 00 00 00 00 	nopl   0x0(%rax)

0000000000001220 <main._omp_fn.0>:
    1220:	f3 0f 1e fa          	endbr64
    1224:	b8 00 00 02 00       	mov    $0x20000,%eax
    1229:	0f 1f 80 00 00 00 00 	nopl   0x0(%rax)
    1230:	48 8b 17             	mov    (%rdi),%rdx
    1233:	f0 83 02 01          	lock addl $0x1,(%rdx)
    1237:	83 e8 01             	sub    $0x1,%eax
    123a:	75 f4                	jne    1230 <main._omp_fn.0+0x10>
    123c:	c3                   	ret

Disassembly of section .fini:

0000000000001240 <_fini>:
    1240:	f3 0f 1e fa          	endbr64
    1244:	48 83 ec 08          	sub    $0x8,%rsp
    1248:	48 83 c4 08          	add    $0x8,%rsp
    124c:	c3                   	ret

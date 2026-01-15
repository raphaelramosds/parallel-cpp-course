
0_critical.out:     file format elf64-x86-64


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
    1020:	ff 35 7a 2f 00 00    	push   0x2f7a(%rip)        # 3fa0 <_GLOBAL_OFFSET_TABLE_+0x8>
    1026:	ff 25 7c 2f 00 00    	jmp    *0x2f7c(%rip)        # 3fa8 <_GLOBAL_OFFSET_TABLE_+0x10>
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
    1060:	f3 0f 1e fa          	endbr64
    1064:	68 03 00 00 00       	push   $0x3
    1069:	e9 b2 ff ff ff       	jmp    1020 <_init+0x20>
    106e:	66 90                	xchg   %ax,%ax
    1070:	f3 0f 1e fa          	endbr64
    1074:	68 04 00 00 00       	push   $0x4
    1079:	e9 a2 ff ff ff       	jmp    1020 <_init+0x20>
    107e:	66 90                	xchg   %ax,%ax

Disassembly of section .plt.got:

0000000000001080 <__cxa_finalize@plt>:
    1080:	f3 0f 1e fa          	endbr64
    1084:	ff 25 6e 2f 00 00    	jmp    *0x2f6e(%rip)        # 3ff8 <__cxa_finalize@GLIBC_2.2.5>
    108a:	66 0f 1f 44 00 00    	nopw   0x0(%rax,%rax,1)

Disassembly of section .plt.sec:

0000000000001090 <__stack_chk_fail@plt>:
    1090:	f3 0f 1e fa          	endbr64
    1094:	ff 25 16 2f 00 00    	jmp    *0x2f16(%rip)        # 3fb0 <__stack_chk_fail@GLIBC_2.4>
    109a:	66 0f 1f 44 00 00    	nopw   0x0(%rax,%rax,1)

00000000000010a0 <GOMP_critical_end@plt>:
    10a0:	f3 0f 1e fa          	endbr64
    10a4:	ff 25 0e 2f 00 00    	jmp    *0x2f0e(%rip)        # 3fb8 <GOMP_critical_end@GOMP_1.0>
    10aa:	66 0f 1f 44 00 00    	nopw   0x0(%rax,%rax,1)

00000000000010b0 <__assert_fail@plt>:
    10b0:	f3 0f 1e fa          	endbr64
    10b4:	ff 25 06 2f 00 00    	jmp    *0x2f06(%rip)        # 3fc0 <__assert_fail@GLIBC_2.2.5>
    10ba:	66 0f 1f 44 00 00    	nopw   0x0(%rax,%rax,1)

00000000000010c0 <GOMP_parallel@plt>:
    10c0:	f3 0f 1e fa          	endbr64
    10c4:	ff 25 fe 2e 00 00    	jmp    *0x2efe(%rip)        # 3fc8 <GOMP_parallel@GOMP_4.0>
    10ca:	66 0f 1f 44 00 00    	nopw   0x0(%rax,%rax,1)

00000000000010d0 <GOMP_critical_start@plt>:
    10d0:	f3 0f 1e fa          	endbr64
    10d4:	ff 25 f6 2e 00 00    	jmp    *0x2ef6(%rip)        # 3fd0 <GOMP_critical_start@GOMP_1.0>
    10da:	66 0f 1f 44 00 00    	nopw   0x0(%rax,%rax,1)

Disassembly of section .text:

00000000000010e0 <main>:
    10e0:	f3 0f 1e fa          	endbr64
    10e4:	48 83 ec 18          	sub    $0x18,%rsp
    10e8:	31 c9                	xor    %ecx,%ecx
    10ea:	ba 08 00 00 00       	mov    $0x8,%edx
    10ef:	64 48 8b 04 25 28 00 	mov    %fs:0x28,%rax
    10f6:	00 00 
    10f8:	48 89 44 24 08       	mov    %rax,0x8(%rsp)
    10fd:	31 c0                	xor    %eax,%eax
    10ff:	48 8d 74 24 04       	lea    0x4(%rsp),%rsi
    1104:	48 8d 3d 45 01 00 00 	lea    0x145(%rip),%rdi        # 1250 <main._omp_fn.0>
    110b:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%rsp)
    1112:	00 
    1113:	e8 a8 ff ff ff       	call   10c0 <GOMP_parallel@plt>
    1118:	81 7c 24 04 00 00 10 	cmpl   $0x100000,0x4(%rsp)
    111f:	00 
    1120:	75 17                	jne    1139 <main+0x59>
    1122:	48 8b 44 24 08       	mov    0x8(%rsp),%rax
    1127:	64 48 2b 04 25 28 00 	sub    %fs:0x28,%rax
    112e:	00 00 
    1130:	75 26                	jne    1158 <main+0x78>
    1132:	31 c0                	xor    %eax,%eax
    1134:	48 83 c4 18          	add    $0x18,%rsp
    1138:	c3                   	ret
    1139:	48 8d 0d c4 0e 00 00 	lea    0xec4(%rip),%rcx        # 2004 <_IO_stdin_used+0x4>
    1140:	ba 19 00 00 00       	mov    $0x19,%edx
    1145:	48 8d 35 c3 0e 00 00 	lea    0xec3(%rip),%rsi        # 200f <_IO_stdin_used+0xf>
    114c:	48 8d 3d cb 0e 00 00 	lea    0xecb(%rip),%rdi        # 201e <_IO_stdin_used+0x1e>
    1153:	e8 58 ff ff ff       	call   10b0 <__assert_fail@plt>
    1158:	e8 33 ff ff ff       	call   1090 <__stack_chk_fail@plt>
    115d:	0f 1f 00             	nopl   (%rax)

0000000000001160 <_start>:
    1160:	f3 0f 1e fa          	endbr64
    1164:	31 ed                	xor    %ebp,%ebp
    1166:	49 89 d1             	mov    %rdx,%r9
    1169:	5e                   	pop    %rsi
    116a:	48 89 e2             	mov    %rsp,%rdx
    116d:	48 83 e4 f0          	and    $0xfffffffffffffff0,%rsp
    1171:	50                   	push   %rax
    1172:	54                   	push   %rsp
    1173:	45 31 c0             	xor    %r8d,%r8d
    1176:	31 c9                	xor    %ecx,%ecx
    1178:	48 8d 3d 61 ff ff ff 	lea    -0x9f(%rip),%rdi        # 10e0 <main>
    117f:	ff 15 53 2e 00 00    	call   *0x2e53(%rip)        # 3fd8 <__libc_start_main@GLIBC_2.34>
    1185:	f4                   	hlt
    1186:	66 2e 0f 1f 84 00 00 	cs nopw 0x0(%rax,%rax,1)
    118d:	00 00 00 

0000000000001190 <deregister_tm_clones>:
    1190:	48 8d 3d 79 2e 00 00 	lea    0x2e79(%rip),%rdi        # 4010 <__TMC_END__>
    1197:	48 8d 05 72 2e 00 00 	lea    0x2e72(%rip),%rax        # 4010 <__TMC_END__>
    119e:	48 39 f8             	cmp    %rdi,%rax
    11a1:	74 15                	je     11b8 <deregister_tm_clones+0x28>
    11a3:	48 8b 05 36 2e 00 00 	mov    0x2e36(%rip),%rax        # 3fe0 <_ITM_deregisterTMCloneTable@Base>
    11aa:	48 85 c0             	test   %rax,%rax
    11ad:	74 09                	je     11b8 <deregister_tm_clones+0x28>
    11af:	ff e0                	jmp    *%rax
    11b1:	0f 1f 80 00 00 00 00 	nopl   0x0(%rax)
    11b8:	c3                   	ret
    11b9:	0f 1f 80 00 00 00 00 	nopl   0x0(%rax)

00000000000011c0 <register_tm_clones>:
    11c0:	48 8d 3d 49 2e 00 00 	lea    0x2e49(%rip),%rdi        # 4010 <__TMC_END__>
    11c7:	48 8d 35 42 2e 00 00 	lea    0x2e42(%rip),%rsi        # 4010 <__TMC_END__>
    11ce:	48 29 fe             	sub    %rdi,%rsi
    11d1:	48 89 f0             	mov    %rsi,%rax
    11d4:	48 c1 ee 3f          	shr    $0x3f,%rsi
    11d8:	48 c1 f8 03          	sar    $0x3,%rax
    11dc:	48 01 c6             	add    %rax,%rsi
    11df:	48 d1 fe             	sar    $1,%rsi
    11e2:	74 14                	je     11f8 <register_tm_clones+0x38>
    11e4:	48 8b 05 05 2e 00 00 	mov    0x2e05(%rip),%rax        # 3ff0 <_ITM_registerTMCloneTable@Base>
    11eb:	48 85 c0             	test   %rax,%rax
    11ee:	74 08                	je     11f8 <register_tm_clones+0x38>
    11f0:	ff e0                	jmp    *%rax
    11f2:	66 0f 1f 44 00 00    	nopw   0x0(%rax,%rax,1)
    11f8:	c3                   	ret
    11f9:	0f 1f 80 00 00 00 00 	nopl   0x0(%rax)

0000000000001200 <__do_global_dtors_aux>:
    1200:	f3 0f 1e fa          	endbr64
    1204:	80 3d 05 2e 00 00 00 	cmpb   $0x0,0x2e05(%rip)        # 4010 <__TMC_END__>
    120b:	75 2b                	jne    1238 <__do_global_dtors_aux+0x38>
    120d:	55                   	push   %rbp
    120e:	48 83 3d e2 2d 00 00 	cmpq   $0x0,0x2de2(%rip)        # 3ff8 <__cxa_finalize@GLIBC_2.2.5>
    1215:	00 
    1216:	48 89 e5             	mov    %rsp,%rbp
    1219:	74 0c                	je     1227 <__do_global_dtors_aux+0x27>
    121b:	48 8b 3d e6 2d 00 00 	mov    0x2de6(%rip),%rdi        # 4008 <__dso_handle>
    1222:	e8 59 fe ff ff       	call   1080 <__cxa_finalize@plt>
    1227:	e8 64 ff ff ff       	call   1190 <deregister_tm_clones>
    122c:	c6 05 dd 2d 00 00 01 	movb   $0x1,0x2ddd(%rip)        # 4010 <__TMC_END__>
    1233:	5d                   	pop    %rbp
    1234:	c3                   	ret
    1235:	0f 1f 00             	nopl   (%rax)
    1238:	c3                   	ret
    1239:	0f 1f 80 00 00 00 00 	nopl   0x0(%rax)

0000000000001240 <frame_dummy>:
    1240:	f3 0f 1e fa          	endbr64
    1244:	e9 77 ff ff ff       	jmp    11c0 <register_tm_clones>
    1249:	0f 1f 80 00 00 00 00 	nopl   0x0(%rax)

0000000000001250 <main._omp_fn.0>:
    1250:	f3 0f 1e fa          	endbr64
    1254:	55                   	push   %rbp
    1255:	48 89 fd             	mov    %rdi,%rbp
    1258:	53                   	push   %rbx
    1259:	bb 00 00 02 00       	mov    $0x20000,%ebx
    125e:	48 83 ec 08          	sub    $0x8,%rsp
    1262:	66 0f 1f 44 00 00    	nopw   0x0(%rax,%rax,1)
    1268:	e8 63 fe ff ff       	call   10d0 <GOMP_critical_start@plt>
    126d:	83 45 00 01          	addl   $0x1,0x0(%rbp)
    1271:	e8 2a fe ff ff       	call   10a0 <GOMP_critical_end@plt>
    1276:	83 eb 01             	sub    $0x1,%ebx
    1279:	75 ed                	jne    1268 <main._omp_fn.0+0x18>
    127b:	48 83 c4 08          	add    $0x8,%rsp
    127f:	5b                   	pop    %rbx
    1280:	5d                   	pop    %rbp
    1281:	c3                   	ret

Disassembly of section .fini:

0000000000001284 <_fini>:
    1284:	f3 0f 1e fa          	endbr64
    1288:	48 83 ec 08          	sub    $0x8,%rsp
    128c:	48 83 c4 08          	add    $0x8,%rsp
    1290:	c3                   	ret

kernel:     file format elf64-littleriscv


Disassembly of section .text:

0000000080000000 <_entry>:
    80000000:	0000d117          	auipc	sp,0xd
    80000004:	d0013103          	ld	sp,-768(sp) # 8000cd00 <_GLOBAL_OFFSET_TABLE_+0x48>
    80000008:	00001537          	lui	a0,0x1
    8000000c:	f14025f3          	csrr	a1,mhartid
    80000010:	00158593          	addi	a1,a1,1
    80000014:	02b50533          	mul	a0,a0,a1
    80000018:	00a10133          	add	sp,sp,a0
    8000001c:	73c070ef          	jal	ra,80007758 <start>

0000000080000020 <spin>:
    80000020:	0000006f          	j	80000020 <spin>
	...

0000000080001000 <copy_and_swap>:
# a1 holds expected value
# a2 holds desired value
# a0 holds return value, 0 if successful, !0 otherwise
.global copy_and_swap
copy_and_swap:
    lr.w t0, (a0)          # Load original value.
    80001000:	100522af          	lr.w	t0,(a0)
    bne t0, a1, fail       # Doesn’t match, so fail.
    80001004:	00b29a63          	bne	t0,a1,80001018 <fail>
    sc.w t0, a2, (a0)      # Try to update.
    80001008:	18c522af          	sc.w	t0,a2,(a0)
    bnez t0, copy_and_swap # Retry if store-conditional failed.
    8000100c:	fe029ae3          	bnez	t0,80001000 <copy_and_swap>
    li a0, 0               # Set return to success.
    80001010:	00000513          	li	a0,0
    jr ra                  # Return.
    80001014:	00008067          	ret

0000000080001018 <fail>:
    fail:
    li a0, 1               # Set return to failure.
    80001018:	00100513          	li	a0,1
    8000101c:	00008067          	ret

0000000080001020 <_ZN3TCB13contextSwitchEPNS_7ContextES1_>:
.global _ZN3TCB13contextSwitchEPNS_7ContextES1_
.type _ZN3TCB13contextSwitchEPNS_7ContextES1_, @function
_ZN3TCB13contextSwitchEPNS_7ContextES1_:
    sd ra, 0 * 8(a0)
    80001020:	00153023          	sd	ra,0(a0) # 1000 <_entry-0x7ffff000>
    sd sp, 1 * 8(a0)
    80001024:	00253423          	sd	sp,8(a0)

    ld ra, 0 * 8(a1)
    80001028:	0005b083          	ld	ra,0(a1)
    ld sp, 1 * 8(a1)
    8000102c:	0085b103          	ld	sp,8(a1)

    ret
    80001030:	00008067          	ret
	...

0000000080001040 <_ZN5Riscv14supervisorTrapEv>:
.global _ZN5Riscv14supervisorTrapEv
.align 4
.type _ZN5Riscv14supervisorTrapEv, @function

_ZN5Riscv14supervisorTrapEv:
    addi sp, sp, -256
    80001040:	f0010113          	addi	sp,sp,-256

    .irp index, 0,1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28,29,30,31
    sd x\index, \index * 8(sp)
    .endr
    80001044:	00013023          	sd	zero,0(sp)
    80001048:	00113423          	sd	ra,8(sp)
    8000104c:	00213823          	sd	sp,16(sp)
    80001050:	00313c23          	sd	gp,24(sp)
    80001054:	02413023          	sd	tp,32(sp)
    80001058:	02513423          	sd	t0,40(sp)
    8000105c:	02613823          	sd	t1,48(sp)
    80001060:	02713c23          	sd	t2,56(sp)
    80001064:	04813023          	sd	s0,64(sp)
    80001068:	04913423          	sd	s1,72(sp)
    8000106c:	04a13823          	sd	a0,80(sp)
    80001070:	04b13c23          	sd	a1,88(sp)
    80001074:	06c13023          	sd	a2,96(sp)
    80001078:	06d13423          	sd	a3,104(sp)
    8000107c:	06e13823          	sd	a4,112(sp)
    80001080:	06f13c23          	sd	a5,120(sp)
    80001084:	09013023          	sd	a6,128(sp)
    80001088:	09113423          	sd	a7,136(sp)
    8000108c:	09213823          	sd	s2,144(sp)
    80001090:	09313c23          	sd	s3,152(sp)
    80001094:	0b413023          	sd	s4,160(sp)
    80001098:	0b513423          	sd	s5,168(sp)
    8000109c:	0b613823          	sd	s6,176(sp)
    800010a0:	0b713c23          	sd	s7,184(sp)
    800010a4:	0d813023          	sd	s8,192(sp)
    800010a8:	0d913423          	sd	s9,200(sp)
    800010ac:	0da13823          	sd	s10,208(sp)
    800010b0:	0db13c23          	sd	s11,216(sp)
    800010b4:	0fc13023          	sd	t3,224(sp)
    800010b8:	0fd13423          	sd	t4,232(sp)
    800010bc:	0fe13823          	sd	t5,240(sp)
    800010c0:	0ff13c23          	sd	t6,248(sp)
    call _ZN5Riscv21supervisorTrapHandlerEv
    800010c4:	400020ef          	jal	ra,800034c4 <_ZN5Riscv21supervisorTrapHandlerEv>

    csrr a1, scause
    800010c8:	142025f3          	csrr	a1,scause
    addi a1, a1, -8
    800010cc:	ff858593          	addi	a1,a1,-8
    beqz a1, syscall
    800010d0:	00058663          	beqz	a1,800010dc <syscall>
    addi a1, a1, -1
    800010d4:	fff58593          	addi	a1,a1,-1
    bnez a1, other
    800010d8:	00059463          	bnez	a1,800010e0 <other>

00000000800010dc <syscall>:

syscall:
    sd x10, 0x50(sp)
    800010dc:	04a13823          	sd	a0,80(sp)

00000000800010e0 <other>:
other:

    .irp index, 0,1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28,29,30,31
    ld x\index, \index * 8(sp)
    .endr
    800010e0:	00013003          	ld	zero,0(sp)
    800010e4:	00813083          	ld	ra,8(sp)
    800010e8:	01013103          	ld	sp,16(sp)
    800010ec:	01813183          	ld	gp,24(sp)
    800010f0:	02013203          	ld	tp,32(sp)
    800010f4:	02813283          	ld	t0,40(sp)
    800010f8:	03013303          	ld	t1,48(sp)
    800010fc:	03813383          	ld	t2,56(sp)
    80001100:	04013403          	ld	s0,64(sp)
    80001104:	04813483          	ld	s1,72(sp)
    80001108:	05013503          	ld	a0,80(sp)
    8000110c:	05813583          	ld	a1,88(sp)
    80001110:	06013603          	ld	a2,96(sp)
    80001114:	06813683          	ld	a3,104(sp)
    80001118:	07013703          	ld	a4,112(sp)
    8000111c:	07813783          	ld	a5,120(sp)
    80001120:	08013803          	ld	a6,128(sp)
    80001124:	08813883          	ld	a7,136(sp)
    80001128:	09013903          	ld	s2,144(sp)
    8000112c:	09813983          	ld	s3,152(sp)
    80001130:	0a013a03          	ld	s4,160(sp)
    80001134:	0a813a83          	ld	s5,168(sp)
    80001138:	0b013b03          	ld	s6,176(sp)
    8000113c:	0b813b83          	ld	s7,184(sp)
    80001140:	0c013c03          	ld	s8,192(sp)
    80001144:	0c813c83          	ld	s9,200(sp)
    80001148:	0d013d03          	ld	s10,208(sp)
    8000114c:	0d813d83          	ld	s11,216(sp)
    80001150:	0e013e03          	ld	t3,224(sp)
    80001154:	0e813e83          	ld	t4,232(sp)
    80001158:	0f013f03          	ld	t5,240(sp)
    8000115c:	0f813f83          	ld	t6,248(sp)

    add sp, sp, 256
    80001160:	10010113          	addi	sp,sp,256

    80001164:	10200073          	sret
	...

0000000080001170 <_ZN5Riscv13pushRegistersEv>:

.global _ZN5Riscv13pushRegistersEv
.type _ZN5Riscv13pushRegistersEv, @function

_ZN5Riscv13pushRegistersEv:
    addi sp, sp, -256
    80001170:	f0010113          	addi	sp,sp,-256
    .irp index, 3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28,29,30,31
    sd x\index, \index*8(sp)
    .endr
    80001174:	00313c23          	sd	gp,24(sp)
    80001178:	02413023          	sd	tp,32(sp)
    8000117c:	02513423          	sd	t0,40(sp)
    80001180:	02613823          	sd	t1,48(sp)
    80001184:	02713c23          	sd	t2,56(sp)
    80001188:	04813023          	sd	s0,64(sp)
    8000118c:	04913423          	sd	s1,72(sp)
    80001190:	04a13823          	sd	a0,80(sp)
    80001194:	04b13c23          	sd	a1,88(sp)
    80001198:	06c13023          	sd	a2,96(sp)
    8000119c:	06d13423          	sd	a3,104(sp)
    800011a0:	06e13823          	sd	a4,112(sp)
    800011a4:	06f13c23          	sd	a5,120(sp)
    800011a8:	09013023          	sd	a6,128(sp)
    800011ac:	09113423          	sd	a7,136(sp)
    800011b0:	09213823          	sd	s2,144(sp)
    800011b4:	09313c23          	sd	s3,152(sp)
    800011b8:	0b413023          	sd	s4,160(sp)
    800011bc:	0b513423          	sd	s5,168(sp)
    800011c0:	0b613823          	sd	s6,176(sp)
    800011c4:	0b713c23          	sd	s7,184(sp)
    800011c8:	0d813023          	sd	s8,192(sp)
    800011cc:	0d913423          	sd	s9,200(sp)
    800011d0:	0da13823          	sd	s10,208(sp)
    800011d4:	0db13c23          	sd	s11,216(sp)
    800011d8:	0fc13023          	sd	t3,224(sp)
    800011dc:	0fd13423          	sd	t4,232(sp)
    800011e0:	0fe13823          	sd	t5,240(sp)
    800011e4:	0ff13c23          	sd	t6,248(sp)
    ret
    800011e8:	00008067          	ret

00000000800011ec <_ZN5Riscv12popRegistersEv>:
.global _ZN5Riscv12popRegistersEv
.type _ZN5Riscv12popRegistersEv, @function
_ZN5Riscv12popRegistersEv:
    .irp index, 3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28,29,30,31
    ld x\index, \index*8(sp)
    .endr
    800011ec:	01813183          	ld	gp,24(sp)
    800011f0:	02013203          	ld	tp,32(sp)
    800011f4:	02813283          	ld	t0,40(sp)
    800011f8:	03013303          	ld	t1,48(sp)
    800011fc:	03813383          	ld	t2,56(sp)
    80001200:	04013403          	ld	s0,64(sp)
    80001204:	04813483          	ld	s1,72(sp)
    80001208:	05013503          	ld	a0,80(sp)
    8000120c:	05813583          	ld	a1,88(sp)
    80001210:	06013603          	ld	a2,96(sp)
    80001214:	06813683          	ld	a3,104(sp)
    80001218:	07013703          	ld	a4,112(sp)
    8000121c:	07813783          	ld	a5,120(sp)
    80001220:	08013803          	ld	a6,128(sp)
    80001224:	08813883          	ld	a7,136(sp)
    80001228:	09013903          	ld	s2,144(sp)
    8000122c:	09813983          	ld	s3,152(sp)
    80001230:	0a013a03          	ld	s4,160(sp)
    80001234:	0a813a83          	ld	s5,168(sp)
    80001238:	0b013b03          	ld	s6,176(sp)
    8000123c:	0b813b83          	ld	s7,184(sp)
    80001240:	0c013c03          	ld	s8,192(sp)
    80001244:	0c813c83          	ld	s9,200(sp)
    80001248:	0d013d03          	ld	s10,208(sp)
    8000124c:	0d813d83          	ld	s11,216(sp)
    80001250:	0e013e03          	ld	t3,224(sp)
    80001254:	0e813e83          	ld	t4,232(sp)
    80001258:	0f013f03          	ld	t5,240(sp)
    8000125c:	0f813f83          	ld	t6,248(sp)
    add sp, sp, 256
    80001260:	10010113          	addi	sp,sp,256
    80001264:	00008067          	ret

0000000080001268 <atoi>:
// Created by bogdan on 5.2.23..
//
#include "../h/string_.h"


int atoi(const char* string){
    80001268:	ff010113          	addi	sp,sp,-16
    8000126c:	00813423          	sd	s0,8(sp)
    80001270:	01010413          	addi	s0,sp,16
    80001274:	00050613          	mv	a2,a0

    int num = 0;

    for (int i = 0; string[i] != '\0'; i++)
    80001278:	00000693          	li	a3,0
    int num = 0;
    8000127c:	00000513          	li	a0,0
    for (int i = 0; string[i] != '\0'; i++)
    80001280:	00d607b3          	add	a5,a2,a3
    80001284:	0007c703          	lbu	a4,0(a5)
    80001288:	02070063          	beqz	a4,800012a8 <atoi+0x40>
        num = num * 10 + (string[i] - '0');
    8000128c:	0025179b          	slliw	a5,a0,0x2
    80001290:	00a787bb          	addw	a5,a5,a0
    80001294:	0017979b          	slliw	a5,a5,0x1
    80001298:	fd07071b          	addiw	a4,a4,-48
    8000129c:	00e7853b          	addw	a0,a5,a4
    for (int i = 0; string[i] != '\0'; i++)
    800012a0:	0016869b          	addiw	a3,a3,1
    800012a4:	fddff06f          	j	80001280 <atoi+0x18>

    return num;
}
    800012a8:	00813403          	ld	s0,8(sp)
    800012ac:	01010113          	addi	sp,sp,16
    800012b0:	00008067          	ret

00000000800012b4 <strcpy>:

void strcpy(char* dest, const char* src) {
    800012b4:	ff010113          	addi	sp,sp,-16
    800012b8:	00813423          	sd	s0,8(sp)
    800012bc:	01010413          	addi	s0,sp,16
    for(int i = 0; src[i] != '\0'; i++)
    800012c0:	00000793          	li	a5,0
    800012c4:	00f58733          	add	a4,a1,a5
    800012c8:	00074703          	lbu	a4,0(a4)
    800012cc:	00070a63          	beqz	a4,800012e0 <strcpy+0x2c>
        dest[i] = src[i];
    800012d0:	00f506b3          	add	a3,a0,a5
    800012d4:	00e68023          	sb	a4,0(a3)
    for(int i = 0; src[i] != '\0'; i++)
    800012d8:	0017879b          	addiw	a5,a5,1
    800012dc:	fe9ff06f          	j	800012c4 <strcpy+0x10>
}
    800012e0:	00813403          	ld	s0,8(sp)
    800012e4:	01010113          	addi	sp,sp,16
    800012e8:	00008067          	ret

00000000800012ec <strlen>:

size_t strlen(const char *str) {
    800012ec:	ff010113          	addi	sp,sp,-16
    800012f0:	00813423          	sd	s0,8(sp)
    800012f4:	01010413          	addi	s0,sp,16
    800012f8:	00050693          	mv	a3,a0
    int len = 0;
    for(int i = 0; str[i] != '\0';i++) len++;
    800012fc:	00000793          	li	a5,0
    int len = 0;
    80001300:	00000513          	li	a0,0
    for(int i = 0; str[i] != '\0';i++) len++;
    80001304:	00f68733          	add	a4,a3,a5
    80001308:	00074703          	lbu	a4,0(a4)
    8000130c:	00070863          	beqz	a4,8000131c <strlen+0x30>
    80001310:	0015051b          	addiw	a0,a0,1
    80001314:	0017879b          	addiw	a5,a5,1
    80001318:	fedff06f          	j	80001304 <strlen+0x18>
    return len;
}
    8000131c:	00813403          	ld	s0,8(sp)
    80001320:	01010113          	addi	sp,sp,16
    80001324:	00008067          	ret

0000000080001328 <strcmp>:

int strcmp(const char *str1, const char *str2){
    80001328:	ff010113          	addi	sp,sp,-16
    8000132c:	00813423          	sd	s0,8(sp)
    80001330:	01010413          	addi	s0,sp,16
    while (*str1){
    80001334:	00054783          	lbu	a5,0(a0)
    80001338:	00078c63          	beqz	a5,80001350 <strcmp+0x28>
        if (*str1 != *str2)
    8000133c:	0005c703          	lbu	a4,0(a1)
    80001340:	00f71863          	bne	a4,a5,80001350 <strcmp+0x28>
            break;

        str1++;
    80001344:	00150513          	addi	a0,a0,1
        str2++;
    80001348:	00158593          	addi	a1,a1,1
    8000134c:	fe9ff06f          	j	80001334 <strcmp+0xc>
    }

    return *(const unsigned char*)str1 - *(const unsigned char*)str2;
    80001350:	0005c503          	lbu	a0,0(a1)
}
    80001354:	40a7853b          	subw	a0,a5,a0
    80001358:	00813403          	ld	s0,8(sp)
    8000135c:	01010113          	addi	sp,sp,16
    80001360:	00008067          	ret

0000000080001364 <strncmp>:

int strncmp(const char *str1, const char *str2, size_t n){
    80001364:	ff010113          	addi	sp,sp,-16
    80001368:	00813423          	sd	s0,8(sp)
    8000136c:	01010413          	addi	s0,sp,16
    int i = 0;
    80001370:	00000713          	li	a4,0
    while (*str1 && i < n){
    80001374:	0100006f          	j	80001384 <strncmp+0x20>
        if (*str1 != *str2)
            break;
        i++;
    80001378:	0017071b          	addiw	a4,a4,1
        str1++;
    8000137c:	00150513          	addi	a0,a0,1
        str2++;
    80001380:	00158593          	addi	a1,a1,1
    while (*str1 && i < n){
    80001384:	00054783          	lbu	a5,0(a0)
    80001388:	00078863          	beqz	a5,80001398 <strncmp+0x34>
    8000138c:	00c77663          	bgeu	a4,a2,80001398 <strncmp+0x34>
        if (*str1 != *str2)
    80001390:	0005c683          	lbu	a3,0(a1)
    80001394:	fef682e3          	beq	a3,a5,80001378 <strncmp+0x14>
    }

    return *(const unsigned char*)str1 - *(const unsigned char*)str2;
    80001398:	0005c503          	lbu	a0,0(a1)
    8000139c:	40a7853b          	subw	a0,a5,a0
    800013a0:	00813403          	ld	s0,8(sp)
    800013a4:	01010113          	addi	sp,sp,16
    800013a8:	00008067          	ret

00000000800013ac <_Z10mallocFreev>:
//

#include "MemoryAllocation_C_API_test.h"


void mallocFree(){
    800013ac:	cc010113          	addi	sp,sp,-832
    800013b0:	32113c23          	sd	ra,824(sp)
    800013b4:	32813823          	sd	s0,816(sp)
    800013b8:	32913423          	sd	s1,808(sp)
    800013bc:	33213023          	sd	s2,800(sp)
    800013c0:	34010413          	addi	s0,sp,832
    printString("mallocFree\n");
    800013c4:	00009517          	auipc	a0,0x9
    800013c8:	c5c50513          	addi	a0,a0,-932 # 8000a020 <CONSOLE_STATUS+0x10>
    800013cc:	00002097          	auipc	ra,0x2
    800013d0:	bfc080e7          	jalr	-1028(ra) # 80002fc8 <_Z11printStringPKc>
    constexpr int num = 100;
    void* addrs[num];
    for(int i = 0; i<num;i++){
    800013d4:	00000493          	li	s1,0
    800013d8:	0080006f          	j	800013e0 <_Z10mallocFreev+0x34>
    800013dc:	0014849b          	addiw	s1,s1,1
    800013e0:	06300793          	li	a5,99
    800013e4:	0497ca63          	blt	a5,s1,80001438 <_Z10mallocFreev+0x8c>
    MemoryAllocator(MemoryAllocator&&) = delete;
    MemoryAllocator& operator=(const MemoryAllocator&) = delete;
    MemoryAllocator& operator=(MemoryAllocator&&) = delete;


    static void* getMemory(size_t size) { return getInstance().IGetMemory(size); }
    800013e8:	00004097          	auipc	ra,0x4
    800013ec:	0d4080e7          	jalr	212(ra) # 800054bc <_ZN15MemoryAllocator11getInstanceEv>
    800013f0:	06400593          	li	a1,100
    800013f4:	00004097          	auipc	ra,0x4
    800013f8:	124080e7          	jalr	292(ra) # 80005518 <_ZN15MemoryAllocator10IGetMemoryEm>
        addrs[i] = MemoryAllocator::getMemory(100);
    800013fc:	00349793          	slli	a5,s1,0x3
    80001400:	fe040713          	addi	a4,s0,-32
    80001404:	00f707b3          	add	a5,a4,a5
    80001408:	cea7b023          	sd	a0,-800(a5)
        if(addrs[i] == 0){
    8000140c:	fc0518e3          	bnez	a0,800013dc <_Z10mallocFreev+0x30>
            printString("not ok\n");
    80001410:	00009517          	auipc	a0,0x9
    80001414:	c2050513          	addi	a0,a0,-992 # 8000a030 <CONSOLE_STATUS+0x20>
    80001418:	00002097          	auipc	ra,0x2
    8000141c:	bb0080e7          	jalr	-1104(ra) # 80002fc8 <_Z11printStringPKc>
            return;
        }
    }

    printString("ok\n");;
}
    80001420:	33813083          	ld	ra,824(sp)
    80001424:	33013403          	ld	s0,816(sp)
    80001428:	32813483          	ld	s1,808(sp)
    8000142c:	32013903          	ld	s2,800(sp)
    80001430:	34010113          	addi	sp,sp,832
    80001434:	00008067          	ret
    for(int i = 0 ; i<num ; i+=2){
    80001438:	00000493          	li	s1,0
    8000143c:	06300793          	li	a5,99
    80001440:	0497c463          	blt	a5,s1,80001488 <_Z10mallocFreev+0xdc>
        int retval = MemoryAllocator::freeMemory(addrs[i]);
    80001444:	00349793          	slli	a5,s1,0x3
    80001448:	fe040713          	addi	a4,s0,-32
    8000144c:	00f707b3          	add	a5,a4,a5
    80001450:	ce07b903          	ld	s2,-800(a5)

    static int freeMemory(void* addr) { return getInstance().IFreeMemory(addr); }
    80001454:	00004097          	auipc	ra,0x4
    80001458:	068080e7          	jalr	104(ra) # 800054bc <_ZN15MemoryAllocator11getInstanceEv>
    8000145c:	00090593          	mv	a1,s2
    80001460:	00004097          	auipc	ra,0x4
    80001464:	1e4080e7          	jalr	484(ra) # 80005644 <_ZN15MemoryAllocator11IFreeMemoryEPv>
        if(retval != 0){
    80001468:	00051663          	bnez	a0,80001474 <_Z10mallocFreev+0xc8>
    for(int i = 0 ; i<num ; i+=2){
    8000146c:	0024849b          	addiw	s1,s1,2
    80001470:	fcdff06f          	j	8000143c <_Z10mallocFreev+0x90>
            printString("not ok\n");
    80001474:	00009517          	auipc	a0,0x9
    80001478:	bbc50513          	addi	a0,a0,-1092 # 8000a030 <CONSOLE_STATUS+0x20>
    8000147c:	00002097          	auipc	ra,0x2
    80001480:	b4c080e7          	jalr	-1204(ra) # 80002fc8 <_Z11printStringPKc>
            return;
    80001484:	f9dff06f          	j	80001420 <_Z10mallocFreev+0x74>
    for(int i = 0 ; i<num;i+=2){
    80001488:	00000493          	li	s1,0
    8000148c:	0080006f          	j	80001494 <_Z10mallocFreev+0xe8>
    80001490:	0024849b          	addiw	s1,s1,2
    80001494:	06300793          	li	a5,99
    80001498:	0497c063          	blt	a5,s1,800014d8 <_Z10mallocFreev+0x12c>
    static void* getMemory(size_t size) { return getInstance().IGetMemory(size); }
    8000149c:	00004097          	auipc	ra,0x4
    800014a0:	020080e7          	jalr	32(ra) # 800054bc <_ZN15MemoryAllocator11getInstanceEv>
    800014a4:	01400593          	li	a1,20
    800014a8:	00004097          	auipc	ra,0x4
    800014ac:	070080e7          	jalr	112(ra) # 80005518 <_ZN15MemoryAllocator10IGetMemoryEm>
        addrs[i] = MemoryAllocator::getMemory(20);
    800014b0:	00349793          	slli	a5,s1,0x3
    800014b4:	fe040713          	addi	a4,s0,-32
    800014b8:	00f707b3          	add	a5,a4,a5
    800014bc:	cea7b023          	sd	a0,-800(a5)
        if(addrs[i] == 0){
    800014c0:	fc0518e3          	bnez	a0,80001490 <_Z10mallocFreev+0xe4>
            printString("not ok\n");;
    800014c4:	00009517          	auipc	a0,0x9
    800014c8:	b6c50513          	addi	a0,a0,-1172 # 8000a030 <CONSOLE_STATUS+0x20>
    800014cc:	00002097          	auipc	ra,0x2
    800014d0:	afc080e7          	jalr	-1284(ra) # 80002fc8 <_Z11printStringPKc>
            return;
    800014d4:	f4dff06f          	j	80001420 <_Z10mallocFreev+0x74>
    for(int i = 0; i<num;i++){
    800014d8:	00000493          	li	s1,0
    800014dc:	06300793          	li	a5,99
    800014e0:	0497c463          	blt	a5,s1,80001528 <_Z10mallocFreev+0x17c>
        int retval = MemoryAllocator::freeMemory(addrs[i]);
    800014e4:	00349793          	slli	a5,s1,0x3
    800014e8:	fe040713          	addi	a4,s0,-32
    800014ec:	00f707b3          	add	a5,a4,a5
    800014f0:	ce07b903          	ld	s2,-800(a5)
    static int freeMemory(void* addr) { return getInstance().IFreeMemory(addr); }
    800014f4:	00004097          	auipc	ra,0x4
    800014f8:	fc8080e7          	jalr	-56(ra) # 800054bc <_ZN15MemoryAllocator11getInstanceEv>
    800014fc:	00090593          	mv	a1,s2
    80001500:	00004097          	auipc	ra,0x4
    80001504:	144080e7          	jalr	324(ra) # 80005644 <_ZN15MemoryAllocator11IFreeMemoryEPv>
        if(retval != 0){
    80001508:	00051663          	bnez	a0,80001514 <_Z10mallocFreev+0x168>
    for(int i = 0; i<num;i++){
    8000150c:	0014849b          	addiw	s1,s1,1
    80001510:	fcdff06f          	j	800014dc <_Z10mallocFreev+0x130>
            printString("not ok\n");;
    80001514:	00009517          	auipc	a0,0x9
    80001518:	b1c50513          	addi	a0,a0,-1252 # 8000a030 <CONSOLE_STATUS+0x20>
    8000151c:	00002097          	auipc	ra,0x2
    80001520:	aac080e7          	jalr	-1364(ra) # 80002fc8 <_Z11printStringPKc>
            return;
    80001524:	efdff06f          	j	80001420 <_Z10mallocFreev+0x74>
    printString("ok\n");;
    80001528:	00009517          	auipc	a0,0x9
    8000152c:	b1050513          	addi	a0,a0,-1264 # 8000a038 <CONSOLE_STATUS+0x28>
    80001530:	00002097          	auipc	ra,0x2
    80001534:	a98080e7          	jalr	-1384(ra) # 80002fc8 <_Z11printStringPKc>
    80001538:	ee9ff06f          	j	80001420 <_Z10mallocFreev+0x74>

000000008000153c <_Z9bigMallocv>:


void bigMalloc(){
    8000153c:	fe010113          	addi	sp,sp,-32
    80001540:	00113c23          	sd	ra,24(sp)
    80001544:	00813823          	sd	s0,16(sp)
    80001548:	00913423          	sd	s1,8(sp)
    8000154c:	02010413          	addi	s0,sp,32

    printString("big Malloc\n");;
    80001550:	00009517          	auipc	a0,0x9
    80001554:	af050513          	addi	a0,a0,-1296 # 8000a040 <CONSOLE_STATUS+0x30>
    80001558:	00002097          	auipc	ra,0x2
    8000155c:	a70080e7          	jalr	-1424(ra) # 80002fc8 <_Z11printStringPKc>
    size_t x = (size_t)HEAP_END_ADDR - (size_t)HEAP_START_ADDR + 100UL;
    80001560:	0000b797          	auipc	a5,0xb
    80001564:	7c87b783          	ld	a5,1992(a5) # 8000cd28 <_GLOBAL_OFFSET_TABLE_+0x70>
    80001568:	0007b483          	ld	s1,0(a5)
    8000156c:	0000b797          	auipc	a5,0xb
    80001570:	7647b783          	ld	a5,1892(a5) # 8000ccd0 <_GLOBAL_OFFSET_TABLE_+0x18>
    80001574:	0007b783          	ld	a5,0(a5)
    80001578:	40f484b3          	sub	s1,s1,a5
    8000157c:	06448493          	addi	s1,s1,100
    static void* getMemory(size_t size) { return getInstance().IGetMemory(size); }
    80001580:	00004097          	auipc	ra,0x4
    80001584:	f3c080e7          	jalr	-196(ra) # 800054bc <_ZN15MemoryAllocator11getInstanceEv>
    80001588:	00048593          	mv	a1,s1
    8000158c:	00004097          	auipc	ra,0x4
    80001590:	f8c080e7          	jalr	-116(ra) # 80005518 <_ZN15MemoryAllocator10IGetMemoryEm>
    void* p = MemoryAllocator::getMemory(x);
    if(p == 0) printString("ok\n");
    80001594:	02050463          	beqz	a0,800015bc <_Z9bigMallocv+0x80>
    else printString("not ok\n");
    80001598:	00009517          	auipc	a0,0x9
    8000159c:	a9850513          	addi	a0,a0,-1384 # 8000a030 <CONSOLE_STATUS+0x20>
    800015a0:	00002097          	auipc	ra,0x2
    800015a4:	a28080e7          	jalr	-1496(ra) # 80002fc8 <_Z11printStringPKc>
}
    800015a8:	01813083          	ld	ra,24(sp)
    800015ac:	01013403          	ld	s0,16(sp)
    800015b0:	00813483          	ld	s1,8(sp)
    800015b4:	02010113          	addi	sp,sp,32
    800015b8:	00008067          	ret
    if(p == 0) printString("ok\n");
    800015bc:	00009517          	auipc	a0,0x9
    800015c0:	a7c50513          	addi	a0,a0,-1412 # 8000a038 <CONSOLE_STATUS+0x28>
    800015c4:	00002097          	auipc	ra,0x2
    800015c8:	a04080e7          	jalr	-1532(ra) # 80002fc8 <_Z11printStringPKc>
    800015cc:	fddff06f          	j	800015a8 <_Z9bigMallocv+0x6c>

00000000800015d0 <_Z17lotOfSmallMallocsv>:


void lotOfSmallMallocs(){
    800015d0:	fd010113          	addi	sp,sp,-48
    800015d4:	02113423          	sd	ra,40(sp)
    800015d8:	02813023          	sd	s0,32(sp)
    800015dc:	00913c23          	sd	s1,24(sp)
    800015e0:	01213823          	sd	s2,16(sp)
    800015e4:	01313423          	sd	s3,8(sp)
    800015e8:	03010413          	addi	s0,sp,48

    printString("lotOfSmallMallocs\n");;
    800015ec:	00009517          	auipc	a0,0x9
    800015f0:	a6450513          	addi	a0,a0,-1436 # 8000a050 <CONSOLE_STATUS+0x40>
    800015f4:	00002097          	auipc	ra,0x2
    800015f8:	9d4080e7          	jalr	-1580(ra) # 80002fc8 <_Z11printStringPKc>
    uint64 cnt = 0;
    uint64 sum = 0;
    uint64 N = 1000000UL;
    uint64 X = 10UL;
    for(uint64 i = 0; i<N;i++){
    800015fc:	00000493          	li	s1,0
    uint64 sum = 0;
    80001600:	00000993          	li	s3,0
    uint64 cnt = 0;
    80001604:	00000913          	li	s2,0
    80001608:	0180006f          	j	80001620 <_Z17lotOfSmallMallocsv+0x50>
        Test* t = (Test*)MemoryAllocator::getMemory(sizeof(Test));
        if(t == 0)break;
        t->a = X;
    8000160c:	00a00793          	li	a5,10
    80001610:	00f52023          	sw	a5,0(a0)
        sum+=t->a;
    80001614:	00a98993          	addi	s3,s3,10
        cnt++;
    80001618:	00190913          	addi	s2,s2,1
    for(uint64 i = 0; i<N;i++){
    8000161c:	00148493          	addi	s1,s1,1
    80001620:	000f47b7          	lui	a5,0xf4
    80001624:	23f78793          	addi	a5,a5,575 # f423f <_entry-0x7ff0bdc1>
    80001628:	0097ee63          	bltu	a5,s1,80001644 <_Z17lotOfSmallMallocsv+0x74>
    8000162c:	00004097          	auipc	ra,0x4
    80001630:	e90080e7          	jalr	-368(ra) # 800054bc <_ZN15MemoryAllocator11getInstanceEv>
    80001634:	00400593          	li	a1,4
    80001638:	00004097          	auipc	ra,0x4
    8000163c:	ee0080e7          	jalr	-288(ra) # 80005518 <_ZN15MemoryAllocator10IGetMemoryEm>
        if(t == 0)break;
    80001640:	fc0516e3          	bnez	a0,8000160c <_Z17lotOfSmallMallocsv+0x3c>
    }
    printInt(cnt);
    80001644:	00000613          	li	a2,0
    80001648:	00a00593          	li	a1,10
    8000164c:	0009051b          	sext.w	a0,s2
    80001650:	00002097          	auipc	ra,0x2
    80001654:	b10080e7          	jalr	-1264(ra) # 80003160 <_Z8printIntiii>
    printString("\n");
    80001658:	00009517          	auipc	a0,0x9
    8000165c:	b6050513          	addi	a0,a0,-1184 # 8000a1b8 <CONSOLE_STATUS+0x1a8>
    80001660:	00002097          	auipc	ra,0x2
    80001664:	968080e7          	jalr	-1688(ra) # 80002fc8 <_Z11printStringPKc>
    if(sum == X*cnt) printString("ok\n");
    80001668:	00291793          	slli	a5,s2,0x2
    8000166c:	01278933          	add	s2,a5,s2
    80001670:	00191913          	slli	s2,s2,0x1
    80001674:	03390863          	beq	s2,s3,800016a4 <_Z17lotOfSmallMallocsv+0xd4>
    else printString("not ok\n");
    80001678:	00009517          	auipc	a0,0x9
    8000167c:	9b850513          	addi	a0,a0,-1608 # 8000a030 <CONSOLE_STATUS+0x20>
    80001680:	00002097          	auipc	ra,0x2
    80001684:	948080e7          	jalr	-1720(ra) # 80002fc8 <_Z11printStringPKc>
}
    80001688:	02813083          	ld	ra,40(sp)
    8000168c:	02013403          	ld	s0,32(sp)
    80001690:	01813483          	ld	s1,24(sp)
    80001694:	01013903          	ld	s2,16(sp)
    80001698:	00813983          	ld	s3,8(sp)
    8000169c:	03010113          	addi	sp,sp,48
    800016a0:	00008067          	ret
    if(sum == X*cnt) printString("ok\n");
    800016a4:	00009517          	auipc	a0,0x9
    800016a8:	99450513          	addi	a0,a0,-1644 # 8000a038 <CONSOLE_STATUS+0x28>
    800016ac:	00002097          	auipc	ra,0x2
    800016b0:	91c080e7          	jalr	-1764(ra) # 80002fc8 <_Z11printStringPKc>
    800016b4:	fd5ff06f          	j	80001688 <_Z17lotOfSmallMallocsv+0xb8>

00000000800016b8 <_Z13stressTestingv>:


void stressTesting(){
    800016b8:	81010113          	addi	sp,sp,-2032
    800016bc:	7e113423          	sd	ra,2024(sp)
    800016c0:	7e813023          	sd	s0,2016(sp)
    800016c4:	7c913c23          	sd	s1,2008(sp)
    800016c8:	7d213823          	sd	s2,2000(sp)
    800016cc:	7d313423          	sd	s3,1992(sp)
    800016d0:	7f010413          	addi	s0,sp,2032
    800016d4:	93010113          	addi	sp,sp,-1744
    printString("stressTesting\n");
    800016d8:	00009517          	auipc	a0,0x9
    800016dc:	99050513          	addi	a0,a0,-1648 # 8000a068 <CONSOLE_STATUS+0x58>
    800016e0:	00002097          	auipc	ra,0x2
    800016e4:	8e8080e7          	jalr	-1816(ra) # 80002fc8 <_Z11printStringPKc>
    constexpr int num = 465;
    void* addrs[num];
    for(int i = 0; i<num;i++){
    800016e8:	00000493          	li	s1,0
    800016ec:	0080006f          	j	800016f4 <_Z13stressTestingv+0x3c>
    800016f0:	0014849b          	addiw	s1,s1,1
    800016f4:	1d000793          	li	a5,464
    800016f8:	0697c263          	blt	a5,s1,8000175c <_Z13stressTestingv+0xa4>
    800016fc:	00004097          	auipc	ra,0x4
    80001700:	dc0080e7          	jalr	-576(ra) # 800054bc <_ZN15MemoryAllocator11getInstanceEv>
    80001704:	00100593          	li	a1,1
    80001708:	00004097          	auipc	ra,0x4
    8000170c:	e10080e7          	jalr	-496(ra) # 80005518 <_ZN15MemoryAllocator10IGetMemoryEm>
        addrs[i] = MemoryAllocator::getMemory(1);
    80001710:	fffff737          	lui	a4,0xfffff
    80001714:	00349793          	slli	a5,s1,0x3
    80001718:	fd040693          	addi	a3,s0,-48
    8000171c:	00e68733          	add	a4,a3,a4
    80001720:	00f707b3          	add	a5,a4,a5
    80001724:	16a7bc23          	sd	a0,376(a5)
        if(addrs[i] == 0){
    80001728:	fc0514e3          	bnez	a0,800016f0 <_Z13stressTestingv+0x38>
            printString("not ok\n");
    8000172c:	00009517          	auipc	a0,0x9
    80001730:	90450513          	addi	a0,a0,-1788 # 8000a030 <CONSOLE_STATUS+0x20>
    80001734:	00002097          	auipc	ra,0x2
    80001738:	894080e7          	jalr	-1900(ra) # 80002fc8 <_Z11printStringPKc>
            }
        }
        sz-=10;
    }
    printString("ok\n");;
}
    8000173c:	6d010113          	addi	sp,sp,1744
    80001740:	7e813083          	ld	ra,2024(sp)
    80001744:	7e013403          	ld	s0,2016(sp)
    80001748:	7d813483          	ld	s1,2008(sp)
    8000174c:	7d013903          	ld	s2,2000(sp)
    80001750:	7c813983          	ld	s3,1992(sp)
    80001754:	7f010113          	addi	sp,sp,2032
    80001758:	00008067          	ret
    int sz = 5;
    8000175c:	00500913          	li	s2,5
    while(sz > 0){
    80001760:	1f205a63          	blez	s2,80001954 <_Z13stressTestingv+0x29c>
        printString("sz:");
    80001764:	00009517          	auipc	a0,0x9
    80001768:	91450513          	addi	a0,a0,-1772 # 8000a078 <CONSOLE_STATUS+0x68>
    8000176c:	00002097          	auipc	ra,0x2
    80001770:	85c080e7          	jalr	-1956(ra) # 80002fc8 <_Z11printStringPKc>
        printInt(sz);
    80001774:	00000613          	li	a2,0
    80001778:	00a00593          	li	a1,10
    8000177c:	00090513          	mv	a0,s2
    80001780:	00002097          	auipc	ra,0x2
    80001784:	9e0080e7          	jalr	-1568(ra) # 80003160 <_Z8printIntiii>
        for(int i = 0 ; i<num;i+=2){
    80001788:	00000493          	li	s1,0
    8000178c:	1d000793          	li	a5,464
    80001790:	0c97ce63          	blt	a5,s1,8000186c <_Z13stressTestingv+0x1b4>
            printString("i:");
    80001794:	00009517          	auipc	a0,0x9
    80001798:	8ec50513          	addi	a0,a0,-1812 # 8000a080 <CONSOLE_STATUS+0x70>
    8000179c:	00002097          	auipc	ra,0x2
    800017a0:	82c080e7          	jalr	-2004(ra) # 80002fc8 <_Z11printStringPKc>
            printInt(i);
    800017a4:	00000613          	li	a2,0
    800017a8:	00a00593          	li	a1,10
    800017ac:	00048513          	mv	a0,s1
    800017b0:	00002097          	auipc	ra,0x2
    800017b4:	9b0080e7          	jalr	-1616(ra) # 80003160 <_Z8printIntiii>
            printString("free\n");
    800017b8:	00009517          	auipc	a0,0x9
    800017bc:	8d050513          	addi	a0,a0,-1840 # 8000a088 <CONSOLE_STATUS+0x78>
    800017c0:	00002097          	auipc	ra,0x2
    800017c4:	808080e7          	jalr	-2040(ra) # 80002fc8 <_Z11printStringPKc>
            int retval = MemoryAllocator::freeMemory(addrs[i]);
    800017c8:	fffff737          	lui	a4,0xfffff
    800017cc:	00349793          	slli	a5,s1,0x3
    800017d0:	fd040693          	addi	a3,s0,-48
    800017d4:	00e68733          	add	a4,a3,a4
    800017d8:	00f707b3          	add	a5,a4,a5
    800017dc:	1787b983          	ld	s3,376(a5)
    static int freeMemory(void* addr) { return getInstance().IFreeMemory(addr); }
    800017e0:	00004097          	auipc	ra,0x4
    800017e4:	cdc080e7          	jalr	-804(ra) # 800054bc <_ZN15MemoryAllocator11getInstanceEv>
    800017e8:	00098593          	mv	a1,s3
    800017ec:	00004097          	auipc	ra,0x4
    800017f0:	e58080e7          	jalr	-424(ra) # 80005644 <_ZN15MemoryAllocator11IFreeMemoryEPv>
            if(retval != 0){
    800017f4:	04051863          	bnez	a0,80001844 <_Z13stressTestingv+0x18c>
            printString("alloc\n");
    800017f8:	00009517          	auipc	a0,0x9
    800017fc:	89850513          	addi	a0,a0,-1896 # 8000a090 <CONSOLE_STATUS+0x80>
    80001800:	00001097          	auipc	ra,0x1
    80001804:	7c8080e7          	jalr	1992(ra) # 80002fc8 <_Z11printStringPKc>
            addrs[i] = MemoryAllocator::getMemory(sz*2);
    80001808:	0019199b          	slliw	s3,s2,0x1
    static void* getMemory(size_t size) { return getInstance().IGetMemory(size); }
    8000180c:	00004097          	auipc	ra,0x4
    80001810:	cb0080e7          	jalr	-848(ra) # 800054bc <_ZN15MemoryAllocator11getInstanceEv>
    80001814:	00098593          	mv	a1,s3
    80001818:	00004097          	auipc	ra,0x4
    8000181c:	d00080e7          	jalr	-768(ra) # 80005518 <_ZN15MemoryAllocator10IGetMemoryEm>
    80001820:	fffff737          	lui	a4,0xfffff
    80001824:	00349793          	slli	a5,s1,0x3
    80001828:	fd040693          	addi	a3,s0,-48
    8000182c:	00e68733          	add	a4,a3,a4
    80001830:	00f707b3          	add	a5,a4,a5
    80001834:	16a7bc23          	sd	a0,376(a5)
            if(addrs[i] == 0){
    80001838:	02050063          	beqz	a0,80001858 <_Z13stressTestingv+0x1a0>
        for(int i = 0 ; i<num;i+=2){
    8000183c:	0024849b          	addiw	s1,s1,2
    80001840:	f4dff06f          	j	8000178c <_Z13stressTestingv+0xd4>
                printString("not ok\n");
    80001844:	00008517          	auipc	a0,0x8
    80001848:	7ec50513          	addi	a0,a0,2028 # 8000a030 <CONSOLE_STATUS+0x20>
    8000184c:	00001097          	auipc	ra,0x1
    80001850:	77c080e7          	jalr	1916(ra) # 80002fc8 <_Z11printStringPKc>
                return;
    80001854:	ee9ff06f          	j	8000173c <_Z13stressTestingv+0x84>
                printString("not ok\n");;
    80001858:	00008517          	auipc	a0,0x8
    8000185c:	7d850513          	addi	a0,a0,2008 # 8000a030 <CONSOLE_STATUS+0x20>
    80001860:	00001097          	auipc	ra,0x1
    80001864:	768080e7          	jalr	1896(ra) # 80002fc8 <_Z11printStringPKc>
                return;
    80001868:	ed5ff06f          	j	8000173c <_Z13stressTestingv+0x84>
        for(int i = 1 ; i<num;i+=2){
    8000186c:	00100493          	li	s1,1
    80001870:	1d000793          	li	a5,464
    80001874:	0c97cc63          	blt	a5,s1,8000194c <_Z13stressTestingv+0x294>
            printString("i:");
    80001878:	00009517          	auipc	a0,0x9
    8000187c:	80850513          	addi	a0,a0,-2040 # 8000a080 <CONSOLE_STATUS+0x70>
    80001880:	00001097          	auipc	ra,0x1
    80001884:	748080e7          	jalr	1864(ra) # 80002fc8 <_Z11printStringPKc>
            printInt(i);
    80001888:	00000613          	li	a2,0
    8000188c:	00a00593          	li	a1,10
    80001890:	00048513          	mv	a0,s1
    80001894:	00002097          	auipc	ra,0x2
    80001898:	8cc080e7          	jalr	-1844(ra) # 80003160 <_Z8printIntiii>
            printString("free\n");
    8000189c:	00008517          	auipc	a0,0x8
    800018a0:	7ec50513          	addi	a0,a0,2028 # 8000a088 <CONSOLE_STATUS+0x78>
    800018a4:	00001097          	auipc	ra,0x1
    800018a8:	724080e7          	jalr	1828(ra) # 80002fc8 <_Z11printStringPKc>
            int retval = MemoryAllocator::freeMemory(addrs[i]);
    800018ac:	fffff737          	lui	a4,0xfffff
    800018b0:	00349793          	slli	a5,s1,0x3
    800018b4:	fd040693          	addi	a3,s0,-48
    800018b8:	00e68733          	add	a4,a3,a4
    800018bc:	00f707b3          	add	a5,a4,a5
    800018c0:	1787b983          	ld	s3,376(a5)
    static int freeMemory(void* addr) { return getInstance().IFreeMemory(addr); }
    800018c4:	00004097          	auipc	ra,0x4
    800018c8:	bf8080e7          	jalr	-1032(ra) # 800054bc <_ZN15MemoryAllocator11getInstanceEv>
    800018cc:	00098593          	mv	a1,s3
    800018d0:	00004097          	auipc	ra,0x4
    800018d4:	d74080e7          	jalr	-652(ra) # 80005644 <_ZN15MemoryAllocator11IFreeMemoryEPv>
            if(retval != 0){
    800018d8:	04051663          	bnez	a0,80001924 <_Z13stressTestingv+0x26c>
            printString("alloc\n");
    800018dc:	00008517          	auipc	a0,0x8
    800018e0:	7b450513          	addi	a0,a0,1972 # 8000a090 <CONSOLE_STATUS+0x80>
    800018e4:	00001097          	auipc	ra,0x1
    800018e8:	6e4080e7          	jalr	1764(ra) # 80002fc8 <_Z11printStringPKc>
    static void* getMemory(size_t size) { return getInstance().IGetMemory(size); }
    800018ec:	00004097          	auipc	ra,0x4
    800018f0:	bd0080e7          	jalr	-1072(ra) # 800054bc <_ZN15MemoryAllocator11getInstanceEv>
    800018f4:	00090593          	mv	a1,s2
    800018f8:	00004097          	auipc	ra,0x4
    800018fc:	c20080e7          	jalr	-992(ra) # 80005518 <_ZN15MemoryAllocator10IGetMemoryEm>
            addrs[i] = MemoryAllocator::getMemory(sz);
    80001900:	fffff737          	lui	a4,0xfffff
    80001904:	00349793          	slli	a5,s1,0x3
    80001908:	fd040693          	addi	a3,s0,-48
    8000190c:	00e68733          	add	a4,a3,a4
    80001910:	00f707b3          	add	a5,a4,a5
    80001914:	16a7bc23          	sd	a0,376(a5)
            if(addrs[i] == 0){
    80001918:	02050063          	beqz	a0,80001938 <_Z13stressTestingv+0x280>
        for(int i = 1 ; i<num;i+=2){
    8000191c:	0024849b          	addiw	s1,s1,2
    80001920:	f51ff06f          	j	80001870 <_Z13stressTestingv+0x1b8>
                printString("not ok\n");
    80001924:	00008517          	auipc	a0,0x8
    80001928:	70c50513          	addi	a0,a0,1804 # 8000a030 <CONSOLE_STATUS+0x20>
    8000192c:	00001097          	auipc	ra,0x1
    80001930:	69c080e7          	jalr	1692(ra) # 80002fc8 <_Z11printStringPKc>
                return;
    80001934:	e09ff06f          	j	8000173c <_Z13stressTestingv+0x84>
                printString("not ok\n");;
    80001938:	00008517          	auipc	a0,0x8
    8000193c:	6f850513          	addi	a0,a0,1784 # 8000a030 <CONSOLE_STATUS+0x20>
    80001940:	00001097          	auipc	ra,0x1
    80001944:	688080e7          	jalr	1672(ra) # 80002fc8 <_Z11printStringPKc>
                return;
    80001948:	df5ff06f          	j	8000173c <_Z13stressTestingv+0x84>
        sz-=10;
    8000194c:	ff69091b          	addiw	s2,s2,-10
    while(sz > 0){
    80001950:	e11ff06f          	j	80001760 <_Z13stressTestingv+0xa8>
    printString("ok\n");;
    80001954:	00008517          	auipc	a0,0x8
    80001958:	6e450513          	addi	a0,a0,1764 # 8000a038 <CONSOLE_STATUS+0x28>
    8000195c:	00001097          	auipc	ra,0x1
    80001960:	66c080e7          	jalr	1644(ra) # 80002fc8 <_Z11printStringPKc>
    80001964:	dd9ff06f          	j	8000173c <_Z13stressTestingv+0x84>

0000000080001968 <_ZN9BufferCPPC1Ei>:
#include "buffer_CPP_API.hpp"

BufferCPP::BufferCPP(int _cap) : cap(_cap + 1), head(0), tail(0) {
    80001968:	fd010113          	addi	sp,sp,-48
    8000196c:	02113423          	sd	ra,40(sp)
    80001970:	02813023          	sd	s0,32(sp)
    80001974:	00913c23          	sd	s1,24(sp)
    80001978:	01213823          	sd	s2,16(sp)
    8000197c:	01313423          	sd	s3,8(sp)
    80001980:	03010413          	addi	s0,sp,48
    80001984:	00050493          	mv	s1,a0
    80001988:	00058993          	mv	s3,a1
    8000198c:	0015879b          	addiw	a5,a1,1
    80001990:	0007851b          	sext.w	a0,a5
    80001994:	00f4a023          	sw	a5,0(s1)
    80001998:	0004a823          	sw	zero,16(s1)
    8000199c:	0004aa23          	sw	zero,20(s1)
    buffer = (int *)mem_alloc(sizeof(int) * cap);
    800019a0:	00251513          	slli	a0,a0,0x2
    800019a4:	00003097          	auipc	ra,0x3
    800019a8:	d14080e7          	jalr	-748(ra) # 800046b8 <_Z9mem_allocm>
    800019ac:	00a4b423          	sd	a0,8(s1)
    itemAvailable = new Semaphore(0);
    800019b0:	01000513          	li	a0,16
    800019b4:	00004097          	auipc	ra,0x4
    800019b8:	744080e7          	jalr	1860(ra) # 800060f8 <_Znwm>
    800019bc:	00050913          	mv	s2,a0
    800019c0:	00050863          	beqz	a0,800019d0 <_ZN9BufferCPPC1Ei+0x68>
    800019c4:	00000593          	li	a1,0
    800019c8:	00005097          	auipc	ra,0x5
    800019cc:	9bc080e7          	jalr	-1604(ra) # 80006384 <_ZN9SemaphoreC1Ej>
    800019d0:	0324b023          	sd	s2,32(s1)
    spaceAvailable = new Semaphore(_cap);
    800019d4:	01000513          	li	a0,16
    800019d8:	00004097          	auipc	ra,0x4
    800019dc:	720080e7          	jalr	1824(ra) # 800060f8 <_Znwm>
    800019e0:	00050913          	mv	s2,a0
    800019e4:	00050863          	beqz	a0,800019f4 <_ZN9BufferCPPC1Ei+0x8c>
    800019e8:	00098593          	mv	a1,s3
    800019ec:	00005097          	auipc	ra,0x5
    800019f0:	998080e7          	jalr	-1640(ra) # 80006384 <_ZN9SemaphoreC1Ej>
    800019f4:	0124bc23          	sd	s2,24(s1)
    mutexHead = new Semaphore(1);
    800019f8:	01000513          	li	a0,16
    800019fc:	00004097          	auipc	ra,0x4
    80001a00:	6fc080e7          	jalr	1788(ra) # 800060f8 <_Znwm>
    80001a04:	00050913          	mv	s2,a0
    80001a08:	00050863          	beqz	a0,80001a18 <_ZN9BufferCPPC1Ei+0xb0>
    80001a0c:	00100593          	li	a1,1
    80001a10:	00005097          	auipc	ra,0x5
    80001a14:	974080e7          	jalr	-1676(ra) # 80006384 <_ZN9SemaphoreC1Ej>
    80001a18:	0324b423          	sd	s2,40(s1)
    mutexTail = new Semaphore(1);
    80001a1c:	01000513          	li	a0,16
    80001a20:	00004097          	auipc	ra,0x4
    80001a24:	6d8080e7          	jalr	1752(ra) # 800060f8 <_Znwm>
    80001a28:	00050913          	mv	s2,a0
    80001a2c:	00050863          	beqz	a0,80001a3c <_ZN9BufferCPPC1Ei+0xd4>
    80001a30:	00100593          	li	a1,1
    80001a34:	00005097          	auipc	ra,0x5
    80001a38:	950080e7          	jalr	-1712(ra) # 80006384 <_ZN9SemaphoreC1Ej>
    80001a3c:	0324b823          	sd	s2,48(s1)
}
    80001a40:	02813083          	ld	ra,40(sp)
    80001a44:	02013403          	ld	s0,32(sp)
    80001a48:	01813483          	ld	s1,24(sp)
    80001a4c:	01013903          	ld	s2,16(sp)
    80001a50:	00813983          	ld	s3,8(sp)
    80001a54:	03010113          	addi	sp,sp,48
    80001a58:	00008067          	ret
    80001a5c:	00050493          	mv	s1,a0
    itemAvailable = new Semaphore(0);
    80001a60:	00090513          	mv	a0,s2
    80001a64:	00004097          	auipc	ra,0x4
    80001a68:	6bc080e7          	jalr	1724(ra) # 80006120 <_ZdlPv>
    80001a6c:	00048513          	mv	a0,s1
    80001a70:	00012097          	auipc	ra,0x12
    80001a74:	718080e7          	jalr	1816(ra) # 80014188 <_Unwind_Resume>
    80001a78:	00050493          	mv	s1,a0
    spaceAvailable = new Semaphore(_cap);
    80001a7c:	00090513          	mv	a0,s2
    80001a80:	00004097          	auipc	ra,0x4
    80001a84:	6a0080e7          	jalr	1696(ra) # 80006120 <_ZdlPv>
    80001a88:	00048513          	mv	a0,s1
    80001a8c:	00012097          	auipc	ra,0x12
    80001a90:	6fc080e7          	jalr	1788(ra) # 80014188 <_Unwind_Resume>
    80001a94:	00050493          	mv	s1,a0
    mutexHead = new Semaphore(1);
    80001a98:	00090513          	mv	a0,s2
    80001a9c:	00004097          	auipc	ra,0x4
    80001aa0:	684080e7          	jalr	1668(ra) # 80006120 <_ZdlPv>
    80001aa4:	00048513          	mv	a0,s1
    80001aa8:	00012097          	auipc	ra,0x12
    80001aac:	6e0080e7          	jalr	1760(ra) # 80014188 <_Unwind_Resume>
    80001ab0:	00050493          	mv	s1,a0
    mutexTail = new Semaphore(1);
    80001ab4:	00090513          	mv	a0,s2
    80001ab8:	00004097          	auipc	ra,0x4
    80001abc:	668080e7          	jalr	1640(ra) # 80006120 <_ZdlPv>
    80001ac0:	00048513          	mv	a0,s1
    80001ac4:	00012097          	auipc	ra,0x12
    80001ac8:	6c4080e7          	jalr	1732(ra) # 80014188 <_Unwind_Resume>

0000000080001acc <_ZN9BufferCPP3putEi>:
    delete mutexTail;
    delete mutexHead;

}

void BufferCPP::put(int val) {
    80001acc:	fe010113          	addi	sp,sp,-32
    80001ad0:	00113c23          	sd	ra,24(sp)
    80001ad4:	00813823          	sd	s0,16(sp)
    80001ad8:	00913423          	sd	s1,8(sp)
    80001adc:	01213023          	sd	s2,0(sp)
    80001ae0:	02010413          	addi	s0,sp,32
    80001ae4:	00050493          	mv	s1,a0
    80001ae8:	00058913          	mv	s2,a1
    spaceAvailable->wait();
    80001aec:	01853503          	ld	a0,24(a0)
    80001af0:	00005097          	auipc	ra,0x5
    80001af4:	8cc080e7          	jalr	-1844(ra) # 800063bc <_ZN9Semaphore4waitEv>

    mutexTail->wait();
    80001af8:	0304b503          	ld	a0,48(s1)
    80001afc:	00005097          	auipc	ra,0x5
    80001b00:	8c0080e7          	jalr	-1856(ra) # 800063bc <_ZN9Semaphore4waitEv>
    buffer[tail] = val;
    80001b04:	0084b783          	ld	a5,8(s1)
    80001b08:	0144a703          	lw	a4,20(s1)
    80001b0c:	00271713          	slli	a4,a4,0x2
    80001b10:	00e787b3          	add	a5,a5,a4
    80001b14:	0127a023          	sw	s2,0(a5)
    tail = (tail + 1) % cap;
    80001b18:	0144a783          	lw	a5,20(s1)
    80001b1c:	0017879b          	addiw	a5,a5,1
    80001b20:	0004a703          	lw	a4,0(s1)
    80001b24:	02e7e7bb          	remw	a5,a5,a4
    80001b28:	00f4aa23          	sw	a5,20(s1)
    mutexTail->signal();
    80001b2c:	0304b503          	ld	a0,48(s1)
    80001b30:	00005097          	auipc	ra,0x5
    80001b34:	8b8080e7          	jalr	-1864(ra) # 800063e8 <_ZN9Semaphore6signalEv>

    itemAvailable->signal();
    80001b38:	0204b503          	ld	a0,32(s1)
    80001b3c:	00005097          	auipc	ra,0x5
    80001b40:	8ac080e7          	jalr	-1876(ra) # 800063e8 <_ZN9Semaphore6signalEv>

}
    80001b44:	01813083          	ld	ra,24(sp)
    80001b48:	01013403          	ld	s0,16(sp)
    80001b4c:	00813483          	ld	s1,8(sp)
    80001b50:	00013903          	ld	s2,0(sp)
    80001b54:	02010113          	addi	sp,sp,32
    80001b58:	00008067          	ret

0000000080001b5c <_ZN9BufferCPP3getEv>:

int BufferCPP::get() {
    80001b5c:	fe010113          	addi	sp,sp,-32
    80001b60:	00113c23          	sd	ra,24(sp)
    80001b64:	00813823          	sd	s0,16(sp)
    80001b68:	00913423          	sd	s1,8(sp)
    80001b6c:	01213023          	sd	s2,0(sp)
    80001b70:	02010413          	addi	s0,sp,32
    80001b74:	00050493          	mv	s1,a0
    itemAvailable->wait();
    80001b78:	02053503          	ld	a0,32(a0)
    80001b7c:	00005097          	auipc	ra,0x5
    80001b80:	840080e7          	jalr	-1984(ra) # 800063bc <_ZN9Semaphore4waitEv>

    mutexHead->wait();
    80001b84:	0284b503          	ld	a0,40(s1)
    80001b88:	00005097          	auipc	ra,0x5
    80001b8c:	834080e7          	jalr	-1996(ra) # 800063bc <_ZN9Semaphore4waitEv>

    int ret = buffer[head];
    80001b90:	0084b703          	ld	a4,8(s1)
    80001b94:	0104a783          	lw	a5,16(s1)
    80001b98:	00279693          	slli	a3,a5,0x2
    80001b9c:	00d70733          	add	a4,a4,a3
    80001ba0:	00072903          	lw	s2,0(a4) # fffffffffffff000 <end+0xffffffff7ffeace0>
    head = (head + 1) % cap;
    80001ba4:	0017879b          	addiw	a5,a5,1
    80001ba8:	0004a703          	lw	a4,0(s1)
    80001bac:	02e7e7bb          	remw	a5,a5,a4
    80001bb0:	00f4a823          	sw	a5,16(s1)
    mutexHead->signal();
    80001bb4:	0284b503          	ld	a0,40(s1)
    80001bb8:	00005097          	auipc	ra,0x5
    80001bbc:	830080e7          	jalr	-2000(ra) # 800063e8 <_ZN9Semaphore6signalEv>

    spaceAvailable->signal();
    80001bc0:	0184b503          	ld	a0,24(s1)
    80001bc4:	00005097          	auipc	ra,0x5
    80001bc8:	824080e7          	jalr	-2012(ra) # 800063e8 <_ZN9Semaphore6signalEv>

    return ret;
}
    80001bcc:	00090513          	mv	a0,s2
    80001bd0:	01813083          	ld	ra,24(sp)
    80001bd4:	01013403          	ld	s0,16(sp)
    80001bd8:	00813483          	ld	s1,8(sp)
    80001bdc:	00013903          	ld	s2,0(sp)
    80001be0:	02010113          	addi	sp,sp,32
    80001be4:	00008067          	ret

0000000080001be8 <_ZN9BufferCPP6getCntEv>:

int BufferCPP::getCnt() {
    80001be8:	fe010113          	addi	sp,sp,-32
    80001bec:	00113c23          	sd	ra,24(sp)
    80001bf0:	00813823          	sd	s0,16(sp)
    80001bf4:	00913423          	sd	s1,8(sp)
    80001bf8:	01213023          	sd	s2,0(sp)
    80001bfc:	02010413          	addi	s0,sp,32
    80001c00:	00050493          	mv	s1,a0
    int ret;

    mutexHead->wait();
    80001c04:	02853503          	ld	a0,40(a0)
    80001c08:	00004097          	auipc	ra,0x4
    80001c0c:	7b4080e7          	jalr	1972(ra) # 800063bc <_ZN9Semaphore4waitEv>
    mutexTail->wait();
    80001c10:	0304b503          	ld	a0,48(s1)
    80001c14:	00004097          	auipc	ra,0x4
    80001c18:	7a8080e7          	jalr	1960(ra) # 800063bc <_ZN9Semaphore4waitEv>

    if (tail >= head) {
    80001c1c:	0144a783          	lw	a5,20(s1)
    80001c20:	0104a903          	lw	s2,16(s1)
    80001c24:	0327ce63          	blt	a5,s2,80001c60 <_ZN9BufferCPP6getCntEv+0x78>
        ret = tail - head;
    80001c28:	4127893b          	subw	s2,a5,s2
    } else {
        ret = cap - head + tail;
    }

    mutexTail->signal();
    80001c2c:	0304b503          	ld	a0,48(s1)
    80001c30:	00004097          	auipc	ra,0x4
    80001c34:	7b8080e7          	jalr	1976(ra) # 800063e8 <_ZN9Semaphore6signalEv>
    mutexHead->signal();
    80001c38:	0284b503          	ld	a0,40(s1)
    80001c3c:	00004097          	auipc	ra,0x4
    80001c40:	7ac080e7          	jalr	1964(ra) # 800063e8 <_ZN9Semaphore6signalEv>

    return ret;
}
    80001c44:	00090513          	mv	a0,s2
    80001c48:	01813083          	ld	ra,24(sp)
    80001c4c:	01013403          	ld	s0,16(sp)
    80001c50:	00813483          	ld	s1,8(sp)
    80001c54:	00013903          	ld	s2,0(sp)
    80001c58:	02010113          	addi	sp,sp,32
    80001c5c:	00008067          	ret
        ret = cap - head + tail;
    80001c60:	0004a703          	lw	a4,0(s1)
    80001c64:	4127093b          	subw	s2,a4,s2
    80001c68:	00f9093b          	addw	s2,s2,a5
    80001c6c:	fc1ff06f          	j	80001c2c <_ZN9BufferCPP6getCntEv+0x44>

0000000080001c70 <_ZN9BufferCPPD1Ev>:
BufferCPP::~BufferCPP() {
    80001c70:	fe010113          	addi	sp,sp,-32
    80001c74:	00113c23          	sd	ra,24(sp)
    80001c78:	00813823          	sd	s0,16(sp)
    80001c7c:	00913423          	sd	s1,8(sp)
    80001c80:	02010413          	addi	s0,sp,32
    80001c84:	00050493          	mv	s1,a0
    Console::putc('\n');
    80001c88:	00a00513          	li	a0,10
    80001c8c:	00004097          	auipc	ra,0x4
    80001c90:	6d0080e7          	jalr	1744(ra) # 8000635c <_ZN7Console4putcEc>
    printString("Buffer deleted!\n");
    80001c94:	00008517          	auipc	a0,0x8
    80001c98:	40450513          	addi	a0,a0,1028 # 8000a098 <CONSOLE_STATUS+0x88>
    80001c9c:	00001097          	auipc	ra,0x1
    80001ca0:	32c080e7          	jalr	812(ra) # 80002fc8 <_Z11printStringPKc>
    while (getCnt()) {
    80001ca4:	00048513          	mv	a0,s1
    80001ca8:	00000097          	auipc	ra,0x0
    80001cac:	f40080e7          	jalr	-192(ra) # 80001be8 <_ZN9BufferCPP6getCntEv>
    80001cb0:	02050c63          	beqz	a0,80001ce8 <_ZN9BufferCPPD1Ev+0x78>
        char ch = buffer[head];
    80001cb4:	0084b783          	ld	a5,8(s1)
    80001cb8:	0104a703          	lw	a4,16(s1)
    80001cbc:	00271713          	slli	a4,a4,0x2
    80001cc0:	00e787b3          	add	a5,a5,a4
        Console::putc(ch);
    80001cc4:	0007c503          	lbu	a0,0(a5)
    80001cc8:	00004097          	auipc	ra,0x4
    80001ccc:	694080e7          	jalr	1684(ra) # 8000635c <_ZN7Console4putcEc>
        head = (head + 1) % cap;
    80001cd0:	0104a783          	lw	a5,16(s1)
    80001cd4:	0017879b          	addiw	a5,a5,1
    80001cd8:	0004a703          	lw	a4,0(s1)
    80001cdc:	02e7e7bb          	remw	a5,a5,a4
    80001ce0:	00f4a823          	sw	a5,16(s1)
    while (getCnt()) {
    80001ce4:	fc1ff06f          	j	80001ca4 <_ZN9BufferCPPD1Ev+0x34>
    Console::putc('!');
    80001ce8:	02100513          	li	a0,33
    80001cec:	00004097          	auipc	ra,0x4
    80001cf0:	670080e7          	jalr	1648(ra) # 8000635c <_ZN7Console4putcEc>
    Console::putc('\n');
    80001cf4:	00a00513          	li	a0,10
    80001cf8:	00004097          	auipc	ra,0x4
    80001cfc:	664080e7          	jalr	1636(ra) # 8000635c <_ZN7Console4putcEc>
    mem_free(buffer);
    80001d00:	0084b503          	ld	a0,8(s1)
    80001d04:	00003097          	auipc	ra,0x3
    80001d08:	a08080e7          	jalr	-1528(ra) # 8000470c <_Z8mem_freePv>
    delete itemAvailable;
    80001d0c:	0204b503          	ld	a0,32(s1)
    80001d10:	00050863          	beqz	a0,80001d20 <_ZN9BufferCPPD1Ev+0xb0>
    80001d14:	00053783          	ld	a5,0(a0)
    80001d18:	0087b783          	ld	a5,8(a5)
    80001d1c:	000780e7          	jalr	a5
    delete spaceAvailable;
    80001d20:	0184b503          	ld	a0,24(s1)
    80001d24:	00050863          	beqz	a0,80001d34 <_ZN9BufferCPPD1Ev+0xc4>
    80001d28:	00053783          	ld	a5,0(a0)
    80001d2c:	0087b783          	ld	a5,8(a5)
    80001d30:	000780e7          	jalr	a5
    delete mutexTail;
    80001d34:	0304b503          	ld	a0,48(s1)
    80001d38:	00050863          	beqz	a0,80001d48 <_ZN9BufferCPPD1Ev+0xd8>
    80001d3c:	00053783          	ld	a5,0(a0)
    80001d40:	0087b783          	ld	a5,8(a5)
    80001d44:	000780e7          	jalr	a5
    delete mutexHead;
    80001d48:	0284b503          	ld	a0,40(s1)
    80001d4c:	00050863          	beqz	a0,80001d5c <_ZN9BufferCPPD1Ev+0xec>
    80001d50:	00053783          	ld	a5,0(a0)
    80001d54:	0087b783          	ld	a5,8(a5)
    80001d58:	000780e7          	jalr	a5
}
    80001d5c:	01813083          	ld	ra,24(sp)
    80001d60:	01013403          	ld	s0,16(sp)
    80001d64:	00813483          	ld	s1,8(sp)
    80001d68:	02010113          	addi	sp,sp,32
    80001d6c:	00008067          	ret

0000000080001d70 <_Z9userMain1v>:





void userMain1() {
    80001d70:	fc010113          	addi	sp,sp,-64
    80001d74:	02113c23          	sd	ra,56(sp)
    80001d78:	02813823          	sd	s0,48(sp)
    80001d7c:	02913423          	sd	s1,40(sp)
    80001d80:	04010413          	addi	s0,sp,64
};


class ForkThread : public Thread {
public:
    ForkThread(long _id) noexcept: Thread(), id(_id), finished(false) {}
    80001d84:	fc040493          	addi	s1,s0,-64
    80001d88:	00048513          	mv	a0,s1
    80001d8c:	00004097          	auipc	ra,0x4
    80001d90:	564080e7          	jalr	1380(ra) # 800062f0 <_ZN6ThreadC1Ev>
    80001d94:	0000b797          	auipc	a5,0xb
    80001d98:	dd478793          	addi	a5,a5,-556 # 8000cb68 <_ZTV10ForkThread+0x10>
    80001d9c:	fcf43023          	sd	a5,-64(s0)
    80001da0:	00100793          	li	a5,1
    80001da4:	fcf43823          	sd	a5,-48(s0)
    80001da8:	fc040c23          	sb	zero,-40(s0)
    ForkThread thread(1);

    thread.start();
    80001dac:	00048513          	mv	a0,s1
    80001db0:	00004097          	auipc	ra,0x4
    80001db4:	494080e7          	jalr	1172(ra) # 80006244 <_ZN6Thread5startEv>
        putc('\n');
        finished = true;
    }

    bool isFinished() const {
        return finished;
    80001db8:	fd844783          	lbu	a5,-40(s0)

    while (!thread.isFinished()) {
    80001dbc:	00079863          	bnez	a5,80001dcc <_Z9userMain1v+0x5c>
        thread_dispatch();
    80001dc0:	00003097          	auipc	ra,0x3
    80001dc4:	a5c080e7          	jalr	-1444(ra) # 8000481c <_Z15thread_dispatchv>
    80001dc8:	ff1ff06f          	j	80001db8 <_Z9userMain1v+0x48>
    }

    printString("User main finished\n");
    80001dcc:	00008517          	auipc	a0,0x8
    80001dd0:	31450513          	addi	a0,a0,788 # 8000a0e0 <CONSOLE_STATUS+0xd0>
    80001dd4:	00001097          	auipc	ra,0x1
    80001dd8:	1f4080e7          	jalr	500(ra) # 80002fc8 <_Z11printStringPKc>
class ForkThread : public Thread {
    80001ddc:	0000b797          	auipc	a5,0xb
    80001de0:	d8c78793          	addi	a5,a5,-628 # 8000cb68 <_ZTV10ForkThread+0x10>
    80001de4:	fcf43023          	sd	a5,-64(s0)
    80001de8:	fc040513          	addi	a0,s0,-64
    80001dec:	00004097          	auipc	ra,0x4
    80001df0:	268080e7          	jalr	616(ra) # 80006054 <_ZN6ThreadD1Ev>
    80001df4:	03813083          	ld	ra,56(sp)
    80001df8:	03013403          	ld	s0,48(sp)
    80001dfc:	02813483          	ld	s1,40(sp)
    80001e00:	04010113          	addi	sp,sp,64
    80001e04:	00008067          	ret
    80001e08:	00050493          	mv	s1,a0
    80001e0c:	0000b797          	auipc	a5,0xb
    80001e10:	d5c78793          	addi	a5,a5,-676 # 8000cb68 <_ZTV10ForkThread+0x10>
    80001e14:	fcf43023          	sd	a5,-64(s0)
    80001e18:	fc040513          	addi	a0,s0,-64
    80001e1c:	00004097          	auipc	ra,0x4
    80001e20:	238080e7          	jalr	568(ra) # 80006054 <_ZN6ThreadD1Ev>
    80001e24:	00048513          	mv	a0,s1
    80001e28:	00012097          	auipc	ra,0x12
    80001e2c:	360080e7          	jalr	864(ra) # 80014188 <_Unwind_Resume>

0000000080001e30 <_ZN10ForkThread3runEv>:
    virtual void run() {
    80001e30:	fc010113          	addi	sp,sp,-64
    80001e34:	02113c23          	sd	ra,56(sp)
    80001e38:	02813823          	sd	s0,48(sp)
    80001e3c:	02913423          	sd	s1,40(sp)
    80001e40:	03213023          	sd	s2,32(sp)
    80001e44:	01313c23          	sd	s3,24(sp)
    80001e48:	01413823          	sd	s4,16(sp)
    80001e4c:	01513423          	sd	s5,8(sp)
    80001e50:	01613023          	sd	s6,0(sp)
    80001e54:	04010413          	addi	s0,sp,64
    80001e58:	00050913          	mv	s2,a0
        printString("Started thread id: ");
    80001e5c:	00008517          	auipc	a0,0x8
    80001e60:	25450513          	addi	a0,a0,596 # 8000a0b0 <CONSOLE_STATUS+0xa0>
    80001e64:	00001097          	auipc	ra,0x1
    80001e68:	164080e7          	jalr	356(ra) # 80002fc8 <_Z11printStringPKc>
        printInt(id);
    80001e6c:	00000613          	li	a2,0
    80001e70:	00a00593          	li	a1,10
    80001e74:	01092503          	lw	a0,16(s2)
    80001e78:	00001097          	auipc	ra,0x1
    80001e7c:	2e8080e7          	jalr	744(ra) # 80003160 <_Z8printIntiii>
        putc('\n');
    80001e80:	00a00513          	li	a0,10
    80001e84:	00003097          	auipc	ra,0x3
    80001e88:	b18080e7          	jalr	-1256(ra) # 8000499c <_Z4putcc>
        ForkThread* thread = new ForkThread(id + 1);
    80001e8c:	02000513          	li	a0,32
    80001e90:	00004097          	auipc	ra,0x4
    80001e94:	268080e7          	jalr	616(ra) # 800060f8 <_Znwm>
    80001e98:	00050a93          	mv	s5,a0
    80001e9c:	02050463          	beqz	a0,80001ec4 <_ZN10ForkThread3runEv+0x94>
    80001ea0:	01093483          	ld	s1,16(s2)
    80001ea4:	00148493          	addi	s1,s1,1
    ForkThread(long _id) noexcept: Thread(), id(_id), finished(false) {}
    80001ea8:	00004097          	auipc	ra,0x4
    80001eac:	448080e7          	jalr	1096(ra) # 800062f0 <_ZN6ThreadC1Ev>
    80001eb0:	0000b797          	auipc	a5,0xb
    80001eb4:	cb878793          	addi	a5,a5,-840 # 8000cb68 <_ZTV10ForkThread+0x10>
    80001eb8:	00fab023          	sd	a5,0(s5)
    80001ebc:	009ab823          	sd	s1,16(s5)
    80001ec0:	000a8c23          	sb	zero,24(s5)
        ForkThread** threads = (ForkThread** ) mem_alloc(sizeof(ForkThread*) * id);
    80001ec4:	01093503          	ld	a0,16(s2)
    80001ec8:	00351513          	slli	a0,a0,0x3
    80001ecc:	00002097          	auipc	ra,0x2
    80001ed0:	7ec080e7          	jalr	2028(ra) # 800046b8 <_Z9mem_allocm>
    80001ed4:	00050a13          	mv	s4,a0
        if (threads != nullptr) {
    80001ed8:	10050463          	beqz	a0,80001fe0 <_ZN10ForkThread3runEv+0x1b0>
            for (long i = 0; i < id; i++) {
    80001edc:	00000993          	li	s3,0
    80001ee0:	0140006f          	j	80001ef4 <_ZN10ForkThread3runEv+0xc4>
                threads[i] = new ForkThread(id);
    80001ee4:	00399793          	slli	a5,s3,0x3
    80001ee8:	00fa07b3          	add	a5,s4,a5
    80001eec:	0097b023          	sd	s1,0(a5)
            for (long i = 0; i < id; i++) {
    80001ef0:	00198993          	addi	s3,s3,1
    80001ef4:	01093783          	ld	a5,16(s2)
    80001ef8:	02f9de63          	bge	s3,a5,80001f34 <_ZN10ForkThread3runEv+0x104>
                threads[i] = new ForkThread(id);
    80001efc:	02000513          	li	a0,32
    80001f00:	00004097          	auipc	ra,0x4
    80001f04:	1f8080e7          	jalr	504(ra) # 800060f8 <_Znwm>
    80001f08:	00050493          	mv	s1,a0
    80001f0c:	fc050ce3          	beqz	a0,80001ee4 <_ZN10ForkThread3runEv+0xb4>
    80001f10:	01093b03          	ld	s6,16(s2)
    ForkThread(long _id) noexcept: Thread(), id(_id), finished(false) {}
    80001f14:	00004097          	auipc	ra,0x4
    80001f18:	3dc080e7          	jalr	988(ra) # 800062f0 <_ZN6ThreadC1Ev>
    80001f1c:	0000b797          	auipc	a5,0xb
    80001f20:	c4c78793          	addi	a5,a5,-948 # 8000cb68 <_ZTV10ForkThread+0x10>
    80001f24:	00f4b023          	sd	a5,0(s1)
    80001f28:	0164b823          	sd	s6,16(s1)
    80001f2c:	00048c23          	sb	zero,24(s1)
    80001f30:	fb5ff06f          	j	80001ee4 <_ZN10ForkThread3runEv+0xb4>
            if (thread != nullptr) {
    80001f34:	060a8663          	beqz	s5,80001fa0 <_ZN10ForkThread3runEv+0x170>
                if (thread->start() == 0) {
    80001f38:	000a8513          	mv	a0,s5
    80001f3c:	00004097          	auipc	ra,0x4
    80001f40:	308080e7          	jalr	776(ra) # 80006244 <_ZN6Thread5startEv>
    80001f44:	00050993          	mv	s3,a0
    80001f48:	04051463          	bnez	a0,80001f90 <_ZN10ForkThread3runEv+0x160>
                    for (int i = 0; i < 50; i++) {
    80001f4c:	00050493          	mv	s1,a0
    80001f50:	0100006f          	j	80001f60 <_ZN10ForkThread3runEv+0x130>
                        thread_dispatch();
    80001f54:	00003097          	auipc	ra,0x3
    80001f58:	8c8080e7          	jalr	-1848(ra) # 8000481c <_Z15thread_dispatchv>
                    for (int i = 0; i < 50; i++) {
    80001f5c:	0014849b          	addiw	s1,s1,1
    80001f60:	03100793          	li	a5,49
    80001f64:	0097cc63          	blt	a5,s1,80001f7c <_ZN10ForkThread3runEv+0x14c>
                        for (int j = 0; j < 50; j++) {
    80001f68:	00098793          	mv	a5,s3
    80001f6c:	03100713          	li	a4,49
    80001f70:	fef742e3          	blt	a4,a5,80001f54 <_ZN10ForkThread3runEv+0x124>
    80001f74:	0017879b          	addiw	a5,a5,1
    80001f78:	ff5ff06f          	j	80001f6c <_ZN10ForkThread3runEv+0x13c>
        return finished;
    80001f7c:	018ac783          	lbu	a5,24(s5)
                    while (!thread->isFinished()) {
    80001f80:	00079863          	bnez	a5,80001f90 <_ZN10ForkThread3runEv+0x160>
                        thread_dispatch();
    80001f84:	00003097          	auipc	ra,0x3
    80001f88:	898080e7          	jalr	-1896(ra) # 8000481c <_Z15thread_dispatchv>
                    while (!thread->isFinished()) {
    80001f8c:	ff1ff06f          	j	80001f7c <_ZN10ForkThread3runEv+0x14c>
                delete thread;
    80001f90:	000ab783          	ld	a5,0(s5)
    80001f94:	0087b783          	ld	a5,8(a5)
    80001f98:	000a8513          	mv	a0,s5
    80001f9c:	000780e7          	jalr	a5
                        for (int j = 0; j < 50; j++) {
    80001fa0:	00000493          	li	s1,0
    80001fa4:	0080006f          	j	80001fac <_ZN10ForkThread3runEv+0x17c>
            for (long i = 0; i < id; i++) {
    80001fa8:	00148493          	addi	s1,s1,1
    80001fac:	01093783          	ld	a5,16(s2)
    80001fb0:	02f4d263          	bge	s1,a5,80001fd4 <_ZN10ForkThread3runEv+0x1a4>
                delete threads[i];
    80001fb4:	00349793          	slli	a5,s1,0x3
    80001fb8:	00fa07b3          	add	a5,s4,a5
    80001fbc:	0007b503          	ld	a0,0(a5)
    80001fc0:	fe0504e3          	beqz	a0,80001fa8 <_ZN10ForkThread3runEv+0x178>
    80001fc4:	00053783          	ld	a5,0(a0)
    80001fc8:	0087b783          	ld	a5,8(a5)
    80001fcc:	000780e7          	jalr	a5
    80001fd0:	fd9ff06f          	j	80001fa8 <_ZN10ForkThread3runEv+0x178>
            mem_free(threads);
    80001fd4:	000a0513          	mv	a0,s4
    80001fd8:	00002097          	auipc	ra,0x2
    80001fdc:	734080e7          	jalr	1844(ra) # 8000470c <_Z8mem_freePv>
        printString("Finished thread id: ");
    80001fe0:	00008517          	auipc	a0,0x8
    80001fe4:	0e850513          	addi	a0,a0,232 # 8000a0c8 <CONSOLE_STATUS+0xb8>
    80001fe8:	00001097          	auipc	ra,0x1
    80001fec:	fe0080e7          	jalr	-32(ra) # 80002fc8 <_Z11printStringPKc>
        printInt(id);
    80001ff0:	00000613          	li	a2,0
    80001ff4:	00a00593          	li	a1,10
    80001ff8:	01092503          	lw	a0,16(s2)
    80001ffc:	00001097          	auipc	ra,0x1
    80002000:	164080e7          	jalr	356(ra) # 80003160 <_Z8printIntiii>
        putc('\n');
    80002004:	00a00513          	li	a0,10
    80002008:	00003097          	auipc	ra,0x3
    8000200c:	994080e7          	jalr	-1644(ra) # 8000499c <_Z4putcc>
        finished = true;
    80002010:	00100793          	li	a5,1
    80002014:	00f90c23          	sb	a5,24(s2)
    }
    80002018:	03813083          	ld	ra,56(sp)
    8000201c:	03013403          	ld	s0,48(sp)
    80002020:	02813483          	ld	s1,40(sp)
    80002024:	02013903          	ld	s2,32(sp)
    80002028:	01813983          	ld	s3,24(sp)
    8000202c:	01013a03          	ld	s4,16(sp)
    80002030:	00813a83          	ld	s5,8(sp)
    80002034:	00013b03          	ld	s6,0(sp)
    80002038:	04010113          	addi	sp,sp,64
    8000203c:	00008067          	ret

0000000080002040 <_ZN10ForkThreadD1Ev>:
class ForkThread : public Thread {
    80002040:	ff010113          	addi	sp,sp,-16
    80002044:	00113423          	sd	ra,8(sp)
    80002048:	00813023          	sd	s0,0(sp)
    8000204c:	01010413          	addi	s0,sp,16
    80002050:	0000b797          	auipc	a5,0xb
    80002054:	b1878793          	addi	a5,a5,-1256 # 8000cb68 <_ZTV10ForkThread+0x10>
    80002058:	00f53023          	sd	a5,0(a0)
    8000205c:	00004097          	auipc	ra,0x4
    80002060:	ff8080e7          	jalr	-8(ra) # 80006054 <_ZN6ThreadD1Ev>
    80002064:	00813083          	ld	ra,8(sp)
    80002068:	00013403          	ld	s0,0(sp)
    8000206c:	01010113          	addi	sp,sp,16
    80002070:	00008067          	ret

0000000080002074 <_ZN10ForkThreadD0Ev>:
    80002074:	fe010113          	addi	sp,sp,-32
    80002078:	00113c23          	sd	ra,24(sp)
    8000207c:	00813823          	sd	s0,16(sp)
    80002080:	00913423          	sd	s1,8(sp)
    80002084:	02010413          	addi	s0,sp,32
    80002088:	00050493          	mv	s1,a0
    8000208c:	0000b797          	auipc	a5,0xb
    80002090:	adc78793          	addi	a5,a5,-1316 # 8000cb68 <_ZTV10ForkThread+0x10>
    80002094:	00f53023          	sd	a5,0(a0)
    80002098:	00004097          	auipc	ra,0x4
    8000209c:	fbc080e7          	jalr	-68(ra) # 80006054 <_ZN6ThreadD1Ev>
    800020a0:	00048513          	mv	a0,s1
    800020a4:	00004097          	auipc	ra,0x4
    800020a8:	07c080e7          	jalr	124(ra) # 80006120 <_ZdlPv>
    800020ac:	01813083          	ld	ra,24(sp)
    800020b0:	01013403          	ld	s0,16(sp)
    800020b4:	00813483          	ld	s1,8(sp)
    800020b8:	02010113          	addi	sp,sp,32
    800020bc:	00008067          	ret

00000000800020c0 <_Z6memsetPKvii>:
                                    "tc_2",
                                    "tc_3",
                                    "tc_4"};


void memset(const void *data, int size, int value) {
    800020c0:	ff010113          	addi	sp,sp,-16
    800020c4:	00813423          	sd	s0,8(sp)
    800020c8:	01010413          	addi	s0,sp,16
    for (int j = 0; j < size; j++) {
    800020cc:	00000793          	li	a5,0
    800020d0:	00b7da63          	bge	a5,a1,800020e4 <_Z6memsetPKvii+0x24>
        *((char*)data + j) = value;
    800020d4:	00f50733          	add	a4,a0,a5
    800020d8:	00c70023          	sb	a2,0(a4)
    for (int j = 0; j < size; j++) {
    800020dc:	0017879b          	addiw	a5,a5,1
    800020e0:	ff1ff06f          	j	800020d0 <_Z6memsetPKvii+0x10>
    }
}
    800020e4:	00813403          	ld	s0,8(sp)
    800020e8:	01010113          	addi	sp,sp,16
    800020ec:	00008067          	ret

00000000800020f0 <_Z9constructPv>:

void construct(void *data) {
    800020f0:	fe010113          	addi	sp,sp,-32
    800020f4:	00113c23          	sd	ra,24(sp)
    800020f8:	00813823          	sd	s0,16(sp)
    800020fc:	00913423          	sd	s1,8(sp)
    80002100:	02010413          	addi	s0,sp,32
    80002104:	00050493          	mv	s1,a0
	static int i = 1;
    printInt(i++);
    80002108:	0000b797          	auipc	a5,0xb
    8000210c:	a7878793          	addi	a5,a5,-1416 # 8000cb80 <_ZZ9constructPvE1i>
    80002110:	0007a503          	lw	a0,0(a5)
    80002114:	0015071b          	addiw	a4,a0,1
    80002118:	00e7a023          	sw	a4,0(a5)
    8000211c:	00000613          	li	a2,0
    80002120:	00a00593          	li	a1,10
    80002124:	00001097          	auipc	ra,0x1
    80002128:	03c080e7          	jalr	60(ra) # 80003160 <_Z8printIntiii>
	printString(" Shared object constructed.\n");
    8000212c:	00008517          	auipc	a0,0x8
    80002130:	fcc50513          	addi	a0,a0,-52 # 8000a0f8 <CONSOLE_STATUS+0xe8>
    80002134:	00001097          	auipc	ra,0x1
    80002138:	e94080e7          	jalr	-364(ra) # 80002fc8 <_Z11printStringPKc>
    memset(data, shared_size, MASK);
    8000213c:	0a500613          	li	a2,165
    80002140:	00700593          	li	a1,7
    80002144:	00048513          	mv	a0,s1
    80002148:	00000097          	auipc	ra,0x0
    8000214c:	f78080e7          	jalr	-136(ra) # 800020c0 <_Z6memsetPKvii>
}
    80002150:	01813083          	ld	ra,24(sp)
    80002154:	01013403          	ld	s0,16(sp)
    80002158:	00813483          	ld	s1,8(sp)
    8000215c:	02010113          	addi	sp,sp,32
    80002160:	00008067          	ret

0000000080002164 <_Z5checkPvm>:

int check(void *data, size_t size) {
    80002164:	ff010113          	addi	sp,sp,-16
    80002168:	00813423          	sd	s0,8(sp)
    8000216c:	01010413          	addi	s0,sp,16
    80002170:	00050613          	mv	a2,a0
	int ret = 1;
	for (size_t i = 0; i < size; i++) {
    80002174:	00000793          	li	a5,0
	int ret = 1;
    80002178:	00100513          	li	a0,1
    8000217c:	0080006f          	j	80002184 <_Z5checkPvm+0x20>
	for (size_t i = 0; i < size; i++) {
    80002180:	00178793          	addi	a5,a5,1
    80002184:	00b7fe63          	bgeu	a5,a1,800021a0 <_Z5checkPvm+0x3c>
		if (((unsigned char *)data)[i] != MASK) {
    80002188:	00f60733          	add	a4,a2,a5
    8000218c:	00074683          	lbu	a3,0(a4)
    80002190:	0a500713          	li	a4,165
    80002194:	fee686e3          	beq	a3,a4,80002180 <_Z5checkPvm+0x1c>
			ret = 0;
    80002198:	00000513          	li	a0,0
    8000219c:	fe5ff06f          	j	80002180 <_Z5checkPvm+0x1c>
		}
	}

	return ret;
}
    800021a0:	00813403          	ld	s0,8(sp)
    800021a4:	01010113          	addi	sp,sp,16
    800021a8:	00008067          	ret

00000000800021ac <_Z4workPv>:



void work(void* pdata) {
    800021ac:	f8010113          	addi	sp,sp,-128
    800021b0:	06113c23          	sd	ra,120(sp)
    800021b4:	06813823          	sd	s0,112(sp)
    800021b8:	06913423          	sd	s1,104(sp)
    800021bc:	07213023          	sd	s2,96(sp)
    800021c0:	05313c23          	sd	s3,88(sp)
    800021c4:	05413823          	sd	s4,80(sp)
    800021c8:	05513423          	sd	s5,72(sp)
    800021cc:	05613023          	sd	s6,64(sp)
    800021d0:	03713c23          	sd	s7,56(sp)
    800021d4:	03813823          	sd	s8,48(sp)
    800021d8:	03913423          	sd	s9,40(sp)
    800021dc:	08010413          	addi	s0,sp,128
	struct data_s data = *(struct data_s*) pdata;
    800021e0:	00053c03          	ld	s8,0(a0)
    800021e4:	f9843423          	sd	s8,-120(s0)
    800021e8:	00853783          	ld	a5,8(a0)
    800021ec:	f8f43823          	sd	a5,-112(s0)
    800021f0:	01053783          	ld	a5,16(a0)
    800021f4:	f8f43c23          	sd	a5,-104(s0)
	int size = 0;
    int object_size = data.id + 1;
    800021f8:	000c079b          	sext.w	a5,s8
    800021fc:	001c0c1b          	addiw	s8,s8,1
	kmem_cache_t *cache = kmem_cache_create(CACHE_NAMES[data.id], object_size, nullptr, nullptr);
    80002200:	00379713          	slli	a4,a5,0x3
    80002204:	0000b797          	auipc	a5,0xb
    80002208:	98478793          	addi	a5,a5,-1660 # 8000cb88 <_ZL11CACHE_NAMES>
    8000220c:	00e787b3          	add	a5,a5,a4
    80002210:	000c0b93          	mv	s7,s8
    80002214:	00000693          	li	a3,0
    80002218:	00000613          	li	a2,0
    8000221c:	000c0593          	mv	a1,s8
    80002220:	0007b503          	ld	a0,0(a5)
    80002224:	00003097          	auipc	ra,0x3
    80002228:	51c080e7          	jalr	1308(ra) # 80005740 <_Z17kmem_cache_createPKcmPFvPvES3_>
    8000222c:	00050993          	mv	s3,a0

	struct objects_s *objs = (struct objects_s*)(kmalloc(sizeof(struct objects_s) * data.iterations));
    80002230:	f9842b03          	lw	s6,-104(s0)
    80002234:	004b1513          	slli	a0,s6,0x4
    80002238:	00003097          	auipc	ra,0x3
    8000223c:	5f4080e7          	jalr	1524(ra) # 8000582c <_Z7kmallocm>
    80002240:	00050a93          	mv	s5,a0

	for (int i = 0; i < data.iterations; i++) {
    80002244:	00000493          	li	s1,0
	int size = 0;
    80002248:	00000913          	li	s2,0
    8000224c:	0380006f          	j	80002284 <_Z4workPv+0xd8>
			if (!check(objs[size].data, shared_size)) {
                printString("Value not correct!\n");
            }
		}
		else {
			objs[size].data = kmem_cache_alloc(cache);
    80002250:	00491a13          	slli	s4,s2,0x4
    80002254:	014a8a33          	add	s4,s5,s4
    80002258:	00098513          	mv	a0,s3
    8000225c:	00003097          	auipc	ra,0x3
    80002260:	580080e7          	jalr	1408(ra) # 800057dc <_Z16kmem_cache_allocP5Cache>
    80002264:	00aa3423          	sd	a0,8(s4)
			objs[size].cache = cache;
    80002268:	013a3023          	sd	s3,0(s4)
			memset(objs[size].data, object_size, MASK);
    8000226c:	0a500613          	li	a2,165
    80002270:	000c0593          	mv	a1,s8
    80002274:	00000097          	auipc	ra,0x0
    80002278:	e4c080e7          	jalr	-436(ra) # 800020c0 <_Z6memsetPKvii>
		}
		size++;
    8000227c:	0019091b          	addiw	s2,s2,1
	for (int i = 0; i < data.iterations; i++) {
    80002280:	0014849b          	addiw	s1,s1,1
    80002284:	0564da63          	bge	s1,s6,800022d8 <_Z4workPv+0x12c>
		if (i % 100 == 0) {
    80002288:	06400793          	li	a5,100
    8000228c:	02f4e7bb          	remw	a5,s1,a5
    80002290:	fc0790e3          	bnez	a5,80002250 <_Z4workPv+0xa4>
			objs[size].data = kmem_cache_alloc(data.shared);
    80002294:	f9043c83          	ld	s9,-112(s0)
    80002298:	00491a13          	slli	s4,s2,0x4
    8000229c:	014a8a33          	add	s4,s5,s4
    800022a0:	000c8513          	mv	a0,s9
    800022a4:	00003097          	auipc	ra,0x3
    800022a8:	538080e7          	jalr	1336(ra) # 800057dc <_Z16kmem_cache_allocP5Cache>
    800022ac:	00aa3423          	sd	a0,8(s4)
			objs[size].cache = data.shared;
    800022b0:	019a3023          	sd	s9,0(s4)
			if (!check(objs[size].data, shared_size)) {
    800022b4:	00700593          	li	a1,7
    800022b8:	00000097          	auipc	ra,0x0
    800022bc:	eac080e7          	jalr	-340(ra) # 80002164 <_Z5checkPvm>
    800022c0:	fa051ee3          	bnez	a0,8000227c <_Z4workPv+0xd0>
                printString("Value not correct!\n");
    800022c4:	00008517          	auipc	a0,0x8
    800022c8:	e5450513          	addi	a0,a0,-428 # 8000a118 <CONSOLE_STATUS+0x108>
    800022cc:	00001097          	auipc	ra,0x1
    800022d0:	cfc080e7          	jalr	-772(ra) # 80002fc8 <_Z11printStringPKc>
    800022d4:	fa9ff06f          	j	8000227c <_Z4workPv+0xd0>
	}

	kmem_cache_info(cache);
    800022d8:	00098513          	mv	a0,s3
    800022dc:	00003097          	auipc	ra,0x3
    800022e0:	618080e7          	jalr	1560(ra) # 800058f4 <_Z15kmem_cache_infoP5Cache>
	kmem_cache_info(data.shared);
    800022e4:	f9043503          	ld	a0,-112(s0)
    800022e8:	00003097          	auipc	ra,0x3
    800022ec:	60c080e7          	jalr	1548(ra) # 800058f4 <_Z15kmem_cache_infoP5Cache>
    static int bb = 0;
	for (int i = 0; i < size; i++) {
    800022f0:	00000a13          	li	s4,0
    800022f4:	0580006f          	j	8000234c <_Z4workPv+0x1a0>
		if (!check(objs[i].data, (cache == objs[i].cache) ? object_size : shared_size)) {
    800022f8:	000b8593          	mv	a1,s7
    800022fc:	06c0006f          	j	80002368 <_Z4workPv+0x1bc>
            printInt(++bb);
    80002300:	0000b797          	auipc	a5,0xb
    80002304:	aa078793          	addi	a5,a5,-1376 # 8000cda0 <_ZZ4workPvE2bb>
    80002308:	0007a503          	lw	a0,0(a5)
    8000230c:	0015051b          	addiw	a0,a0,1
    80002310:	00a7a023          	sw	a0,0(a5)
    80002314:	00000613          	li	a2,0
    80002318:	00a00593          	li	a1,10
    8000231c:	0005051b          	sext.w	a0,a0
    80002320:	00001097          	auipc	ra,0x1
    80002324:	e40080e7          	jalr	-448(ra) # 80003160 <_Z8printIntiii>
            printString(" Value not correct!\n");
    80002328:	00008517          	auipc	a0,0x8
    8000232c:	e0850513          	addi	a0,a0,-504 # 8000a130 <CONSOLE_STATUS+0x120>
    80002330:	00001097          	auipc	ra,0x1
    80002334:	c98080e7          	jalr	-872(ra) # 80002fc8 <_Z11printStringPKc>

        }
		kmem_cache_free(objs[i].cache, objs[i].data);
    80002338:	0084b583          	ld	a1,8(s1)
    8000233c:	0004b503          	ld	a0,0(s1)
    80002340:	00003097          	auipc	ra,0x3
    80002344:	4c4080e7          	jalr	1220(ra) # 80005804 <_Z15kmem_cache_freeP5CachePv>
	for (int i = 0; i < size; i++) {
    80002348:	001a0a1b          	addiw	s4,s4,1
    8000234c:	032a5663          	bge	s4,s2,80002378 <_Z4workPv+0x1cc>
		if (!check(objs[i].data, (cache == objs[i].cache) ? object_size : shared_size)) {
    80002350:	004a1493          	slli	s1,s4,0x4
    80002354:	009a84b3          	add	s1,s5,s1
    80002358:	0084b503          	ld	a0,8(s1)
    8000235c:	0004b783          	ld	a5,0(s1)
    80002360:	f9378ce3          	beq	a5,s3,800022f8 <_Z4workPv+0x14c>
    80002364:	00700593          	li	a1,7
    80002368:	00000097          	auipc	ra,0x0
    8000236c:	dfc080e7          	jalr	-516(ra) # 80002164 <_Z5checkPvm>
    80002370:	fc0514e3          	bnez	a0,80002338 <_Z4workPv+0x18c>
    80002374:	f8dff06f          	j	80002300 <_Z4workPv+0x154>
	}

	kfree(objs);
    80002378:	000a8513          	mv	a0,s5
    8000237c:	00003097          	auipc	ra,0x3
    80002380:	4f0080e7          	jalr	1264(ra) # 8000586c <_Z5kfreePv>
	kmem_cache_destroy(cache);
    80002384:	00098513          	mv	a0,s3
    80002388:	00003097          	auipc	ra,0x3
    8000238c:	524080e7          	jalr	1316(ra) # 800058ac <_Z18kmem_cache_destroyP5Cache>
}
    80002390:	07813083          	ld	ra,120(sp)
    80002394:	07013403          	ld	s0,112(sp)
    80002398:	06813483          	ld	s1,104(sp)
    8000239c:	06013903          	ld	s2,96(sp)
    800023a0:	05813983          	ld	s3,88(sp)
    800023a4:	05013a03          	ld	s4,80(sp)
    800023a8:	04813a83          	ld	s5,72(sp)
    800023ac:	04013b03          	ld	s6,64(sp)
    800023b0:	03813b83          	ld	s7,56(sp)
    800023b4:	03013c03          	ld	s8,48(sp)
    800023b8:	02813c83          	ld	s9,40(sp)
    800023bc:	08010113          	addi	sp,sp,128
    800023c0:	00008067          	ret

00000000800023c4 <_Z4runsPFvPvEP6data_si>:



void runs(void(*work)(void*), struct data_s* data, int num) {
    800023c4:	fb010113          	addi	sp,sp,-80
    800023c8:	04113423          	sd	ra,72(sp)
    800023cc:	04813023          	sd	s0,64(sp)
    800023d0:	02913c23          	sd	s1,56(sp)
    800023d4:	03213823          	sd	s2,48(sp)
    800023d8:	03313423          	sd	s3,40(sp)
    800023dc:	03413023          	sd	s4,32(sp)
    800023e0:	05010413          	addi	s0,sp,80
    800023e4:	00050a13          	mv	s4,a0
    800023e8:	00058913          	mv	s2,a1
    800023ec:	00060993          	mv	s3,a2
    for (int i = 0; i < num; i++) {
    800023f0:	00000493          	li	s1,0
    800023f4:	0334d863          	bge	s1,s3,80002424 <_Z4runsPFvPvEP6data_si+0x60>
        struct data_s private_data;
        private_data = *(struct data_s*) data;
    800023f8:	00093783          	ld	a5,0(s2)
    800023fc:	faf43c23          	sd	a5,-72(s0)
    80002400:	00893783          	ld	a5,8(s2)
    80002404:	fcf43023          	sd	a5,-64(s0)
    80002408:	01093783          	ld	a5,16(s2)
    8000240c:	fcf43423          	sd	a5,-56(s0)
        private_data.id = i;
    80002410:	fa942c23          	sw	s1,-72(s0)
        work(&private_data);
    80002414:	fb840513          	addi	a0,s0,-72
    80002418:	000a00e7          	jalr	s4
    for (int i = 0; i < num; i++) {
    8000241c:	0014849b          	addiw	s1,s1,1
    80002420:	fd5ff06f          	j	800023f4 <_Z4runsPFvPvEP6data_si+0x30>
    }
}
    80002424:	04813083          	ld	ra,72(sp)
    80002428:	04013403          	ld	s0,64(sp)
    8000242c:	03813483          	ld	s1,56(sp)
    80002430:	03013903          	ld	s2,48(sp)
    80002434:	02813983          	ld	s3,40(sp)
    80002438:	02013a03          	ld	s4,32(sp)
    8000243c:	05010113          	addi	sp,sp,80
    80002440:	00008067          	ret

0000000080002444 <_Z9userMain2v>:

void userMain2() {
    80002444:	fc010113          	addi	sp,sp,-64
    80002448:	02113c23          	sd	ra,56(sp)
    8000244c:	02813823          	sd	s0,48(sp)
    80002450:	02913423          	sd	s1,40(sp)
    80002454:	04010413          	addi	s0,sp,64
	kmem_cache_t *shared = kmem_cache_create("shared object", shared_size, construct, nullptr);
    80002458:	00000693          	li	a3,0
    8000245c:	00000617          	auipc	a2,0x0
    80002460:	c9460613          	addi	a2,a2,-876 # 800020f0 <_Z9constructPv>
    80002464:	00700593          	li	a1,7
    80002468:	00008517          	auipc	a0,0x8
    8000246c:	ce050513          	addi	a0,a0,-800 # 8000a148 <CONSOLE_STATUS+0x138>
    80002470:	00003097          	auipc	ra,0x3
    80002474:	2d0080e7          	jalr	720(ra) # 80005740 <_Z17kmem_cache_createPKcmPFvPvES3_>
    80002478:	00050493          	mv	s1,a0

	struct data_s data;
	data.shared = shared;
    8000247c:	fca43823          	sd	a0,-48(s0)
	data.iterations = ITERATIONS;
    80002480:	3e800793          	li	a5,1000
    80002484:	fcf42c23          	sw	a5,-40(s0)
	runs(work, &data, RUN_NUM);
    80002488:	00500613          	li	a2,5
    8000248c:	fc840593          	addi	a1,s0,-56
    80002490:	00000517          	auipc	a0,0x0
    80002494:	d1c50513          	addi	a0,a0,-740 # 800021ac <_Z4workPv>
    80002498:	00000097          	auipc	ra,0x0
    8000249c:	f2c080e7          	jalr	-212(ra) # 800023c4 <_Z4runsPFvPvEP6data_si>

	kmem_cache_destroy(shared);
    800024a0:	00048513          	mv	a0,s1
    800024a4:	00003097          	auipc	ra,0x3
    800024a8:	408080e7          	jalr	1032(ra) # 800058ac <_Z18kmem_cache_destroyP5Cache>
}
    800024ac:	03813083          	ld	ra,56(sp)
    800024b0:	03013403          	ld	s0,48(sp)
    800024b4:	02813483          	ld	s1,40(sp)
    800024b8:	04010113          	addi	sp,sp,64
    800024bc:	00008067          	ret

00000000800024c0 <_ZN6BufferC1Ei>:
#include "buffer.hpp"

Buffer::Buffer(int _cap) : cap(_cap + 1), head(0), tail(0) {
    800024c0:	fe010113          	addi	sp,sp,-32
    800024c4:	00113c23          	sd	ra,24(sp)
    800024c8:	00813823          	sd	s0,16(sp)
    800024cc:	00913423          	sd	s1,8(sp)
    800024d0:	01213023          	sd	s2,0(sp)
    800024d4:	02010413          	addi	s0,sp,32
    800024d8:	00050493          	mv	s1,a0
    800024dc:	00058913          	mv	s2,a1
    800024e0:	0015879b          	addiw	a5,a1,1
    800024e4:	0007851b          	sext.w	a0,a5
    800024e8:	00f4a023          	sw	a5,0(s1)
    800024ec:	0004a823          	sw	zero,16(s1)
    800024f0:	0004aa23          	sw	zero,20(s1)
    buffer = (int *)mem_alloc(sizeof(int) * cap);
    800024f4:	00251513          	slli	a0,a0,0x2
    800024f8:	00002097          	auipc	ra,0x2
    800024fc:	1c0080e7          	jalr	448(ra) # 800046b8 <_Z9mem_allocm>
    80002500:	00a4b423          	sd	a0,8(s1)
    sem_open(&itemAvailable, 0);
    80002504:	00000593          	li	a1,0
    80002508:	02048513          	addi	a0,s1,32
    8000250c:	00002097          	auipc	ra,0x2
    80002510:	334080e7          	jalr	820(ra) # 80004840 <_Z8sem_openPP4_semj>
    sem_open(&spaceAvailable, _cap);
    80002514:	00090593          	mv	a1,s2
    80002518:	01848513          	addi	a0,s1,24
    8000251c:	00002097          	auipc	ra,0x2
    80002520:	324080e7          	jalr	804(ra) # 80004840 <_Z8sem_openPP4_semj>
    sem_open(&mutexHead, 1);
    80002524:	00100593          	li	a1,1
    80002528:	02848513          	addi	a0,s1,40
    8000252c:	00002097          	auipc	ra,0x2
    80002530:	314080e7          	jalr	788(ra) # 80004840 <_Z8sem_openPP4_semj>
    sem_open(&mutexTail, 1);
    80002534:	00100593          	li	a1,1
    80002538:	03048513          	addi	a0,s1,48
    8000253c:	00002097          	auipc	ra,0x2
    80002540:	304080e7          	jalr	772(ra) # 80004840 <_Z8sem_openPP4_semj>
}
    80002544:	01813083          	ld	ra,24(sp)
    80002548:	01013403          	ld	s0,16(sp)
    8000254c:	00813483          	ld	s1,8(sp)
    80002550:	00013903          	ld	s2,0(sp)
    80002554:	02010113          	addi	sp,sp,32
    80002558:	00008067          	ret

000000008000255c <_ZN6Buffer3putEi>:
    sem_close(spaceAvailable);
    sem_close(mutexTail);
    sem_close(mutexHead);
}

void Buffer::put(int val) {
    8000255c:	fe010113          	addi	sp,sp,-32
    80002560:	00113c23          	sd	ra,24(sp)
    80002564:	00813823          	sd	s0,16(sp)
    80002568:	00913423          	sd	s1,8(sp)
    8000256c:	01213023          	sd	s2,0(sp)
    80002570:	02010413          	addi	s0,sp,32
    80002574:	00050493          	mv	s1,a0
    80002578:	00058913          	mv	s2,a1
    sem_wait(spaceAvailable);
    8000257c:	01853503          	ld	a0,24(a0)
    80002580:	00002097          	auipc	ra,0x2
    80002584:	340080e7          	jalr	832(ra) # 800048c0 <_Z8sem_waitP4_sem>

    sem_wait(mutexTail);
    80002588:	0304b503          	ld	a0,48(s1)
    8000258c:	00002097          	auipc	ra,0x2
    80002590:	334080e7          	jalr	820(ra) # 800048c0 <_Z8sem_waitP4_sem>
    buffer[tail] = val;
    80002594:	0084b783          	ld	a5,8(s1)
    80002598:	0144a703          	lw	a4,20(s1)
    8000259c:	00271713          	slli	a4,a4,0x2
    800025a0:	00e787b3          	add	a5,a5,a4
    800025a4:	0127a023          	sw	s2,0(a5)
    tail = (tail + 1) % cap;
    800025a8:	0144a783          	lw	a5,20(s1)
    800025ac:	0017879b          	addiw	a5,a5,1
    800025b0:	0004a703          	lw	a4,0(s1)
    800025b4:	02e7e7bb          	remw	a5,a5,a4
    800025b8:	00f4aa23          	sw	a5,20(s1)
    sem_signal(mutexTail);
    800025bc:	0304b503          	ld	a0,48(s1)
    800025c0:	00002097          	auipc	ra,0x2
    800025c4:	338080e7          	jalr	824(ra) # 800048f8 <_Z10sem_signalP4_sem>

    sem_signal(itemAvailable);
    800025c8:	0204b503          	ld	a0,32(s1)
    800025cc:	00002097          	auipc	ra,0x2
    800025d0:	32c080e7          	jalr	812(ra) # 800048f8 <_Z10sem_signalP4_sem>

}
    800025d4:	01813083          	ld	ra,24(sp)
    800025d8:	01013403          	ld	s0,16(sp)
    800025dc:	00813483          	ld	s1,8(sp)
    800025e0:	00013903          	ld	s2,0(sp)
    800025e4:	02010113          	addi	sp,sp,32
    800025e8:	00008067          	ret

00000000800025ec <_ZN6Buffer3getEv>:

int Buffer::get() {
    800025ec:	fe010113          	addi	sp,sp,-32
    800025f0:	00113c23          	sd	ra,24(sp)
    800025f4:	00813823          	sd	s0,16(sp)
    800025f8:	00913423          	sd	s1,8(sp)
    800025fc:	01213023          	sd	s2,0(sp)
    80002600:	02010413          	addi	s0,sp,32
    80002604:	00050493          	mv	s1,a0
    sem_wait(itemAvailable);
    80002608:	02053503          	ld	a0,32(a0)
    8000260c:	00002097          	auipc	ra,0x2
    80002610:	2b4080e7          	jalr	692(ra) # 800048c0 <_Z8sem_waitP4_sem>

    sem_wait(mutexHead);
    80002614:	0284b503          	ld	a0,40(s1)
    80002618:	00002097          	auipc	ra,0x2
    8000261c:	2a8080e7          	jalr	680(ra) # 800048c0 <_Z8sem_waitP4_sem>

    int ret = buffer[head];
    80002620:	0084b703          	ld	a4,8(s1)
    80002624:	0104a783          	lw	a5,16(s1)
    80002628:	00279693          	slli	a3,a5,0x2
    8000262c:	00d70733          	add	a4,a4,a3
    80002630:	00072903          	lw	s2,0(a4)
    head = (head + 1) % cap;
    80002634:	0017879b          	addiw	a5,a5,1
    80002638:	0004a703          	lw	a4,0(s1)
    8000263c:	02e7e7bb          	remw	a5,a5,a4
    80002640:	00f4a823          	sw	a5,16(s1)
    sem_signal(mutexHead);
    80002644:	0284b503          	ld	a0,40(s1)
    80002648:	00002097          	auipc	ra,0x2
    8000264c:	2b0080e7          	jalr	688(ra) # 800048f8 <_Z10sem_signalP4_sem>

    sem_signal(spaceAvailable);
    80002650:	0184b503          	ld	a0,24(s1)
    80002654:	00002097          	auipc	ra,0x2
    80002658:	2a4080e7          	jalr	676(ra) # 800048f8 <_Z10sem_signalP4_sem>

    return ret;
}
    8000265c:	00090513          	mv	a0,s2
    80002660:	01813083          	ld	ra,24(sp)
    80002664:	01013403          	ld	s0,16(sp)
    80002668:	00813483          	ld	s1,8(sp)
    8000266c:	00013903          	ld	s2,0(sp)
    80002670:	02010113          	addi	sp,sp,32
    80002674:	00008067          	ret

0000000080002678 <_ZN6Buffer6getCntEv>:

int Buffer::getCnt() {
    80002678:	fe010113          	addi	sp,sp,-32
    8000267c:	00113c23          	sd	ra,24(sp)
    80002680:	00813823          	sd	s0,16(sp)
    80002684:	00913423          	sd	s1,8(sp)
    80002688:	01213023          	sd	s2,0(sp)
    8000268c:	02010413          	addi	s0,sp,32
    80002690:	00050493          	mv	s1,a0
    int ret;

    sem_wait(mutexHead);
    80002694:	02853503          	ld	a0,40(a0)
    80002698:	00002097          	auipc	ra,0x2
    8000269c:	228080e7          	jalr	552(ra) # 800048c0 <_Z8sem_waitP4_sem>
    sem_wait(mutexTail);
    800026a0:	0304b503          	ld	a0,48(s1)
    800026a4:	00002097          	auipc	ra,0x2
    800026a8:	21c080e7          	jalr	540(ra) # 800048c0 <_Z8sem_waitP4_sem>

    if (tail >= head) {
    800026ac:	0144a783          	lw	a5,20(s1)
    800026b0:	0104a903          	lw	s2,16(s1)
    800026b4:	0327ce63          	blt	a5,s2,800026f0 <_ZN6Buffer6getCntEv+0x78>
        ret = tail - head;
    800026b8:	4127893b          	subw	s2,a5,s2
    } else {
        ret = cap - head + tail;
    }

    sem_signal(mutexTail);
    800026bc:	0304b503          	ld	a0,48(s1)
    800026c0:	00002097          	auipc	ra,0x2
    800026c4:	238080e7          	jalr	568(ra) # 800048f8 <_Z10sem_signalP4_sem>
    sem_signal(mutexHead);
    800026c8:	0284b503          	ld	a0,40(s1)
    800026cc:	00002097          	auipc	ra,0x2
    800026d0:	22c080e7          	jalr	556(ra) # 800048f8 <_Z10sem_signalP4_sem>

    return ret;
}
    800026d4:	00090513          	mv	a0,s2
    800026d8:	01813083          	ld	ra,24(sp)
    800026dc:	01013403          	ld	s0,16(sp)
    800026e0:	00813483          	ld	s1,8(sp)
    800026e4:	00013903          	ld	s2,0(sp)
    800026e8:	02010113          	addi	sp,sp,32
    800026ec:	00008067          	ret
        ret = cap - head + tail;
    800026f0:	0004a703          	lw	a4,0(s1)
    800026f4:	4127093b          	subw	s2,a4,s2
    800026f8:	00f9093b          	addw	s2,s2,a5
    800026fc:	fc1ff06f          	j	800026bc <_ZN6Buffer6getCntEv+0x44>

0000000080002700 <_ZN6BufferD1Ev>:
Buffer::~Buffer() {
    80002700:	fe010113          	addi	sp,sp,-32
    80002704:	00113c23          	sd	ra,24(sp)
    80002708:	00813823          	sd	s0,16(sp)
    8000270c:	00913423          	sd	s1,8(sp)
    80002710:	02010413          	addi	s0,sp,32
    80002714:	00050493          	mv	s1,a0
    putc('\n');
    80002718:	00a00513          	li	a0,10
    8000271c:	00002097          	auipc	ra,0x2
    80002720:	280080e7          	jalr	640(ra) # 8000499c <_Z4putcc>
    printString("Buffer deleted!\n");
    80002724:	00008517          	auipc	a0,0x8
    80002728:	97450513          	addi	a0,a0,-1676 # 8000a098 <CONSOLE_STATUS+0x88>
    8000272c:	00001097          	auipc	ra,0x1
    80002730:	89c080e7          	jalr	-1892(ra) # 80002fc8 <_Z11printStringPKc>
    while (getCnt() > 0) {
    80002734:	00048513          	mv	a0,s1
    80002738:	00000097          	auipc	ra,0x0
    8000273c:	f40080e7          	jalr	-192(ra) # 80002678 <_ZN6Buffer6getCntEv>
    80002740:	02a05c63          	blez	a0,80002778 <_ZN6BufferD1Ev+0x78>
        char ch = buffer[head];
    80002744:	0084b783          	ld	a5,8(s1)
    80002748:	0104a703          	lw	a4,16(s1)
    8000274c:	00271713          	slli	a4,a4,0x2
    80002750:	00e787b3          	add	a5,a5,a4
        putc(ch);
    80002754:	0007c503          	lbu	a0,0(a5)
    80002758:	00002097          	auipc	ra,0x2
    8000275c:	244080e7          	jalr	580(ra) # 8000499c <_Z4putcc>
        head = (head + 1) % cap;
    80002760:	0104a783          	lw	a5,16(s1)
    80002764:	0017879b          	addiw	a5,a5,1
    80002768:	0004a703          	lw	a4,0(s1)
    8000276c:	02e7e7bb          	remw	a5,a5,a4
    80002770:	00f4a823          	sw	a5,16(s1)
    while (getCnt() > 0) {
    80002774:	fc1ff06f          	j	80002734 <_ZN6BufferD1Ev+0x34>
    putc('!');
    80002778:	02100513          	li	a0,33
    8000277c:	00002097          	auipc	ra,0x2
    80002780:	220080e7          	jalr	544(ra) # 8000499c <_Z4putcc>
    putc('\n');
    80002784:	00a00513          	li	a0,10
    80002788:	00002097          	auipc	ra,0x2
    8000278c:	214080e7          	jalr	532(ra) # 8000499c <_Z4putcc>
    mem_free(buffer);
    80002790:	0084b503          	ld	a0,8(s1)
    80002794:	00002097          	auipc	ra,0x2
    80002798:	f78080e7          	jalr	-136(ra) # 8000470c <_Z8mem_freePv>
    sem_close(itemAvailable);
    8000279c:	0204b503          	ld	a0,32(s1)
    800027a0:	00002097          	auipc	ra,0x2
    800027a4:	0e8080e7          	jalr	232(ra) # 80004888 <_Z9sem_closeP4_sem>
    sem_close(spaceAvailable);
    800027a8:	0184b503          	ld	a0,24(s1)
    800027ac:	00002097          	auipc	ra,0x2
    800027b0:	0dc080e7          	jalr	220(ra) # 80004888 <_Z9sem_closeP4_sem>
    sem_close(mutexTail);
    800027b4:	0304b503          	ld	a0,48(s1)
    800027b8:	00002097          	auipc	ra,0x2
    800027bc:	0d0080e7          	jalr	208(ra) # 80004888 <_Z9sem_closeP4_sem>
    sem_close(mutexHead);
    800027c0:	0284b503          	ld	a0,40(s1)
    800027c4:	00002097          	auipc	ra,0x2
    800027c8:	0c4080e7          	jalr	196(ra) # 80004888 <_Z9sem_closeP4_sem>
}
    800027cc:	01813083          	ld	ra,24(sp)
    800027d0:	01013403          	ld	s0,16(sp)
    800027d4:	00813483          	ld	s1,8(sp)
    800027d8:	02010113          	addi	sp,sp,32
    800027dc:	00008067          	ret

00000000800027e0 <_ZN19ConsumerProducerCPP20testConsumerProducerEv>:

            td->sem->signal();
        }
    };

    void testConsumerProducer() {
    800027e0:	f8010113          	addi	sp,sp,-128
    800027e4:	06113c23          	sd	ra,120(sp)
    800027e8:	06813823          	sd	s0,112(sp)
    800027ec:	06913423          	sd	s1,104(sp)
    800027f0:	07213023          	sd	s2,96(sp)
    800027f4:	05313c23          	sd	s3,88(sp)
    800027f8:	05413823          	sd	s4,80(sp)
    800027fc:	05513423          	sd	s5,72(sp)
    80002800:	05613023          	sd	s6,64(sp)
    80002804:	03713c23          	sd	s7,56(sp)
    80002808:	03813823          	sd	s8,48(sp)
    8000280c:	03913423          	sd	s9,40(sp)
    80002810:	08010413          	addi	s0,sp,128
        delete waitForAll;
        for (int i = 0; i < threadNum; i++) {
            delete producers[i];
        }
        delete consumer;
        delete buffer;
    80002814:	00010b93          	mv	s7,sp
        printString("Unesite broj proizvodjaca?\n");
    80002818:	00008517          	auipc	a0,0x8
    8000281c:	96850513          	addi	a0,a0,-1688 # 8000a180 <CONSOLE_STATUS+0x170>
    80002820:	00000097          	auipc	ra,0x0
    80002824:	7a8080e7          	jalr	1960(ra) # 80002fc8 <_Z11printStringPKc>
        getString(input, 30);
    80002828:	01e00593          	li	a1,30
    8000282c:	f8040493          	addi	s1,s0,-128
    80002830:	00048513          	mv	a0,s1
    80002834:	00001097          	auipc	ra,0x1
    80002838:	810080e7          	jalr	-2032(ra) # 80003044 <_Z9getStringPci>
        threadNum = stringToInt(input);
    8000283c:	00048513          	mv	a0,s1
    80002840:	00001097          	auipc	ra,0x1
    80002844:	8d0080e7          	jalr	-1840(ra) # 80003110 <_Z11stringToIntPKc>
    80002848:	00050913          	mv	s2,a0
        printString("Unesite velicinu bafera?\n");
    8000284c:	00008517          	auipc	a0,0x8
    80002850:	95450513          	addi	a0,a0,-1708 # 8000a1a0 <CONSOLE_STATUS+0x190>
    80002854:	00000097          	auipc	ra,0x0
    80002858:	774080e7          	jalr	1908(ra) # 80002fc8 <_Z11printStringPKc>
        getString(input, 30);
    8000285c:	01e00593          	li	a1,30
    80002860:	00048513          	mv	a0,s1
    80002864:	00000097          	auipc	ra,0x0
    80002868:	7e0080e7          	jalr	2016(ra) # 80003044 <_Z9getStringPci>
        n = stringToInt(input);
    8000286c:	00048513          	mv	a0,s1
    80002870:	00001097          	auipc	ra,0x1
    80002874:	8a0080e7          	jalr	-1888(ra) # 80003110 <_Z11stringToIntPKc>
    80002878:	00050493          	mv	s1,a0
        printString("Broj proizvodjaca "); printInt(threadNum);
    8000287c:	00008517          	auipc	a0,0x8
    80002880:	94450513          	addi	a0,a0,-1724 # 8000a1c0 <CONSOLE_STATUS+0x1b0>
    80002884:	00000097          	auipc	ra,0x0
    80002888:	744080e7          	jalr	1860(ra) # 80002fc8 <_Z11printStringPKc>
    8000288c:	00000613          	li	a2,0
    80002890:	00a00593          	li	a1,10
    80002894:	00090513          	mv	a0,s2
    80002898:	00001097          	auipc	ra,0x1
    8000289c:	8c8080e7          	jalr	-1848(ra) # 80003160 <_Z8printIntiii>
        printString(" i velicina bafera "); printInt(n);
    800028a0:	00008517          	auipc	a0,0x8
    800028a4:	93850513          	addi	a0,a0,-1736 # 8000a1d8 <CONSOLE_STATUS+0x1c8>
    800028a8:	00000097          	auipc	ra,0x0
    800028ac:	720080e7          	jalr	1824(ra) # 80002fc8 <_Z11printStringPKc>
    800028b0:	00000613          	li	a2,0
    800028b4:	00a00593          	li	a1,10
    800028b8:	00048513          	mv	a0,s1
    800028bc:	00001097          	auipc	ra,0x1
    800028c0:	8a4080e7          	jalr	-1884(ra) # 80003160 <_Z8printIntiii>
        printString(".\n");
    800028c4:	00008517          	auipc	a0,0x8
    800028c8:	92c50513          	addi	a0,a0,-1748 # 8000a1f0 <CONSOLE_STATUS+0x1e0>
    800028cc:	00000097          	auipc	ra,0x0
    800028d0:	6fc080e7          	jalr	1788(ra) # 80002fc8 <_Z11printStringPKc>
        if(threadNum > n) {
    800028d4:	0324c663          	blt	s1,s2,80002900 <_ZN19ConsumerProducerCPP20testConsumerProducerEv+0x120>
        } else if (threadNum < 1) {
    800028d8:	03205e63          	blez	s2,80002914 <_ZN19ConsumerProducerCPP20testConsumerProducerEv+0x134>
        BufferCPP *buffer = new BufferCPP(n);
    800028dc:	03800513          	li	a0,56
    800028e0:	00004097          	auipc	ra,0x4
    800028e4:	818080e7          	jalr	-2024(ra) # 800060f8 <_Znwm>
    800028e8:	00050a93          	mv	s5,a0
    800028ec:	04050063          	beqz	a0,8000292c <_ZN19ConsumerProducerCPP20testConsumerProducerEv+0x14c>
    800028f0:	00048593          	mv	a1,s1
    800028f4:	fffff097          	auipc	ra,0xfffff
    800028f8:	074080e7          	jalr	116(ra) # 80001968 <_ZN9BufferCPPC1Ei>
    800028fc:	0300006f          	j	8000292c <_ZN19ConsumerProducerCPP20testConsumerProducerEv+0x14c>
            printString("Broj proizvodjaca ne sme biti manji od velicine bafera!\n");
    80002900:	00008517          	auipc	a0,0x8
    80002904:	8f850513          	addi	a0,a0,-1800 # 8000a1f8 <CONSOLE_STATUS+0x1e8>
    80002908:	00000097          	auipc	ra,0x0
    8000290c:	6c0080e7          	jalr	1728(ra) # 80002fc8 <_Z11printStringPKc>
            return;
    80002910:	0140006f          	j	80002924 <_ZN19ConsumerProducerCPP20testConsumerProducerEv+0x144>
            printString("Broj proizvodjaca mora biti veci od nula!\n");
    80002914:	00008517          	auipc	a0,0x8
    80002918:	92450513          	addi	a0,a0,-1756 # 8000a238 <CONSOLE_STATUS+0x228>
    8000291c:	00000097          	auipc	ra,0x0
    80002920:	6ac080e7          	jalr	1708(ra) # 80002fc8 <_Z11printStringPKc>
            return;
    80002924:	000b8113          	mv	sp,s7
    80002928:	24c0006f          	j	80002b74 <_ZN19ConsumerProducerCPP20testConsumerProducerEv+0x394>
        waitForAll = new Semaphore(0);
    8000292c:	01000513          	li	a0,16
    80002930:	00003097          	auipc	ra,0x3
    80002934:	7c8080e7          	jalr	1992(ra) # 800060f8 <_Znwm>
    80002938:	00050493          	mv	s1,a0
    8000293c:	00050863          	beqz	a0,8000294c <_ZN19ConsumerProducerCPP20testConsumerProducerEv+0x16c>
    80002940:	00000593          	li	a1,0
    80002944:	00004097          	auipc	ra,0x4
    80002948:	a40080e7          	jalr	-1472(ra) # 80006384 <_ZN9SemaphoreC1Ej>
    8000294c:	0000a717          	auipc	a4,0xa
    80002950:	45c70713          	addi	a4,a4,1116 # 8000cda8 <_ZN19ConsumerProducerCPP9threadEndE>
    80002954:	00973423          	sd	s1,8(a4)
        Thread *producers[threadNum];
    80002958:	00391793          	slli	a5,s2,0x3
    8000295c:	00f78793          	addi	a5,a5,15
    80002960:	ff07f793          	andi	a5,a5,-16
    80002964:	40f10133          	sub	sp,sp,a5
    80002968:	00010a13          	mv	s4,sp
        thread_data threadData[threadNum + 1];
    8000296c:	0019069b          	addiw	a3,s2,1
    80002970:	00169793          	slli	a5,a3,0x1
    80002974:	00d787b3          	add	a5,a5,a3
    80002978:	00379793          	slli	a5,a5,0x3
    8000297c:	00f78793          	addi	a5,a5,15
    80002980:	ff07f793          	andi	a5,a5,-16
    80002984:	40f10133          	sub	sp,sp,a5
    80002988:	00010993          	mv	s3,sp
        threadData[threadNum].id = threadNum;
    8000298c:	00191793          	slli	a5,s2,0x1
    80002990:	012787b3          	add	a5,a5,s2
    80002994:	00379793          	slli	a5,a5,0x3
    80002998:	00f987b3          	add	a5,s3,a5
    8000299c:	0127a023          	sw	s2,0(a5)
        threadData[threadNum].buffer = buffer;
    800029a0:	0157b423          	sd	s5,8(a5)
        threadData[threadNum].sem = waitForAll;
    800029a4:	00873703          	ld	a4,8(a4)
    800029a8:	00e7b823          	sd	a4,16(a5)
        Thread *consumer = new Consumer(&threadData[threadNum]);
    800029ac:	01800513          	li	a0,24
    800029b0:	00003097          	auipc	ra,0x3
    800029b4:	748080e7          	jalr	1864(ra) # 800060f8 <_Znwm>
    800029b8:	00050b13          	mv	s6,a0
    800029bc:	02050663          	beqz	a0,800029e8 <_ZN19ConsumerProducerCPP20testConsumerProducerEv+0x208>
    800029c0:	00191493          	slli	s1,s2,0x1
    800029c4:	012484b3          	add	s1,s1,s2
    800029c8:	00349493          	slli	s1,s1,0x3
    800029cc:	009984b3          	add	s1,s3,s1
        Consumer(thread_data *_td) : Thread(), td(_td) {}
    800029d0:	00004097          	auipc	ra,0x4
    800029d4:	920080e7          	jalr	-1760(ra) # 800062f0 <_ZN6ThreadC1Ev>
    800029d8:	0000a797          	auipc	a5,0xa
    800029dc:	23878793          	addi	a5,a5,568 # 8000cc10 <_ZTVN19ConsumerProducerCPP8ConsumerE+0x10>
    800029e0:	00fb3023          	sd	a5,0(s6)
    800029e4:	009b3823          	sd	s1,16(s6)
        consumer->start();
    800029e8:	000b0513          	mv	a0,s6
    800029ec:	00004097          	auipc	ra,0x4
    800029f0:	858080e7          	jalr	-1960(ra) # 80006244 <_ZN6Thread5startEv>
        threadData[0].id = 0;
    800029f4:	0009a023          	sw	zero,0(s3)
        threadData[0].buffer = buffer;
    800029f8:	0159b423          	sd	s5,8(s3)
        threadData[0].sem = waitForAll;
    800029fc:	0000a797          	auipc	a5,0xa
    80002a00:	3b47b783          	ld	a5,948(a5) # 8000cdb0 <_ZN19ConsumerProducerCPP10waitForAllE>
    80002a04:	00f9b823          	sd	a5,16(s3)
        producers[0] = new ProducerKeyborad(&threadData[0]);
    80002a08:	01800513          	li	a0,24
    80002a0c:	00003097          	auipc	ra,0x3
    80002a10:	6ec080e7          	jalr	1772(ra) # 800060f8 <_Znwm>
    80002a14:	00050493          	mv	s1,a0
    80002a18:	00050e63          	beqz	a0,80002a34 <_ZN19ConsumerProducerCPP20testConsumerProducerEv+0x254>
        ProducerKeyborad(thread_data *_td) : Thread(), td(_td) {}
    80002a1c:	00004097          	auipc	ra,0x4
    80002a20:	8d4080e7          	jalr	-1836(ra) # 800062f0 <_ZN6ThreadC1Ev>
    80002a24:	0000a797          	auipc	a5,0xa
    80002a28:	19c78793          	addi	a5,a5,412 # 8000cbc0 <_ZTVN19ConsumerProducerCPP16ProducerKeyboradE+0x10>
    80002a2c:	00f4b023          	sd	a5,0(s1)
    80002a30:	0134b823          	sd	s3,16(s1)
        producers[0] = new ProducerKeyborad(&threadData[0]);
    80002a34:	009a3023          	sd	s1,0(s4)
        producers[0]->start();
    80002a38:	00048513          	mv	a0,s1
    80002a3c:	00004097          	auipc	ra,0x4
    80002a40:	808080e7          	jalr	-2040(ra) # 80006244 <_ZN6Thread5startEv>
        for (int i = 1; i < threadNum; i++) {
    80002a44:	00100493          	li	s1,1
    80002a48:	0300006f          	j	80002a78 <_ZN19ConsumerProducerCPP20testConsumerProducerEv+0x298>
        Producer(thread_data *_td) : Thread(), td(_td) {}
    80002a4c:	0000a797          	auipc	a5,0xa
    80002a50:	19c78793          	addi	a5,a5,412 # 8000cbe8 <_ZTVN19ConsumerProducerCPP8ProducerE+0x10>
    80002a54:	00fc3023          	sd	a5,0(s8)
    80002a58:	019c3823          	sd	s9,16(s8)
            producers[i] = new Producer(&threadData[i]);
    80002a5c:	00349793          	slli	a5,s1,0x3
    80002a60:	00fa07b3          	add	a5,s4,a5
    80002a64:	0187b023          	sd	s8,0(a5)
            producers[i]->start();
    80002a68:	000c0513          	mv	a0,s8
    80002a6c:	00003097          	auipc	ra,0x3
    80002a70:	7d8080e7          	jalr	2008(ra) # 80006244 <_ZN6Thread5startEv>
        for (int i = 1; i < threadNum; i++) {
    80002a74:	0014849b          	addiw	s1,s1,1
    80002a78:	0524dc63          	bge	s1,s2,80002ad0 <_ZN19ConsumerProducerCPP20testConsumerProducerEv+0x2f0>
            threadData[i].id = i;
    80002a7c:	00149793          	slli	a5,s1,0x1
    80002a80:	009787b3          	add	a5,a5,s1
    80002a84:	00379793          	slli	a5,a5,0x3
    80002a88:	00f987b3          	add	a5,s3,a5
    80002a8c:	0097a023          	sw	s1,0(a5)
            threadData[i].buffer = buffer;
    80002a90:	0157b423          	sd	s5,8(a5)
            threadData[i].sem = waitForAll;
    80002a94:	0000a717          	auipc	a4,0xa
    80002a98:	31c73703          	ld	a4,796(a4) # 8000cdb0 <_ZN19ConsumerProducerCPP10waitForAllE>
    80002a9c:	00e7b823          	sd	a4,16(a5)
            producers[i] = new Producer(&threadData[i]);
    80002aa0:	01800513          	li	a0,24
    80002aa4:	00003097          	auipc	ra,0x3
    80002aa8:	654080e7          	jalr	1620(ra) # 800060f8 <_Znwm>
    80002aac:	00050c13          	mv	s8,a0
    80002ab0:	fa0506e3          	beqz	a0,80002a5c <_ZN19ConsumerProducerCPP20testConsumerProducerEv+0x27c>
    80002ab4:	00149c93          	slli	s9,s1,0x1
    80002ab8:	009c8cb3          	add	s9,s9,s1
    80002abc:	003c9c93          	slli	s9,s9,0x3
    80002ac0:	01998cb3          	add	s9,s3,s9
        Producer(thread_data *_td) : Thread(), td(_td) {}
    80002ac4:	00004097          	auipc	ra,0x4
    80002ac8:	82c080e7          	jalr	-2004(ra) # 800062f0 <_ZN6ThreadC1Ev>
    80002acc:	f81ff06f          	j	80002a4c <_ZN19ConsumerProducerCPP20testConsumerProducerEv+0x26c>
        Thread::dispatch();
    80002ad0:	00003097          	auipc	ra,0x3
    80002ad4:	7d0080e7          	jalr	2000(ra) # 800062a0 <_ZN6Thread8dispatchEv>
        for (int i = 0; i <= threadNum; i++) {
    80002ad8:	00000493          	li	s1,0
    80002adc:	00994e63          	blt	s2,s1,80002af8 <_ZN19ConsumerProducerCPP20testConsumerProducerEv+0x318>
            waitForAll->wait();
    80002ae0:	0000a517          	auipc	a0,0xa
    80002ae4:	2d053503          	ld	a0,720(a0) # 8000cdb0 <_ZN19ConsumerProducerCPP10waitForAllE>
    80002ae8:	00004097          	auipc	ra,0x4
    80002aec:	8d4080e7          	jalr	-1836(ra) # 800063bc <_ZN9Semaphore4waitEv>
        for (int i = 0; i <= threadNum; i++) {
    80002af0:	0014849b          	addiw	s1,s1,1
    80002af4:	fe9ff06f          	j	80002adc <_ZN19ConsumerProducerCPP20testConsumerProducerEv+0x2fc>
        delete waitForAll;
    80002af8:	0000a517          	auipc	a0,0xa
    80002afc:	2b853503          	ld	a0,696(a0) # 8000cdb0 <_ZN19ConsumerProducerCPP10waitForAllE>
    80002b00:	00050863          	beqz	a0,80002b10 <_ZN19ConsumerProducerCPP20testConsumerProducerEv+0x330>
    80002b04:	00053783          	ld	a5,0(a0)
    80002b08:	0087b783          	ld	a5,8(a5)
    80002b0c:	000780e7          	jalr	a5
        for (int i = 0; i <= threadNum; i++) {
    80002b10:	00000493          	li	s1,0
    80002b14:	0080006f          	j	80002b1c <_ZN19ConsumerProducerCPP20testConsumerProducerEv+0x33c>
        for (int i = 0; i < threadNum; i++) {
    80002b18:	0014849b          	addiw	s1,s1,1
    80002b1c:	0324d263          	bge	s1,s2,80002b40 <_ZN19ConsumerProducerCPP20testConsumerProducerEv+0x360>
            delete producers[i];
    80002b20:	00349793          	slli	a5,s1,0x3
    80002b24:	00fa07b3          	add	a5,s4,a5
    80002b28:	0007b503          	ld	a0,0(a5)
    80002b2c:	fe0506e3          	beqz	a0,80002b18 <_ZN19ConsumerProducerCPP20testConsumerProducerEv+0x338>
    80002b30:	00053783          	ld	a5,0(a0)
    80002b34:	0087b783          	ld	a5,8(a5)
    80002b38:	000780e7          	jalr	a5
    80002b3c:	fddff06f          	j	80002b18 <_ZN19ConsumerProducerCPP20testConsumerProducerEv+0x338>
        delete consumer;
    80002b40:	000b0a63          	beqz	s6,80002b54 <_ZN19ConsumerProducerCPP20testConsumerProducerEv+0x374>
    80002b44:	000b3783          	ld	a5,0(s6)
    80002b48:	0087b783          	ld	a5,8(a5)
    80002b4c:	000b0513          	mv	a0,s6
    80002b50:	000780e7          	jalr	a5
        delete buffer;
    80002b54:	000a8e63          	beqz	s5,80002b70 <_ZN19ConsumerProducerCPP20testConsumerProducerEv+0x390>
    80002b58:	000a8513          	mv	a0,s5
    80002b5c:	fffff097          	auipc	ra,0xfffff
    80002b60:	114080e7          	jalr	276(ra) # 80001c70 <_ZN9BufferCPPD1Ev>
    80002b64:	000a8513          	mv	a0,s5
    80002b68:	00003097          	auipc	ra,0x3
    80002b6c:	5b8080e7          	jalr	1464(ra) # 80006120 <_ZdlPv>
    80002b70:	000b8113          	mv	sp,s7
    }
    80002b74:	f8040113          	addi	sp,s0,-128
    80002b78:	07813083          	ld	ra,120(sp)
    80002b7c:	07013403          	ld	s0,112(sp)
    80002b80:	06813483          	ld	s1,104(sp)
    80002b84:	06013903          	ld	s2,96(sp)
    80002b88:	05813983          	ld	s3,88(sp)
    80002b8c:	05013a03          	ld	s4,80(sp)
    80002b90:	04813a83          	ld	s5,72(sp)
    80002b94:	04013b03          	ld	s6,64(sp)
    80002b98:	03813b83          	ld	s7,56(sp)
    80002b9c:	03013c03          	ld	s8,48(sp)
    80002ba0:	02813c83          	ld	s9,40(sp)
    80002ba4:	08010113          	addi	sp,sp,128
    80002ba8:	00008067          	ret
    80002bac:	00050493          	mv	s1,a0
        BufferCPP *buffer = new BufferCPP(n);
    80002bb0:	000a8513          	mv	a0,s5
    80002bb4:	00003097          	auipc	ra,0x3
    80002bb8:	56c080e7          	jalr	1388(ra) # 80006120 <_ZdlPv>
    80002bbc:	00048513          	mv	a0,s1
    80002bc0:	00011097          	auipc	ra,0x11
    80002bc4:	5c8080e7          	jalr	1480(ra) # 80014188 <_Unwind_Resume>
    80002bc8:	00050913          	mv	s2,a0
        waitForAll = new Semaphore(0);
    80002bcc:	00048513          	mv	a0,s1
    80002bd0:	00003097          	auipc	ra,0x3
    80002bd4:	550080e7          	jalr	1360(ra) # 80006120 <_ZdlPv>
    80002bd8:	00090513          	mv	a0,s2
    80002bdc:	00011097          	auipc	ra,0x11
    80002be0:	5ac080e7          	jalr	1452(ra) # 80014188 <_Unwind_Resume>
    80002be4:	00050493          	mv	s1,a0
        Thread *consumer = new Consumer(&threadData[threadNum]);
    80002be8:	000b0513          	mv	a0,s6
    80002bec:	00003097          	auipc	ra,0x3
    80002bf0:	534080e7          	jalr	1332(ra) # 80006120 <_ZdlPv>
    80002bf4:	00048513          	mv	a0,s1
    80002bf8:	00011097          	auipc	ra,0x11
    80002bfc:	590080e7          	jalr	1424(ra) # 80014188 <_Unwind_Resume>
    80002c00:	00050913          	mv	s2,a0
        producers[0] = new ProducerKeyborad(&threadData[0]);
    80002c04:	00048513          	mv	a0,s1
    80002c08:	00003097          	auipc	ra,0x3
    80002c0c:	518080e7          	jalr	1304(ra) # 80006120 <_ZdlPv>
    80002c10:	00090513          	mv	a0,s2
    80002c14:	00011097          	auipc	ra,0x11
    80002c18:	574080e7          	jalr	1396(ra) # 80014188 <_Unwind_Resume>
    80002c1c:	00050493          	mv	s1,a0
            producers[i] = new Producer(&threadData[i]);
    80002c20:	000c0513          	mv	a0,s8
    80002c24:	00003097          	auipc	ra,0x3
    80002c28:	4fc080e7          	jalr	1276(ra) # 80006120 <_ZdlPv>
    80002c2c:	00048513          	mv	a0,s1
    80002c30:	00011097          	auipc	ra,0x11
    80002c34:	558080e7          	jalr	1368(ra) # 80014188 <_Unwind_Resume>

0000000080002c38 <_Z8userMainv>:
#include "../test/ThreadTestPeriodic.hpp"

#include "../test/userMain1.hpp"
#include "../test/userMain2.hpp"

void userMain() {
    80002c38:	ff010113          	addi	sp,sp,-16
    80002c3c:	00113423          	sd	ra,8(sp)
    80002c40:	00813023          	sd	s0,0(sp)
    80002c44:	01010413          	addi	s0,sp,16
    //testSleeping(); // thread_sleep test C API
    //ConsumerProducerCPP::testConsumerProducer(); // zadatak 4. CPP API i asinhrona promena konteksta, kompletan test svega



    userMain1(); // prvi test
    80002c48:	fffff097          	auipc	ra,0xfffff
    80002c4c:	128080e7          	jalr	296(ra) # 80001d70 <_Z9userMain1v>
    //userMain2(); //drugi test

}
    80002c50:	00813083          	ld	ra,8(sp)
    80002c54:	00013403          	ld	s0,0(sp)
    80002c58:	01010113          	addi	sp,sp,16
    80002c5c:	00008067          	ret

0000000080002c60 <_ZN19ConsumerProducerCPP8Consumer3runEv>:
        void run() override {
    80002c60:	fd010113          	addi	sp,sp,-48
    80002c64:	02113423          	sd	ra,40(sp)
    80002c68:	02813023          	sd	s0,32(sp)
    80002c6c:	00913c23          	sd	s1,24(sp)
    80002c70:	01213823          	sd	s2,16(sp)
    80002c74:	01313423          	sd	s3,8(sp)
    80002c78:	03010413          	addi	s0,sp,48
    80002c7c:	00050913          	mv	s2,a0
            int i = 0;
    80002c80:	00000993          	li	s3,0
    80002c84:	0100006f          	j	80002c94 <_ZN19ConsumerProducerCPP8Consumer3runEv+0x34>
                    Console::putc('\n');
    80002c88:	00a00513          	li	a0,10
    80002c8c:	00003097          	auipc	ra,0x3
    80002c90:	6d0080e7          	jalr	1744(ra) # 8000635c <_ZN7Console4putcEc>
            while (!threadEnd) {
    80002c94:	0000a797          	auipc	a5,0xa
    80002c98:	1147a783          	lw	a5,276(a5) # 8000cda8 <_ZN19ConsumerProducerCPP9threadEndE>
    80002c9c:	04079a63          	bnez	a5,80002cf0 <_ZN19ConsumerProducerCPP8Consumer3runEv+0x90>
                int key = td->buffer->get();
    80002ca0:	01093783          	ld	a5,16(s2)
    80002ca4:	0087b503          	ld	a0,8(a5)
    80002ca8:	fffff097          	auipc	ra,0xfffff
    80002cac:	eb4080e7          	jalr	-332(ra) # 80001b5c <_ZN9BufferCPP3getEv>
                i++;
    80002cb0:	0019849b          	addiw	s1,s3,1
    80002cb4:	0004899b          	sext.w	s3,s1
                Console::putc(key);
    80002cb8:	0ff57513          	andi	a0,a0,255
    80002cbc:	00003097          	auipc	ra,0x3
    80002cc0:	6a0080e7          	jalr	1696(ra) # 8000635c <_ZN7Console4putcEc>
                if (i % 80 == 0) {
    80002cc4:	05000793          	li	a5,80
    80002cc8:	02f4e4bb          	remw	s1,s1,a5
    80002ccc:	fc0494e3          	bnez	s1,80002c94 <_ZN19ConsumerProducerCPP8Consumer3runEv+0x34>
    80002cd0:	fb9ff06f          	j	80002c88 <_ZN19ConsumerProducerCPP8Consumer3runEv+0x28>
                int key = td->buffer->get();
    80002cd4:	01093783          	ld	a5,16(s2)
    80002cd8:	0087b503          	ld	a0,8(a5)
    80002cdc:	fffff097          	auipc	ra,0xfffff
    80002ce0:	e80080e7          	jalr	-384(ra) # 80001b5c <_ZN9BufferCPP3getEv>
                Console::putc(key);
    80002ce4:	0ff57513          	andi	a0,a0,255
    80002ce8:	00003097          	auipc	ra,0x3
    80002cec:	674080e7          	jalr	1652(ra) # 8000635c <_ZN7Console4putcEc>
            while (td->buffer->getCnt() > 0) {
    80002cf0:	01093783          	ld	a5,16(s2)
    80002cf4:	0087b503          	ld	a0,8(a5)
    80002cf8:	fffff097          	auipc	ra,0xfffff
    80002cfc:	ef0080e7          	jalr	-272(ra) # 80001be8 <_ZN9BufferCPP6getCntEv>
    80002d00:	fca04ae3          	bgtz	a0,80002cd4 <_ZN19ConsumerProducerCPP8Consumer3runEv+0x74>
            td->sem->signal();
    80002d04:	01093783          	ld	a5,16(s2)
    80002d08:	0107b503          	ld	a0,16(a5)
    80002d0c:	00003097          	auipc	ra,0x3
    80002d10:	6dc080e7          	jalr	1756(ra) # 800063e8 <_ZN9Semaphore6signalEv>
        }
    80002d14:	02813083          	ld	ra,40(sp)
    80002d18:	02013403          	ld	s0,32(sp)
    80002d1c:	01813483          	ld	s1,24(sp)
    80002d20:	01013903          	ld	s2,16(sp)
    80002d24:	00813983          	ld	s3,8(sp)
    80002d28:	03010113          	addi	sp,sp,48
    80002d2c:	00008067          	ret

0000000080002d30 <_ZN19ConsumerProducerCPP8ConsumerD1Ev>:
    class Consumer : public Thread {
    80002d30:	ff010113          	addi	sp,sp,-16
    80002d34:	00113423          	sd	ra,8(sp)
    80002d38:	00813023          	sd	s0,0(sp)
    80002d3c:	01010413          	addi	s0,sp,16
    80002d40:	0000a797          	auipc	a5,0xa
    80002d44:	ed078793          	addi	a5,a5,-304 # 8000cc10 <_ZTVN19ConsumerProducerCPP8ConsumerE+0x10>
    80002d48:	00f53023          	sd	a5,0(a0)
    80002d4c:	00003097          	auipc	ra,0x3
    80002d50:	308080e7          	jalr	776(ra) # 80006054 <_ZN6ThreadD1Ev>
    80002d54:	00813083          	ld	ra,8(sp)
    80002d58:	00013403          	ld	s0,0(sp)
    80002d5c:	01010113          	addi	sp,sp,16
    80002d60:	00008067          	ret

0000000080002d64 <_ZN19ConsumerProducerCPP8ConsumerD0Ev>:
    80002d64:	fe010113          	addi	sp,sp,-32
    80002d68:	00113c23          	sd	ra,24(sp)
    80002d6c:	00813823          	sd	s0,16(sp)
    80002d70:	00913423          	sd	s1,8(sp)
    80002d74:	02010413          	addi	s0,sp,32
    80002d78:	00050493          	mv	s1,a0
    80002d7c:	0000a797          	auipc	a5,0xa
    80002d80:	e9478793          	addi	a5,a5,-364 # 8000cc10 <_ZTVN19ConsumerProducerCPP8ConsumerE+0x10>
    80002d84:	00f53023          	sd	a5,0(a0)
    80002d88:	00003097          	auipc	ra,0x3
    80002d8c:	2cc080e7          	jalr	716(ra) # 80006054 <_ZN6ThreadD1Ev>
    80002d90:	00048513          	mv	a0,s1
    80002d94:	00003097          	auipc	ra,0x3
    80002d98:	38c080e7          	jalr	908(ra) # 80006120 <_ZdlPv>
    80002d9c:	01813083          	ld	ra,24(sp)
    80002da0:	01013403          	ld	s0,16(sp)
    80002da4:	00813483          	ld	s1,8(sp)
    80002da8:	02010113          	addi	sp,sp,32
    80002dac:	00008067          	ret

0000000080002db0 <_ZN19ConsumerProducerCPP16ProducerKeyboradD1Ev>:
    class ProducerKeyborad : public Thread {
    80002db0:	ff010113          	addi	sp,sp,-16
    80002db4:	00113423          	sd	ra,8(sp)
    80002db8:	00813023          	sd	s0,0(sp)
    80002dbc:	01010413          	addi	s0,sp,16
    80002dc0:	0000a797          	auipc	a5,0xa
    80002dc4:	e0078793          	addi	a5,a5,-512 # 8000cbc0 <_ZTVN19ConsumerProducerCPP16ProducerKeyboradE+0x10>
    80002dc8:	00f53023          	sd	a5,0(a0)
    80002dcc:	00003097          	auipc	ra,0x3
    80002dd0:	288080e7          	jalr	648(ra) # 80006054 <_ZN6ThreadD1Ev>
    80002dd4:	00813083          	ld	ra,8(sp)
    80002dd8:	00013403          	ld	s0,0(sp)
    80002ddc:	01010113          	addi	sp,sp,16
    80002de0:	00008067          	ret

0000000080002de4 <_ZN19ConsumerProducerCPP16ProducerKeyboradD0Ev>:
    80002de4:	fe010113          	addi	sp,sp,-32
    80002de8:	00113c23          	sd	ra,24(sp)
    80002dec:	00813823          	sd	s0,16(sp)
    80002df0:	00913423          	sd	s1,8(sp)
    80002df4:	02010413          	addi	s0,sp,32
    80002df8:	00050493          	mv	s1,a0
    80002dfc:	0000a797          	auipc	a5,0xa
    80002e00:	dc478793          	addi	a5,a5,-572 # 8000cbc0 <_ZTVN19ConsumerProducerCPP16ProducerKeyboradE+0x10>
    80002e04:	00f53023          	sd	a5,0(a0)
    80002e08:	00003097          	auipc	ra,0x3
    80002e0c:	24c080e7          	jalr	588(ra) # 80006054 <_ZN6ThreadD1Ev>
    80002e10:	00048513          	mv	a0,s1
    80002e14:	00003097          	auipc	ra,0x3
    80002e18:	30c080e7          	jalr	780(ra) # 80006120 <_ZdlPv>
    80002e1c:	01813083          	ld	ra,24(sp)
    80002e20:	01013403          	ld	s0,16(sp)
    80002e24:	00813483          	ld	s1,8(sp)
    80002e28:	02010113          	addi	sp,sp,32
    80002e2c:	00008067          	ret

0000000080002e30 <_ZN19ConsumerProducerCPP8ProducerD1Ev>:
    class Producer : public Thread {
    80002e30:	ff010113          	addi	sp,sp,-16
    80002e34:	00113423          	sd	ra,8(sp)
    80002e38:	00813023          	sd	s0,0(sp)
    80002e3c:	01010413          	addi	s0,sp,16
    80002e40:	0000a797          	auipc	a5,0xa
    80002e44:	da878793          	addi	a5,a5,-600 # 8000cbe8 <_ZTVN19ConsumerProducerCPP8ProducerE+0x10>
    80002e48:	00f53023          	sd	a5,0(a0)
    80002e4c:	00003097          	auipc	ra,0x3
    80002e50:	208080e7          	jalr	520(ra) # 80006054 <_ZN6ThreadD1Ev>
    80002e54:	00813083          	ld	ra,8(sp)
    80002e58:	00013403          	ld	s0,0(sp)
    80002e5c:	01010113          	addi	sp,sp,16
    80002e60:	00008067          	ret

0000000080002e64 <_ZN19ConsumerProducerCPP8ProducerD0Ev>:
    80002e64:	fe010113          	addi	sp,sp,-32
    80002e68:	00113c23          	sd	ra,24(sp)
    80002e6c:	00813823          	sd	s0,16(sp)
    80002e70:	00913423          	sd	s1,8(sp)
    80002e74:	02010413          	addi	s0,sp,32
    80002e78:	00050493          	mv	s1,a0
    80002e7c:	0000a797          	auipc	a5,0xa
    80002e80:	d6c78793          	addi	a5,a5,-660 # 8000cbe8 <_ZTVN19ConsumerProducerCPP8ProducerE+0x10>
    80002e84:	00f53023          	sd	a5,0(a0)
    80002e88:	00003097          	auipc	ra,0x3
    80002e8c:	1cc080e7          	jalr	460(ra) # 80006054 <_ZN6ThreadD1Ev>
    80002e90:	00048513          	mv	a0,s1
    80002e94:	00003097          	auipc	ra,0x3
    80002e98:	28c080e7          	jalr	652(ra) # 80006120 <_ZdlPv>
    80002e9c:	01813083          	ld	ra,24(sp)
    80002ea0:	01013403          	ld	s0,16(sp)
    80002ea4:	00813483          	ld	s1,8(sp)
    80002ea8:	02010113          	addi	sp,sp,32
    80002eac:	00008067          	ret

0000000080002eb0 <_ZN19ConsumerProducerCPP16ProducerKeyborad3runEv>:
        void run() override {
    80002eb0:	fe010113          	addi	sp,sp,-32
    80002eb4:	00113c23          	sd	ra,24(sp)
    80002eb8:	00813823          	sd	s0,16(sp)
    80002ebc:	00913423          	sd	s1,8(sp)
    80002ec0:	02010413          	addi	s0,sp,32
    80002ec4:	00050493          	mv	s1,a0
            while ((key = getc()) != 0x1b) {
    80002ec8:	00002097          	auipc	ra,0x2
    80002ecc:	aa0080e7          	jalr	-1376(ra) # 80004968 <_Z4getcv>
    80002ed0:	0005059b          	sext.w	a1,a0
    80002ed4:	01b00793          	li	a5,27
    80002ed8:	00f58c63          	beq	a1,a5,80002ef0 <_ZN19ConsumerProducerCPP16ProducerKeyborad3runEv+0x40>
                td->buffer->put(key);
    80002edc:	0104b783          	ld	a5,16(s1)
    80002ee0:	0087b503          	ld	a0,8(a5)
    80002ee4:	fffff097          	auipc	ra,0xfffff
    80002ee8:	be8080e7          	jalr	-1048(ra) # 80001acc <_ZN9BufferCPP3putEi>
            while ((key = getc()) != 0x1b) {
    80002eec:	fddff06f          	j	80002ec8 <_ZN19ConsumerProducerCPP16ProducerKeyborad3runEv+0x18>
            threadEnd = 1;
    80002ef0:	00100793          	li	a5,1
    80002ef4:	0000a717          	auipc	a4,0xa
    80002ef8:	eaf72a23          	sw	a5,-332(a4) # 8000cda8 <_ZN19ConsumerProducerCPP9threadEndE>
            td->buffer->put('!');
    80002efc:	0104b783          	ld	a5,16(s1)
    80002f00:	02100593          	li	a1,33
    80002f04:	0087b503          	ld	a0,8(a5)
    80002f08:	fffff097          	auipc	ra,0xfffff
    80002f0c:	bc4080e7          	jalr	-1084(ra) # 80001acc <_ZN9BufferCPP3putEi>
            td->sem->signal();
    80002f10:	0104b783          	ld	a5,16(s1)
    80002f14:	0107b503          	ld	a0,16(a5)
    80002f18:	00003097          	auipc	ra,0x3
    80002f1c:	4d0080e7          	jalr	1232(ra) # 800063e8 <_ZN9Semaphore6signalEv>
        }
    80002f20:	01813083          	ld	ra,24(sp)
    80002f24:	01013403          	ld	s0,16(sp)
    80002f28:	00813483          	ld	s1,8(sp)
    80002f2c:	02010113          	addi	sp,sp,32
    80002f30:	00008067          	ret

0000000080002f34 <_ZN19ConsumerProducerCPP8Producer3runEv>:
        void run() override {
    80002f34:	fe010113          	addi	sp,sp,-32
    80002f38:	00113c23          	sd	ra,24(sp)
    80002f3c:	00813823          	sd	s0,16(sp)
    80002f40:	00913423          	sd	s1,8(sp)
    80002f44:	01213023          	sd	s2,0(sp)
    80002f48:	02010413          	addi	s0,sp,32
    80002f4c:	00050493          	mv	s1,a0
            int i = 0;
    80002f50:	00000913          	li	s2,0
            while (!threadEnd) {
    80002f54:	0000a797          	auipc	a5,0xa
    80002f58:	e547a783          	lw	a5,-428(a5) # 8000cda8 <_ZN19ConsumerProducerCPP9threadEndE>
    80002f5c:	04079263          	bnez	a5,80002fa0 <_ZN19ConsumerProducerCPP8Producer3runEv+0x6c>
                td->buffer->put(td->id + '0');
    80002f60:	0104b783          	ld	a5,16(s1)
    80002f64:	0007a583          	lw	a1,0(a5)
    80002f68:	0305859b          	addiw	a1,a1,48
    80002f6c:	0087b503          	ld	a0,8(a5)
    80002f70:	fffff097          	auipc	ra,0xfffff
    80002f74:	b5c080e7          	jalr	-1188(ra) # 80001acc <_ZN9BufferCPP3putEi>
                i++;
    80002f78:	0019071b          	addiw	a4,s2,1
    80002f7c:	0007091b          	sext.w	s2,a4
                Thread::sleep((i+td->id)%5);
    80002f80:	0104b783          	ld	a5,16(s1)
    80002f84:	0007a783          	lw	a5,0(a5)
    80002f88:	00e787bb          	addw	a5,a5,a4
    80002f8c:	00500513          	li	a0,5
    80002f90:	02a7e53b          	remw	a0,a5,a0
    80002f94:	00003097          	auipc	ra,0x3
    80002f98:	334080e7          	jalr	820(ra) # 800062c8 <_ZN6Thread5sleepEm>
            while (!threadEnd) {
    80002f9c:	fb9ff06f          	j	80002f54 <_ZN19ConsumerProducerCPP8Producer3runEv+0x20>
            td->sem->signal();
    80002fa0:	0104b783          	ld	a5,16(s1)
    80002fa4:	0107b503          	ld	a0,16(a5)
    80002fa8:	00003097          	auipc	ra,0x3
    80002fac:	440080e7          	jalr	1088(ra) # 800063e8 <_ZN9Semaphore6signalEv>
        }
    80002fb0:	01813083          	ld	ra,24(sp)
    80002fb4:	01013403          	ld	s0,16(sp)
    80002fb8:	00813483          	ld	s1,8(sp)
    80002fbc:	00013903          	ld	s2,0(sp)
    80002fc0:	02010113          	addi	sp,sp,32
    80002fc4:	00008067          	ret

0000000080002fc8 <_Z11printStringPKc>:

#define LOCK() while(copy_and_swap(lockPrint, 0, 1))
#define UNLOCK() while(copy_and_swap(lockPrint, 1, 0))

void printString(char const *string)
{
    80002fc8:	fe010113          	addi	sp,sp,-32
    80002fcc:	00113c23          	sd	ra,24(sp)
    80002fd0:	00813823          	sd	s0,16(sp)
    80002fd4:	00913423          	sd	s1,8(sp)
    80002fd8:	02010413          	addi	s0,sp,32
    80002fdc:	00050493          	mv	s1,a0
    LOCK();
    80002fe0:	00100613          	li	a2,1
    80002fe4:	00000593          	li	a1,0
    80002fe8:	0000a517          	auipc	a0,0xa
    80002fec:	dd050513          	addi	a0,a0,-560 # 8000cdb8 <lockPrint>
    80002ff0:	ffffe097          	auipc	ra,0xffffe
    80002ff4:	010080e7          	jalr	16(ra) # 80001000 <copy_and_swap>
    80002ff8:	fe0514e3          	bnez	a0,80002fe0 <_Z11printStringPKc+0x18>
    while (*string != '\0')
    80002ffc:	0004c503          	lbu	a0,0(s1)
    80003000:	00050a63          	beqz	a0,80003014 <_Z11printStringPKc+0x4c>
    {
        putc(*string);
    80003004:	00002097          	auipc	ra,0x2
    80003008:	998080e7          	jalr	-1640(ra) # 8000499c <_Z4putcc>
        string++;
    8000300c:	00148493          	addi	s1,s1,1
    while (*string != '\0')
    80003010:	fedff06f          	j	80002ffc <_Z11printStringPKc+0x34>
    }
    UNLOCK();
    80003014:	00000613          	li	a2,0
    80003018:	00100593          	li	a1,1
    8000301c:	0000a517          	auipc	a0,0xa
    80003020:	d9c50513          	addi	a0,a0,-612 # 8000cdb8 <lockPrint>
    80003024:	ffffe097          	auipc	ra,0xffffe
    80003028:	fdc080e7          	jalr	-36(ra) # 80001000 <copy_and_swap>
    8000302c:	fe0514e3          	bnez	a0,80003014 <_Z11printStringPKc+0x4c>
}
    80003030:	01813083          	ld	ra,24(sp)
    80003034:	01013403          	ld	s0,16(sp)
    80003038:	00813483          	ld	s1,8(sp)
    8000303c:	02010113          	addi	sp,sp,32
    80003040:	00008067          	ret

0000000080003044 <_Z9getStringPci>:

char* getString(char *buf, int max) {
    80003044:	fd010113          	addi	sp,sp,-48
    80003048:	02113423          	sd	ra,40(sp)
    8000304c:	02813023          	sd	s0,32(sp)
    80003050:	00913c23          	sd	s1,24(sp)
    80003054:	01213823          	sd	s2,16(sp)
    80003058:	01313423          	sd	s3,8(sp)
    8000305c:	01413023          	sd	s4,0(sp)
    80003060:	03010413          	addi	s0,sp,48
    80003064:	00050993          	mv	s3,a0
    80003068:	00058a13          	mv	s4,a1
    LOCK();
    8000306c:	00100613          	li	a2,1
    80003070:	00000593          	li	a1,0
    80003074:	0000a517          	auipc	a0,0xa
    80003078:	d4450513          	addi	a0,a0,-700 # 8000cdb8 <lockPrint>
    8000307c:	ffffe097          	auipc	ra,0xffffe
    80003080:	f84080e7          	jalr	-124(ra) # 80001000 <copy_and_swap>
    80003084:	fe0514e3          	bnez	a0,8000306c <_Z9getStringPci+0x28>
    int i, cc;
    char c;

    for(i=0; i+1 < max; ){
    80003088:	00000913          	li	s2,0
    8000308c:	00090493          	mv	s1,s2
    80003090:	0019091b          	addiw	s2,s2,1
    80003094:	03495a63          	bge	s2,s4,800030c8 <_Z9getStringPci+0x84>
        cc = getc();
    80003098:	00002097          	auipc	ra,0x2
    8000309c:	8d0080e7          	jalr	-1840(ra) # 80004968 <_Z4getcv>
        if(cc < 1)
    800030a0:	02050463          	beqz	a0,800030c8 <_Z9getStringPci+0x84>
            break;
        c = cc;
        buf[i++] = c;
    800030a4:	009984b3          	add	s1,s3,s1
    800030a8:	00a48023          	sb	a0,0(s1)
        if(c == '\n' || c == '\r')
    800030ac:	00a00793          	li	a5,10
    800030b0:	00f50a63          	beq	a0,a5,800030c4 <_Z9getStringPci+0x80>
    800030b4:	00d00793          	li	a5,13
    800030b8:	fcf51ae3          	bne	a0,a5,8000308c <_Z9getStringPci+0x48>
        buf[i++] = c;
    800030bc:	00090493          	mv	s1,s2
    800030c0:	0080006f          	j	800030c8 <_Z9getStringPci+0x84>
    800030c4:	00090493          	mv	s1,s2
            break;
    }
    buf[i] = '\0';
    800030c8:	009984b3          	add	s1,s3,s1
    800030cc:	00048023          	sb	zero,0(s1)

    UNLOCK();
    800030d0:	00000613          	li	a2,0
    800030d4:	00100593          	li	a1,1
    800030d8:	0000a517          	auipc	a0,0xa
    800030dc:	ce050513          	addi	a0,a0,-800 # 8000cdb8 <lockPrint>
    800030e0:	ffffe097          	auipc	ra,0xffffe
    800030e4:	f20080e7          	jalr	-224(ra) # 80001000 <copy_and_swap>
    800030e8:	fe0514e3          	bnez	a0,800030d0 <_Z9getStringPci+0x8c>
    return buf;
}
    800030ec:	00098513          	mv	a0,s3
    800030f0:	02813083          	ld	ra,40(sp)
    800030f4:	02013403          	ld	s0,32(sp)
    800030f8:	01813483          	ld	s1,24(sp)
    800030fc:	01013903          	ld	s2,16(sp)
    80003100:	00813983          	ld	s3,8(sp)
    80003104:	00013a03          	ld	s4,0(sp)
    80003108:	03010113          	addi	sp,sp,48
    8000310c:	00008067          	ret

0000000080003110 <_Z11stringToIntPKc>:

int stringToInt(const char *s) {
    80003110:	ff010113          	addi	sp,sp,-16
    80003114:	00813423          	sd	s0,8(sp)
    80003118:	01010413          	addi	s0,sp,16
    8000311c:	00050693          	mv	a3,a0
    int n;

    n = 0;
    80003120:	00000513          	li	a0,0
    while ('0' <= *s && *s <= '9')
    80003124:	0006c603          	lbu	a2,0(a3)
    80003128:	fd06071b          	addiw	a4,a2,-48
    8000312c:	0ff77713          	andi	a4,a4,255
    80003130:	00900793          	li	a5,9
    80003134:	02e7e063          	bltu	a5,a4,80003154 <_Z11stringToIntPKc+0x44>
        n = n * 10 + *s++ - '0';
    80003138:	0025179b          	slliw	a5,a0,0x2
    8000313c:	00a787bb          	addw	a5,a5,a0
    80003140:	0017979b          	slliw	a5,a5,0x1
    80003144:	00168693          	addi	a3,a3,1
    80003148:	00c787bb          	addw	a5,a5,a2
    8000314c:	fd07851b          	addiw	a0,a5,-48
    while ('0' <= *s && *s <= '9')
    80003150:	fd5ff06f          	j	80003124 <_Z11stringToIntPKc+0x14>
    return n;
}
    80003154:	00813403          	ld	s0,8(sp)
    80003158:	01010113          	addi	sp,sp,16
    8000315c:	00008067          	ret

0000000080003160 <_Z8printIntiii>:

char digits[] = "0123456789ABCDEF";

void printInt(int xx, int base, int sgn)
{
    80003160:	fc010113          	addi	sp,sp,-64
    80003164:	02113c23          	sd	ra,56(sp)
    80003168:	02813823          	sd	s0,48(sp)
    8000316c:	02913423          	sd	s1,40(sp)
    80003170:	03213023          	sd	s2,32(sp)
    80003174:	01313c23          	sd	s3,24(sp)
    80003178:	04010413          	addi	s0,sp,64
    8000317c:	00050493          	mv	s1,a0
    80003180:	00058913          	mv	s2,a1
    80003184:	00060993          	mv	s3,a2
    LOCK();
    80003188:	00100613          	li	a2,1
    8000318c:	00000593          	li	a1,0
    80003190:	0000a517          	auipc	a0,0xa
    80003194:	c2850513          	addi	a0,a0,-984 # 8000cdb8 <lockPrint>
    80003198:	ffffe097          	auipc	ra,0xffffe
    8000319c:	e68080e7          	jalr	-408(ra) # 80001000 <copy_and_swap>
    800031a0:	fe0514e3          	bnez	a0,80003188 <_Z8printIntiii+0x28>
    char buf[16];
    int i, neg;
    uint x;

    neg = 0;
    if(sgn && xx < 0){
    800031a4:	00098463          	beqz	s3,800031ac <_Z8printIntiii+0x4c>
    800031a8:	0804c463          	bltz	s1,80003230 <_Z8printIntiii+0xd0>
        neg = 1;
        x = -xx;
    } else {
        x = xx;
    800031ac:	0004851b          	sext.w	a0,s1
    neg = 0;
    800031b0:	00000593          	li	a1,0
    }

    i = 0;
    800031b4:	00000493          	li	s1,0
    do{
        buf[i++] = digits[x % base];
    800031b8:	0009079b          	sext.w	a5,s2
    800031bc:	0325773b          	remuw	a4,a0,s2
    800031c0:	00048613          	mv	a2,s1
    800031c4:	0014849b          	addiw	s1,s1,1
    800031c8:	02071693          	slli	a3,a4,0x20
    800031cc:	0206d693          	srli	a3,a3,0x20
    800031d0:	0000a717          	auipc	a4,0xa
    800031d4:	a5870713          	addi	a4,a4,-1448 # 8000cc28 <digits>
    800031d8:	00d70733          	add	a4,a4,a3
    800031dc:	00074683          	lbu	a3,0(a4)
    800031e0:	fd040713          	addi	a4,s0,-48
    800031e4:	00c70733          	add	a4,a4,a2
    800031e8:	fed70823          	sb	a3,-16(a4)
    }while((x /= base) != 0);
    800031ec:	0005071b          	sext.w	a4,a0
    800031f0:	0325553b          	divuw	a0,a0,s2
    800031f4:	fcf772e3          	bgeu	a4,a5,800031b8 <_Z8printIntiii+0x58>
    if(neg)
    800031f8:	00058c63          	beqz	a1,80003210 <_Z8printIntiii+0xb0>
        buf[i++] = '-';
    800031fc:	fd040793          	addi	a5,s0,-48
    80003200:	009784b3          	add	s1,a5,s1
    80003204:	02d00793          	li	a5,45
    80003208:	fef48823          	sb	a5,-16(s1)
    8000320c:	0026049b          	addiw	s1,a2,2

    while(--i >= 0)
    80003210:	fff4849b          	addiw	s1,s1,-1
    80003214:	0204c463          	bltz	s1,8000323c <_Z8printIntiii+0xdc>
        putc(buf[i]);
    80003218:	fd040793          	addi	a5,s0,-48
    8000321c:	009787b3          	add	a5,a5,s1
    80003220:	ff07c503          	lbu	a0,-16(a5)
    80003224:	00001097          	auipc	ra,0x1
    80003228:	778080e7          	jalr	1912(ra) # 8000499c <_Z4putcc>
    8000322c:	fe5ff06f          	j	80003210 <_Z8printIntiii+0xb0>
        x = -xx;
    80003230:	4090053b          	negw	a0,s1
        neg = 1;
    80003234:	00100593          	li	a1,1
        x = -xx;
    80003238:	f7dff06f          	j	800031b4 <_Z8printIntiii+0x54>

    UNLOCK();
    8000323c:	00000613          	li	a2,0
    80003240:	00100593          	li	a1,1
    80003244:	0000a517          	auipc	a0,0xa
    80003248:	b7450513          	addi	a0,a0,-1164 # 8000cdb8 <lockPrint>
    8000324c:	ffffe097          	auipc	ra,0xffffe
    80003250:	db4080e7          	jalr	-588(ra) # 80001000 <copy_and_swap>
    80003254:	fe0514e3          	bnez	a0,8000323c <_Z8printIntiii+0xdc>
    80003258:	03813083          	ld	ra,56(sp)
    8000325c:	03013403          	ld	s0,48(sp)
    80003260:	02813483          	ld	s1,40(sp)
    80003264:	02013903          	ld	s2,32(sp)
    80003268:	01813983          	ld	s3,24(sp)
    8000326c:	04010113          	addi	sp,sp,64
    80003270:	00008067          	ret

0000000080003274 <_Z41__static_initialization_and_destruction_0ii>:

void Scheduler::put(TCB *ccb){
    if(ccb == nullptr)
        return;
    readyCoroutineQueue.addLast(ccb);
}
    80003274:	ff010113          	addi	sp,sp,-16
    80003278:	00813423          	sd	s0,8(sp)
    8000327c:	01010413          	addi	s0,sp,16
    80003280:	00100793          	li	a5,1
    80003284:	00f50863          	beq	a0,a5,80003294 <_Z41__static_initialization_and_destruction_0ii+0x20>
    80003288:	00813403          	ld	s0,8(sp)
    8000328c:	01010113          	addi	sp,sp,16
    80003290:	00008067          	ret
    80003294:	000107b7          	lui	a5,0x10
    80003298:	fff78793          	addi	a5,a5,-1 # ffff <_entry-0x7fff0001>
    8000329c:	fef596e3          	bne	a1,a5,80003288 <_Z41__static_initialization_and_destruction_0ii+0x14>

public:



    List() : head(0), tail(0), current(0) {}
    800032a0:	0000a797          	auipc	a5,0xa
    800032a4:	b2078793          	addi	a5,a5,-1248 # 8000cdc0 <_ZN9Scheduler19readyCoroutineQueueE>
    800032a8:	0007b023          	sd	zero,0(a5)
    800032ac:	0007b423          	sd	zero,8(a5)
    800032b0:	0007b823          	sd	zero,16(a5)
    800032b4:	fd5ff06f          	j	80003288 <_Z41__static_initialization_and_destruction_0ii+0x14>

00000000800032b8 <_ZN9Scheduler3getEv>:
TCB *Scheduler::get(){
    800032b8:	fe010113          	addi	sp,sp,-32
    800032bc:	00113c23          	sd	ra,24(sp)
    800032c0:	00813823          	sd	s0,16(sp)
    800032c4:	00913423          	sd	s1,8(sp)
    800032c8:	01213023          	sd	s2,0(sp)
    800032cc:	02010413          	addi	s0,sp,32
        } else
            head = tail = elem;
    }

    T *removeFirst(){
        if (!head)
    800032d0:	0000a497          	auipc	s1,0xa
    800032d4:	af04b483          	ld	s1,-1296(s1) # 8000cdc0 <_ZN9Scheduler19readyCoroutineQueueE>
    800032d8:	04048c63          	beqz	s1,80003330 <_ZN9Scheduler3getEv+0x78>
            return 0;

        Elem *elem = head;
        head = head->next;
    800032dc:	0084b783          	ld	a5,8(s1)
    800032e0:	0000a717          	auipc	a4,0xa
    800032e4:	aef73023          	sd	a5,-1312(a4) # 8000cdc0 <_ZN9Scheduler19readyCoroutineQueueE>
        if (!head)
    800032e8:	02078e63          	beqz	a5,80003324 <_ZN9Scheduler3getEv+0x6c>
            tail = 0;

        T *ret = elem->data;
    800032ec:	0004b903          	ld	s2,0(s1)
            SlabAllocator::getInstance().deallocKernel(addr, SlabAllocator::LISTELEM);
    800032f0:	00001097          	auipc	ra,0x1
    800032f4:	7d8080e7          	jalr	2008(ra) # 80004ac8 <_ZN13SlabAllocator11getInstanceEv>
    800032f8:	00200613          	li	a2,2
    800032fc:	00048593          	mv	a1,s1
    80003300:	00002097          	auipc	ra,0x2
    80003304:	cb0080e7          	jalr	-848(ra) # 80004fb0 <_ZN13SlabAllocator13deallocKernelEPvNS_16kernelCacheEntryE>
}
    80003308:	00090513          	mv	a0,s2
    8000330c:	01813083          	ld	ra,24(sp)
    80003310:	01013403          	ld	s0,16(sp)
    80003314:	00813483          	ld	s1,8(sp)
    80003318:	00013903          	ld	s2,0(sp)
    8000331c:	02010113          	addi	sp,sp,32
    80003320:	00008067          	ret
            tail = 0;
    80003324:	0000a797          	auipc	a5,0xa
    80003328:	aa07b223          	sd	zero,-1372(a5) # 8000cdc8 <_ZN9Scheduler19readyCoroutineQueueE+0x8>
    8000332c:	fc1ff06f          	j	800032ec <_ZN9Scheduler3getEv+0x34>
            return 0;
    80003330:	00048913          	mv	s2,s1
    return readyCoroutineQueue.removeFirst();
    80003334:	fd5ff06f          	j	80003308 <_ZN9Scheduler3getEv+0x50>

0000000080003338 <_ZN9Scheduler3putEP3TCB>:
    if(ccb == nullptr)
    80003338:	08050263          	beqz	a0,800033bc <_ZN9Scheduler3putEP3TCB+0x84>
void Scheduler::put(TCB *ccb){
    8000333c:	fe010113          	addi	sp,sp,-32
    80003340:	00113c23          	sd	ra,24(sp)
    80003344:	00813823          	sd	s0,16(sp)
    80003348:	00913423          	sd	s1,8(sp)
    8000334c:	02010413          	addi	s0,sp,32
    80003350:	00050493          	mv	s1,a0
            void* addr = SlabAllocator::getInstance().allocKernel(size, SlabAllocator::LISTELEM);
    80003354:	00001097          	auipc	ra,0x1
    80003358:	774080e7          	jalr	1908(ra) # 80004ac8 <_ZN13SlabAllocator11getInstanceEv>
    8000335c:	00200613          	li	a2,2
    80003360:	01000593          	li	a1,16
    80003364:	00002097          	auipc	ra,0x2
    80003368:	af0080e7          	jalr	-1296(ra) # 80004e54 <_ZN13SlabAllocator11allocKernelEmNS_16kernelCacheEntryE>
        Elem *elem = new Elem(data, 0);
    8000336c:	00050663          	beqz	a0,80003378 <_ZN9Scheduler3putEP3TCB+0x40>
        Elem(T *data, Elem *next) : data(data), next(next) {}
    80003370:	00953023          	sd	s1,0(a0)
    80003374:	00053423          	sd	zero,8(a0)
        if(!elem)
    80003378:	00050e63          	beqz	a0,80003394 <_ZN9Scheduler3putEP3TCB+0x5c>
        if (tail){
    8000337c:	0000a797          	auipc	a5,0xa
    80003380:	a4c7b783          	ld	a5,-1460(a5) # 8000cdc8 <_ZN9Scheduler19readyCoroutineQueueE+0x8>
    80003384:	02078263          	beqz	a5,800033a8 <_ZN9Scheduler3putEP3TCB+0x70>
            tail->next = elem;
    80003388:	00a7b423          	sd	a0,8(a5)
            tail = elem;
    8000338c:	0000a797          	auipc	a5,0xa
    80003390:	a2a7be23          	sd	a0,-1476(a5) # 8000cdc8 <_ZN9Scheduler19readyCoroutineQueueE+0x8>
}
    80003394:	01813083          	ld	ra,24(sp)
    80003398:	01013403          	ld	s0,16(sp)
    8000339c:	00813483          	ld	s1,8(sp)
    800033a0:	02010113          	addi	sp,sp,32
    800033a4:	00008067          	ret
            head = tail = elem;
    800033a8:	0000a797          	auipc	a5,0xa
    800033ac:	a1878793          	addi	a5,a5,-1512 # 8000cdc0 <_ZN9Scheduler19readyCoroutineQueueE>
    800033b0:	00a7b423          	sd	a0,8(a5)
    800033b4:	00a7b023          	sd	a0,0(a5)
    800033b8:	fddff06f          	j	80003394 <_ZN9Scheduler3putEP3TCB+0x5c>
    800033bc:	00008067          	ret

00000000800033c0 <_GLOBAL__sub_I__ZN9Scheduler19readyCoroutineQueueE>:
    800033c0:	ff010113          	addi	sp,sp,-16
    800033c4:	00113423          	sd	ra,8(sp)
    800033c8:	00813023          	sd	s0,0(sp)
    800033cc:	01010413          	addi	s0,sp,16
    800033d0:	000105b7          	lui	a1,0x10
    800033d4:	fff58593          	addi	a1,a1,-1 # ffff <_entry-0x7fff0001>
    800033d8:	00100513          	li	a0,1
    800033dc:	00000097          	auipc	ra,0x0
    800033e0:	e98080e7          	jalr	-360(ra) # 80003274 <_Z41__static_initialization_and_destruction_0ii>
    800033e4:	00813083          	ld	ra,8(sp)
    800033e8:	00013403          	ld	s0,0(sp)
    800033ec:	01010113          	addi	sp,sp,16
    800033f0:	00008067          	ret

00000000800033f4 <_ZN5Riscv10popSppSpieEv>:
using Body = void(*)(void*);

_buffer* Riscv::inputBuffer = nullptr;
_buffer* Riscv::outputBuffer = nullptr;

void Riscv::popSppSpie() {
    800033f4:	ff010113          	addi	sp,sp,-16
    800033f8:	00813423          	sd	s0,8(sp)
    800033fc:	01010413          	addi	s0,sp,16
    __asm__ volatile ("csrw sepc, ra");
    80003400:	14109073          	csrw	sepc,ra
    __asm__ volatile ("sret");
    80003404:	10200073          	sret
}
    80003408:	00813403          	ld	s0,8(sp)
    8000340c:	01010113          	addi	sp,sp,16
    80003410:	00008067          	ret

0000000080003414 <_ZN5Riscv4initEv>:

void Riscv::init(){
    80003414:	fe010113          	addi	sp,sp,-32
    80003418:	00113c23          	sd	ra,24(sp)
    8000341c:	00813823          	sd	s0,16(sp)
    80003420:	00913423          	sd	s1,8(sp)
    80003424:	01213023          	sd	s2,0(sp)
    80003428:	02010413          	addi	s0,sp,32
    inputBuffer = new _buffer();
    8000342c:	03800513          	li	a0,56
    80003430:	00001097          	auipc	ra,0x1
    80003434:	ab8080e7          	jalr	-1352(ra) # 80003ee8 <_ZN7_buffernwEm>
    80003438:	00050493          	mv	s1,a0
    8000343c:	00050663          	beqz	a0,80003448 <_ZN5Riscv4initEv+0x34>
    80003440:	00000097          	auipc	ra,0x0
    80003444:	688080e7          	jalr	1672(ra) # 80003ac8 <_ZN7_bufferC1Ev>
    80003448:	0000a797          	auipc	a5,0xa
    8000344c:	9897b823          	sd	s1,-1648(a5) # 8000cdd8 <_ZN5Riscv11inputBufferE>
    outputBuffer = new _buffer();
    80003450:	03800513          	li	a0,56
    80003454:	00001097          	auipc	ra,0x1
    80003458:	a94080e7          	jalr	-1388(ra) # 80003ee8 <_ZN7_buffernwEm>
    8000345c:	00050493          	mv	s1,a0
    80003460:	00050663          	beqz	a0,8000346c <_ZN5Riscv4initEv+0x58>
    80003464:	00000097          	auipc	ra,0x0
    80003468:	664080e7          	jalr	1636(ra) # 80003ac8 <_ZN7_bufferC1Ev>
    8000346c:	0000a797          	auipc	a5,0xa
    80003470:	9697ba23          	sd	s1,-1676(a5) # 8000cde0 <_ZN5Riscv12outputBufferE>
}
    80003474:	01813083          	ld	ra,24(sp)
    80003478:	01013403          	ld	s0,16(sp)
    8000347c:	00813483          	ld	s1,8(sp)
    80003480:	00013903          	ld	s2,0(sp)
    80003484:	02010113          	addi	sp,sp,32
    80003488:	00008067          	ret
    8000348c:	00050913          	mv	s2,a0
    inputBuffer = new _buffer();
    80003490:	00048513          	mv	a0,s1
    80003494:	00001097          	auipc	ra,0x1
    80003498:	ad8080e7          	jalr	-1320(ra) # 80003f6c <_ZN7_bufferdlEPv>
    8000349c:	00090513          	mv	a0,s2
    800034a0:	00011097          	auipc	ra,0x11
    800034a4:	ce8080e7          	jalr	-792(ra) # 80014188 <_Unwind_Resume>
    800034a8:	00050913          	mv	s2,a0
    outputBuffer = new _buffer();
    800034ac:	00048513          	mv	a0,s1
    800034b0:	00001097          	auipc	ra,0x1
    800034b4:	abc080e7          	jalr	-1348(ra) # 80003f6c <_ZN7_bufferdlEPv>
    800034b8:	00090513          	mv	a0,s2
    800034bc:	00011097          	auipc	ra,0x11
    800034c0:	ccc080e7          	jalr	-820(ra) # 80014188 <_Unwind_Resume>

00000000800034c4 <_ZN5Riscv21supervisorTrapHandlerEv>:

void Riscv::supervisorTrapHandler(){
    800034c4:	f6010113          	addi	sp,sp,-160
    800034c8:	08113c23          	sd	ra,152(sp)
    800034cc:	08813823          	sd	s0,144(sp)
    800034d0:	08913423          	sd	s1,136(sp)
    800034d4:	09213023          	sd	s2,128(sp)
    800034d8:	07313c23          	sd	s3,120(sp)
    800034dc:	07413823          	sd	s4,112(sp)
    800034e0:	07513423          	sd	s5,104(sp)
    800034e4:	07613023          	sd	s6,96(sp)
    800034e8:	05713c23          	sd	s7,88(sp)
    800034ec:	05813823          	sd	s8,80(sp)
    800034f0:	05913423          	sd	s9,72(sp)
    800034f4:	0a010413          	addi	s0,sp,160

    uint64 a0, a1, a2, a3, a4, a5, a6, a7;

    __asm__ volatile ("mv %0, a7" : "=r" (a7));
    800034f8:	00088c13          	mv	s8,a7
    __asm__ volatile ("mv %0, a6" : "=r" (a6));
    800034fc:	00080b93          	mv	s7,a6
    __asm__ volatile ("mv %0, a5" : "=r" (a5));
    80003500:	00078b13          	mv	s6,a5
    __asm__ volatile ("mv %0, a4" : "=r" (a4));
    80003504:	00070a93          	mv	s5,a4
    __asm__ volatile ("mv %0, a3" : "=r" (a3));
    80003508:	00068a13          	mv	s4,a3
    __asm__ volatile ("mv %0, a2" : "=r" (a2));
    8000350c:	00060993          	mv	s3,a2
    __asm__ volatile ("mv %0, a1" : "=r" (a1));
    80003510:	00058913          	mv	s2,a1
    __asm__ volatile ("mv %0, a0" : "=r" (a0));
    80003514:	00050493          	mv	s1,a0
    static void finish();
};

inline uint64 Riscv::r_scause(){
    uint64 volatile scause;
    __asm__ volatile ("csrr %[scause], scause" : [scause] "=r"(scause));
    80003518:	142027f3          	csrr	a5,scause
    8000351c:	f6f43823          	sd	a5,-144(s0)
    return scause;
    80003520:	f7043783          	ld	a5,-144(s0)

    uint64 operation = a0;

    uint64 volatile scause;
    scause = r_scause();
    80003524:	f8f43c23          	sd	a5,-104(s0)
    __asm__ volatile ("csrw scause, %[scause]" : : [scause] "r"(scause));
}

inline uint64 Riscv::r_sepc(){
    uint64 volatile sepc;
    __asm__ volatile ("csrr %[sepc], sepc" : [sepc] "=r"(sepc));
    80003528:	141027f3          	csrr	a5,sepc
    8000352c:	f6f43423          	sd	a5,-152(s0)
    return sepc;
    80003530:	f6843783          	ld	a5,-152(s0)
    uint64 volatile sepc = r_sepc();
    80003534:	f8f43823          	sd	a5,-112(s0)
    __asm__ volatile ("csrc sstatus, %[mask]" : : [mask] "r"(mask));
}

inline uint64 Riscv::r_sstatus(){
    uint64 volatile sstatus;
    __asm__ volatile ("csrr %[sstatus], sstatus" : [sstatus] "=r"(sstatus));
    80003538:	100027f3          	csrr	a5,sstatus
    8000353c:	f6f43023          	sd	a5,-160(s0)
    return sstatus;
    80003540:	f6043c83          	ld	s9,-160(s0)
    uint64 sstatus = r_sstatus();
    if(scause == ECALL_SYS || scause == ECALL_USER){
    80003544:	f9843703          	ld	a4,-104(s0)
    80003548:	00900793          	li	a5,9
    8000354c:	0ef70663          	beq	a4,a5,80003638 <_ZN5Riscv21supervisorTrapHandlerEv+0x174>
    80003550:	f9843703          	ld	a4,-104(s0)
    80003554:	00800793          	li	a5,8
    80003558:	0ef70063          	beq	a4,a5,80003638 <_ZN5Riscv21supervisorTrapHandlerEv+0x174>
            if(*handle == nullptr) ret  = 1;
        }
        w_sstatus(sstatus);
        w_sepc(sepc + 4);
        a0 = ret;
    }else if(scause == TIMER){
    8000355c:	f9843703          	ld	a4,-104(s0)
    80003560:	fff00793          	li	a5,-1
    80003564:	03f79793          	slli	a5,a5,0x3f
    80003568:	00178793          	addi	a5,a5,1
    8000356c:	36f70e63          	beq	a4,a5,800038e8 <_ZN5Riscv21supervisorTrapHandlerEv+0x424>
            TCB::dispatch();
            w_sstatus(sstatus);
            w_sepc(sepc);
        }
        mc_sip(SIP_SSIP);
    }else if(scause == HARDWARE){
    80003570:	f9843703          	ld	a4,-104(s0)
    80003574:	fff00793          	li	a5,-1
    80003578:	03f79793          	slli	a5,a5,0x3f
    8000357c:	00978793          	addi	a5,a5,9
    80003580:	3af70e63          	beq	a4,a5,8000393c <_ZN5Riscv21supervisorTrapHandlerEv+0x478>
       int code = plic_claim();
        if (code == CONSOLE_IRQ)
            plic_complete(code);
    } else{
        printString("scause: ");
    80003584:	00007517          	auipc	a0,0x7
    80003588:	ce450513          	addi	a0,a0,-796 # 8000a268 <CONSOLE_STATUS+0x258>
    8000358c:	00000097          	auipc	ra,0x0
    80003590:	a3c080e7          	jalr	-1476(ra) # 80002fc8 <_Z11printStringPKc>
    __asm__ volatile ("csrr %[scause], scause" : [scause] "=r"(scause));
    80003594:	142027f3          	csrr	a5,scause
    80003598:	f8f43423          	sd	a5,-120(s0)
    return scause;
    8000359c:	f8843503          	ld	a0,-120(s0)
        printInt(r_scause());
    800035a0:	00000613          	li	a2,0
    800035a4:	00a00593          	li	a1,10
    800035a8:	0005051b          	sext.w	a0,a0
    800035ac:	00000097          	auipc	ra,0x0
    800035b0:	bb4080e7          	jalr	-1100(ra) # 80003160 <_Z8printIntiii>
        printString("\nsepc: ");
    800035b4:	00007517          	auipc	a0,0x7
    800035b8:	cc450513          	addi	a0,a0,-828 # 8000a278 <CONSOLE_STATUS+0x268>
    800035bc:	00000097          	auipc	ra,0x0
    800035c0:	a0c080e7          	jalr	-1524(ra) # 80002fc8 <_Z11printStringPKc>
    __asm__ volatile ("csrr %[sepc], sepc" : [sepc] "=r"(sepc));
    800035c4:	141027f3          	csrr	a5,sepc
    800035c8:	f8f43023          	sd	a5,-128(s0)
    return sepc;
    800035cc:	f8043503          	ld	a0,-128(s0)
        printInt(r_sepc());
    800035d0:	00000613          	li	a2,0
    800035d4:	00a00593          	li	a1,10
    800035d8:	0005051b          	sext.w	a0,a0
    800035dc:	00000097          	auipc	ra,0x0
    800035e0:	b84080e7          	jalr	-1148(ra) # 80003160 <_Z8printIntiii>
        printString("\nstval: ");
    800035e4:	00007517          	auipc	a0,0x7
    800035e8:	c9c50513          	addi	a0,a0,-868 # 8000a280 <CONSOLE_STATUS+0x270>
    800035ec:	00000097          	auipc	ra,0x0
    800035f0:	9dc080e7          	jalr	-1572(ra) # 80002fc8 <_Z11printStringPKc>
    __asm__ volatile ("csrr %[stval], stval" : [stval] "=r"(stval));
    800035f4:	143027f3          	csrr	a5,stval
    800035f8:	f6f43c23          	sd	a5,-136(s0)
    return stval;
    800035fc:	f7843503          	ld	a0,-136(s0)
        printInt(r_stval());
    80003600:	00000613          	li	a2,0
    80003604:	00a00593          	li	a1,10
    80003608:	0005051b          	sext.w	a0,a0
    8000360c:	00000097          	auipc	ra,0x0
    80003610:	b54080e7          	jalr	-1196(ra) # 80003160 <_Z8printIntiii>
        printString("\n");
    80003614:	00007517          	auipc	a0,0x7
    80003618:	ba450513          	addi	a0,a0,-1116 # 8000a1b8 <CONSOLE_STATUS+0x1a8>
    8000361c:	00000097          	auipc	ra,0x0
    80003620:	9ac080e7          	jalr	-1620(ra) # 80002fc8 <_Z11printStringPKc>
}

inline void Riscv::w_sstatus(uint64 sstatus){
    __asm__ volatile ("csrw sstatus, %[sstatus]" : : [sstatus] "r"(sstatus));
    80003624:	100c9073          	csrw	sstatus,s9
        w_sstatus(sstatus);
        w_sepc(sepc + 4);
    80003628:	f9043783          	ld	a5,-112(s0)
    8000362c:	00478793          	addi	a5,a5,4
    __asm__ volatile ("csrw sepc, %[sepc]" : : [sepc] "r"(sepc));
    80003630:	14179073          	csrw	sepc,a5
}
    80003634:	0b40006f          	j	800036e8 <_ZN5Riscv21supervisorTrapHandlerEv+0x224>
        if(operation== MEM_ALLOC){
    80003638:	00100793          	li	a5,1
    8000363c:	08f48263          	beq	s1,a5,800036c0 <_ZN5Riscv21supervisorTrapHandlerEv+0x1fc>
        }else if(operation == BUDDY_ALLOC){
    80003640:	02500793          	li	a5,37
    80003644:	0ef48c63          	beq	s1,a5,8000373c <_ZN5Riscv21supervisorTrapHandlerEv+0x278>
        }else if(operation == BUDDY_FREE){
    80003648:	02600793          	li	a5,38
    8000364c:	10f48663          	beq	s1,a5,80003758 <_ZN5Riscv21supervisorTrapHandlerEv+0x294>
        }else if(operation == MEM_FREE){
    80003650:	00200793          	li	a5,2
    80003654:	12f48263          	beq	s1,a5,80003778 <_ZN5Riscv21supervisorTrapHandlerEv+0x2b4>
        }else if(operation == THREAD_CREATE){
    80003658:	01100793          	li	a5,17
    8000365c:	12f48c63          	beq	s1,a5,80003794 <_ZN5Riscv21supervisorTrapHandlerEv+0x2d0>
        }else if(operation == THREAD_EXIT){
    80003660:	01200793          	li	a5,18
    80003664:	14f48e63          	beq	s1,a5,800037c0 <_ZN5Riscv21supervisorTrapHandlerEv+0x2fc>
        }else if(operation == THREAD_DISPATCH){
    80003668:	01300793          	li	a5,19
    8000366c:	16f48263          	beq	s1,a5,800037d0 <_ZN5Riscv21supervisorTrapHandlerEv+0x30c>
        }else if(operation == SEM_OPEN){
    80003670:	02100793          	li	a5,33
    80003674:	16f48663          	beq	s1,a5,800037e0 <_ZN5Riscv21supervisorTrapHandlerEv+0x31c>
        }else if(operation == SEM_CLOSE){
    80003678:	02200793          	li	a5,34
    8000367c:	18f48463          	beq	s1,a5,80003804 <_ZN5Riscv21supervisorTrapHandlerEv+0x340>
        }else if(operation == SEM_WAIT){
    80003680:	02300793          	li	a5,35
    80003684:	18f48a63          	beq	s1,a5,80003818 <_ZN5Riscv21supervisorTrapHandlerEv+0x354>
        }else if(operation == SEM_SIGNAL){
    80003688:	02400793          	li	a5,36
    8000368c:	1af48063          	beq	s1,a5,8000382c <_ZN5Riscv21supervisorTrapHandlerEv+0x368>
        }else if(operation == THREAD_YIELD){
    80003690:	01400793          	li	a5,20
    80003694:	1af48663          	beq	s1,a5,80003840 <_ZN5Riscv21supervisorTrapHandlerEv+0x37c>
        }else if(operation == TIME_SLEEP){
    80003698:	03100793          	li	a5,49
    8000369c:	1cf48063          	beq	s1,a5,8000385c <_ZN5Riscv21supervisorTrapHandlerEv+0x398>
        }else if(operation == GETC){
    800036a0:	04100793          	li	a5,65
    800036a4:	1ef48063          	beq	s1,a5,80003884 <_ZN5Riscv21supervisorTrapHandlerEv+0x3c0>
        }else if(operation == PUTC){
    800036a8:	04200793          	li	a5,66
    800036ac:	1ef48863          	beq	s1,a5,8000389c <_ZN5Riscv21supervisorTrapHandlerEv+0x3d8>
        }else if(operation == THREAD_CPP_CREATE){
    800036b0:	01500793          	li	a5,21
    800036b4:	20f48263          	beq	s1,a5,800038b8 <_ZN5Riscv21supervisorTrapHandlerEv+0x3f4>
        uint64 ret = 0;
    800036b8:	00000493          	li	s1,0
    800036bc:	01c0006f          	j	800036d8 <_ZN5Riscv21supervisorTrapHandlerEv+0x214>
    MemoryAllocator(MemoryAllocator&&) = delete;
    MemoryAllocator& operator=(const MemoryAllocator&) = delete;
    MemoryAllocator& operator=(MemoryAllocator&&) = delete;


    static void* getMemory(size_t size) { return getInstance().IGetMemory(size); }
    800036c0:	00002097          	auipc	ra,0x2
    800036c4:	dfc080e7          	jalr	-516(ra) # 800054bc <_ZN15MemoryAllocator11getInstanceEv>
    800036c8:	00090593          	mv	a1,s2
    800036cc:	00002097          	auipc	ra,0x2
    800036d0:	e4c080e7          	jalr	-436(ra) # 80005518 <_ZN15MemoryAllocator10IGetMemoryEm>
    800036d4:	00050493          	mv	s1,a0
    __asm__ volatile ("csrw sstatus, %[sstatus]" : : [sstatus] "r"(sstatus));
    800036d8:	100c9073          	csrw	sstatus,s9
        w_sepc(sepc + 4);
    800036dc:	f9043783          	ld	a5,-112(s0)
    800036e0:	00478793          	addi	a5,a5,4
    __asm__ volatile ("csrw sepc, %[sepc]" : : [sepc] "r"(sepc));
    800036e4:	14179073          	csrw	sepc,a5

    }

    __asm__ volatile("mv a7, %0" : : "r"(a7));
    800036e8:	000c0893          	mv	a7,s8
    __asm__ volatile("mv a6, %0" : : "r"(a6));
    800036ec:	000b8813          	mv	a6,s7
    __asm__ volatile("mv a5, %0" : : "r"(a5));
    800036f0:	000b0793          	mv	a5,s6
    __asm__ volatile("mv a4, %0" : : "r"(a4));
    800036f4:	000a8713          	mv	a4,s5
    __asm__ volatile("mv a3, %0" : : "r"(a3));
    800036f8:	000a0693          	mv	a3,s4
    __asm__ volatile("mv a2, %0" : : "r"(a2));
    800036fc:	00098613          	mv	a2,s3
    __asm__ volatile("mv a1, %0" : : "r"(a1));
    80003700:	00090593          	mv	a1,s2
    __asm__ volatile("mv a0, %0" : : "r"(a0));
    80003704:	00048513          	mv	a0,s1
}
    80003708:	09813083          	ld	ra,152(sp)
    8000370c:	09013403          	ld	s0,144(sp)
    80003710:	08813483          	ld	s1,136(sp)
    80003714:	08013903          	ld	s2,128(sp)
    80003718:	07813983          	ld	s3,120(sp)
    8000371c:	07013a03          	ld	s4,112(sp)
    80003720:	06813a83          	ld	s5,104(sp)
    80003724:	06013b03          	ld	s6,96(sp)
    80003728:	05813b83          	ld	s7,88(sp)
    8000372c:	05013c03          	ld	s8,80(sp)
    80003730:	04813c83          	ld	s9,72(sp)
    80003734:	0a010113          	addi	sp,sp,160
    80003738:	00008067          	ret
            ret = (uint64)BuddyAllocator::getInstance().alloc((size_t)a1);
    8000373c:	00002097          	auipc	ra,0x2
    80003740:	944080e7          	jalr	-1724(ra) # 80005080 <_ZN14BuddyAllocator11getInstanceEv>
    80003744:	00090593          	mv	a1,s2
    80003748:	00002097          	auipc	ra,0x2
    8000374c:	ad8080e7          	jalr	-1320(ra) # 80005220 <_ZN14BuddyAllocator5allocEm>
    80003750:	00050493          	mv	s1,a0
    80003754:	f85ff06f          	j	800036d8 <_ZN5Riscv21supervisorTrapHandlerEv+0x214>
            BuddyAllocator::getInstance().dealloc((void*)a1, (size_t)a2);
    80003758:	00002097          	auipc	ra,0x2
    8000375c:	928080e7          	jalr	-1752(ra) # 80005080 <_ZN14BuddyAllocator11getInstanceEv>
    80003760:	00098613          	mv	a2,s3
    80003764:	00090593          	mv	a1,s2
    80003768:	00002097          	auipc	ra,0x2
    8000376c:	bc8080e7          	jalr	-1080(ra) # 80005330 <_ZN14BuddyAllocator7deallocEPvm>
        uint64 ret = 0;
    80003770:	00000493          	li	s1,0
    80003774:	f65ff06f          	j	800036d8 <_ZN5Riscv21supervisorTrapHandlerEv+0x214>

    static int freeMemory(void* addr) { return getInstance().IFreeMemory(addr); }
    80003778:	00002097          	auipc	ra,0x2
    8000377c:	d44080e7          	jalr	-700(ra) # 800054bc <_ZN15MemoryAllocator11getInstanceEv>
    80003780:	00090593          	mv	a1,s2
    80003784:	00002097          	auipc	ra,0x2
    80003788:	ec0080e7          	jalr	-320(ra) # 80005644 <_ZN15MemoryAllocator11IFreeMemoryEPv>
            ret = (uint64)MemoryAllocator::freeMemory((void*)a1);
    8000378c:	00050493          	mv	s1,a0
    80003790:	f49ff06f          	j	800036d8 <_ZN5Riscv21supervisorTrapHandlerEv+0x214>
            ret = TCB::createThread((thread_t*)a1, (Body)a2, (void*)a3, (uint64*)a4);
    80003794:	000a8693          	mv	a3,s5
    80003798:	000a0613          	mv	a2,s4
    8000379c:	00098593          	mv	a1,s3
    800037a0:	00090513          	mv	a0,s2
    800037a4:	00003097          	auipc	ra,0x3
    800037a8:	580080e7          	jalr	1408(ra) # 80006d24 <_ZN3TCB12createThreadEPPS_PFvPvES2_Pm>
    800037ac:	00050493          	mv	s1,a0
            if(*handle == nullptr) ret  = 1;
    800037b0:	00093783          	ld	a5,0(s2)
    800037b4:	f20792e3          	bnez	a5,800036d8 <_ZN5Riscv21supervisorTrapHandlerEv+0x214>
    800037b8:	00100493          	li	s1,1
    800037bc:	f1dff06f          	j	800036d8 <_ZN5Riscv21supervisorTrapHandlerEv+0x214>
            ret = TCB::stopThread();
    800037c0:	00003097          	auipc	ra,0x3
    800037c4:	2e0080e7          	jalr	736(ra) # 80006aa0 <_ZN3TCB10stopThreadEv>
    800037c8:	00050493          	mv	s1,a0
    800037cc:	f0dff06f          	j	800036d8 <_ZN5Riscv21supervisorTrapHandlerEv+0x214>
            TCB::dispatch();
    800037d0:	00003097          	auipc	ra,0x3
    800037d4:	174080e7          	jalr	372(ra) # 80006944 <_ZN3TCB8dispatchEv>
        uint64 ret = 0;
    800037d8:	00000493          	li	s1,0
    800037dc:	efdff06f          	j	800036d8 <_ZN5Riscv21supervisorTrapHandlerEv+0x214>
            ret = _sem::createSemaphore((sem_t*)a1, (int)a2);
    800037e0:	0009859b          	sext.w	a1,s3
    800037e4:	00090513          	mv	a0,s2
    800037e8:	00001097          	auipc	ra,0x1
    800037ec:	d18080e7          	jalr	-744(ra) # 80004500 <_ZN4_sem15createSemaphoreEPPS_i>
    800037f0:	00050493          	mv	s1,a0
            if(*handle == nullptr) ret  = 1;
    800037f4:	00093783          	ld	a5,0(s2)
    800037f8:	ee0790e3          	bnez	a5,800036d8 <_ZN5Riscv21supervisorTrapHandlerEv+0x214>
    800037fc:	00100493          	li	s1,1
    80003800:	ed9ff06f          	j	800036d8 <_ZN5Riscv21supervisorTrapHandlerEv+0x214>
            ret = id->close();
    80003804:	00090513          	mv	a0,s2
    80003808:	00001097          	auipc	ra,0x1
    8000380c:	bb8080e7          	jalr	-1096(ra) # 800043c0 <_ZN4_sem5closeEv>
    80003810:	00050493          	mv	s1,a0
    80003814:	ec5ff06f          	j	800036d8 <_ZN5Riscv21supervisorTrapHandlerEv+0x214>
            ret = semaphore->wait();
    80003818:	00090513          	mv	a0,s2
    8000381c:	00001097          	auipc	ra,0x1
    80003820:	a58080e7          	jalr	-1448(ra) # 80004274 <_ZN4_sem4waitEv>
    80003824:	00050493          	mv	s1,a0
    80003828:	eb1ff06f          	j	800036d8 <_ZN5Riscv21supervisorTrapHandlerEv+0x214>
            ret = semaphore->signal();
    8000382c:	00090513          	mv	a0,s2
    80003830:	00001097          	auipc	ra,0x1
    80003834:	b38080e7          	jalr	-1224(ra) # 80004368 <_ZN4_sem6signalEv>
    80003838:	00050493          	mv	s1,a0
    8000383c:	e9dff06f          	j	800036d8 <_ZN5Riscv21supervisorTrapHandlerEv+0x214>
            TCB::timeSliceCounter = 0;
    80003840:	00009797          	auipc	a5,0x9
    80003844:	4a07b783          	ld	a5,1184(a5) # 8000cce0 <_GLOBAL_OFFSET_TABLE_+0x28>
    80003848:	0007b023          	sd	zero,0(a5)
            TCB::dispatch();
    8000384c:	00003097          	auipc	ra,0x3
    80003850:	0f8080e7          	jalr	248(ra) # 80006944 <_ZN3TCB8dispatchEv>
        uint64 ret = 0;
    80003854:	00000493          	li	s1,0
    80003858:	e81ff06f          	j	800036d8 <_ZN5Riscv21supervisorTrapHandlerEv+0x214>
            SleepList::put(TCB::running, time);
    8000385c:	00090593          	mv	a1,s2
    80003860:	00009797          	auipc	a5,0x9
    80003864:	4c07b783          	ld	a5,1216(a5) # 8000cd20 <_GLOBAL_OFFSET_TABLE_+0x68>
    80003868:	0007b503          	ld	a0,0(a5)
    8000386c:	00004097          	auipc	ra,0x4
    80003870:	8a8080e7          	jalr	-1880(ra) # 80007114 <_ZN9SleepList3putEP3TCBm>
            TCB::dispatch();
    80003874:	00003097          	auipc	ra,0x3
    80003878:	0d0080e7          	jalr	208(ra) # 80006944 <_ZN3TCB8dispatchEv>
        uint64 ret = 0;
    8000387c:	00000493          	li	s1,0
    80003880:	e59ff06f          	j	800036d8 <_ZN5Riscv21supervisorTrapHandlerEv+0x214>
            ret = (uint64)inputBuffer->kget();
    80003884:	00009517          	auipc	a0,0x9
    80003888:	55453503          	ld	a0,1364(a0) # 8000cdd8 <_ZN5Riscv11inputBufferE>
    8000388c:	00000097          	auipc	ra,0x0
    80003890:	548080e7          	jalr	1352(ra) # 80003dd4 <_ZN7_buffer4kgetEv>
    80003894:	00050493          	mv	s1,a0
    80003898:	e41ff06f          	j	800036d8 <_ZN5Riscv21supervisorTrapHandlerEv+0x214>
            outputBuffer->kput((char)a1);
    8000389c:	0ff97593          	andi	a1,s2,255
    800038a0:	00009517          	auipc	a0,0x9
    800038a4:	54053503          	ld	a0,1344(a0) # 8000cde0 <_ZN5Riscv12outputBufferE>
    800038a8:	00000097          	auipc	ra,0x0
    800038ac:	5b4080e7          	jalr	1460(ra) # 80003e5c <_ZN7_buffer4kputEc>
        uint64 ret = 0;
    800038b0:	00000493          	li	s1,0
    800038b4:	e25ff06f          	j	800036d8 <_ZN5Riscv21supervisorTrapHandlerEv+0x214>
            ret = TCB::createThread((thread_t*)a1, (Body)a2, (void*)a3, (uint64*)a4, TCB::READY);
    800038b8:	00400713          	li	a4,4
    800038bc:	000a8693          	mv	a3,s5
    800038c0:	000a0613          	mv	a2,s4
    800038c4:	00098593          	mv	a1,s3
    800038c8:	00090513          	mv	a0,s2
    800038cc:	00003097          	auipc	ra,0x3
    800038d0:	564080e7          	jalr	1380(ra) # 80006e30 <_ZN3TCB12createThreadEPPS_PFvPvES2_PmNS_12threadStatusE>
    800038d4:	00050493          	mv	s1,a0
            if(*handle == nullptr) ret  = 1;
    800038d8:	00093783          	ld	a5,0(s2)
    800038dc:	de079ee3          	bnez	a5,800036d8 <_ZN5Riscv21supervisorTrapHandlerEv+0x214>
    800038e0:	00100493          	li	s1,1
    800038e4:	df5ff06f          	j	800036d8 <_ZN5Riscv21supervisorTrapHandlerEv+0x214>
        SleepList::releaseThreads();
    800038e8:	00004097          	auipc	ra,0x4
    800038ec:	b08080e7          	jalr	-1272(ra) # 800073f0 <_ZN9SleepList14releaseThreadsEv>
        TCB::timeSliceCounter++;
    800038f0:	00009717          	auipc	a4,0x9
    800038f4:	3f073703          	ld	a4,1008(a4) # 8000cce0 <_GLOBAL_OFFSET_TABLE_+0x28>
    800038f8:	00073783          	ld	a5,0(a4)
    800038fc:	00178793          	addi	a5,a5,1
    80003900:	00f73023          	sd	a5,0(a4)
        if(TCB::timeSliceCounter >= DEFAULT_TIME_SLICE){
    80003904:	00100713          	li	a4,1
    80003908:	00f76863          	bltu	a4,a5,80003918 <_ZN5Riscv21supervisorTrapHandlerEv+0x454>
    __asm__ volatile ("csrc sip, %[mask]" : : [mask] "r"(mask));
    8000390c:	00200793          	li	a5,2
    80003910:	1447b073          	csrc	sip,a5
}
    80003914:	dd5ff06f          	j	800036e8 <_ZN5Riscv21supervisorTrapHandlerEv+0x224>
            TCB::timeSliceCounter = 0;
    80003918:	00009797          	auipc	a5,0x9
    8000391c:	3c87b783          	ld	a5,968(a5) # 8000cce0 <_GLOBAL_OFFSET_TABLE_+0x28>
    80003920:	0007b023          	sd	zero,0(a5)
            TCB::dispatch();
    80003924:	00003097          	auipc	ra,0x3
    80003928:	020080e7          	jalr	32(ra) # 80006944 <_ZN3TCB8dispatchEv>
    __asm__ volatile ("csrw sstatus, %[sstatus]" : : [sstatus] "r"(sstatus));
    8000392c:	100c9073          	csrw	sstatus,s9
            w_sepc(sepc);
    80003930:	f9043783          	ld	a5,-112(s0)
    __asm__ volatile ("csrw sepc, %[sepc]" : : [sepc] "r"(sepc));
    80003934:	14179073          	csrw	sepc,a5
}
    80003938:	fd5ff06f          	j	8000390c <_ZN5Riscv21supervisorTrapHandlerEv+0x448>
       int code = plic_claim();
    8000393c:	00004097          	auipc	ra,0x4
    80003940:	678080e7          	jalr	1656(ra) # 80007fb4 <plic_claim>
        if (code == CONSOLE_IRQ)
    80003944:	00a00793          	li	a5,10
    80003948:	daf510e3          	bne	a0,a5,800036e8 <_ZN5Riscv21supervisorTrapHandlerEv+0x224>
            plic_complete(code);
    8000394c:	00004097          	auipc	ra,0x4
    80003950:	6a0080e7          	jalr	1696(ra) # 80007fec <plic_complete>
    80003954:	d95ff06f          	j	800036e8 <_ZN5Riscv21supervisorTrapHandlerEv+0x224>

0000000080003958 <_ZN5Riscv6finishEv>:

void Riscv::finish() {
    80003958:	fe010113          	addi	sp,sp,-32
    8000395c:	00113c23          	sd	ra,24(sp)
    80003960:	00813823          	sd	s0,16(sp)
    80003964:	00913423          	sd	s1,8(sp)
    80003968:	02010413          	addi	s0,sp,32
    delete inputBuffer;
    8000396c:	00009497          	auipc	s1,0x9
    80003970:	46c4b483          	ld	s1,1132(s1) # 8000cdd8 <_ZN5Riscv11inputBufferE>
    80003974:	00048e63          	beqz	s1,80003990 <_ZN5Riscv6finishEv+0x38>
    80003978:	00048513          	mv	a0,s1
    8000397c:	00000097          	auipc	ra,0x0
    80003980:	37c080e7          	jalr	892(ra) # 80003cf8 <_ZN7_bufferD1Ev>
    80003984:	00048513          	mv	a0,s1
    80003988:	00000097          	auipc	ra,0x0
    8000398c:	5e4080e7          	jalr	1508(ra) # 80003f6c <_ZN7_bufferdlEPv>
    delete outputBuffer;
    80003990:	00009497          	auipc	s1,0x9
    80003994:	4504b483          	ld	s1,1104(s1) # 8000cde0 <_ZN5Riscv12outputBufferE>
    80003998:	00048e63          	beqz	s1,800039b4 <_ZN5Riscv6finishEv+0x5c>
    8000399c:	00048513          	mv	a0,s1
    800039a0:	00000097          	auipc	ra,0x0
    800039a4:	358080e7          	jalr	856(ra) # 80003cf8 <_ZN7_bufferD1Ev>
    800039a8:	00048513          	mv	a0,s1
    800039ac:	00000097          	auipc	ra,0x0
    800039b0:	5c0080e7          	jalr	1472(ra) # 80003f6c <_ZN7_bufferdlEPv>
}
    800039b4:	01813083          	ld	ra,24(sp)
    800039b8:	01013403          	ld	s0,16(sp)
    800039bc:	00813483          	ld	s1,8(sp)
    800039c0:	02010113          	addi	sp,sp,32
    800039c4:	00008067          	ret

00000000800039c8 <_ZN5RiscvnwEm>:

void *Riscv::operator new(size_t size) {
    800039c8:	fe010113          	addi	sp,sp,-32
    800039cc:	00113c23          	sd	ra,24(sp)
    800039d0:	00813823          	sd	s0,16(sp)
    800039d4:	00913423          	sd	s1,8(sp)
    800039d8:	02010413          	addi	s0,sp,32
    800039dc:	00050493          	mv	s1,a0
    static void* getMemory(size_t size) { return getInstance().IGetMemory(size); }
    800039e0:	00002097          	auipc	ra,0x2
    800039e4:	adc080e7          	jalr	-1316(ra) # 800054bc <_ZN15MemoryAllocator11getInstanceEv>
    800039e8:	00048593          	mv	a1,s1
    800039ec:	00002097          	auipc	ra,0x2
    800039f0:	b2c080e7          	jalr	-1236(ra) # 80005518 <_ZN15MemoryAllocator10IGetMemoryEm>
    return MemoryAllocator::getMemory(size);
}
    800039f4:	01813083          	ld	ra,24(sp)
    800039f8:	01013403          	ld	s0,16(sp)
    800039fc:	00813483          	ld	s1,8(sp)
    80003a00:	02010113          	addi	sp,sp,32
    80003a04:	00008067          	ret

0000000080003a08 <_ZN5RiscvnaEm>:

void *Riscv::operator new[](size_t size) {
    80003a08:	fe010113          	addi	sp,sp,-32
    80003a0c:	00113c23          	sd	ra,24(sp)
    80003a10:	00813823          	sd	s0,16(sp)
    80003a14:	00913423          	sd	s1,8(sp)
    80003a18:	02010413          	addi	s0,sp,32
    80003a1c:	00050493          	mv	s1,a0
    80003a20:	00002097          	auipc	ra,0x2
    80003a24:	a9c080e7          	jalr	-1380(ra) # 800054bc <_ZN15MemoryAllocator11getInstanceEv>
    80003a28:	00048593          	mv	a1,s1
    80003a2c:	00002097          	auipc	ra,0x2
    80003a30:	aec080e7          	jalr	-1300(ra) # 80005518 <_ZN15MemoryAllocator10IGetMemoryEm>
    return MemoryAllocator::getMemory(size);
}
    80003a34:	01813083          	ld	ra,24(sp)
    80003a38:	01013403          	ld	s0,16(sp)
    80003a3c:	00813483          	ld	s1,8(sp)
    80003a40:	02010113          	addi	sp,sp,32
    80003a44:	00008067          	ret

0000000080003a48 <_ZN5RiscvdlEPv>:

void Riscv::operator delete(void *addr) {
    80003a48:	fe010113          	addi	sp,sp,-32
    80003a4c:	00113c23          	sd	ra,24(sp)
    80003a50:	00813823          	sd	s0,16(sp)
    80003a54:	00913423          	sd	s1,8(sp)
    80003a58:	02010413          	addi	s0,sp,32
    80003a5c:	00050493          	mv	s1,a0
    static int freeMemory(void* addr) { return getInstance().IFreeMemory(addr); }
    80003a60:	00002097          	auipc	ra,0x2
    80003a64:	a5c080e7          	jalr	-1444(ra) # 800054bc <_ZN15MemoryAllocator11getInstanceEv>
    80003a68:	00048593          	mv	a1,s1
    80003a6c:	00002097          	auipc	ra,0x2
    80003a70:	bd8080e7          	jalr	-1064(ra) # 80005644 <_ZN15MemoryAllocator11IFreeMemoryEPv>
    MemoryAllocator::freeMemory(addr);
}
    80003a74:	01813083          	ld	ra,24(sp)
    80003a78:	01013403          	ld	s0,16(sp)
    80003a7c:	00813483          	ld	s1,8(sp)
    80003a80:	02010113          	addi	sp,sp,32
    80003a84:	00008067          	ret

0000000080003a88 <_ZN5RiscvdaEPv>:

void Riscv::operator delete[](void *addr) {
    80003a88:	fe010113          	addi	sp,sp,-32
    80003a8c:	00113c23          	sd	ra,24(sp)
    80003a90:	00813823          	sd	s0,16(sp)
    80003a94:	00913423          	sd	s1,8(sp)
    80003a98:	02010413          	addi	s0,sp,32
    80003a9c:	00050493          	mv	s1,a0
    80003aa0:	00002097          	auipc	ra,0x2
    80003aa4:	a1c080e7          	jalr	-1508(ra) # 800054bc <_ZN15MemoryAllocator11getInstanceEv>
    80003aa8:	00048593          	mv	a1,s1
    80003aac:	00002097          	auipc	ra,0x2
    80003ab0:	b98080e7          	jalr	-1128(ra) # 80005644 <_ZN15MemoryAllocator11IFreeMemoryEPv>
    MemoryAllocator::freeMemory(addr);
}
    80003ab4:	01813083          	ld	ra,24(sp)
    80003ab8:	01013403          	ld	s0,16(sp)
    80003abc:	00813483          	ld	s1,8(sp)
    80003ac0:	02010113          	addi	sp,sp,32
    80003ac4:	00008067          	ret

0000000080003ac8 <_ZN7_bufferC1Ev>:
#include "../h/_buffer.hpp"
#include "../h/MemoryAllocator.hpp"


_buffer::_buffer() : cap(DEFAULT_BUFFER_SIZE + 1), head(0), tail(0) {
    80003ac8:	fe010113          	addi	sp,sp,-32
    80003acc:	00113c23          	sd	ra,24(sp)
    80003ad0:	00813823          	sd	s0,16(sp)
    80003ad4:	00913423          	sd	s1,8(sp)
    80003ad8:	02010413          	addi	s0,sp,32
    80003adc:	00050493          	mv	s1,a0
    80003ae0:	40100793          	li	a5,1025
    80003ae4:	00f52023          	sw	a5,0(a0)
    80003ae8:	00052823          	sw	zero,16(a0)
    80003aec:	00052a23          	sw	zero,20(a0)

    //buffer = (char*)MemoryAllocator::getMemory(sizeof(char)*DEFAULT_BUFFER_SIZE);
    //buffer = (char*)SlabAllocator::getInstance().allocKernel(sizeof(char)*DEFAULT_BUFFER_SIZE, SlabAllocator::BUFFER);// TODO stavi da alocira iz mem buffer velicine 1024
    //buffer = (char*)BuddyAllocator::getInstance().alloc();// TODO stavi da alocira iz mem buffer velicine 1024
    buffer = (char*)SlabAllocator::getInstance().allocBuffer(sizeof(char)*DEFAULT_BUFFER_SIZE);
    80003af0:	00001097          	auipc	ra,0x1
    80003af4:	fd8080e7          	jalr	-40(ra) # 80004ac8 <_ZN13SlabAllocator11getInstanceEv>
    80003af8:	40000593          	li	a1,1024
    80003afc:	00001097          	auipc	ra,0x1
    80003b00:	138080e7          	jalr	312(ra) # 80004c34 <_ZN13SlabAllocator11allocBufferEm>
    80003b04:	00a4b423          	sd	a0,8(s1)
    _sem::createSemaphore(&itemAvailable, 0);
    80003b08:	00000593          	li	a1,0
    80003b0c:	02048513          	addi	a0,s1,32
    80003b10:	00001097          	auipc	ra,0x1
    80003b14:	9f0080e7          	jalr	-1552(ra) # 80004500 <_ZN4_sem15createSemaphoreEPPS_i>
    _sem::createSemaphore(&spaceAvailable, DEFAULT_BUFFER_SIZE + 1);
    80003b18:	40100593          	li	a1,1025
    80003b1c:	01848513          	addi	a0,s1,24
    80003b20:	00001097          	auipc	ra,0x1
    80003b24:	9e0080e7          	jalr	-1568(ra) # 80004500 <_ZN4_sem15createSemaphoreEPPS_i>
    _sem::createSemaphore(&mutexHead, 1);
    80003b28:	00100593          	li	a1,1
    80003b2c:	02848513          	addi	a0,s1,40
    80003b30:	00001097          	auipc	ra,0x1
    80003b34:	9d0080e7          	jalr	-1584(ra) # 80004500 <_ZN4_sem15createSemaphoreEPPS_i>
    _sem::createSemaphore(&mutexTail, 1);
    80003b38:	00100593          	li	a1,1
    80003b3c:	03048513          	addi	a0,s1,48
    80003b40:	00001097          	auipc	ra,0x1
    80003b44:	9c0080e7          	jalr	-1600(ra) # 80004500 <_ZN4_sem15createSemaphoreEPPS_i>
}
    80003b48:	01813083          	ld	ra,24(sp)
    80003b4c:	01013403          	ld	s0,16(sp)
    80003b50:	00813483          	ld	s1,8(sp)
    80003b54:	02010113          	addi	sp,sp,32
    80003b58:	00008067          	ret

0000000080003b5c <_ZN7_buffer3putEc>:
    delete itemAvailable;
    delete mutexHead;
    delete mutexTail;
}

void _buffer::put(char val) {
    80003b5c:	fe010113          	addi	sp,sp,-32
    80003b60:	00113c23          	sd	ra,24(sp)
    80003b64:	00813823          	sd	s0,16(sp)
    80003b68:	00913423          	sd	s1,8(sp)
    80003b6c:	01213023          	sd	s2,0(sp)
    80003b70:	02010413          	addi	s0,sp,32
    80003b74:	00050493          	mv	s1,a0
    80003b78:	00058913          	mv	s2,a1
    sem_wait(spaceAvailable);
    80003b7c:	01853503          	ld	a0,24(a0)
    80003b80:	00001097          	auipc	ra,0x1
    80003b84:	d40080e7          	jalr	-704(ra) # 800048c0 <_Z8sem_waitP4_sem>
    sem_wait(mutexTail);
    80003b88:	0304b503          	ld	a0,48(s1)
    80003b8c:	00001097          	auipc	ra,0x1
    80003b90:	d34080e7          	jalr	-716(ra) # 800048c0 <_Z8sem_waitP4_sem>

    buffer[tail] = val;
    80003b94:	0084b783          	ld	a5,8(s1)
    80003b98:	0144a703          	lw	a4,20(s1)
    80003b9c:	00e787b3          	add	a5,a5,a4
    80003ba0:	01278023          	sb	s2,0(a5)
    tail = (tail + 1) % cap;
    80003ba4:	0144a783          	lw	a5,20(s1)
    80003ba8:	0017879b          	addiw	a5,a5,1
    80003bac:	0004a703          	lw	a4,0(s1)
    80003bb0:	02e7e7bb          	remw	a5,a5,a4
    80003bb4:	00f4aa23          	sw	a5,20(s1)

    sem_signal(mutexTail);
    80003bb8:	0304b503          	ld	a0,48(s1)
    80003bbc:	00001097          	auipc	ra,0x1
    80003bc0:	d3c080e7          	jalr	-708(ra) # 800048f8 <_Z10sem_signalP4_sem>
    sem_signal(itemAvailable);
    80003bc4:	0204b503          	ld	a0,32(s1)
    80003bc8:	00001097          	auipc	ra,0x1
    80003bcc:	d30080e7          	jalr	-720(ra) # 800048f8 <_Z10sem_signalP4_sem>
}
    80003bd0:	01813083          	ld	ra,24(sp)
    80003bd4:	01013403          	ld	s0,16(sp)
    80003bd8:	00813483          	ld	s1,8(sp)
    80003bdc:	00013903          	ld	s2,0(sp)
    80003be0:	02010113          	addi	sp,sp,32
    80003be4:	00008067          	ret

0000000080003be8 <_ZN7_buffer3getEv>:

char _buffer::get() {
    80003be8:	fe010113          	addi	sp,sp,-32
    80003bec:	00113c23          	sd	ra,24(sp)
    80003bf0:	00813823          	sd	s0,16(sp)
    80003bf4:	00913423          	sd	s1,8(sp)
    80003bf8:	01213023          	sd	s2,0(sp)
    80003bfc:	02010413          	addi	s0,sp,32
    80003c00:	00050493          	mv	s1,a0
    sem_wait(itemAvailable);
    80003c04:	02053503          	ld	a0,32(a0)
    80003c08:	00001097          	auipc	ra,0x1
    80003c0c:	cb8080e7          	jalr	-840(ra) # 800048c0 <_Z8sem_waitP4_sem>
    sem_wait(mutexHead);
    80003c10:	0284b503          	ld	a0,40(s1)
    80003c14:	00001097          	auipc	ra,0x1
    80003c18:	cac080e7          	jalr	-852(ra) # 800048c0 <_Z8sem_waitP4_sem>

    char ret = buffer[head];
    80003c1c:	0084b703          	ld	a4,8(s1)
    80003c20:	0104a783          	lw	a5,16(s1)
    80003c24:	00f70733          	add	a4,a4,a5
    80003c28:	00074903          	lbu	s2,0(a4)
    head = (head + 1) % cap;
    80003c2c:	0017879b          	addiw	a5,a5,1
    80003c30:	0004a703          	lw	a4,0(s1)
    80003c34:	02e7e7bb          	remw	a5,a5,a4
    80003c38:	00f4a823          	sw	a5,16(s1)

    sem_signal(mutexHead);
    80003c3c:	0284b503          	ld	a0,40(s1)
    80003c40:	00001097          	auipc	ra,0x1
    80003c44:	cb8080e7          	jalr	-840(ra) # 800048f8 <_Z10sem_signalP4_sem>
    sem_signal(spaceAvailable);
    80003c48:	0184b503          	ld	a0,24(s1)
    80003c4c:	00001097          	auipc	ra,0x1
    80003c50:	cac080e7          	jalr	-852(ra) # 800048f8 <_Z10sem_signalP4_sem>

    return ret;
}
    80003c54:	00090513          	mv	a0,s2
    80003c58:	01813083          	ld	ra,24(sp)
    80003c5c:	01013403          	ld	s0,16(sp)
    80003c60:	00813483          	ld	s1,8(sp)
    80003c64:	00013903          	ld	s2,0(sp)
    80003c68:	02010113          	addi	sp,sp,32
    80003c6c:	00008067          	ret

0000000080003c70 <_ZN7_buffer6getCntEv>:

int _buffer::getCnt() {
    80003c70:	fe010113          	addi	sp,sp,-32
    80003c74:	00113c23          	sd	ra,24(sp)
    80003c78:	00813823          	sd	s0,16(sp)
    80003c7c:	00913423          	sd	s1,8(sp)
    80003c80:	01213023          	sd	s2,0(sp)
    80003c84:	02010413          	addi	s0,sp,32
    80003c88:	00050493          	mv	s1,a0
    int ret;

    sem_wait(mutexHead);
    80003c8c:	02853503          	ld	a0,40(a0)
    80003c90:	00001097          	auipc	ra,0x1
    80003c94:	c30080e7          	jalr	-976(ra) # 800048c0 <_Z8sem_waitP4_sem>
    sem_wait(mutexTail);
    80003c98:	0304b503          	ld	a0,48(s1)
    80003c9c:	00001097          	auipc	ra,0x1
    80003ca0:	c24080e7          	jalr	-988(ra) # 800048c0 <_Z8sem_waitP4_sem>

    if (tail >= head) {
    80003ca4:	0144a783          	lw	a5,20(s1)
    80003ca8:	0104a903          	lw	s2,16(s1)
    80003cac:	0327ce63          	blt	a5,s2,80003ce8 <_ZN7_buffer6getCntEv+0x78>
        ret = tail - head;
    80003cb0:	4127893b          	subw	s2,a5,s2
    } else {
        ret = cap - head + tail;
    }

    sem_signal(mutexTail);
    80003cb4:	0304b503          	ld	a0,48(s1)
    80003cb8:	00001097          	auipc	ra,0x1
    80003cbc:	c40080e7          	jalr	-960(ra) # 800048f8 <_Z10sem_signalP4_sem>
    sem_signal(mutexHead);
    80003cc0:	0284b503          	ld	a0,40(s1)
    80003cc4:	00001097          	auipc	ra,0x1
    80003cc8:	c34080e7          	jalr	-972(ra) # 800048f8 <_Z10sem_signalP4_sem>

    return ret;
}
    80003ccc:	00090513          	mv	a0,s2
    80003cd0:	01813083          	ld	ra,24(sp)
    80003cd4:	01013403          	ld	s0,16(sp)
    80003cd8:	00813483          	ld	s1,8(sp)
    80003cdc:	00013903          	ld	s2,0(sp)
    80003ce0:	02010113          	addi	sp,sp,32
    80003ce4:	00008067          	ret
        ret = cap - head + tail;
    80003ce8:	0004a703          	lw	a4,0(s1)
    80003cec:	4127093b          	subw	s2,a4,s2
    80003cf0:	00f9093b          	addw	s2,s2,a5
    80003cf4:	fc1ff06f          	j	80003cb4 <_ZN7_buffer6getCntEv+0x44>

0000000080003cf8 <_ZN7_bufferD1Ev>:
_buffer::~_buffer() {
    80003cf8:	fe010113          	addi	sp,sp,-32
    80003cfc:	00113c23          	sd	ra,24(sp)
    80003d00:	00813823          	sd	s0,16(sp)
    80003d04:	00913423          	sd	s1,8(sp)
    80003d08:	02010413          	addi	s0,sp,32
    80003d0c:	00050493          	mv	s1,a0
    while (getCnt() > 0)
    80003d10:	00048513          	mv	a0,s1
    80003d14:	00000097          	auipc	ra,0x0
    80003d18:	f5c080e7          	jalr	-164(ra) # 80003c70 <_ZN7_buffer6getCntEv>
    80003d1c:	00a05e63          	blez	a0,80003d38 <_ZN7_bufferD1Ev+0x40>
        head = (head + 1) % cap;
    80003d20:	0104a783          	lw	a5,16(s1)
    80003d24:	0017879b          	addiw	a5,a5,1
    80003d28:	0004a703          	lw	a4,0(s1)
    80003d2c:	02e7e7bb          	remw	a5,a5,a4
    80003d30:	00f4a823          	sw	a5,16(s1)
    while (getCnt() > 0)
    80003d34:	fddff06f          	j	80003d10 <_ZN7_bufferD1Ev+0x18>
    sem_close(itemAvailable);
    80003d38:	0204b503          	ld	a0,32(s1)
    80003d3c:	00001097          	auipc	ra,0x1
    80003d40:	b4c080e7          	jalr	-1204(ra) # 80004888 <_Z9sem_closeP4_sem>
    sem_close(spaceAvailable);
    80003d44:	0184b503          	ld	a0,24(s1)
    80003d48:	00001097          	auipc	ra,0x1
    80003d4c:	b40080e7          	jalr	-1216(ra) # 80004888 <_Z9sem_closeP4_sem>
    sem_close(mutexTail);
    80003d50:	0304b503          	ld	a0,48(s1)
    80003d54:	00001097          	auipc	ra,0x1
    80003d58:	b34080e7          	jalr	-1228(ra) # 80004888 <_Z9sem_closeP4_sem>
    sem_close(mutexHead);
    80003d5c:	0284b503          	ld	a0,40(s1)
    80003d60:	00001097          	auipc	ra,0x1
    80003d64:	b28080e7          	jalr	-1240(ra) # 80004888 <_Z9sem_closeP4_sem>
    SlabAllocator::getInstance().deallocBuffer(buffer);
    80003d68:	00001097          	auipc	ra,0x1
    80003d6c:	d60080e7          	jalr	-672(ra) # 80004ac8 <_ZN13SlabAllocator11getInstanceEv>
    80003d70:	0084b583          	ld	a1,8(s1)
    80003d74:	00001097          	auipc	ra,0x1
    80003d78:	068080e7          	jalr	104(ra) # 80004ddc <_ZN13SlabAllocator13deallocBufferEPv>
    buffer = nullptr;
    80003d7c:	0004b423          	sd	zero,8(s1)
    delete spaceAvailable;
    80003d80:	0184b503          	ld	a0,24(s1)
    80003d84:	00050663          	beqz	a0,80003d90 <_ZN7_bufferD1Ev+0x98>
    80003d88:	00001097          	auipc	ra,0x1
    80003d8c:	830080e7          	jalr	-2000(ra) # 800045b8 <_ZN4_semdlEPv>
    delete itemAvailable;
    80003d90:	0204b503          	ld	a0,32(s1)
    80003d94:	00050663          	beqz	a0,80003da0 <_ZN7_bufferD1Ev+0xa8>
    80003d98:	00001097          	auipc	ra,0x1
    80003d9c:	820080e7          	jalr	-2016(ra) # 800045b8 <_ZN4_semdlEPv>
    delete mutexHead;
    80003da0:	0284b503          	ld	a0,40(s1)
    80003da4:	00050663          	beqz	a0,80003db0 <_ZN7_bufferD1Ev+0xb8>
    80003da8:	00001097          	auipc	ra,0x1
    80003dac:	810080e7          	jalr	-2032(ra) # 800045b8 <_ZN4_semdlEPv>
    delete mutexTail;
    80003db0:	0304b503          	ld	a0,48(s1)
    80003db4:	00050663          	beqz	a0,80003dc0 <_ZN7_bufferD1Ev+0xc8>
    80003db8:	00001097          	auipc	ra,0x1
    80003dbc:	800080e7          	jalr	-2048(ra) # 800045b8 <_ZN4_semdlEPv>
}
    80003dc0:	01813083          	ld	ra,24(sp)
    80003dc4:	01013403          	ld	s0,16(sp)
    80003dc8:	00813483          	ld	s1,8(sp)
    80003dcc:	02010113          	addi	sp,sp,32
    80003dd0:	00008067          	ret

0000000080003dd4 <_ZN7_buffer4kgetEv>:


char _buffer::kget() {
    80003dd4:	fe010113          	addi	sp,sp,-32
    80003dd8:	00113c23          	sd	ra,24(sp)
    80003ddc:	00813823          	sd	s0,16(sp)
    80003de0:	00913423          	sd	s1,8(sp)
    80003de4:	01213023          	sd	s2,0(sp)
    80003de8:	02010413          	addi	s0,sp,32
    80003dec:	00050493          	mv	s1,a0

    itemAvailable->wait();
    80003df0:	02053503          	ld	a0,32(a0)
    80003df4:	00000097          	auipc	ra,0x0
    80003df8:	480080e7          	jalr	1152(ra) # 80004274 <_ZN4_sem4waitEv>
    mutexHead->wait();
    80003dfc:	0284b503          	ld	a0,40(s1)
    80003e00:	00000097          	auipc	ra,0x0
    80003e04:	474080e7          	jalr	1140(ra) # 80004274 <_ZN4_sem4waitEv>

    char ret = buffer[head];
    80003e08:	0084b703          	ld	a4,8(s1)
    80003e0c:	0104a783          	lw	a5,16(s1)
    80003e10:	00f70733          	add	a4,a4,a5
    80003e14:	00074903          	lbu	s2,0(a4)
    head = (head + 1) % cap;
    80003e18:	0017879b          	addiw	a5,a5,1
    80003e1c:	0004a703          	lw	a4,0(s1)
    80003e20:	02e7e7bb          	remw	a5,a5,a4
    80003e24:	00f4a823          	sw	a5,16(s1)

    mutexHead->signal();
    80003e28:	0284b503          	ld	a0,40(s1)
    80003e2c:	00000097          	auipc	ra,0x0
    80003e30:	53c080e7          	jalr	1340(ra) # 80004368 <_ZN4_sem6signalEv>
    spaceAvailable->signal();
    80003e34:	0184b503          	ld	a0,24(s1)
    80003e38:	00000097          	auipc	ra,0x0
    80003e3c:	530080e7          	jalr	1328(ra) # 80004368 <_ZN4_sem6signalEv>
    return ret;
}
    80003e40:	00090513          	mv	a0,s2
    80003e44:	01813083          	ld	ra,24(sp)
    80003e48:	01013403          	ld	s0,16(sp)
    80003e4c:	00813483          	ld	s1,8(sp)
    80003e50:	00013903          	ld	s2,0(sp)
    80003e54:	02010113          	addi	sp,sp,32
    80003e58:	00008067          	ret

0000000080003e5c <_ZN7_buffer4kputEc>:

void _buffer::kput(char val) {
    80003e5c:	fe010113          	addi	sp,sp,-32
    80003e60:	00113c23          	sd	ra,24(sp)
    80003e64:	00813823          	sd	s0,16(sp)
    80003e68:	00913423          	sd	s1,8(sp)
    80003e6c:	01213023          	sd	s2,0(sp)
    80003e70:	02010413          	addi	s0,sp,32
    80003e74:	00050493          	mv	s1,a0
    80003e78:	00058913          	mv	s2,a1

    spaceAvailable->wait();
    80003e7c:	01853503          	ld	a0,24(a0)
    80003e80:	00000097          	auipc	ra,0x0
    80003e84:	3f4080e7          	jalr	1012(ra) # 80004274 <_ZN4_sem4waitEv>
    mutexTail->wait();
    80003e88:	0304b503          	ld	a0,48(s1)
    80003e8c:	00000097          	auipc	ra,0x0
    80003e90:	3e8080e7          	jalr	1000(ra) # 80004274 <_ZN4_sem4waitEv>

    buffer[tail] = val;
    80003e94:	0084b783          	ld	a5,8(s1)
    80003e98:	0144a703          	lw	a4,20(s1)
    80003e9c:	00e787b3          	add	a5,a5,a4
    80003ea0:	01278023          	sb	s2,0(a5)
    tail = (tail + 1) % cap;
    80003ea4:	0144a783          	lw	a5,20(s1)
    80003ea8:	0017879b          	addiw	a5,a5,1
    80003eac:	0004a703          	lw	a4,0(s1)
    80003eb0:	02e7e7bb          	remw	a5,a5,a4
    80003eb4:	00f4aa23          	sw	a5,20(s1)

    mutexTail->signal();
    80003eb8:	0304b503          	ld	a0,48(s1)
    80003ebc:	00000097          	auipc	ra,0x0
    80003ec0:	4ac080e7          	jalr	1196(ra) # 80004368 <_ZN4_sem6signalEv>
    itemAvailable->signal();
    80003ec4:	0204b503          	ld	a0,32(s1)
    80003ec8:	00000097          	auipc	ra,0x0
    80003ecc:	4a0080e7          	jalr	1184(ra) # 80004368 <_ZN4_sem6signalEv>
}
    80003ed0:	01813083          	ld	ra,24(sp)
    80003ed4:	01013403          	ld	s0,16(sp)
    80003ed8:	00813483          	ld	s1,8(sp)
    80003edc:	00013903          	ld	s2,0(sp)
    80003ee0:	02010113          	addi	sp,sp,32
    80003ee4:	00008067          	ret

0000000080003ee8 <_ZN7_buffernwEm>:


void *_buffer::operator new(size_t size) {
    80003ee8:	fe010113          	addi	sp,sp,-32
    80003eec:	00113c23          	sd	ra,24(sp)
    80003ef0:	00813823          	sd	s0,16(sp)
    80003ef4:	00913423          	sd	s1,8(sp)
    80003ef8:	02010413          	addi	s0,sp,32
    80003efc:	00050493          	mv	s1,a0
    //return MemoryAllocator::getMemory(size);
    return SlabAllocator::getInstance().allocKernel(size, SlabAllocator::BUFFER);
    80003f00:	00001097          	auipc	ra,0x1
    80003f04:	bc8080e7          	jalr	-1080(ra) # 80004ac8 <_ZN13SlabAllocator11getInstanceEv>
    80003f08:	00300613          	li	a2,3
    80003f0c:	00048593          	mv	a1,s1
    80003f10:	00001097          	auipc	ra,0x1
    80003f14:	f44080e7          	jalr	-188(ra) # 80004e54 <_ZN13SlabAllocator11allocKernelEmNS_16kernelCacheEntryE>
}
    80003f18:	01813083          	ld	ra,24(sp)
    80003f1c:	01013403          	ld	s0,16(sp)
    80003f20:	00813483          	ld	s1,8(sp)
    80003f24:	02010113          	addi	sp,sp,32
    80003f28:	00008067          	ret

0000000080003f2c <_ZN7_buffernaEm>:

void *_buffer::operator new[](size_t size) {
    80003f2c:	fe010113          	addi	sp,sp,-32
    80003f30:	00113c23          	sd	ra,24(sp)
    80003f34:	00813823          	sd	s0,16(sp)
    80003f38:	00913423          	sd	s1,8(sp)
    80003f3c:	02010413          	addi	s0,sp,32
    80003f40:	00050493          	mv	s1,a0
    MemoryAllocator(MemoryAllocator&&) = delete;
    MemoryAllocator& operator=(const MemoryAllocator&) = delete;
    MemoryAllocator& operator=(MemoryAllocator&&) = delete;


    static void* getMemory(size_t size) { return getInstance().IGetMemory(size); }
    80003f44:	00001097          	auipc	ra,0x1
    80003f48:	578080e7          	jalr	1400(ra) # 800054bc <_ZN15MemoryAllocator11getInstanceEv>
    80003f4c:	00048593          	mv	a1,s1
    80003f50:	00001097          	auipc	ra,0x1
    80003f54:	5c8080e7          	jalr	1480(ra) # 80005518 <_ZN15MemoryAllocator10IGetMemoryEm>
    return MemoryAllocator::getMemory(size);
}
    80003f58:	01813083          	ld	ra,24(sp)
    80003f5c:	01013403          	ld	s0,16(sp)
    80003f60:	00813483          	ld	s1,8(sp)
    80003f64:	02010113          	addi	sp,sp,32
    80003f68:	00008067          	ret

0000000080003f6c <_ZN7_bufferdlEPv>:

void _buffer::operator delete(void *addr) {
    80003f6c:	fe010113          	addi	sp,sp,-32
    80003f70:	00113c23          	sd	ra,24(sp)
    80003f74:	00813823          	sd	s0,16(sp)
    80003f78:	00913423          	sd	s1,8(sp)
    80003f7c:	02010413          	addi	s0,sp,32
    80003f80:	00050493          	mv	s1,a0
    //MemoryAllocator::freeMemory(addr);
    SlabAllocator::getInstance().deallocKernel(addr, SlabAllocator::BUFFER);
    80003f84:	00001097          	auipc	ra,0x1
    80003f88:	b44080e7          	jalr	-1212(ra) # 80004ac8 <_ZN13SlabAllocator11getInstanceEv>
    80003f8c:	00300613          	li	a2,3
    80003f90:	00048593          	mv	a1,s1
    80003f94:	00001097          	auipc	ra,0x1
    80003f98:	01c080e7          	jalr	28(ra) # 80004fb0 <_ZN13SlabAllocator13deallocKernelEPvNS_16kernelCacheEntryE>

}
    80003f9c:	01813083          	ld	ra,24(sp)
    80003fa0:	01013403          	ld	s0,16(sp)
    80003fa4:	00813483          	ld	s1,8(sp)
    80003fa8:	02010113          	addi	sp,sp,32
    80003fac:	00008067          	ret

0000000080003fb0 <_ZN7_bufferdaEPv>:

void _buffer::operator delete[](void *addr) {
    80003fb0:	fe010113          	addi	sp,sp,-32
    80003fb4:	00113c23          	sd	ra,24(sp)
    80003fb8:	00813823          	sd	s0,16(sp)
    80003fbc:	00913423          	sd	s1,8(sp)
    80003fc0:	02010413          	addi	s0,sp,32
    80003fc4:	00050493          	mv	s1,a0

    static int freeMemory(void* addr) { return getInstance().IFreeMemory(addr); }
    80003fc8:	00001097          	auipc	ra,0x1
    80003fcc:	4f4080e7          	jalr	1268(ra) # 800054bc <_ZN15MemoryAllocator11getInstanceEv>
    80003fd0:	00048593          	mv	a1,s1
    80003fd4:	00001097          	auipc	ra,0x1
    80003fd8:	670080e7          	jalr	1648(ra) # 80005644 <_ZN15MemoryAllocator11IFreeMemoryEPv>
    MemoryAllocator::freeMemory(addr);
}
    80003fdc:	01813083          	ld	ra,24(sp)
    80003fe0:	01013403          	ld	s0,16(sp)
    80003fe4:	00813483          	ld	s1,8(sp)
    80003fe8:	02010113          	addi	sp,sp,32
    80003fec:	00008067          	ret

0000000080003ff0 <main>:
#include "../h/SleepList.hpp"




int main(){
    80003ff0:	fb010113          	addi	sp,sp,-80
    80003ff4:	04113423          	sd	ra,72(sp)
    80003ff8:	04813023          	sd	s0,64(sp)
    80003ffc:	02913c23          	sd	s1,56(sp)
    80004000:	05010413          	addi	s0,sp,80

    Riscv::w_stvec((uint64)&Riscv::supervisorTrap);
    80004004:	00009797          	auipc	a5,0x9
    80004008:	cd47b783          	ld	a5,-812(a5) # 8000ccd8 <_GLOBAL_OFFSET_TABLE_+0x20>
    __asm__ volatile ("csrw stvec, %[stvec]" : : [stvec] "r"(stvec));
    8000400c:	10579073          	csrw	stvec,a5

    Riscv::init();
    80004010:	fffff097          	auipc	ra,0xfffff
    80004014:	404080e7          	jalr	1028(ra) # 80003414 <_ZN5Riscv4initEv>

    thread_t empty;
    thread_create(&empty, nullptr, nullptr);
    80004018:	00000613          	li	a2,0
    8000401c:	00000593          	li	a1,0
    80004020:	fd840513          	addi	a0,s0,-40
    80004024:	00000097          	auipc	ra,0x0
    80004028:	72c080e7          	jalr	1836(ra) # 80004750 <_Z13thread_createPP3TCBPFvPvES2_>
    TCB::running = empty;
    8000402c:	00009797          	auipc	a5,0x9
    80004030:	cf47b783          	ld	a5,-780(a5) # 8000cd20 <_GLOBAL_OFFSET_TABLE_+0x68>
    80004034:	fd843703          	ld	a4,-40(s0)
    80004038:	00e7b023          	sd	a4,0(a5)

    thread_t out;
    thread_create(&out, TCB::output, nullptr);
    8000403c:	00000613          	li	a2,0
    80004040:	00009597          	auipc	a1,0x9
    80004044:	cb05b583          	ld	a1,-848(a1) # 8000ccf0 <_GLOBAL_OFFSET_TABLE_+0x38>
    80004048:	fd040513          	addi	a0,s0,-48
    8000404c:	00000097          	auipc	ra,0x0
    80004050:	704080e7          	jalr	1796(ra) # 80004750 <_Z13thread_createPP3TCBPFvPvES2_>

    thread_t in;
    thread_create(&in, TCB::input, nullptr);
    80004054:	00000613          	li	a2,0
    80004058:	00009597          	auipc	a1,0x9
    8000405c:	cb85b583          	ld	a1,-840(a1) # 8000cd10 <_GLOBAL_OFFSET_TABLE_+0x58>
    80004060:	fc840513          	addi	a0,s0,-56
    80004064:	00000097          	auipc	ra,0x0
    80004068:	6ec080e7          	jalr	1772(ra) # 80004750 <_Z13thread_createPP3TCBPFvPvES2_>

    sem_t mainSem;
    sem_open(&mainSem, 0);
    8000406c:	00000593          	li	a1,0
    80004070:	fc040513          	addi	a0,s0,-64
    80004074:	00000097          	auipc	ra,0x0
    80004078:	7cc080e7          	jalr	1996(ra) # 80004840 <_Z8sem_openPP4_semj>


    thread_t main;
    thread_create(&main, TCB::mainWrapper, mainSem);
    8000407c:	fc043603          	ld	a2,-64(s0)
    80004080:	00009597          	auipc	a1,0x9
    80004084:	cb05b583          	ld	a1,-848(a1) # 8000cd30 <_GLOBAL_OFFSET_TABLE_+0x78>
    80004088:	fb840513          	addi	a0,s0,-72
    8000408c:	00000097          	auipc	ra,0x0
    80004090:	6c4080e7          	jalr	1732(ra) # 80004750 <_Z13thread_createPP3TCBPFvPvES2_>

    thread_t idleThread;
    thread_create(&idleThread, TCB::idle, nullptr);
    80004094:	00000613          	li	a2,0
    80004098:	00009597          	auipc	a1,0x9
    8000409c:	c705b583          	ld	a1,-912(a1) # 8000cd08 <_GLOBAL_OFFSET_TABLE_+0x50>
    800040a0:	fb040513          	addi	a0,s0,-80
    800040a4:	00000097          	auipc	ra,0x0
    800040a8:	6ac080e7          	jalr	1708(ra) # 80004750 <_Z13thread_createPP3TCBPFvPvES2_>
    __asm__ volatile ("csrs sstatus, %[mask]" : : [mask] "r"(mask));
    800040ac:	00200793          	li	a5,2
    800040b0:	1007a073          	csrs	sstatus,a5

    Riscv::ms_sstatus(Riscv::SSTATUS_SIE);

    sem_wait(mainSem);
    800040b4:	fc043503          	ld	a0,-64(s0)
    800040b8:	00001097          	auipc	ra,0x1
    800040bc:	808080e7          	jalr	-2040(ra) # 800048c0 <_Z8sem_waitP4_sem>


    while(Riscv::outputBuffer->getCnt() > 0)
    800040c0:	00009797          	auipc	a5,0x9
    800040c4:	c587b783          	ld	a5,-936(a5) # 8000cd18 <_GLOBAL_OFFSET_TABLE_+0x60>
    800040c8:	0007b503          	ld	a0,0(a5)
    800040cc:	00000097          	auipc	ra,0x0
    800040d0:	ba4080e7          	jalr	-1116(ra) # 80003c70 <_ZN7_buffer6getCntEv>
    800040d4:	00a05863          	blez	a0,800040e4 <main+0xf4>
        thread_dispatch();
    800040d8:	00000097          	auipc	ra,0x0
    800040dc:	744080e7          	jalr	1860(ra) # 8000481c <_Z15thread_dispatchv>
    800040e0:	fe1ff06f          	j	800040c0 <main+0xd0>

    SleepList::emptyList();
    800040e4:	00003097          	auipc	ra,0x3
    800040e8:	4f0080e7          	jalr	1264(ra) # 800075d4 <_ZN9SleepList9emptyListEv>
    TCB::deleteThreads(); // delete threads
    800040ec:	00003097          	auipc	ra,0x3
    800040f0:	ea0080e7          	jalr	-352(ra) # 80006f8c <_ZN3TCB13deleteThreadsEv>
    Riscv::finish(); //delete inputBuffer and outputBuffer
    800040f4:	00000097          	auipc	ra,0x0
    800040f8:	864080e7          	jalr	-1948(ra) # 80003958 <_ZN5Riscv6finishEv>

    delete out;
    800040fc:	fd043483          	ld	s1,-48(s0)
    80004100:	00048e63          	beqz	s1,8000411c <main+0x12c>
    80004104:	00048513          	mv	a0,s1
    80004108:	00000097          	auipc	ra,0x0
    8000410c:	07c080e7          	jalr	124(ra) # 80004184 <_ZN3TCBD1Ev>
    80004110:	00048513          	mv	a0,s1
    80004114:	00003097          	auipc	ra,0x3
    80004118:	bcc080e7          	jalr	-1076(ra) # 80006ce0 <_ZN3TCBdlEPv>
    delete in;
    8000411c:	fc843483          	ld	s1,-56(s0)
    80004120:	00048e63          	beqz	s1,8000413c <main+0x14c>
    80004124:	00048513          	mv	a0,s1
    80004128:	00000097          	auipc	ra,0x0
    8000412c:	05c080e7          	jalr	92(ra) # 80004184 <_ZN3TCBD1Ev>
    80004130:	00048513          	mv	a0,s1
    80004134:	00003097          	auipc	ra,0x3
    80004138:	bac080e7          	jalr	-1108(ra) # 80006ce0 <_ZN3TCBdlEPv>
    delete idleThread; // in out and idleThread are while(true)
    8000413c:	fb043483          	ld	s1,-80(s0)
    80004140:	00048e63          	beqz	s1,8000415c <main+0x16c>
    80004144:	00048513          	mv	a0,s1
    80004148:	00000097          	auipc	ra,0x0
    8000414c:	03c080e7          	jalr	60(ra) # 80004184 <_ZN3TCBD1Ev>
    80004150:	00048513          	mv	a0,s1
    80004154:	00003097          	auipc	ra,0x3
    80004158:	b8c080e7          	jalr	-1140(ra) # 80006ce0 <_ZN3TCBdlEPv>
    delete mainSem;
    8000415c:	fc043503          	ld	a0,-64(s0)
    80004160:	00050663          	beqz	a0,8000416c <main+0x17c>
    80004164:	00000097          	auipc	ra,0x0
    80004168:	454080e7          	jalr	1108(ra) # 800045b8 <_ZN4_semdlEPv>

    return 0;
    8000416c:	00000513          	li	a0,0
    80004170:	04813083          	ld	ra,72(sp)
    80004174:	04013403          	ld	s0,64(sp)
    80004178:	03813483          	ld	s1,56(sp)
    8000417c:	05010113          	addi	sp,sp,80
    80004180:	00008067          	ret

0000000080004184 <_ZN3TCBD1Ev>:
    void operator delete(void*);
    void operator delete[](void*);

    ~TCB(){
        //mem_free(stack);
        if(stack) SlabAllocator::getInstance().deallocKernel(stack, SlabAllocator::STACK);
    80004184:	01853783          	ld	a5,24(a0)
    80004188:	04078463          	beqz	a5,800041d0 <_ZN3TCBD1Ev+0x4c>
    ~TCB(){
    8000418c:	fe010113          	addi	sp,sp,-32
    80004190:	00113c23          	sd	ra,24(sp)
    80004194:	00813823          	sd	s0,16(sp)
    80004198:	00913423          	sd	s1,8(sp)
    8000419c:	02010413          	addi	s0,sp,32
    800041a0:	00050493          	mv	s1,a0
        if(stack) SlabAllocator::getInstance().deallocKernel(stack, SlabAllocator::STACK);
    800041a4:	00001097          	auipc	ra,0x1
    800041a8:	924080e7          	jalr	-1756(ra) # 80004ac8 <_ZN13SlabAllocator11getInstanceEv>
    800041ac:	00400613          	li	a2,4
    800041b0:	0184b583          	ld	a1,24(s1)
    800041b4:	00001097          	auipc	ra,0x1
    800041b8:	dfc080e7          	jalr	-516(ra) # 80004fb0 <_ZN13SlabAllocator13deallocKernelEPvNS_16kernelCacheEntryE>
        stack = nullptr;
    };
    800041bc:	01813083          	ld	ra,24(sp)
    800041c0:	01013403          	ld	s0,16(sp)
    800041c4:	00813483          	ld	s1,8(sp)
    800041c8:	02010113          	addi	sp,sp,32
    800041cc:	00008067          	ret
    800041d0:	00008067          	ret

00000000800041d4 <_ZN4_sem5blockEv>:
    if(++value <= 0)
        unblock();
    return 0;
}

void _sem::block() {
    800041d4:	fd010113          	addi	sp,sp,-48
    800041d8:	02113423          	sd	ra,40(sp)
    800041dc:	02813023          	sd	s0,32(sp)
    800041e0:	00913c23          	sd	s1,24(sp)
    800041e4:	01213823          	sd	s2,16(sp)
    800041e8:	01313423          	sd	s3,8(sp)
    800041ec:	03010413          	addi	s0,sp,48
    800041f0:	00050493          	mv	s1,a0
    TCB::running->setStatus(TCB::BLOCKED);
    800041f4:	00009797          	auipc	a5,0x9
    800041f8:	b2c7b783          	ld	a5,-1236(a5) # 8000cd20 <_GLOBAL_OFFSET_TABLE_+0x68>
    800041fc:	0007b903          	ld	s2,0(a5)


    static TCB* running;
    int pid;

    void setStatus(threadStatus status) { this->status = status; }
    80004200:	00200793          	li	a5,2
    80004204:	02f92c23          	sw	a5,56(s2)
    blocked.addLast(TCB::running);
    80004208:	00850993          	addi	s3,a0,8

        Elem(T *data, Elem *next) : data(data), next(next) {}

        void* operator new(size_t size) {
            //void*addr =  MemoryAllocator::getMemory(size);
            void* addr = SlabAllocator::getInstance().allocKernel(size, SlabAllocator::LISTELEM);
    8000420c:	00001097          	auipc	ra,0x1
    80004210:	8bc080e7          	jalr	-1860(ra) # 80004ac8 <_ZN13SlabAllocator11getInstanceEv>
    80004214:	00200613          	li	a2,2
    80004218:	01000593          	li	a1,16
    8000421c:	00001097          	auipc	ra,0x1
    80004220:	c38080e7          	jalr	-968(ra) # 80004e54 <_ZN13SlabAllocator11allocKernelEmNS_16kernelCacheEntryE>
        head = elem;
        if (!tail) { tail = head; }
    }

    void addLast(T *data){
        Elem *elem = new Elem(data, 0);
    80004224:	00050663          	beqz	a0,80004230 <_ZN4_sem5blockEv+0x5c>
        Elem(T *data, Elem *next) : data(data), next(next) {}
    80004228:	01253023          	sd	s2,0(a0)
    8000422c:	00053423          	sd	zero,8(a0)
        if(!elem)
    80004230:	00050a63          	beqz	a0,80004244 <_ZN4_sem5blockEv+0x70>
            return;
        if (tail){
    80004234:	0089b783          	ld	a5,8(s3)
    80004238:	02078863          	beqz	a5,80004268 <_ZN4_sem5blockEv+0x94>
            tail->next = elem;
    8000423c:	00a7b423          	sd	a0,8(a5)
            tail = elem;
    80004240:	00a9b423          	sd	a0,8(s3)
    TCB::dispatch();
    80004244:	00002097          	auipc	ra,0x2
    80004248:	700080e7          	jalr	1792(ra) # 80006944 <_ZN3TCB8dispatchEv>
}
    8000424c:	02813083          	ld	ra,40(sp)
    80004250:	02013403          	ld	s0,32(sp)
    80004254:	01813483          	ld	s1,24(sp)
    80004258:	01013903          	ld	s2,16(sp)
    8000425c:	00813983          	ld	s3,8(sp)
    80004260:	03010113          	addi	sp,sp,48
    80004264:	00008067          	ret
        } else
            head = tail = elem;
    80004268:	00a9b423          	sd	a0,8(s3)
    8000426c:	00a4b423          	sd	a0,8(s1)
    80004270:	fd5ff06f          	j	80004244 <_ZN4_sem5blockEv+0x70>

0000000080004274 <_ZN4_sem4waitEv>:
    if(!this->active)
    80004274:	00454783          	lbu	a5,4(a0)
    80004278:	04078e63          	beqz	a5,800042d4 <_ZN4_sem4waitEv+0x60>
int _sem::wait() {
    8000427c:	fe010113          	addi	sp,sp,-32
    80004280:	00113c23          	sd	ra,24(sp)
    80004284:	00813823          	sd	s0,16(sp)
    80004288:	00913423          	sd	s1,8(sp)
    8000428c:	02010413          	addi	s0,sp,32
    80004290:	00050493          	mv	s1,a0
    if(--value < 0)
    80004294:	00052783          	lw	a5,0(a0)
    80004298:	fff7879b          	addiw	a5,a5,-1
    8000429c:	00f52023          	sw	a5,0(a0)
    800042a0:	02079713          	slli	a4,a5,0x20
    800042a4:	02074263          	bltz	a4,800042c8 <_ZN4_sem4waitEv+0x54>
    if(!this->active)
    800042a8:	0044c783          	lbu	a5,4(s1)
    800042ac:	02078863          	beqz	a5,800042dc <_ZN4_sem4waitEv+0x68>
    return 0;
    800042b0:	00000513          	li	a0,0
}
    800042b4:	01813083          	ld	ra,24(sp)
    800042b8:	01013403          	ld	s0,16(sp)
    800042bc:	00813483          	ld	s1,8(sp)
    800042c0:	02010113          	addi	sp,sp,32
    800042c4:	00008067          	ret
        block();
    800042c8:	00000097          	auipc	ra,0x0
    800042cc:	f0c080e7          	jalr	-244(ra) # 800041d4 <_ZN4_sem5blockEv>
    800042d0:	fd9ff06f          	j	800042a8 <_ZN4_sem4waitEv+0x34>
        return -1;
    800042d4:	fff00513          	li	a0,-1
}
    800042d8:	00008067          	ret
        return -1;
    800042dc:	fff00513          	li	a0,-1
    800042e0:	fd5ff06f          	j	800042b4 <_ZN4_sem4waitEv+0x40>

00000000800042e4 <_ZN4_sem7unblockEv>:

void _sem::unblock() {
    800042e4:	fe010113          	addi	sp,sp,-32
    800042e8:	00113c23          	sd	ra,24(sp)
    800042ec:	00813823          	sd	s0,16(sp)
    800042f0:	00913423          	sd	s1,8(sp)
    800042f4:	01213023          	sd	s2,0(sp)
    800042f8:	02010413          	addi	s0,sp,32
    }

    T *removeFirst(){
        if (!head)
    800042fc:	00853483          	ld	s1,8(a0)
    80004300:	06048063          	beqz	s1,80004360 <_ZN4_sem7unblockEv+0x7c>
            return 0;

        Elem *elem = head;
        head = head->next;
    80004304:	0084b783          	ld	a5,8(s1)
    80004308:	00f53423          	sd	a5,8(a0)
        if (!head)
    8000430c:	04078663          	beqz	a5,80004358 <_ZN4_sem7unblockEv+0x74>
            tail = 0;

        T *ret = elem->data;
    80004310:	0004b903          	ld	s2,0(s1)
            SlabAllocator::getInstance().deallocKernel(addr, SlabAllocator::LISTELEM);
    80004314:	00000097          	auipc	ra,0x0
    80004318:	7b4080e7          	jalr	1972(ra) # 80004ac8 <_ZN13SlabAllocator11getInstanceEv>
    8000431c:	00200613          	li	a2,2
    80004320:	00048593          	mv	a1,s1
    80004324:	00001097          	auipc	ra,0x1
    80004328:	c8c080e7          	jalr	-884(ra) # 80004fb0 <_ZN13SlabAllocator13deallocKernelEPvNS_16kernelCacheEntryE>
    8000432c:	00100793          	li	a5,1
    80004330:	02f92c23          	sw	a5,56(s2)
    TCB* t = blocked.removeFirst();
    t->setStatus(TCB::RUNNING);
    Scheduler::put(t);
    80004334:	00090513          	mv	a0,s2
    80004338:	fffff097          	auipc	ra,0xfffff
    8000433c:	000080e7          	jalr	ra # 80003338 <_ZN9Scheduler3putEP3TCB>
}
    80004340:	01813083          	ld	ra,24(sp)
    80004344:	01013403          	ld	s0,16(sp)
    80004348:	00813483          	ld	s1,8(sp)
    8000434c:	00013903          	ld	s2,0(sp)
    80004350:	02010113          	addi	sp,sp,32
    80004354:	00008067          	ret
            tail = 0;
    80004358:	00053823          	sd	zero,16(a0)
    8000435c:	fb5ff06f          	j	80004310 <_ZN4_sem7unblockEv+0x2c>
            return 0;
    80004360:	00048913          	mv	s2,s1
    80004364:	fc9ff06f          	j	8000432c <_ZN4_sem7unblockEv+0x48>

0000000080004368 <_ZN4_sem6signalEv>:
    if(!this->active)
    80004368:	00454783          	lbu	a5,4(a0)
    8000436c:	04078663          	beqz	a5,800043b8 <_ZN4_sem6signalEv+0x50>
    if(++value <= 0)
    80004370:	00052783          	lw	a5,0(a0)
    80004374:	0017879b          	addiw	a5,a5,1
    80004378:	0007871b          	sext.w	a4,a5
    8000437c:	00f52023          	sw	a5,0(a0)
    80004380:	00e05663          	blez	a4,8000438c <_ZN4_sem6signalEv+0x24>
    return 0;
    80004384:	00000513          	li	a0,0
}
    80004388:	00008067          	ret
int _sem::signal() {
    8000438c:	ff010113          	addi	sp,sp,-16
    80004390:	00113423          	sd	ra,8(sp)
    80004394:	00813023          	sd	s0,0(sp)
    80004398:	01010413          	addi	s0,sp,16
        unblock();
    8000439c:	00000097          	auipc	ra,0x0
    800043a0:	f48080e7          	jalr	-184(ra) # 800042e4 <_ZN4_sem7unblockEv>
    return 0;
    800043a4:	00000513          	li	a0,0
}
    800043a8:	00813083          	ld	ra,8(sp)
    800043ac:	00013403          	ld	s0,0(sp)
    800043b0:	01010113          	addi	sp,sp,16
    800043b4:	00008067          	ret
        return -1;
    800043b8:	fff00513          	li	a0,-1
    800043bc:	00008067          	ret

00000000800043c0 <_ZN4_sem5closeEv>:

int _sem::close(){

    if(!this->active)
    800043c0:	00454783          	lbu	a5,4(a0)
    800043c4:	0e078863          	beqz	a5,800044b4 <_ZN4_sem5closeEv+0xf4>
int _sem::close(){
    800043c8:	fd010113          	addi	sp,sp,-48
    800043cc:	02113423          	sd	ra,40(sp)
    800043d0:	02813023          	sd	s0,32(sp)
    800043d4:	00913c23          	sd	s1,24(sp)
    800043d8:	01213823          	sd	s2,16(sp)
    800043dc:	01313423          	sd	s3,8(sp)
    800043e0:	01413023          	sd	s4,0(sp)
    800043e4:	03010413          	addi	s0,sp,48
    800043e8:	00050a13          	mv	s4,a0
        return -1;
    TCB* thread;
    for(thread = blocked.removeFirst(); thread;){
    800043ec:	00850993          	addi	s3,a0,8
        if (!head)
    800043f0:	00853483          	ld	s1,8(a0)
    800043f4:	02048c63          	beqz	s1,8000442c <_ZN4_sem5closeEv+0x6c>
        head = head->next;
    800043f8:	0084b783          	ld	a5,8(s1)
    800043fc:	00f53423          	sd	a5,8(a0)
        if (!head)
    80004400:	02078263          	beqz	a5,80004424 <_ZN4_sem5closeEv+0x64>
        T *ret = elem->data;
    80004404:	0004b903          	ld	s2,0(s1)
            SlabAllocator::getInstance().deallocKernel(addr, SlabAllocator::LISTELEM);
    80004408:	00000097          	auipc	ra,0x0
    8000440c:	6c0080e7          	jalr	1728(ra) # 80004ac8 <_ZN13SlabAllocator11getInstanceEv>
    80004410:	00200613          	li	a2,2
    80004414:	00048593          	mv	a1,s1
    80004418:	00001097          	auipc	ra,0x1
    8000441c:	b98080e7          	jalr	-1128(ra) # 80004fb0 <_ZN13SlabAllocator13deallocKernelEPvNS_16kernelCacheEntryE>
        delete elem;
        return ret;
    80004420:	0340006f          	j	80004454 <_ZN4_sem5closeEv+0x94>
            tail = 0;
    80004424:	0009b423          	sd	zero,8(s3)
    80004428:	fddff06f          	j	80004404 <_ZN4_sem5closeEv+0x44>
            return 0;
    8000442c:	00048913          	mv	s2,s1
    80004430:	0240006f          	j	80004454 <_ZN4_sem5closeEv+0x94>
            tail = 0;
    80004434:	0009b423          	sd	zero,8(s3)
        T *ret = elem->data;
    80004438:	0004b903          	ld	s2,0(s1)
            SlabAllocator::getInstance().deallocKernel(addr, SlabAllocator::LISTELEM);
    8000443c:	00000097          	auipc	ra,0x0
    80004440:	68c080e7          	jalr	1676(ra) # 80004ac8 <_ZN13SlabAllocator11getInstanceEv>
    80004444:	00200613          	li	a2,2
    80004448:	00048593          	mv	a1,s1
    8000444c:	00001097          	auipc	ra,0x1
    80004450:	b64080e7          	jalr	-1180(ra) # 80004fb0 <_ZN13SlabAllocator13deallocKernelEPvNS_16kernelCacheEntryE>
    80004454:	02090c63          	beqz	s2,8000448c <_ZN4_sem5closeEv+0xcc>
    80004458:	00100793          	li	a5,1
    8000445c:	02f92c23          	sw	a5,56(s2)
        thread->setStatus(TCB::RUNNING);
        Scheduler::put(thread);
    80004460:	00090513          	mv	a0,s2
    80004464:	fffff097          	auipc	ra,0xfffff
    80004468:	ed4080e7          	jalr	-300(ra) # 80003338 <_ZN9Scheduler3putEP3TCB>
        if (!head)
    8000446c:	0009b483          	ld	s1,0(s3)
    80004470:	00048a63          	beqz	s1,80004484 <_ZN4_sem5closeEv+0xc4>
        head = head->next;
    80004474:	0084b783          	ld	a5,8(s1)
    80004478:	00f9b023          	sd	a5,0(s3)
        if (!head)
    8000447c:	fa079ee3          	bnez	a5,80004438 <_ZN4_sem5closeEv+0x78>
    80004480:	fb5ff06f          	j	80004434 <_ZN4_sem5closeEv+0x74>
            return 0;
    80004484:	00048913          	mv	s2,s1
    for(thread = blocked.removeFirst(); thread;){
    80004488:	fcdff06f          	j	80004454 <_ZN4_sem5closeEv+0x94>
        thread = blocked.removeFirst();
    }
    this->active = false;
    8000448c:	000a0223          	sb	zero,4(s4)
    return 0;
    80004490:	00000513          	li	a0,0
}
    80004494:	02813083          	ld	ra,40(sp)
    80004498:	02013403          	ld	s0,32(sp)
    8000449c:	01813483          	ld	s1,24(sp)
    800044a0:	01013903          	ld	s2,16(sp)
    800044a4:	00813983          	ld	s3,8(sp)
    800044a8:	00013a03          	ld	s4,0(sp)
    800044ac:	03010113          	addi	sp,sp,48
    800044b0:	00008067          	ret
        return -1;
    800044b4:	fff00513          	li	a0,-1
}
    800044b8:	00008067          	ret

00000000800044bc <_ZN4_semnwEm>:


void *_sem::operator new(size_t size) {
    800044bc:	fe010113          	addi	sp,sp,-32
    800044c0:	00113c23          	sd	ra,24(sp)
    800044c4:	00813823          	sd	s0,16(sp)
    800044c8:	00913423          	sd	s1,8(sp)
    800044cc:	02010413          	addi	s0,sp,32
    800044d0:	00050493          	mv	s1,a0
    //return MemoryAllocator::getMemory(size);
    return SlabAllocator::getInstance().allocKernel(size, SlabAllocator::SEM);
    800044d4:	00000097          	auipc	ra,0x0
    800044d8:	5f4080e7          	jalr	1524(ra) # 80004ac8 <_ZN13SlabAllocator11getInstanceEv>
    800044dc:	00100613          	li	a2,1
    800044e0:	00048593          	mv	a1,s1
    800044e4:	00001097          	auipc	ra,0x1
    800044e8:	970080e7          	jalr	-1680(ra) # 80004e54 <_ZN13SlabAllocator11allocKernelEmNS_16kernelCacheEntryE>
}
    800044ec:	01813083          	ld	ra,24(sp)
    800044f0:	01013403          	ld	s0,16(sp)
    800044f4:	00813483          	ld	s1,8(sp)
    800044f8:	02010113          	addi	sp,sp,32
    800044fc:	00008067          	ret

0000000080004500 <_ZN4_sem15createSemaphoreEPPS_i>:
int _sem::createSemaphore(sem_t *handle, int i) {
    80004500:	fe010113          	addi	sp,sp,-32
    80004504:	00113c23          	sd	ra,24(sp)
    80004508:	00813823          	sd	s0,16(sp)
    8000450c:	00913423          	sd	s1,8(sp)
    80004510:	01213023          	sd	s2,0(sp)
    80004514:	02010413          	addi	s0,sp,32
    80004518:	00050493          	mv	s1,a0
    8000451c:	00058913          	mv	s2,a1
    *handle = new _sem(i);
    80004520:	02000513          	li	a0,32
    80004524:	00000097          	auipc	ra,0x0
    80004528:	f98080e7          	jalr	-104(ra) # 800044bc <_ZN4_semnwEm>
    8000452c:	00050e63          	beqz	a0,80004548 <_ZN4_sem15createSemaphoreEPPS_i+0x48>

    // unblock thread
    void unblock();

private:
    _sem(int val) : value(val), active(true){}
    80004530:	01252023          	sw	s2,0(a0)
    80004534:	00100793          	li	a5,1
    80004538:	00f50223          	sb	a5,4(a0)
    List() : head(0), tail(0), current(0) {}
    8000453c:	00053423          	sd	zero,8(a0)
    80004540:	00053823          	sd	zero,16(a0)
    80004544:	00053c23          	sd	zero,24(a0)
    80004548:	00a4b023          	sd	a0,0(s1)
    if(handle == nullptr){
    8000454c:	02048063          	beqz	s1,8000456c <_ZN4_sem15createSemaphoreEPPS_i+0x6c>
    return 0;
    80004550:	00000513          	li	a0,0
}
    80004554:	01813083          	ld	ra,24(sp)
    80004558:	01013403          	ld	s0,16(sp)
    8000455c:	00813483          	ld	s1,8(sp)
    80004560:	00013903          	ld	s2,0(sp)
    80004564:	02010113          	addi	sp,sp,32
    80004568:	00008067          	ret
        *handle = nullptr;
    8000456c:	0004b023          	sd	zero,0(s1)
        return -1;
    80004570:	fff00513          	li	a0,-1
    80004574:	fe1ff06f          	j	80004554 <_ZN4_sem15createSemaphoreEPPS_i+0x54>

0000000080004578 <_ZN4_semnaEm>:

void *_sem::operator new[](size_t size) {
    80004578:	fe010113          	addi	sp,sp,-32
    8000457c:	00113c23          	sd	ra,24(sp)
    80004580:	00813823          	sd	s0,16(sp)
    80004584:	00913423          	sd	s1,8(sp)
    80004588:	02010413          	addi	s0,sp,32
    8000458c:	00050493          	mv	s1,a0
    MemoryAllocator(MemoryAllocator&&) = delete;
    MemoryAllocator& operator=(const MemoryAllocator&) = delete;
    MemoryAllocator& operator=(MemoryAllocator&&) = delete;


    static void* getMemory(size_t size) { return getInstance().IGetMemory(size); }
    80004590:	00001097          	auipc	ra,0x1
    80004594:	f2c080e7          	jalr	-212(ra) # 800054bc <_ZN15MemoryAllocator11getInstanceEv>
    80004598:	00048593          	mv	a1,s1
    8000459c:	00001097          	auipc	ra,0x1
    800045a0:	f7c080e7          	jalr	-132(ra) # 80005518 <_ZN15MemoryAllocator10IGetMemoryEm>
    return MemoryAllocator::getMemory(size);
}
    800045a4:	01813083          	ld	ra,24(sp)
    800045a8:	01013403          	ld	s0,16(sp)
    800045ac:	00813483          	ld	s1,8(sp)
    800045b0:	02010113          	addi	sp,sp,32
    800045b4:	00008067          	ret

00000000800045b8 <_ZN4_semdlEPv>:

void _sem::operator delete(void *addr) {
    800045b8:	fe010113          	addi	sp,sp,-32
    800045bc:	00113c23          	sd	ra,24(sp)
    800045c0:	00813823          	sd	s0,16(sp)
    800045c4:	00913423          	sd	s1,8(sp)
    800045c8:	02010413          	addi	s0,sp,32
    800045cc:	00050493          	mv	s1,a0
    //MemoryAllocator::freeMemory(addr);
    SlabAllocator::getInstance().deallocKernel(addr, SlabAllocator::SEM);
    800045d0:	00000097          	auipc	ra,0x0
    800045d4:	4f8080e7          	jalr	1272(ra) # 80004ac8 <_ZN13SlabAllocator11getInstanceEv>
    800045d8:	00100613          	li	a2,1
    800045dc:	00048593          	mv	a1,s1
    800045e0:	00001097          	auipc	ra,0x1
    800045e4:	9d0080e7          	jalr	-1584(ra) # 80004fb0 <_ZN13SlabAllocator13deallocKernelEPvNS_16kernelCacheEntryE>
}
    800045e8:	01813083          	ld	ra,24(sp)
    800045ec:	01013403          	ld	s0,16(sp)
    800045f0:	00813483          	ld	s1,8(sp)
    800045f4:	02010113          	addi	sp,sp,32
    800045f8:	00008067          	ret

00000000800045fc <_ZN4_semdaEPv>:

void _sem::operator delete[](void *addr) {
    800045fc:	fe010113          	addi	sp,sp,-32
    80004600:	00113c23          	sd	ra,24(sp)
    80004604:	00813823          	sd	s0,16(sp)
    80004608:	00913423          	sd	s1,8(sp)
    8000460c:	02010413          	addi	s0,sp,32
    80004610:	00050493          	mv	s1,a0

    static int freeMemory(void* addr) { return getInstance().IFreeMemory(addr); }
    80004614:	00001097          	auipc	ra,0x1
    80004618:	ea8080e7          	jalr	-344(ra) # 800054bc <_ZN15MemoryAllocator11getInstanceEv>
    8000461c:	00048593          	mv	a1,s1
    80004620:	00001097          	auipc	ra,0x1
    80004624:	024080e7          	jalr	36(ra) # 80005644 <_ZN15MemoryAllocator11IFreeMemoryEPv>
    MemoryAllocator::freeMemory(addr);
}
    80004628:	01813083          	ld	ra,24(sp)
    8000462c:	01013403          	ld	s0,16(sp)
    80004630:	00813483          	ld	s1,8(sp)
    80004634:	02010113          	addi	sp,sp,32
    80004638:	00008067          	ret

000000008000463c <_Z11buddy_allocm>:

#include "../h/syscall_c.h"
#include "../h/SlabAllocator.hpp"

void* buddy_alloc(size_t size) {
    if(size <= 0)
    8000463c:	02050c63          	beqz	a0,80004674 <_Z11buddy_allocm+0x38>
void* buddy_alloc(size_t size) {
    80004640:	fe010113          	addi	sp,sp,-32
    80004644:	00813c23          	sd	s0,24(sp)
    80004648:	02010413          	addi	s0,sp,32
        return 0;


    __asm__ volatile("mv a1, %[var]" : : [var] "r"(size));
    8000464c:	00050593          	mv	a1,a0
    __asm__ volatile("mv a0, %[var]" : : [var] "r"(BUDDY_ALLOC));
    80004650:	02500793          	li	a5,37
    80004654:	00078513          	mv	a0,a5
    __asm__ volatile("ecall");
    80004658:	00000073          	ecall
    uint64 volatile ret;
    __asm__ volatile ("mv %0, a0" : "=r" (ret));
    8000465c:	00050793          	mv	a5,a0
    80004660:	fef43423          	sd	a5,-24(s0)

    return (void*)ret;
    80004664:	fe843503          	ld	a0,-24(s0)

}
    80004668:	01813403          	ld	s0,24(sp)
    8000466c:	02010113          	addi	sp,sp,32
    80004670:	00008067          	ret
        return 0;
    80004674:	00000513          	li	a0,0
}
    80004678:	00008067          	ret

000000008000467c <_Z10buddy_freePvm>:
void buddy_free(void *addr, size_t size) {
    if(!addr)
    8000467c:	02050c63          	beqz	a0,800046b4 <_Z10buddy_freePvm+0x38>
void buddy_free(void *addr, size_t size) {
    80004680:	fe010113          	addi	sp,sp,-32
    80004684:	00813c23          	sd	s0,24(sp)
    80004688:	02010413          	addi	s0,sp,32
        return;

    uint64 param = (uint64)(addr);
    __asm__ volatile("mv a2, %[var]" : : [var] "r"(size));
    8000468c:	00058613          	mv	a2,a1
    __asm__ volatile("mv a1, %[var]" : : [var] "r"(param));
    80004690:	00050593          	mv	a1,a0
    __asm__ volatile("mv a0, %[var]" : : [var] "r"(BUDDY_FREE));
    80004694:	02600793          	li	a5,38
    80004698:	00078513          	mv	a0,a5
    __asm__ volatile("ecall");
    8000469c:	00000073          	ecall
    uint64 volatile ret;
    __asm__ volatile ("mv %0, a0" : "=r" (ret));
    800046a0:	00050793          	mv	a5,a0
    800046a4:	fef43423          	sd	a5,-24(s0)

}
    800046a8:	01813403          	ld	s0,24(sp)
    800046ac:	02010113          	addi	sp,sp,32
    800046b0:	00008067          	ret
    800046b4:	00008067          	ret

00000000800046b8 <_Z9mem_allocm>:


void* mem_alloc(size_t size){

    if(size <= 0)
    800046b8:	04050663          	beqz	a0,80004704 <_Z9mem_allocm+0x4c>
void* mem_alloc(size_t size){
    800046bc:	fe010113          	addi	sp,sp,-32
    800046c0:	00813c23          	sd	s0,24(sp)
    800046c4:	02010413          	addi	s0,sp,32
        return 0;
    size_t temp = size / MEM_BLOCK_SIZE;
    800046c8:	00655793          	srli	a5,a0,0x6
    size_t sz = (temp * MEM_BLOCK_SIZE == size) ? size : (temp + 1)*MEM_BLOCK_SIZE;
    800046cc:	fc057713          	andi	a4,a0,-64
    800046d0:	00a70663          	beq	a4,a0,800046dc <_Z9mem_allocm+0x24>
    800046d4:	00178513          	addi	a0,a5,1
    800046d8:	00651513          	slli	a0,a0,0x6

    __asm__ volatile("mv a1, %[var]" : : [var] "r"(sz));
    800046dc:	00050593          	mv	a1,a0
    __asm__ volatile("mv a0, %[var]" : : [var] "r"(MEM_ALLOC));
    800046e0:	00100793          	li	a5,1
    800046e4:	00078513          	mv	a0,a5
    __asm__ volatile("ecall");
    800046e8:	00000073          	ecall
    uint64 volatile ret;
    __asm__ volatile ("mv %0, a0" : "=r" (ret));
    800046ec:	00050793          	mv	a5,a0
    800046f0:	fef43423          	sd	a5,-24(s0)

    return (void*)ret;
    800046f4:	fe843503          	ld	a0,-24(s0)
}
    800046f8:	01813403          	ld	s0,24(sp)
    800046fc:	02010113          	addi	sp,sp,32
    80004700:	00008067          	ret
        return 0;
    80004704:	00000513          	li	a0,0
}
    80004708:	00008067          	ret

000000008000470c <_Z8mem_freePv>:

int mem_free(void* addr){

    if(!addr)
    8000470c:	02050e63          	beqz	a0,80004748 <_Z8mem_freePv+0x3c>
int mem_free(void* addr){
    80004710:	fe010113          	addi	sp,sp,-32
    80004714:	00813c23          	sd	s0,24(sp)
    80004718:	02010413          	addi	s0,sp,32
        return 0;

    uint64 param = (uint64)(addr);
    __asm__ volatile("mv a1, %[var]" : : [var] "r"(param));
    8000471c:	00050593          	mv	a1,a0
    __asm__ volatile("mv a0, %[var]" : : [var] "r"(MEM_FREE));
    80004720:	00200793          	li	a5,2
    80004724:	00078513          	mv	a0,a5
    __asm__ volatile("ecall");
    80004728:	00000073          	ecall
    uint64 volatile ret;
    __asm__ volatile ("mv %0, a0" : "=r" (ret));
    8000472c:	00050793          	mv	a5,a0
    80004730:	fef43423          	sd	a5,-24(s0)

    return (int)ret;
    80004734:	fe843503          	ld	a0,-24(s0)
    80004738:	0005051b          	sext.w	a0,a0
}
    8000473c:	01813403          	ld	s0,24(sp)
    80004740:	02010113          	addi	sp,sp,32
    80004744:	00008067          	ret
        return 0;
    80004748:	00000513          	li	a0,0
}
    8000474c:	00008067          	ret

0000000080004750 <_Z13thread_createPP3TCBPFvPvES2_>:


int thread_create(thread_t* handle, void(*start_routine)(void*), void* arg){
    80004750:	fc010113          	addi	sp,sp,-64
    80004754:	02113c23          	sd	ra,56(sp)
    80004758:	02813823          	sd	s0,48(sp)
    8000475c:	02913423          	sd	s1,40(sp)
    80004760:	03213023          	sd	s2,32(sp)
    80004764:	01313c23          	sd	s3,24(sp)
    80004768:	04010413          	addi	s0,sp,64
    8000476c:	00050493          	mv	s1,a0
    80004770:	00058913          	mv	s2,a1
    80004774:	00060993          	mv	s3,a2

    //void* stack = mem_alloc(sizeof(uint64) * DEFAULT_STACK_SIZE);
    void* stack = SlabAllocator::getInstance().allocKernel(DEFAULT_STACK_SIZE, SlabAllocator::STACK);
    80004778:	00000097          	auipc	ra,0x0
    8000477c:	350080e7          	jalr	848(ra) # 80004ac8 <_ZN13SlabAllocator11getInstanceEv>
    80004780:	00400613          	li	a2,4
    80004784:	000015b7          	lui	a1,0x1
    80004788:	00000097          	auipc	ra,0x0
    8000478c:	6cc080e7          	jalr	1740(ra) # 80004e54 <_ZN13SlabAllocator11allocKernelEmNS_16kernelCacheEntryE>
    if(stack == nullptr ){
    80004790:	04050663          	beqz	a0,800047dc <_Z13thread_createPP3TCBPFvPvES2_+0x8c>
        *handle = nullptr;
        return -1;
    }

    __asm__ volatile("mv a4, %[var]" : : [var] "r"(stack));
    80004794:	00050713          	mv	a4,a0
    __asm__ volatile("mv a3, %[var]" : : [var] "r"(arg));
    80004798:	00098693          	mv	a3,s3
    __asm__ volatile("mv a2, %[var]" : : [var] "r"(start_routine));
    8000479c:	00090613          	mv	a2,s2
    __asm__ volatile("mv a1, %[var]" : : [var] "r"(handle));
    800047a0:	00048593          	mv	a1,s1
    __asm__ volatile("mv a0, %[var]" : : [var] "r"(THREAD_CREATE));
    800047a4:	01100793          	li	a5,17
    800047a8:	00078513          	mv	a0,a5
    __asm__ volatile("ecall");
    800047ac:	00000073          	ecall

    uint64 volatile ret;
    __asm__ volatile ("mv %0, a0" : "=r" (ret));
    800047b0:	00050793          	mv	a5,a0
    800047b4:	fcf43423          	sd	a5,-56(s0)
    return (int)ret;
    800047b8:	fc843503          	ld	a0,-56(s0)
    800047bc:	0005051b          	sext.w	a0,a0

}
    800047c0:	03813083          	ld	ra,56(sp)
    800047c4:	03013403          	ld	s0,48(sp)
    800047c8:	02813483          	ld	s1,40(sp)
    800047cc:	02013903          	ld	s2,32(sp)
    800047d0:	01813983          	ld	s3,24(sp)
    800047d4:	04010113          	addi	sp,sp,64
    800047d8:	00008067          	ret
        *handle = nullptr;
    800047dc:	0004b023          	sd	zero,0(s1)
        return -1;
    800047e0:	fff00513          	li	a0,-1
    800047e4:	fddff06f          	j	800047c0 <_Z13thread_createPP3TCBPFvPvES2_+0x70>

00000000800047e8 <_Z11thread_exitv>:
int thread_exit (){
    800047e8:	fe010113          	addi	sp,sp,-32
    800047ec:	00813c23          	sd	s0,24(sp)
    800047f0:	02010413          	addi	s0,sp,32
    __asm__ volatile("mv a0, %[var]" : : [var] "r"(THREAD_EXIT));
    800047f4:	01200793          	li	a5,18
    800047f8:	00078513          	mv	a0,a5
    __asm__ volatile("ecall");
    800047fc:	00000073          	ecall
    uint64 volatile ret;
    __asm__ volatile ("mv %0, a0" : "=r" (ret));
    80004800:	00050793          	mv	a5,a0
    80004804:	fef43423          	sd	a5,-24(s0)
    return (int)ret;
    80004808:	fe843503          	ld	a0,-24(s0)
}
    8000480c:	0005051b          	sext.w	a0,a0
    80004810:	01813403          	ld	s0,24(sp)
    80004814:	02010113          	addi	sp,sp,32
    80004818:	00008067          	ret

000000008000481c <_Z15thread_dispatchv>:


void thread_dispatch (){
    8000481c:	ff010113          	addi	sp,sp,-16
    80004820:	00813423          	sd	s0,8(sp)
    80004824:	01010413          	addi	s0,sp,16
    __asm__ volatile("mv a0, %[var]" : : [var] "r"(THREAD_DISPATCH));
    80004828:	01300793          	li	a5,19
    8000482c:	00078513          	mv	a0,a5
    __asm__ volatile("ecall");
    80004830:	00000073          	ecall
}
    80004834:	00813403          	ld	s0,8(sp)
    80004838:	01010113          	addi	sp,sp,16
    8000483c:	00008067          	ret

0000000080004840 <_Z8sem_openPP4_semj>:

int sem_open (sem_t* handle, unsigned init){
    if(handle == nullptr)
    80004840:	04050063          	beqz	a0,80004880 <_Z8sem_openPP4_semj+0x40>
int sem_open (sem_t* handle, unsigned init){
    80004844:	fe010113          	addi	sp,sp,-32
    80004848:	00813c23          	sd	s0,24(sp)
    8000484c:	02010413          	addi	s0,sp,32
        return -1;
    __asm__ volatile("mv a2, %[var]" : : [var] "r"(init));
    80004850:	00058613          	mv	a2,a1
    __asm__ volatile("mv a1, %[var]" : : [var] "r"(handle));
    80004854:	00050593          	mv	a1,a0
    __asm__ volatile("mv a0, %[var]" : : [var] "r"(SEM_OPEN));
    80004858:	02100793          	li	a5,33
    8000485c:	00078513          	mv	a0,a5
    __asm__ volatile("ecall");
    80004860:	00000073          	ecall
    uint64 volatile ret;
    __asm__ volatile ("mv %0, a0" : "=r" (ret));
    80004864:	00050793          	mv	a5,a0
    80004868:	fef43423          	sd	a5,-24(s0)
    return (int)ret;
    8000486c:	fe843503          	ld	a0,-24(s0)
    80004870:	0005051b          	sext.w	a0,a0
}
    80004874:	01813403          	ld	s0,24(sp)
    80004878:	02010113          	addi	sp,sp,32
    8000487c:	00008067          	ret
        return -1;
    80004880:	fff00513          	li	a0,-1
}
    80004884:	00008067          	ret

0000000080004888 <_Z9sem_closeP4_sem>:

int sem_close(sem_t handle){
    80004888:	fe010113          	addi	sp,sp,-32
    8000488c:	00813c23          	sd	s0,24(sp)
    80004890:	02010413          	addi	s0,sp,32
    __asm__ volatile("mv a1, %[var]" : : [var] "r"(handle));
    80004894:	00050593          	mv	a1,a0
    __asm__ volatile("mv a0, %[var]" : : [var] "r"(SEM_CLOSE));
    80004898:	02200793          	li	a5,34
    8000489c:	00078513          	mv	a0,a5
    __asm__ volatile("ecall");
    800048a0:	00000073          	ecall
    uint64 volatile ret;
    __asm__ volatile ("mv %0, a0" : "=r" (ret));
    800048a4:	00050793          	mv	a5,a0
    800048a8:	fef43423          	sd	a5,-24(s0)
    return (int)ret;
    800048ac:	fe843503          	ld	a0,-24(s0)
}
    800048b0:	0005051b          	sext.w	a0,a0
    800048b4:	01813403          	ld	s0,24(sp)
    800048b8:	02010113          	addi	sp,sp,32
    800048bc:	00008067          	ret

00000000800048c0 <_Z8sem_waitP4_sem>:

int sem_wait (sem_t id){
    800048c0:	fe010113          	addi	sp,sp,-32
    800048c4:	00813c23          	sd	s0,24(sp)
    800048c8:	02010413          	addi	s0,sp,32
    __asm__ volatile("mv a1, %[var]" : : [var] "r"(id));
    800048cc:	00050593          	mv	a1,a0
    __asm__ volatile("mv a0, %[var]" : : [var] "r"(SEM_WAIT));
    800048d0:	02300793          	li	a5,35
    800048d4:	00078513          	mv	a0,a5
    __asm__ volatile("ecall");
    800048d8:	00000073          	ecall
    uint64 volatile ret;
    __asm__ volatile ("mv %0, a0" : "=r" (ret));
    800048dc:	00050793          	mv	a5,a0
    800048e0:	fef43423          	sd	a5,-24(s0)

    return (int)ret;
    800048e4:	fe843503          	ld	a0,-24(s0)
}
    800048e8:	0005051b          	sext.w	a0,a0
    800048ec:	01813403          	ld	s0,24(sp)
    800048f0:	02010113          	addi	sp,sp,32
    800048f4:	00008067          	ret

00000000800048f8 <_Z10sem_signalP4_sem>:

int sem_signal(sem_t id){
    800048f8:	fe010113          	addi	sp,sp,-32
    800048fc:	00813c23          	sd	s0,24(sp)
    80004900:	02010413          	addi	s0,sp,32
    __asm__ volatile("mv a1, %[var]" : : [var] "r"(id));
    80004904:	00050593          	mv	a1,a0
    __asm__ volatile("mv a0, %[var]" : : [var] "r"(SEM_SIGNAL));
    80004908:	02400793          	li	a5,36
    8000490c:	00078513          	mv	a0,a5
    __asm__ volatile("ecall");
    80004910:	00000073          	ecall
    uint64 volatile ret;
    __asm__ volatile ("mv %0, a0" : "=r" (ret));
    80004914:	00050793          	mv	a5,a0
    80004918:	fef43423          	sd	a5,-24(s0)

    return (int)ret;
    8000491c:	fe843503          	ld	a0,-24(s0)
}
    80004920:	0005051b          	sext.w	a0,a0
    80004924:	01813403          	ld	s0,24(sp)
    80004928:	02010113          	addi	sp,sp,32
    8000492c:	00008067          	ret

0000000080004930 <_Z10time_sleepm>:

int time_sleep(size_t time){
    80004930:	fe010113          	addi	sp,sp,-32
    80004934:	00813c23          	sd	s0,24(sp)
    80004938:	02010413          	addi	s0,sp,32
    __asm__ volatile("mv a1, %[var]" : : [var] "r"(time));
    8000493c:	00050593          	mv	a1,a0
    __asm__ volatile("mv a0, %[var]" : : [var] "r"(TIME_SLEEP));
    80004940:	03100793          	li	a5,49
    80004944:	00078513          	mv	a0,a5
    __asm__ volatile("ecall");
    80004948:	00000073          	ecall
    uint64 volatile ret;
    __asm__ volatile ("mv %0, a0" : "=r" (ret));
    8000494c:	00050793          	mv	a5,a0
    80004950:	fef43423          	sd	a5,-24(s0)

    return (int)ret;
    80004954:	fe843503          	ld	a0,-24(s0)
}
    80004958:	0005051b          	sext.w	a0,a0
    8000495c:	01813403          	ld	s0,24(sp)
    80004960:	02010113          	addi	sp,sp,32
    80004964:	00008067          	ret

0000000080004968 <_Z4getcv>:

char getc(){
    80004968:	fe010113          	addi	sp,sp,-32
    8000496c:	00813c23          	sd	s0,24(sp)
    80004970:	02010413          	addi	s0,sp,32
    __asm__ volatile("mv a0, %[var]" : : [var] "r"(GETC));
    80004974:	04100793          	li	a5,65
    80004978:	00078513          	mv	a0,a5
    __asm__ volatile("ecall");
    8000497c:	00000073          	ecall
    uint64 volatile ret;
    __asm__ volatile ("mv %0, a0" : "=r" (ret));
    80004980:	00050793          	mv	a5,a0
    80004984:	fef43423          	sd	a5,-24(s0)

    return (char)ret;
    80004988:	fe843503          	ld	a0,-24(s0)
}
    8000498c:	0ff57513          	andi	a0,a0,255
    80004990:	01813403          	ld	s0,24(sp)
    80004994:	02010113          	addi	sp,sp,32
    80004998:	00008067          	ret

000000008000499c <_Z4putcc>:

void putc(char c){
    8000499c:	ff010113          	addi	sp,sp,-16
    800049a0:	00813423          	sd	s0,8(sp)
    800049a4:	01010413          	addi	s0,sp,16
    __asm__ volatile("mv a1, %[var]" : : [var] "r"(c));
    800049a8:	00050593          	mv	a1,a0
    __asm__ volatile("mv a0, %[var]" : : [var] "r"(PUTC));
    800049ac:	04200793          	li	a5,66
    800049b0:	00078513          	mv	a0,a5
    __asm__ volatile("ecall");
    800049b4:	00000073          	ecall

    return;
}
    800049b8:	00813403          	ld	s0,8(sp)
    800049bc:	01010113          	addi	sp,sp,16
    800049c0:	00008067          	ret

00000000800049c4 <_Z17thread_cpp_createPP3TCBPFvPvES2_>:

int thread_cpp_create(thread_t* handle, void(*start_routine)(void*), void* arg) {
    800049c4:	fe010113          	addi	sp,sp,-32
    800049c8:	00813c23          	sd	s0,24(sp)
    800049cc:	02010413          	addi	s0,sp,32

    void* stack = nullptr;
    __asm__ volatile("mv a4, %[var]" : : [var] "r"(stack));
    800049d0:	00000793          	li	a5,0
    800049d4:	00078713          	mv	a4,a5
    __asm__ volatile("mv a3, %[var]" : : [var] "r"(arg));
    800049d8:	00060693          	mv	a3,a2
    __asm__ volatile("mv a2, %[var]" : : [var] "r"(start_routine));
    800049dc:	00058613          	mv	a2,a1
    __asm__ volatile("mv a1, %[var]" : : [var] "r"(handle));
    800049e0:	00050593          	mv	a1,a0
    __asm__ volatile("mv a0, %[var]" : : [var] "r"(THREAD_CPP_CREATE));
    800049e4:	01500793          	li	a5,21
    800049e8:	00078513          	mv	a0,a5
    __asm__ volatile("ecall");
    800049ec:	00000073          	ecall

    uint64 volatile ret;
    __asm__ volatile ("mv %0, a0" : "=r" (ret));
    800049f0:	00050793          	mv	a5,a0
    800049f4:	fef43423          	sd	a5,-24(s0)
    return (int)ret;
    800049f8:	fe843503          	ld	a0,-24(s0)

}
    800049fc:	0005051b          	sext.w	a0,a0
    80004a00:	01813403          	ld	s0,24(sp)
    80004a04:	02010113          	addi	sp,sp,32
    80004a08:	00008067          	ret

0000000080004a0c <_ZN13SlabAllocatorC1Ev>:
#include "../h/SlabAllocator.hpp"

int SlabAllocator::counter = 0;


SlabAllocator::SlabAllocator() : space(nullptr), blocNum(0) {
    80004a0c:	ff010113          	addi	sp,sp,-16
    80004a10:	00813423          	sd	s0,8(sp)
    80004a14:	01010413          	addi	s0,sp,16
    80004a18:	00053023          	sd	zero,0(a0)
    80004a1c:	00052423          	sw	zero,8(a0)
    80004a20:	00006797          	auipc	a5,0x6
    80004a24:	87878793          	addi	a5,a5,-1928 # 8000a298 <CONSOLE_STATUS+0x288>
    80004a28:	0b850713          	addi	a4,a0,184
    80004a2c:	00006897          	auipc	a7,0x6
    80004a30:	9ac88893          	addi	a7,a7,-1620 # 8000a3d8 <CONSOLE_STATUS+0x3c8>
    80004a34:	0007b803          	ld	a6,0(a5)
    80004a38:	0087b583          	ld	a1,8(a5)
    80004a3c:	0107b603          	ld	a2,16(a5)
    80004a40:	0187b683          	ld	a3,24(a5)
    80004a44:	01073023          	sd	a6,0(a4)
    80004a48:	00b73423          	sd	a1,8(a4)
    80004a4c:	00c73823          	sd	a2,16(a4)
    80004a50:	00d73c23          	sd	a3,24(a4)
    80004a54:	02078793          	addi	a5,a5,32
    80004a58:	02070713          	addi	a4,a4,32
    80004a5c:	fd179ce3          	bne	a5,a7,80004a34 <_ZN13SlabAllocatorC1Ev+0x28>
    80004a60:	0007a683          	lw	a3,0(a5)
    80004a64:	00d72023          	sw	a3,0(a4)
    80004a68:	0047c783          	lbu	a5,4(a5)
    80004a6c:	00f70223          	sb	a5,4(a4)

    for(int i = 5; i < 18;i++) {
    80004a70:	00500713          	li	a4,5
    80004a74:	01c0006f          	j	80004a90 <_ZN13SlabAllocatorC1Ev+0x84>
        memBuffer[i - 5] = nullptr;
    80004a78:	ffb7079b          	addiw	a5,a4,-5
    80004a7c:	00278793          	addi	a5,a5,2
    80004a80:	00379793          	slli	a5,a5,0x3
    80004a84:	00f507b3          	add	a5,a0,a5
    80004a88:	0007b023          	sd	zero,0(a5)
    for(int i = 5; i < 18;i++) {
    80004a8c:	0017071b          	addiw	a4,a4,1
    80004a90:	01100793          	li	a5,17
    80004a94:	fee7d2e3          	bge	a5,a4,80004a78 <_ZN13SlabAllocatorC1Ev+0x6c>
    }

    for(int i = 0;i < 8;i++){
    80004a98:	00000713          	li	a4,0
    80004a9c:	0180006f          	j	80004ab4 <_ZN13SlabAllocatorC1Ev+0xa8>
        kernelCache[i] = nullptr;
    80004aa0:	00e70793          	addi	a5,a4,14
    80004aa4:	00379793          	slli	a5,a5,0x3
    80004aa8:	00f507b3          	add	a5,a0,a5
    80004aac:	0007b423          	sd	zero,8(a5)
    for(int i = 0;i < 8;i++){
    80004ab0:	0017071b          	addiw	a4,a4,1
    80004ab4:	00700793          	li	a5,7
    80004ab8:	fee7d4e3          	bge	a5,a4,80004aa0 <_ZN13SlabAllocatorC1Ev+0x94>
    }

}
    80004abc:	00813403          	ld	s0,8(sp)
    80004ac0:	01010113          	addi	sp,sp,16
    80004ac4:	00008067          	ret

0000000080004ac8 <_ZN13SlabAllocator11getInstanceEv>:

SlabAllocator& SlabAllocator::getInstance() {
    static SlabAllocator instance;
    80004ac8:	00008797          	auipc	a5,0x8
    80004acc:	3207c783          	lbu	a5,800(a5) # 8000cde8 <_ZGVZN13SlabAllocator11getInstanceEvE8instance>
    80004ad0:	00078863          	beqz	a5,80004ae0 <_ZN13SlabAllocator11getInstanceEv+0x18>
    return instance;
}
    80004ad4:	00008517          	auipc	a0,0x8
    80004ad8:	31c50513          	addi	a0,a0,796 # 8000cdf0 <_ZZN13SlabAllocator11getInstanceEvE8instance>
    80004adc:	00008067          	ret
SlabAllocator& SlabAllocator::getInstance() {
    80004ae0:	ff010113          	addi	sp,sp,-16
    80004ae4:	00113423          	sd	ra,8(sp)
    80004ae8:	00813023          	sd	s0,0(sp)
    80004aec:	01010413          	addi	s0,sp,16
    static SlabAllocator instance;
    80004af0:	00008517          	auipc	a0,0x8
    80004af4:	30050513          	addi	a0,a0,768 # 8000cdf0 <_ZZN13SlabAllocator11getInstanceEvE8instance>
    80004af8:	00000097          	auipc	ra,0x0
    80004afc:	f14080e7          	jalr	-236(ra) # 80004a0c <_ZN13SlabAllocatorC1Ev>
    80004b00:	00100793          	li	a5,1
    80004b04:	00008717          	auipc	a4,0x8
    80004b08:	2ef70223          	sb	a5,740(a4) # 8000cde8 <_ZGVZN13SlabAllocator11getInstanceEvE8instance>
}
    80004b0c:	00008517          	auipc	a0,0x8
    80004b10:	2e450513          	addi	a0,a0,740 # 8000cdf0 <_ZZN13SlabAllocator11getInstanceEvE8instance>
    80004b14:	00813083          	ld	ra,8(sp)
    80004b18:	00013403          	ld	s0,0(sp)
    80004b1c:	01010113          	addi	sp,sp,16
    80004b20:	00008067          	ret

0000000080004b24 <_ZN13SlabAllocator11createCacheEPKcmPFvPvES4_>:

Cache* SlabAllocator::createCache(const char *name, size_t size, void (*ctor)(void *), void (*dtor)(void *)) {
    80004b24:	fc010113          	addi	sp,sp,-64
    80004b28:	02113c23          	sd	ra,56(sp)
    80004b2c:	02813823          	sd	s0,48(sp)
    80004b30:	02913423          	sd	s1,40(sp)
    80004b34:	03213023          	sd	s2,32(sp)
    80004b38:	01313c23          	sd	s3,24(sp)
    80004b3c:	01413823          	sd	s4,16(sp)
    80004b40:	01513423          	sd	s5,8(sp)
    80004b44:	04010413          	addi	s0,sp,64
    80004b48:	00058a93          	mv	s5,a1
    80004b4c:	00060993          	mv	s3,a2
    80004b50:	00068a13          	mv	s4,a3
    80004b54:	00070913          	mv	s2,a4
    return new Cache(name, size, ctor, dtor);
    80004b58:	05000513          	li	a0,80
    80004b5c:	00001097          	auipc	ra,0x1
    80004b60:	024080e7          	jalr	36(ra) # 80005b80 <_ZN5CachenwEm>
    80004b64:	00050493          	mv	s1,a0
    80004b68:	06050a63          	beqz	a0,80004bdc <_ZN13SlabAllocator11createCacheEPKcmPFvPvES4_+0xb8>

class Cache{
public:
    using Func = void(*)(void*);

    Cache(const char* name, size_t objectSize, Func constructor, Func destructor) : objectSize(objectSize), halfHead(nullptr), fullHead(nullptr), ctor(constructor), dtor(destructor) {
    80004b6c:	03353023          	sd	s3,32(a0)
    80004b70:	02053823          	sd	zero,48(a0)
    80004b74:	02053c23          	sd	zero,56(a0)
    80004b78:	05453023          	sd	s4,64(a0)
    80004b7c:	05253423          	sd	s2,72(a0)
        int len;
        for(len = 0; name[len] != '\0';len++) {
    80004b80:	00000793          	li	a5,0
    80004b84:	00fa8733          	add	a4,s5,a5
    80004b88:	00074703          	lbu	a4,0(a4)
    80004b8c:	00070a63          	beqz	a4,80004ba0 <_ZN13SlabAllocator11createCacheEPKcmPFvPvES4_+0x7c>
            this->name[len] = name[len];
    80004b90:	00f486b3          	add	a3,s1,a5
    80004b94:	00e68023          	sb	a4,0(a3)
        for(len = 0; name[len] != '\0';len++) {
    80004b98:	0017879b          	addiw	a5,a5,1
    80004b9c:	fe9ff06f          	j	80004b84 <_ZN13SlabAllocator11createCacheEPKcmPFvPvES4_+0x60>
        }
        this->name[len] = '\0';
    80004ba0:	00f487b3          	add	a5,s1,a5
    80004ba4:	00078023          	sb	zero,0(a5)
        freeHead = new _slab(objectSize, nullptr, nullptr, ctor, dtor);
    80004ba8:	04000513          	li	a0,64
    80004bac:	00002097          	auipc	ra,0x2
    80004bb0:	ad4080e7          	jalr	-1324(ra) # 80006680 <_ZN5_slabnwEm>
    80004bb4:	00050913          	mv	s2,a0
    80004bb8:	02050063          	beqz	a0,80004bd8 <_ZN13SlabAllocator11createCacheEPKcmPFvPvES4_+0xb4>
    80004bbc:	0484b783          	ld	a5,72(s1)
    80004bc0:	0404b703          	ld	a4,64(s1)
    80004bc4:	00000693          	li	a3,0
    80004bc8:	00000613          	li	a2,0
    80004bcc:	00098593          	mv	a1,s3
    80004bd0:	00002097          	auipc	ra,0x2
    80004bd4:	8cc080e7          	jalr	-1844(ra) # 8000649c <_ZN5_slabC1EmPS_S0_PFvPvES3_>
    80004bd8:	0324b423          	sd	s2,40(s1)
}
    80004bdc:	00048513          	mv	a0,s1
    80004be0:	03813083          	ld	ra,56(sp)
    80004be4:	03013403          	ld	s0,48(sp)
    80004be8:	02813483          	ld	s1,40(sp)
    80004bec:	02013903          	ld	s2,32(sp)
    80004bf0:	01813983          	ld	s3,24(sp)
    80004bf4:	01013a03          	ld	s4,16(sp)
    80004bf8:	00813a83          	ld	s5,8(sp)
    80004bfc:	04010113          	addi	sp,sp,64
    80004c00:	00008067          	ret
    80004c04:	00050993          	mv	s3,a0
    80004c08:	00090513          	mv	a0,s2
    80004c0c:	00002097          	auipc	ra,0x2
    80004c10:	ab4080e7          	jalr	-1356(ra) # 800066c0 <_ZN5_slabdlEPv>
    return new Cache(name, size, ctor, dtor);
    80004c14:	00048513          	mv	a0,s1
    80004c18:	00001097          	auipc	ra,0x1
    80004c1c:	fa8080e7          	jalr	-88(ra) # 80005bc0 <_ZN5CachedlEPv>
    80004c20:	00098513          	mv	a0,s3
    80004c24:	0000f097          	auipc	ra,0xf
    80004c28:	564080e7          	jalr	1380(ra) # 80014188 <_Unwind_Resume>
    80004c2c:	00050993          	mv	s3,a0
    80004c30:	fe5ff06f          	j	80004c14 <_ZN13SlabAllocator11createCacheEPKcmPFvPvES4_+0xf0>

0000000080004c34 <_ZN13SlabAllocator11allocBufferEm>:

void *SlabAllocator::allocBuffer(size_t size) {
    80004c34:	fc010113          	addi	sp,sp,-64
    80004c38:	02113c23          	sd	ra,56(sp)
    80004c3c:	02813823          	sd	s0,48(sp)
    80004c40:	02913423          	sd	s1,40(sp)
    80004c44:	03213023          	sd	s2,32(sp)
    80004c48:	01313c23          	sd	s3,24(sp)
    80004c4c:	01413823          	sd	s4,16(sp)
    80004c50:	01513423          	sd	s5,8(sp)
    80004c54:	04010413          	addi	s0,sp,64
    if(size > 1<<17)
    80004c58:	000207b7          	lui	a5,0x20
    80004c5c:	16b7e863          	bltu	a5,a1,80004dcc <_ZN13SlabAllocator11allocBufferEm+0x198>
    80004c60:	00050993          	mv	s3,a0
    80004c64:	00058513          	mv	a0,a1
        return nullptr;

    if(size < 1<<5)
    80004c68:	01f00793          	li	a5,31
    80004c6c:	00b7e463          	bltu	a5,a1,80004c74 <_ZN13SlabAllocator11allocBufferEm+0x40>
        size = 32;
    80004c70:	02000513          	li	a0,32

    size = BuddyAllocator::roundToPow2(size);
    80004c74:	00000097          	auipc	ra,0x0
    80004c78:	53c080e7          	jalr	1340(ra) # 800051b0 <_ZN14BuddyAllocator11roundToPow2Em>
    int entry = BuddyAllocator::log2(size) - 5;
    80004c7c:	00000097          	auipc	ra,0x0
    80004c80:	564080e7          	jalr	1380(ra) # 800051e0 <_ZN14BuddyAllocator4log2Em>
    80004c84:	00050a1b          	sext.w	s4,a0
    80004c88:	ffb5049b          	addiw	s1,a0,-5


    if(memBuffer[entry] == nullptr){
    80004c8c:	00248793          	addi	a5,s1,2
    80004c90:	00379793          	slli	a5,a5,0x3
    80004c94:	00f987b3          	add	a5,s3,a5
    80004c98:	0007b783          	ld	a5,0(a5) # 20000 <_entry-0x7ffe0000>
    80004c9c:	04078463          	beqz	a5,80004ce4 <_ZN13SlabAllocator11allocBufferEm+0xb0>
        memBuffer[entry] = new Cache(names[entry], 1 << (entry + 5), nullptr, nullptr);
        if(memBuffer[entry] == nullptr)
            return nullptr;
    }
    Cache* cache = memBuffer[entry];
    80004ca0:	00248493          	addi	s1,s1,2
    80004ca4:	00349493          	slli	s1,s1,0x3
    80004ca8:	009984b3          	add	s1,s3,s1
    void* obj = cache->alloc();
    80004cac:	0004b503          	ld	a0,0(s1)
    80004cb0:	00001097          	auipc	ra,0x1
    80004cb4:	c98080e7          	jalr	-872(ra) # 80005948 <_ZN5Cache5allocEv>
    80004cb8:	00050913          	mv	s2,a0

    return obj;
}
    80004cbc:	00090513          	mv	a0,s2
    80004cc0:	03813083          	ld	ra,56(sp)
    80004cc4:	03013403          	ld	s0,48(sp)
    80004cc8:	02813483          	ld	s1,40(sp)
    80004ccc:	02013903          	ld	s2,32(sp)
    80004cd0:	01813983          	ld	s3,24(sp)
    80004cd4:	01013a03          	ld	s4,16(sp)
    80004cd8:	00813a83          	ld	s5,8(sp)
    80004cdc:	04010113          	addi	sp,sp,64
    80004ce0:	00008067          	ret
        memBuffer[entry] = new Cache(names[entry], 1 << (entry + 5), nullptr, nullptr);
    80004ce4:	05000513          	li	a0,80
    80004ce8:	00001097          	auipc	ra,0x1
    80004cec:	e98080e7          	jalr	-360(ra) # 80005b80 <_ZN5CachenwEm>
    80004cf0:	00050913          	mv	s2,a0
    80004cf4:	08050c63          	beqz	a0,80004d8c <_ZN13SlabAllocator11allocBufferEm+0x158>
    80004cf8:	00149713          	slli	a4,s1,0x1
    80004cfc:	00970733          	add	a4,a4,s1
    80004d00:	00371713          	slli	a4,a4,0x3
    80004d04:	00970733          	add	a4,a4,s1
    80004d08:	0b070713          	addi	a4,a4,176
    80004d0c:	00e98733          	add	a4,s3,a4
    80004d10:	00870713          	addi	a4,a4,8
    80004d14:	00100793          	li	a5,1
    80004d18:	01479a3b          	sllw	s4,a5,s4
    Cache(const char* name, size_t objectSize, Func constructor, Func destructor) : objectSize(objectSize), halfHead(nullptr), fullHead(nullptr), ctor(constructor), dtor(destructor) {
    80004d1c:	03453023          	sd	s4,32(a0)
    80004d20:	02053823          	sd	zero,48(a0)
    80004d24:	02053c23          	sd	zero,56(a0)
    80004d28:	04053023          	sd	zero,64(a0)
    80004d2c:	04053423          	sd	zero,72(a0)
        for(len = 0; name[len] != '\0';len++) {
    80004d30:	00000793          	li	a5,0
    80004d34:	00f706b3          	add	a3,a4,a5
    80004d38:	0006c683          	lbu	a3,0(a3)
    80004d3c:	00068a63          	beqz	a3,80004d50 <_ZN13SlabAllocator11allocBufferEm+0x11c>
            this->name[len] = name[len];
    80004d40:	00f90633          	add	a2,s2,a5
    80004d44:	00d60023          	sb	a3,0(a2)
        for(len = 0; name[len] != '\0';len++) {
    80004d48:	0017879b          	addiw	a5,a5,1
    80004d4c:	fe9ff06f          	j	80004d34 <_ZN13SlabAllocator11allocBufferEm+0x100>
        this->name[len] = '\0';
    80004d50:	00f907b3          	add	a5,s2,a5
    80004d54:	00078023          	sb	zero,0(a5)
        freeHead = new _slab(objectSize, nullptr, nullptr, ctor, dtor);
    80004d58:	04000513          	li	a0,64
    80004d5c:	00002097          	auipc	ra,0x2
    80004d60:	924080e7          	jalr	-1756(ra) # 80006680 <_ZN5_slabnwEm>
    80004d64:	00050a93          	mv	s5,a0
    80004d68:	02050063          	beqz	a0,80004d88 <_ZN13SlabAllocator11allocBufferEm+0x154>
    80004d6c:	04893783          	ld	a5,72(s2)
    80004d70:	04093703          	ld	a4,64(s2)
    80004d74:	00000693          	li	a3,0
    80004d78:	00000613          	li	a2,0
    80004d7c:	000a0593          	mv	a1,s4
    80004d80:	00001097          	auipc	ra,0x1
    80004d84:	71c080e7          	jalr	1820(ra) # 8000649c <_ZN5_slabC1EmPS_S0_PFvPvES3_>
    80004d88:	03593423          	sd	s5,40(s2)
    80004d8c:	00248793          	addi	a5,s1,2
    80004d90:	00379793          	slli	a5,a5,0x3
    80004d94:	00f987b3          	add	a5,s3,a5
    80004d98:	0127b023          	sd	s2,0(a5)
        if(memBuffer[entry] == nullptr)
    80004d9c:	f00912e3          	bnez	s2,80004ca0 <_ZN13SlabAllocator11allocBufferEm+0x6c>
    80004da0:	f1dff06f          	j	80004cbc <_ZN13SlabAllocator11allocBufferEm+0x88>
    80004da4:	00050493          	mv	s1,a0
    80004da8:	000a8513          	mv	a0,s5
    80004dac:	00002097          	auipc	ra,0x2
    80004db0:	914080e7          	jalr	-1772(ra) # 800066c0 <_ZN5_slabdlEPv>
        memBuffer[entry] = new Cache(names[entry], 1 << (entry + 5), nullptr, nullptr);
    80004db4:	00090513          	mv	a0,s2
    80004db8:	00001097          	auipc	ra,0x1
    80004dbc:	e08080e7          	jalr	-504(ra) # 80005bc0 <_ZN5CachedlEPv>
    80004dc0:	00048513          	mv	a0,s1
    80004dc4:	0000f097          	auipc	ra,0xf
    80004dc8:	3c4080e7          	jalr	964(ra) # 80014188 <_Unwind_Resume>
        return nullptr;
    80004dcc:	00000913          	li	s2,0
    80004dd0:	eedff06f          	j	80004cbc <_ZN13SlabAllocator11allocBufferEm+0x88>
    80004dd4:	00050493          	mv	s1,a0
    80004dd8:	fddff06f          	j	80004db4 <_ZN13SlabAllocator11allocBufferEm+0x180>

0000000080004ddc <_ZN13SlabAllocator13deallocBufferEPv>:

void SlabAllocator::deallocBuffer(void *obj) {
    80004ddc:	fd010113          	addi	sp,sp,-48
    80004de0:	02113423          	sd	ra,40(sp)
    80004de4:	02813023          	sd	s0,32(sp)
    80004de8:	00913c23          	sd	s1,24(sp)
    80004dec:	01213823          	sd	s2,16(sp)
    80004df0:	01313423          	sd	s3,8(sp)
    80004df4:	03010413          	addi	s0,sp,48
    80004df8:	00050913          	mv	s2,a0
    80004dfc:	00058993          	mv	s3,a1
    for(int i = 0;i < 13;i++)
    80004e00:	00000493          	li	s1,0
    80004e04:	0140006f          	j	80004e18 <_ZN13SlabAllocator13deallocBufferEPv+0x3c>
        if(memBuffer[i]) memBuffer[i]->free(obj);
    80004e08:	00098593          	mv	a1,s3
    80004e0c:	00001097          	auipc	ra,0x1
    80004e10:	c5c080e7          	jalr	-932(ra) # 80005a68 <_ZN5Cache4freeEPv>
    for(int i = 0;i < 13;i++)
    80004e14:	0014849b          	addiw	s1,s1,1
    80004e18:	00c00793          	li	a5,12
    80004e1c:	0097ce63          	blt	a5,s1,80004e38 <_ZN13SlabAllocator13deallocBufferEPv+0x5c>
        if(memBuffer[i]) memBuffer[i]->free(obj);
    80004e20:	00248793          	addi	a5,s1,2
    80004e24:	00379793          	slli	a5,a5,0x3
    80004e28:	00f907b3          	add	a5,s2,a5
    80004e2c:	0007b503          	ld	a0,0(a5)
    80004e30:	fc051ce3          	bnez	a0,80004e08 <_ZN13SlabAllocator13deallocBufferEPv+0x2c>
    80004e34:	fe1ff06f          	j	80004e14 <_ZN13SlabAllocator13deallocBufferEPv+0x38>
}
    80004e38:	02813083          	ld	ra,40(sp)
    80004e3c:	02013403          	ld	s0,32(sp)
    80004e40:	01813483          	ld	s1,24(sp)
    80004e44:	01013903          	ld	s2,16(sp)
    80004e48:	00813983          	ld	s3,8(sp)
    80004e4c:	03010113          	addi	sp,sp,48
    80004e50:	00008067          	ret

0000000080004e54 <_ZN13SlabAllocator11allocKernelEmNS_16kernelCacheEntryE>:


void *SlabAllocator::allocKernel(size_t size, SlabAllocator::kernelCacheEntry entry) {
    80004e54:	fc010113          	addi	sp,sp,-64
    80004e58:	02113c23          	sd	ra,56(sp)
    80004e5c:	02813823          	sd	s0,48(sp)
    80004e60:	02913423          	sd	s1,40(sp)
    80004e64:	03213023          	sd	s2,32(sp)
    80004e68:	01313c23          	sd	s3,24(sp)
    80004e6c:	01413823          	sd	s4,16(sp)
    80004e70:	01513423          	sd	s5,8(sp)
    80004e74:	04010413          	addi	s0,sp,64
    80004e78:	00050993          	mv	s3,a0

    if(kernelCache[entry] == nullptr){
    80004e7c:	00060913          	mv	s2,a2
    80004e80:	00e60793          	addi	a5,a2,14
    80004e84:	00379793          	slli	a5,a5,0x3
    80004e88:	00f507b3          	add	a5,a0,a5
    80004e8c:	0087b783          	ld	a5,8(a5)
    80004e90:	04078463          	beqz	a5,80004ed8 <_ZN13SlabAllocator11allocKernelEmNS_16kernelCacheEntryE+0x84>
        kernelCache[entry] = new Cache("dfadfd", size, nullptr, nullptr); // TODO set names
        if(kernelCache[entry] == nullptr)
            return nullptr;
    }
    return kernelCache[entry]->alloc();
    80004e94:	00e90913          	addi	s2,s2,14
    80004e98:	00391913          	slli	s2,s2,0x3
    80004e9c:	01298933          	add	s2,s3,s2
    80004ea0:	00893503          	ld	a0,8(s2)
    80004ea4:	00001097          	auipc	ra,0x1
    80004ea8:	aa4080e7          	jalr	-1372(ra) # 80005948 <_ZN5Cache5allocEv>
    80004eac:	00050493          	mv	s1,a0
}
    80004eb0:	00048513          	mv	a0,s1
    80004eb4:	03813083          	ld	ra,56(sp)
    80004eb8:	03013403          	ld	s0,48(sp)
    80004ebc:	02813483          	ld	s1,40(sp)
    80004ec0:	02013903          	ld	s2,32(sp)
    80004ec4:	01813983          	ld	s3,24(sp)
    80004ec8:	01013a03          	ld	s4,16(sp)
    80004ecc:	00813a83          	ld	s5,8(sp)
    80004ed0:	04010113          	addi	sp,sp,64
    80004ed4:	00008067          	ret
    80004ed8:	00058a13          	mv	s4,a1
        kernelCache[entry] = new Cache("dfadfd", size, nullptr, nullptr); // TODO set names
    80004edc:	05000513          	li	a0,80
    80004ee0:	00001097          	auipc	ra,0x1
    80004ee4:	ca0080e7          	jalr	-864(ra) # 80005b80 <_ZN5CachenwEm>
    80004ee8:	00050493          	mv	s1,a0
    80004eec:	06050e63          	beqz	a0,80004f68 <_ZN13SlabAllocator11allocKernelEmNS_16kernelCacheEntryE+0x114>
    Cache(const char* name, size_t objectSize, Func constructor, Func destructor) : objectSize(objectSize), halfHead(nullptr), fullHead(nullptr), ctor(constructor), dtor(destructor) {
    80004ef0:	03453023          	sd	s4,32(a0)
    80004ef4:	02053823          	sd	zero,48(a0)
    80004ef8:	02053c23          	sd	zero,56(a0)
    80004efc:	04053023          	sd	zero,64(a0)
    80004f00:	04053423          	sd	zero,72(a0)
        for(len = 0; name[len] != '\0';len++) {
    80004f04:	00000793          	li	a5,0
    80004f08:	00005717          	auipc	a4,0x5
    80004f0c:	38870713          	addi	a4,a4,904 # 8000a290 <CONSOLE_STATUS+0x280>
    80004f10:	00e78733          	add	a4,a5,a4
    80004f14:	00074703          	lbu	a4,0(a4)
    80004f18:	00070a63          	beqz	a4,80004f2c <_ZN13SlabAllocator11allocKernelEmNS_16kernelCacheEntryE+0xd8>
            this->name[len] = name[len];
    80004f1c:	00f486b3          	add	a3,s1,a5
    80004f20:	00e68023          	sb	a4,0(a3)
        for(len = 0; name[len] != '\0';len++) {
    80004f24:	0017879b          	addiw	a5,a5,1
    80004f28:	fe1ff06f          	j	80004f08 <_ZN13SlabAllocator11allocKernelEmNS_16kernelCacheEntryE+0xb4>
        this->name[len] = '\0';
    80004f2c:	00f487b3          	add	a5,s1,a5
    80004f30:	00078023          	sb	zero,0(a5)
        freeHead = new _slab(objectSize, nullptr, nullptr, ctor, dtor);
    80004f34:	04000513          	li	a0,64
    80004f38:	00001097          	auipc	ra,0x1
    80004f3c:	748080e7          	jalr	1864(ra) # 80006680 <_ZN5_slabnwEm>
    80004f40:	00050a93          	mv	s5,a0
    80004f44:	02050063          	beqz	a0,80004f64 <_ZN13SlabAllocator11allocKernelEmNS_16kernelCacheEntryE+0x110>
    80004f48:	0484b783          	ld	a5,72(s1)
    80004f4c:	0404b703          	ld	a4,64(s1)
    80004f50:	00000693          	li	a3,0
    80004f54:	00000613          	li	a2,0
    80004f58:	000a0593          	mv	a1,s4
    80004f5c:	00001097          	auipc	ra,0x1
    80004f60:	540080e7          	jalr	1344(ra) # 8000649c <_ZN5_slabC1EmPS_S0_PFvPvES3_>
    80004f64:	0354b423          	sd	s5,40(s1)
    80004f68:	00e90793          	addi	a5,s2,14
    80004f6c:	00379793          	slli	a5,a5,0x3
    80004f70:	00f987b3          	add	a5,s3,a5
    80004f74:	0097b423          	sd	s1,8(a5)
        if(kernelCache[entry] == nullptr)
    80004f78:	f0049ee3          	bnez	s1,80004e94 <_ZN13SlabAllocator11allocKernelEmNS_16kernelCacheEntryE+0x40>
    80004f7c:	f35ff06f          	j	80004eb0 <_ZN13SlabAllocator11allocKernelEmNS_16kernelCacheEntryE+0x5c>
    80004f80:	00050913          	mv	s2,a0
    80004f84:	000a8513          	mv	a0,s5
    80004f88:	00001097          	auipc	ra,0x1
    80004f8c:	738080e7          	jalr	1848(ra) # 800066c0 <_ZN5_slabdlEPv>
        kernelCache[entry] = new Cache("dfadfd", size, nullptr, nullptr); // TODO set names
    80004f90:	00048513          	mv	a0,s1
    80004f94:	00001097          	auipc	ra,0x1
    80004f98:	c2c080e7          	jalr	-980(ra) # 80005bc0 <_ZN5CachedlEPv>
    80004f9c:	00090513          	mv	a0,s2
    80004fa0:	0000f097          	auipc	ra,0xf
    80004fa4:	1e8080e7          	jalr	488(ra) # 80014188 <_Unwind_Resume>
    80004fa8:	00050913          	mv	s2,a0
    80004fac:	fe5ff06f          	j	80004f90 <_ZN13SlabAllocator11allocKernelEmNS_16kernelCacheEntryE+0x13c>

0000000080004fb0 <_ZN13SlabAllocator13deallocKernelEPvNS_16kernelCacheEntryE>:

void SlabAllocator::deallocKernel(void *addr, SlabAllocator::kernelCacheEntry entry) {

    if(kernelCache[entry]){
    80004fb0:	00e60613          	addi	a2,a2,14
    80004fb4:	00361613          	slli	a2,a2,0x3
    80004fb8:	00c50633          	add	a2,a0,a2
    80004fbc:	00863503          	ld	a0,8(a2)
    80004fc0:	02050663          	beqz	a0,80004fec <_ZN13SlabAllocator13deallocKernelEPvNS_16kernelCacheEntryE+0x3c>
void SlabAllocator::deallocKernel(void *addr, SlabAllocator::kernelCacheEntry entry) {
    80004fc4:	ff010113          	addi	sp,sp,-16
    80004fc8:	00113423          	sd	ra,8(sp)
    80004fcc:	00813023          	sd	s0,0(sp)
    80004fd0:	01010413          	addi	s0,sp,16
            kernelCache[entry]->free(addr);
    80004fd4:	00001097          	auipc	ra,0x1
    80004fd8:	a94080e7          	jalr	-1388(ra) # 80005a68 <_ZN5Cache4freeEPv>
    }

}
    80004fdc:	00813083          	ld	ra,8(sp)
    80004fe0:	00013403          	ld	s0,0(sp)
    80004fe4:	01010113          	addi	sp,sp,16
    80004fe8:	00008067          	ret
    80004fec:	00008067          	ret

0000000080004ff0 <_ZN14BuddyAllocatorC1Ev>:

#include "../h/BuddyAllocator.hpp"



BuddyAllocator::BuddyAllocator () : START_ADDR(HEAP_START_ADDR){
    80004ff0:	ff010113          	addi	sp,sp,-16
    80004ff4:	00813423          	sd	s0,8(sp)
    80004ff8:	01010413          	addi	s0,sp,16
    80004ffc:	000067b7          	lui	a5,0x6
    80005000:	00f507b3          	add	a5,a0,a5
    80005004:	00008717          	auipc	a4,0x8
    80005008:	ccc73703          	ld	a4,-820(a4) # 8000ccd0 <_GLOBAL_OFFSET_TABLE_+0x18>
    8000500c:	00073703          	ld	a4,0(a4)
    80005010:	04e7b423          	sd	a4,72(a5) # 6048 <_entry-0x7fff9fb8>

    for (int i = BUCKET_SIZE - 1, nblks = 1; i >= 0; i--, nblks *= 2){
    80005014:	00100613          	li	a2,1
    80005018:	00b00693          	li	a3,11
    8000501c:	00c0006f          	j	80005028 <_ZN14BuddyAllocatorC1Ev+0x38>
    80005020:	fff6869b          	addiw	a3,a3,-1
    80005024:	0016161b          	slliw	a2,a2,0x1
    80005028:	0206ce63          	bltz	a3,80005064 <_ZN14BuddyAllocatorC1Ev+0x74>
        numOfBlocks[i] = nblks;
    8000502c:	000027b7          	lui	a5,0x2
    80005030:	80078793          	addi	a5,a5,-2048 # 1800 <_entry-0x7fffe800>
    80005034:	00f687b3          	add	a5,a3,a5
    80005038:	00279793          	slli	a5,a5,0x2
    8000503c:	00f507b3          	add	a5,a0,a5
    80005040:	00c7a023          	sw	a2,0(a5)
        for (int j = 0; j < nblks; j++) {
    80005044:	00000713          	li	a4,0
    80005048:	fcc75ce3          	bge	a4,a2,80005020 <_ZN14BuddyAllocatorC1Ev+0x30>
            bucket[i][j] = false;
    8000504c:	00b69793          	slli	a5,a3,0xb
    80005050:	00f507b3          	add	a5,a0,a5
    80005054:	00e787b3          	add	a5,a5,a4
    80005058:	00078023          	sb	zero,0(a5)
        for (int j = 0; j < nblks; j++) {
    8000505c:	0017071b          	addiw	a4,a4,1
    80005060:	fe9ff06f          	j	80005048 <_ZN14BuddyAllocatorC1Ev+0x58>
        }
    }

    bucket[BUCKET_SIZE - 1][0] = true;
    80005064:	000067b7          	lui	a5,0x6
    80005068:	00f50533          	add	a0,a0,a5
    8000506c:	00100793          	li	a5,1
    80005070:	80f50023          	sb	a5,-2048(a0)

}
    80005074:	00813403          	ld	s0,8(sp)
    80005078:	01010113          	addi	sp,sp,16
    8000507c:	00008067          	ret

0000000080005080 <_ZN14BuddyAllocator11getInstanceEv>:

BuddyAllocator &BuddyAllocator::getInstance() {
    static BuddyAllocator instance;
    80005080:	00008797          	auipc	a5,0x8
    80005084:	f787c783          	lbu	a5,-136(a5) # 8000cff8 <_ZGVZN14BuddyAllocator11getInstanceEvE8instance>
    80005088:	00078863          	beqz	a5,80005098 <_ZN14BuddyAllocator11getInstanceEv+0x18>
    return instance;
}
    8000508c:	00008517          	auipc	a0,0x8
    80005090:	f7450513          	addi	a0,a0,-140 # 8000d000 <_ZZN14BuddyAllocator11getInstanceEvE8instance>
    80005094:	00008067          	ret
BuddyAllocator &BuddyAllocator::getInstance() {
    80005098:	ff010113          	addi	sp,sp,-16
    8000509c:	00113423          	sd	ra,8(sp)
    800050a0:	00813023          	sd	s0,0(sp)
    800050a4:	01010413          	addi	s0,sp,16
    static BuddyAllocator instance;
    800050a8:	00008517          	auipc	a0,0x8
    800050ac:	f5850513          	addi	a0,a0,-168 # 8000d000 <_ZZN14BuddyAllocator11getInstanceEvE8instance>
    800050b0:	00000097          	auipc	ra,0x0
    800050b4:	f40080e7          	jalr	-192(ra) # 80004ff0 <_ZN14BuddyAllocatorC1Ev>
    800050b8:	00100793          	li	a5,1
    800050bc:	00008717          	auipc	a4,0x8
    800050c0:	f2f70e23          	sb	a5,-196(a4) # 8000cff8 <_ZGVZN14BuddyAllocator11getInstanceEvE8instance>
}
    800050c4:	00008517          	auipc	a0,0x8
    800050c8:	f3c50513          	addi	a0,a0,-196 # 8000d000 <_ZZN14BuddyAllocator11getInstanceEvE8instance>
    800050cc:	00813083          	ld	ra,8(sp)
    800050d0:	00013403          	ld	s0,0(sp)
    800050d4:	01010113          	addi	sp,sp,16
    800050d8:	00008067          	ret

00000000800050dc <_ZNK14BuddyAllocator12getFreeBlockEi>:


int BuddyAllocator::getFreeBlock (int size) const {
    800050dc:	ff010113          	addi	sp,sp,-16
    800050e0:	00813423          	sd	s0,8(sp)
    800050e4:	01010413          	addi	s0,sp,16
    800050e8:	00050713          	mv	a4,a0
    for (int i = 0; i < numOfBlocks[size]; i++) {
    800050ec:	00000513          	li	a0,0
    800050f0:	000027b7          	lui	a5,0x2
    800050f4:	80078793          	addi	a5,a5,-2048 # 1800 <_entry-0x7fffe800>
    800050f8:	00f587b3          	add	a5,a1,a5
    800050fc:	00279793          	slli	a5,a5,0x2
    80005100:	00f707b3          	add	a5,a4,a5
    80005104:	0007a783          	lw	a5,0(a5)
    80005108:	02f55063          	bge	a0,a5,80005128 <_ZNK14BuddyAllocator12getFreeBlockEi+0x4c>
        if (bucket[size][i])
    8000510c:	00b59793          	slli	a5,a1,0xb
    80005110:	00f707b3          	add	a5,a4,a5
    80005114:	00a787b3          	add	a5,a5,a0
    80005118:	0007c783          	lbu	a5,0(a5)
    8000511c:	00079863          	bnez	a5,8000512c <_ZNK14BuddyAllocator12getFreeBlockEi+0x50>
    for (int i = 0; i < numOfBlocks[size]; i++) {
    80005120:	0015051b          	addiw	a0,a0,1
    80005124:	fcdff06f          	j	800050f0 <_ZNK14BuddyAllocator12getFreeBlockEi+0x14>
            return i;
    }
    return -1;
    80005128:	fff00513          	li	a0,-1
}
    8000512c:	00813403          	ld	s0,8(sp)
    80005130:	01010113          	addi	sp,sp,16
    80005134:	00008067          	ret

0000000080005138 <_ZNK14BuddyAllocator9countFreeEv>:

    }

}

int BuddyAllocator::countFree() const {
    80005138:	ff010113          	addi	sp,sp,-16
    8000513c:	00813423          	sd	s0,8(sp)
    80005140:	01010413          	addi	s0,sp,16
    80005144:	00050613          	mv	a2,a0

    int count = 0;
    for(int i = 0;i < BUCKET_SIZE;i++){
    80005148:	00000693          	li	a3,0
    int count = 0;
    8000514c:	00000513          	li	a0,0
    80005150:	0440006f          	j	80005194 <_ZNK14BuddyAllocator9countFreeEv+0x5c>
        for (int j = 0; j < numOfBlocks[i]; j++){
    80005154:	0017071b          	addiw	a4,a4,1
    80005158:	000027b7          	lui	a5,0x2
    8000515c:	80078793          	addi	a5,a5,-2048 # 1800 <_entry-0x7fffe800>
    80005160:	00f687b3          	add	a5,a3,a5
    80005164:	00279793          	slli	a5,a5,0x2
    80005168:	00f607b3          	add	a5,a2,a5
    8000516c:	0007a783          	lw	a5,0(a5)
    80005170:	02f75063          	bge	a4,a5,80005190 <_ZNK14BuddyAllocator9countFreeEv+0x58>
            if (bucket[i][j])
    80005174:	00b69793          	slli	a5,a3,0xb
    80005178:	00f607b3          	add	a5,a2,a5
    8000517c:	00e787b3          	add	a5,a5,a4
    80005180:	0007c783          	lbu	a5,0(a5)
    80005184:	fc0788e3          	beqz	a5,80005154 <_ZNK14BuddyAllocator9countFreeEv+0x1c>
                count++;
    80005188:	0015051b          	addiw	a0,a0,1
    8000518c:	fc9ff06f          	j	80005154 <_ZNK14BuddyAllocator9countFreeEv+0x1c>
    for(int i = 0;i < BUCKET_SIZE;i++){
    80005190:	0016869b          	addiw	a3,a3,1
    80005194:	00b00793          	li	a5,11
    80005198:	00d7c663          	blt	a5,a3,800051a4 <_ZNK14BuddyAllocator9countFreeEv+0x6c>
        for (int j = 0; j < numOfBlocks[i]; j++){
    8000519c:	00000713          	li	a4,0
    800051a0:	fb9ff06f          	j	80005158 <_ZNK14BuddyAllocator9countFreeEv+0x20>
        }

    }
    return count;
}
    800051a4:	00813403          	ld	s0,8(sp)
    800051a8:	01010113          	addi	sp,sp,16
    800051ac:	00008067          	ret

00000000800051b0 <_ZN14BuddyAllocator11roundToPow2Em>:

uint64 BuddyAllocator::roundToPow2(uint64 x) {
    800051b0:	ff010113          	addi	sp,sp,-16
    800051b4:	00813423          	sd	s0,8(sp)
    800051b8:	01010413          	addi	s0,sp,16
        uint64 power = 2;
        x--;
    800051bc:	fff50793          	addi	a5,a0,-1
        uint64 power = 2;
    800051c0:	00200513          	li	a0,2
        while (x >>= 1) power <<= 1;
    800051c4:	0017d793          	srli	a5,a5,0x1
    800051c8:	00078663          	beqz	a5,800051d4 <_ZN14BuddyAllocator11roundToPow2Em+0x24>
    800051cc:	00151513          	slli	a0,a0,0x1
    800051d0:	ff5ff06f          	j	800051c4 <_ZN14BuddyAllocator11roundToPow2Em+0x14>
        return power;
}
    800051d4:	00813403          	ld	s0,8(sp)
    800051d8:	01010113          	addi	sp,sp,16
    800051dc:	00008067          	ret

00000000800051e0 <_ZN14BuddyAllocator4log2Em>:

uint16 BuddyAllocator::log2(uint64 n) {
    800051e0:	ff010113          	addi	sp,sp,-16
    800051e4:	00813423          	sd	s0,8(sp)
    800051e8:	01010413          	addi	s0,sp,16
    if (n==0)
    800051ec:	02050663          	beqz	a0,80005218 <_ZN14BuddyAllocator4log2Em+0x38>
        return 0;
    uint32 logValue = -1;
    800051f0:	fff00793          	li	a5,-1
    while (n) {
    800051f4:	00050863          	beqz	a0,80005204 <_ZN14BuddyAllocator4log2Em+0x24>
        logValue++;
    800051f8:	0017879b          	addiw	a5,a5,1
        n >>= 1;
    800051fc:	00155513          	srli	a0,a0,0x1
    while (n) {
    80005200:	ff5ff06f          	j	800051f4 <_ZN14BuddyAllocator4log2Em+0x14>
    }
    return logValue;
    80005204:	03079513          	slli	a0,a5,0x30
    80005208:	03055513          	srli	a0,a0,0x30

}
    8000520c:	00813403          	ld	s0,8(sp)
    80005210:	01010113          	addi	sp,sp,16
    80005214:	00008067          	ret
        return 0;
    80005218:	00000513          	li	a0,0
    8000521c:	ff1ff06f          	j	8000520c <_ZN14BuddyAllocator4log2Em+0x2c>

0000000080005220 <_ZN14BuddyAllocator5allocEm>:
void* BuddyAllocator::alloc (size_t size) {
    80005220:	fd010113          	addi	sp,sp,-48
    80005224:	02113423          	sd	ra,40(sp)
    80005228:	02813023          	sd	s0,32(sp)
    8000522c:	00913c23          	sd	s1,24(sp)
    80005230:	01213823          	sd	s2,16(sp)
    80005234:	01313423          	sd	s3,8(sp)
    80005238:	01413023          	sd	s4,0(sp)
    8000523c:	03010413          	addi	s0,sp,48
    80005240:	00050913          	mv	s2,a0
    int newSize = log2(roundToPow2(size));
    80005244:	00058513          	mv	a0,a1
    80005248:	00000097          	auipc	ra,0x0
    8000524c:	f68080e7          	jalr	-152(ra) # 800051b0 <_ZN14BuddyAllocator11roundToPow2Em>
    80005250:	00000097          	auipc	ra,0x0
    80005254:	f90080e7          	jalr	-112(ra) # 800051e0 <_ZN14BuddyAllocator4log2Em>
    80005258:	00050a1b          	sext.w	s4,a0
    if (newSize >= END_SIZE) {
    8000525c:	01600793          	li	a5,22
    80005260:	0d47c063          	blt	a5,s4,80005320 <_ZN14BuddyAllocator5allocEm+0x100>
    if(newSize < START_SIZE){
    80005264:	00b00793          	li	a5,11
    80005268:	0147c463          	blt	a5,s4,80005270 <_ZN14BuddyAllocator5allocEm+0x50>
        newSize = START_SIZE;
    8000526c:	00c00a13          	li	s4,12
    int current = newSize - START_SIZE;
    80005270:	ff4a099b          	addiw	s3,s4,-12
    80005274:	00098493          	mv	s1,s3
    int block = -1;
    80005278:	fff00513          	li	a0,-1
    for (; block<0 && current < BUCKET_SIZE; current++) {
    8000527c:	02055263          	bgez	a0,800052a0 <_ZN14BuddyAllocator5allocEm+0x80>
    80005280:	00b00793          	li	a5,11
    80005284:	0097ce63          	blt	a5,s1,800052a0 <_ZN14BuddyAllocator5allocEm+0x80>
        block = getFreeBlock(current);
    80005288:	00048593          	mv	a1,s1
    8000528c:	00090513          	mv	a0,s2
    80005290:	00000097          	auipc	ra,0x0
    80005294:	e4c080e7          	jalr	-436(ra) # 800050dc <_ZNK14BuddyAllocator12getFreeBlockEi>
    for (; block<0 && current < BUCKET_SIZE; current++) {
    80005298:	0014849b          	addiw	s1,s1,1
    8000529c:	fe1ff06f          	j	8000527c <_ZN14BuddyAllocator5allocEm+0x5c>
    if (block < 0)
    800052a0:	08054463          	bltz	a0,80005328 <_ZN14BuddyAllocator5allocEm+0x108>
    setBlock(--current, block, false);
    800052a4:	fff4849b          	addiw	s1,s1,-1
private:

    int getFreeBlock (int size) const;
    void* getBlockAddr(size_t size, int block) const;
    int getBlockAddr(size_t size, void* addr) const;
    void setBlock (size_t size, int block, bool a) { bucket[size][block] = a; }
    800052a8:	00b49793          	slli	a5,s1,0xb
    800052ac:	00f907b3          	add	a5,s2,a5
    800052b0:	00a787b3          	add	a5,a5,a0
    800052b4:	00078023          	sb	zero,0(a5)
    while (--current >= newSize - START_SIZE) {
    800052b8:	fff4849b          	addiw	s1,s1,-1
    800052bc:	0334c463          	blt	s1,s3,800052e4 <_ZN14BuddyAllocator5allocEm+0xc4>
        block *= 2;
    800052c0:	0015179b          	slliw	a5,a0,0x1
    800052c4:	0007851b          	sext.w	a0,a5
        setBlock(current,block+1,true);
    800052c8:	0017871b          	addiw	a4,a5,1
    800052cc:	00b49793          	slli	a5,s1,0xb
    800052d0:	00f907b3          	add	a5,s2,a5
    800052d4:	00e787b3          	add	a5,a5,a4
    800052d8:	00100713          	li	a4,1
    800052dc:	00e78023          	sb	a4,0(a5)
    800052e0:	fd9ff06f          	j	800052b8 <_ZN14BuddyAllocator5allocEm+0x98>
    size_t offset = 1<<size;
    800052e4:	00100793          	li	a5,1
    800052e8:	01479a3b          	sllw	s4,a5,s4
    return (void*)((char*)START_ADDR + offset*block);
    800052ec:	000067b7          	lui	a5,0x6
    800052f0:	00f90933          	add	s2,s2,a5
    800052f4:	04893783          	ld	a5,72(s2)
    800052f8:	02aa0533          	mul	a0,s4,a0
    800052fc:	00a78533          	add	a0,a5,a0
}
    80005300:	02813083          	ld	ra,40(sp)
    80005304:	02013403          	ld	s0,32(sp)
    80005308:	01813483          	ld	s1,24(sp)
    8000530c:	01013903          	ld	s2,16(sp)
    80005310:	00813983          	ld	s3,8(sp)
    80005314:	00013a03          	ld	s4,0(sp)
    80005318:	03010113          	addi	sp,sp,48
    8000531c:	00008067          	ret
      return nullptr; // Exception
    80005320:	00000513          	li	a0,0
    80005324:	fddff06f          	j	80005300 <_ZN14BuddyAllocator5allocEm+0xe0>
        return nullptr; // No available memory
    80005328:	00000513          	li	a0,0
    8000532c:	fd5ff06f          	j	80005300 <_ZN14BuddyAllocator5allocEm+0xe0>

0000000080005330 <_ZN14BuddyAllocator7deallocEPvm>:
    if(addr == nullptr)
    80005330:	10058e63          	beqz	a1,8000544c <_ZN14BuddyAllocator7deallocEPvm+0x11c>
void BuddyAllocator::dealloc(void *addr, size_t size) {
    80005334:	fe010113          	addi	sp,sp,-32
    80005338:	00113c23          	sd	ra,24(sp)
    8000533c:	00813823          	sd	s0,16(sp)
    80005340:	00913423          	sd	s1,8(sp)
    80005344:	01213023          	sd	s2,0(sp)
    80005348:	02010413          	addi	s0,sp,32
    8000534c:	00050493          	mv	s1,a0
    80005350:	00058913          	mv	s2,a1
    80005354:	00060513          	mv	a0,a2
    int newSize = log2(roundToPow2(size));
    80005358:	00000097          	auipc	ra,0x0
    8000535c:	e58080e7          	jalr	-424(ra) # 800051b0 <_ZN14BuddyAllocator11roundToPow2Em>
    80005360:	00000097          	auipc	ra,0x0
    80005364:	e80080e7          	jalr	-384(ra) # 800051e0 <_ZN14BuddyAllocator4log2Em>
    80005368:	0005051b          	sext.w	a0,a0
    if (newSize >= END_SIZE) {
    8000536c:	01600793          	li	a5,22
    80005370:	0ca7c263          	blt	a5,a0,80005434 <_ZN14BuddyAllocator7deallocEPvm+0x104>
    if(newSize < START_SIZE){
    80005374:	00b00793          	li	a5,11
    80005378:	00a7c463          	blt	a5,a0,80005380 <_ZN14BuddyAllocator7deallocEPvm+0x50>
        newSize = START_SIZE;
    8000537c:	00c00513          	li	a0,12
    int block = ((int)((size_t)addr - (size_t)START_ADDR))/(1<<size);
    80005380:	000067b7          	lui	a5,0x6
    80005384:	00f487b3          	add	a5,s1,a5
    80005388:	0487b783          	ld	a5,72(a5) # 6048 <_entry-0x7fff9fb8>
    8000538c:	40f907bb          	subw	a5,s2,a5
    80005390:	00100693          	li	a3,1
    80005394:	00a6973b          	sllw	a4,a3,a0
    80005398:	02e7c7bb          	divw	a5,a5,a4
    setBlock(newSize - START_SIZE, block, true);
    8000539c:	ff45051b          	addiw	a0,a0,-12
    800053a0:	00b51713          	slli	a4,a0,0xb
    800053a4:	00e48733          	add	a4,s1,a4
    800053a8:	00f70733          	add	a4,a4,a5
    800053ac:	00d70023          	sb	a3,0(a4)
    for(int i = newSize - START_SIZE; i < BUCKET_SIZE - 1;i++){
    800053b0:	06c0006f          	j	8000541c <_ZN14BuddyAllocator7deallocEPvm+0xec>
        int b2 = b1 + 1;
    800053b4:	0017861b          	addiw	a2,a5,1
        if(bucket[i][b1]  && bucket[i][b2]){
    800053b8:	00b51693          	slli	a3,a0,0xb
    800053bc:	00d486b3          	add	a3,s1,a3
    800053c0:	00f686b3          	add	a3,a3,a5
    800053c4:	0006c703          	lbu	a4,0(a3)
    800053c8:	06070663          	beqz	a4,80005434 <_ZN14BuddyAllocator7deallocEPvm+0x104>
    800053cc:	00b51693          	slli	a3,a0,0xb
    800053d0:	00d486b3          	add	a3,s1,a3
    800053d4:	00c686b3          	add	a3,a3,a2
    800053d8:	0006c703          	lbu	a4,0(a3)
    800053dc:	04070c63          	beqz	a4,80005434 <_ZN14BuddyAllocator7deallocEPvm+0x104>
    800053e0:	00b51713          	slli	a4,a0,0xb
    800053e4:	00e48733          	add	a4,s1,a4
    800053e8:	00f706b3          	add	a3,a4,a5
    800053ec:	00068023          	sb	zero,0(a3)
    800053f0:	00c70733          	add	a4,a4,a2
    800053f4:	00070023          	sb	zero,0(a4)
            j = b1/2;
    800053f8:	01f7d71b          	srliw	a4,a5,0x1f
    800053fc:	00f707bb          	addw	a5,a4,a5
    80005400:	4017d79b          	sraiw	a5,a5,0x1
            setBlock(i+1, j, true);
    80005404:	0015051b          	addiw	a0,a0,1
    80005408:	00b51713          	slli	a4,a0,0xb
    8000540c:	00e48733          	add	a4,s1,a4
    80005410:	00f70733          	add	a4,a4,a5
    80005414:	00100693          	li	a3,1
    80005418:	00d70023          	sb	a3,0(a4)
    for(int i = newSize - START_SIZE; i < BUCKET_SIZE - 1;i++){
    8000541c:	00a00713          	li	a4,10
    80005420:	00a74a63          	blt	a4,a0,80005434 <_ZN14BuddyAllocator7deallocEPvm+0x104>
        int b1 = (j % 2 == 0) ? j : j - 1;
    80005424:	0017f713          	andi	a4,a5,1
    80005428:	f80706e3          	beqz	a4,800053b4 <_ZN14BuddyAllocator7deallocEPvm+0x84>
    8000542c:	fff7879b          	addiw	a5,a5,-1
    80005430:	f85ff06f          	j	800053b4 <_ZN14BuddyAllocator7deallocEPvm+0x84>
}
    80005434:	01813083          	ld	ra,24(sp)
    80005438:	01013403          	ld	s0,16(sp)
    8000543c:	00813483          	ld	s1,8(sp)
    80005440:	00013903          	ld	s2,0(sp)
    80005444:	02010113          	addi	sp,sp,32
    80005448:	00008067          	ret
    8000544c:	00008067          	ret

0000000080005450 <_ZN15MemoryAllocatorC1Ev>:
#include "../h/MemoryAllocator.hpp"


MemoryAllocator::MemoryAllocator()  {
    80005450:	ff010113          	addi	sp,sp,-16
    80005454:	00813423          	sd	s0,8(sp)
    80005458:	01010413          	addi	s0,sp,16
    END_ADDR = HEAP_END_ADDR;
    8000545c:	00008797          	auipc	a5,0x8
    80005460:	8cc7b783          	ld	a5,-1844(a5) # 8000cd28 <_GLOBAL_OFFSET_TABLE_+0x70>
    80005464:	0007b703          	ld	a4,0(a5)
    80005468:	00e53c23          	sd	a4,24(a0)
    size_t offset = ((size_t)HEAP_END_ADDR - (size_t)HEAP_START_ADDR)>>3;
    8000546c:	00008797          	auipc	a5,0x8
    80005470:	8647b783          	ld	a5,-1948(a5) # 8000ccd0 <_GLOBAL_OFFSET_TABLE_+0x18>
    80005474:	0007b783          	ld	a5,0(a5)
    80005478:	40f706b3          	sub	a3,a4,a5
    8000547c:	0036d693          	srli	a3,a3,0x3
    START_ADDR = (void*)((char*)HEAP_START_ADDR + offset);
    80005480:	00d787b3          	add	a5,a5,a3
    80005484:	00f53823          	sd	a5,16(a0)
    head = (FreeBlock*)START_ADDR;
    80005488:	00f53023          	sd	a5,0(a0)
    head->size = (size_t)END_ADDR - (size_t)START_ADDR - sizeof(FreeBlock);
    8000548c:	40f70733          	sub	a4,a4,a5
    80005490:	fe870713          	addi	a4,a4,-24
    80005494:	00e7b823          	sd	a4,16(a5)
    head->next = 0;
    80005498:	00053783          	ld	a5,0(a0)
    8000549c:	0007b023          	sd	zero,0(a5)
    head->prev = 0;
    800054a0:	00053783          	ld	a5,0(a0)
    800054a4:	0007b423          	sd	zero,8(a5)
    tail = head;
    800054a8:	00053783          	ld	a5,0(a0)
    800054ac:	00f53423          	sd	a5,8(a0)
}
    800054b0:	00813403          	ld	s0,8(sp)
    800054b4:	01010113          	addi	sp,sp,16
    800054b8:	00008067          	ret

00000000800054bc <_ZN15MemoryAllocator11getInstanceEv>:


MemoryAllocator& MemoryAllocator::getInstance() {
    static MemoryAllocator instance;
    800054bc:	0000e797          	auipc	a5,0xe
    800054c0:	b947c783          	lbu	a5,-1132(a5) # 80013050 <_ZGVZN15MemoryAllocator11getInstanceEvE8instance>
    800054c4:	00078863          	beqz	a5,800054d4 <_ZN15MemoryAllocator11getInstanceEv+0x18>
    return instance;
}
    800054c8:	0000e517          	auipc	a0,0xe
    800054cc:	b9050513          	addi	a0,a0,-1136 # 80013058 <_ZZN15MemoryAllocator11getInstanceEvE8instance>
    800054d0:	00008067          	ret
MemoryAllocator& MemoryAllocator::getInstance() {
    800054d4:	ff010113          	addi	sp,sp,-16
    800054d8:	00113423          	sd	ra,8(sp)
    800054dc:	00813023          	sd	s0,0(sp)
    800054e0:	01010413          	addi	s0,sp,16
    static MemoryAllocator instance;
    800054e4:	0000e517          	auipc	a0,0xe
    800054e8:	b7450513          	addi	a0,a0,-1164 # 80013058 <_ZZN15MemoryAllocator11getInstanceEvE8instance>
    800054ec:	00000097          	auipc	ra,0x0
    800054f0:	f64080e7          	jalr	-156(ra) # 80005450 <_ZN15MemoryAllocatorC1Ev>
    800054f4:	00100793          	li	a5,1
    800054f8:	0000e717          	auipc	a4,0xe
    800054fc:	b4f70c23          	sb	a5,-1192(a4) # 80013050 <_ZGVZN15MemoryAllocator11getInstanceEvE8instance>
}
    80005500:	0000e517          	auipc	a0,0xe
    80005504:	b5850513          	addi	a0,a0,-1192 # 80013058 <_ZZN15MemoryAllocator11getInstanceEvE8instance>
    80005508:	00813083          	ld	ra,8(sp)
    8000550c:	00013403          	ld	s0,0(sp)
    80005510:	01010113          	addi	sp,sp,16
    80005514:	00008067          	ret

0000000080005518 <_ZN15MemoryAllocator10IGetMemoryEm>:


void* MemoryAllocator::IGetMemory(size_t size)  {
    80005518:	ff010113          	addi	sp,sp,-16
    8000551c:	00813423          	sd	s0,8(sp)
    80005520:	01010413          	addi	s0,sp,16
    80005524:	00050713          	mv	a4,a0
    FreeBlock* blk = head;
    80005528:	00053503          	ld	a0,0(a0)

    // round size to MEM_BLOCK_SIZE
    size_t temp = size / MEM_BLOCK_SIZE;
    size = (temp * MEM_BLOCK_SIZE == size) ? size : (temp + 1)*MEM_BLOCK_SIZE;
    8000552c:	fc05f693          	andi	a3,a1,-64
    80005530:	00b68863          	beq	a3,a1,80005540 <_ZN15MemoryAllocator10IGetMemoryEm+0x28>
    80005534:	0065d793          	srli	a5,a1,0x6
    80005538:	00178593          	addi	a1,a5,1
    8000553c:	00659593          	slli	a1,a1,0x6

    // Try to find free block
    for (; blk != nullptr; blk = blk->next)
    80005540:	00050a63          	beqz	a0,80005554 <_ZN15MemoryAllocator10IGetMemoryEm+0x3c>
        if (blk->size >= size) break;
    80005544:	01053783          	ld	a5,16(a0)
    80005548:	00b7f663          	bgeu	a5,a1,80005554 <_ZN15MemoryAllocator10IGetMemoryEm+0x3c>
    for (; blk != nullptr; blk = blk->next)
    8000554c:	00053503          	ld	a0,0(a0)
    80005550:	ff1ff06f          	j	80005540 <_ZN15MemoryAllocator10IGetMemoryEm+0x28>

    // If not found
    if (blk == nullptr) {
    80005554:	04050863          	beqz	a0,800055a4 <_ZN15MemoryAllocator10IGetMemoryEm+0x8c>
        return nullptr;
    }

    size_t remainingSize = blk->size - size;
    80005558:	01053783          	ld	a5,16(a0)
    8000555c:	40b787b3          	sub	a5,a5,a1

    if (remainingSize >= sizeof(FreeBlock) + MEM_BLOCK_SIZE) { // Shrink block and make a new one
    80005560:	05700693          	li	a3,87
    80005564:	04f6fc63          	bgeu	a3,a5,800055bc <_ZN15MemoryAllocator10IGetMemoryEm+0xa4>
        blk->size = size;
    80005568:	00b53823          	sd	a1,16(a0)
        size_t offset = sizeof(FreeBlock) + size;
    8000556c:	01858593          	addi	a1,a1,24 # 1018 <_entry-0x7fffefe8>
        FreeBlock* newBlk = (FreeBlock*)((char*)blk + offset);
    80005570:	00b505b3          	add	a1,a0,a1
        if (blk->prev) {
    80005574:	00853683          	ld	a3,8(a0)
    80005578:	02068c63          	beqz	a3,800055b0 <_ZN15MemoryAllocator10IGetMemoryEm+0x98>
            blk->prev->next = newBlk;
    8000557c:	00b6b023          	sd	a1,0(a3)
            newBlk->prev = blk->prev;
    80005580:	00853703          	ld	a4,8(a0)
    80005584:	00e5b423          	sd	a4,8(a1)
        }
        else {
            head = newBlk;
            head->prev = 0;
        }
        newBlk->next = blk->next;
    80005588:	00053703          	ld	a4,0(a0)
    8000558c:	00e5b023          	sd	a4,0(a1)
        newBlk->size = remainingSize - sizeof(FreeBlock);
    80005590:	fe878793          	addi	a5,a5,-24
    80005594:	00f5b823          	sd	a5,16(a1)
        else {
            head = blk->next;
            head->prev = 0;
        }
    }
    blk->next = 0;
    80005598:	00053023          	sd	zero,0(a0)
    blk->prev = 0;
    8000559c:	00053423          	sd	zero,8(a0)
    return (char*)blk + sizeof(FreeBlock);
    800055a0:	01850513          	addi	a0,a0,24
}
    800055a4:	00813403          	ld	s0,8(sp)
    800055a8:	01010113          	addi	sp,sp,16
    800055ac:	00008067          	ret
            head = newBlk;
    800055b0:	00b73023          	sd	a1,0(a4)
            head->prev = 0;
    800055b4:	0005b423          	sd	zero,8(a1)
    800055b8:	fd1ff06f          	j	80005588 <_ZN15MemoryAllocator10IGetMemoryEm+0x70>
        if (blk->prev) {
    800055bc:	00853783          	ld	a5,8(a0)
    800055c0:	02078063          	beqz	a5,800055e0 <_ZN15MemoryAllocator10IGetMemoryEm+0xc8>
            blk->prev->next = blk->next;
    800055c4:	00053703          	ld	a4,0(a0)
    800055c8:	00e7b023          	sd	a4,0(a5)
            if(blk->next) blk->next->prev = blk->prev;
    800055cc:	00053783          	ld	a5,0(a0)
    800055d0:	fc0784e3          	beqz	a5,80005598 <_ZN15MemoryAllocator10IGetMemoryEm+0x80>
    800055d4:	00853703          	ld	a4,8(a0)
    800055d8:	00e7b423          	sd	a4,8(a5)
    800055dc:	fbdff06f          	j	80005598 <_ZN15MemoryAllocator10IGetMemoryEm+0x80>
            head = blk->next;
    800055e0:	00053783          	ld	a5,0(a0)
    800055e4:	00f73023          	sd	a5,0(a4)
            head->prev = 0;
    800055e8:	0007b423          	sd	zero,8(a5)
    800055ec:	fadff06f          	j	80005598 <_ZN15MemoryAllocator10IGetMemoryEm+0x80>

00000000800055f0 <_ZN15MemoryAllocator10tryToMergeEPNS_9FreeBlockE>:
    tryToMerge(blk);

    return 0;
}

void MemoryAllocator::tryToMerge(FreeBlock* blk)  {
    800055f0:	ff010113          	addi	sp,sp,-16
    800055f4:	00813423          	sd	s0,8(sp)
    800055f8:	01010413          	addi	s0,sp,16
    if (!blk)
    800055fc:	00058c63          	beqz	a1,80005614 <_ZN15MemoryAllocator10tryToMergeEPNS_9FreeBlockE+0x24>
        return ;

    if (blk->next && (char*)blk + blk->size == (char*)(blk->next)) {
    80005600:	0005b783          	ld	a5,0(a1)
    80005604:	00078863          	beqz	a5,80005614 <_ZN15MemoryAllocator10tryToMergeEPNS_9FreeBlockE+0x24>
    80005608:	0105b703          	ld	a4,16(a1)
    8000560c:	00e586b3          	add	a3,a1,a4
    80005610:	00d78863          	beq	a5,a3,80005620 <_ZN15MemoryAllocator10tryToMergeEPNS_9FreeBlockE+0x30>
        blk->size += blk->next->size;
        blk->size += sizeof(FreeBlock);
        blk->next = blk->next->next;
        if (blk->next) blk->next->prev = blk;
    }
    80005614:	00813403          	ld	s0,8(sp)
    80005618:	01010113          	addi	sp,sp,16
    8000561c:	00008067          	ret
        blk->size += blk->next->size;
    80005620:	0107b683          	ld	a3,16(a5)
    80005624:	00d70733          	add	a4,a4,a3
        blk->size += sizeof(FreeBlock);
    80005628:	01870713          	addi	a4,a4,24
    8000562c:	00e5b823          	sd	a4,16(a1)
        blk->next = blk->next->next;
    80005630:	0007b783          	ld	a5,0(a5)
    80005634:	00f5b023          	sd	a5,0(a1)
        if (blk->next) blk->next->prev = blk;
    80005638:	fc078ee3          	beqz	a5,80005614 <_ZN15MemoryAllocator10tryToMergeEPNS_9FreeBlockE+0x24>
    8000563c:	00b7b423          	sd	a1,8(a5)
    80005640:	fd5ff06f          	j	80005614 <_ZN15MemoryAllocator10tryToMergeEPNS_9FreeBlockE+0x24>

0000000080005644 <_ZN15MemoryAllocator11IFreeMemoryEPv>:
    if( addr == 0 || (char*)addr < HEAP_START_ADDR || (char*)addr > HEAP_END_ADDR){
    80005644:	0e058263          	beqz	a1,80005728 <_ZN15MemoryAllocator11IFreeMemoryEPv+0xe4>
int MemoryAllocator::IFreeMemory(void* addr) {
    80005648:	fe010113          	addi	sp,sp,-32
    8000564c:	00113c23          	sd	ra,24(sp)
    80005650:	00813823          	sd	s0,16(sp)
    80005654:	00913423          	sd	s1,8(sp)
    80005658:	01213023          	sd	s2,0(sp)
    8000565c:	02010413          	addi	s0,sp,32
    80005660:	00050913          	mv	s2,a0
    80005664:	00058713          	mv	a4,a1
    if( addr == 0 || (char*)addr < HEAP_START_ADDR || (char*)addr > HEAP_END_ADDR){
    80005668:	00007797          	auipc	a5,0x7
    8000566c:	6687b783          	ld	a5,1640(a5) # 8000ccd0 <_GLOBAL_OFFSET_TABLE_+0x18>
    80005670:	0007b783          	ld	a5,0(a5)
    80005674:	0af5ee63          	bltu	a1,a5,80005730 <_ZN15MemoryAllocator11IFreeMemoryEPv+0xec>
    80005678:	00007797          	auipc	a5,0x7
    8000567c:	6b07b783          	ld	a5,1712(a5) # 8000cd28 <_GLOBAL_OFFSET_TABLE_+0x70>
    80005680:	0007b783          	ld	a5,0(a5)
    80005684:	0ab7ea63          	bltu	a5,a1,80005738 <_ZN15MemoryAllocator11IFreeMemoryEPv+0xf4>
    if ( !head || (char*)addr < (char*)head)
    80005688:	00053783          	ld	a5,0(a0)
    8000568c:	00078e63          	beqz	a5,800056a8 <_ZN15MemoryAllocator11IFreeMemoryEPv+0x64>
    80005690:	02f5e063          	bltu	a1,a5,800056b0 <_ZN15MemoryAllocator11IFreeMemoryEPv+0x6c>
        for ( blk = head; blk->next != 0 && (char*)addr > (char*)(blk->next); blk = blk->next);
    80005694:	00078493          	mv	s1,a5
    80005698:	0007b783          	ld	a5,0(a5)
    8000569c:	00078c63          	beqz	a5,800056b4 <_ZN15MemoryAllocator11IFreeMemoryEPv+0x70>
    800056a0:	fee7eae3          	bltu	a5,a4,80005694 <_ZN15MemoryAllocator11IFreeMemoryEPv+0x50>
    800056a4:	0100006f          	j	800056b4 <_ZN15MemoryAllocator11IFreeMemoryEPv+0x70>
        blk = 0;
    800056a8:	00078493          	mv	s1,a5
    800056ac:	0080006f          	j	800056b4 <_ZN15MemoryAllocator11IFreeMemoryEPv+0x70>
    800056b0:	00000493          	li	s1,0
    FreeBlock* newBlk = (FreeBlock*)((char*)addr - sizeof(FreeBlock));
    800056b4:	fe870593          	addi	a1,a4,-24
    newBlk->prev = blk;
    800056b8:	fe973823          	sd	s1,-16(a4)
    if (blk) newBlk->next = blk->next;
    800056bc:	04048c63          	beqz	s1,80005714 <_ZN15MemoryAllocator11IFreeMemoryEPv+0xd0>
    800056c0:	0004b783          	ld	a5,0(s1)
    800056c4:	fef73423          	sd	a5,-24(a4)
    if (newBlk->next) newBlk->next->prev = newBlk;
    800056c8:	fe873783          	ld	a5,-24(a4)
    800056cc:	00078463          	beqz	a5,800056d4 <_ZN15MemoryAllocator11IFreeMemoryEPv+0x90>
    800056d0:	00b7b423          	sd	a1,8(a5)
    if (blk) blk->next = newBlk;
    800056d4:	04048663          	beqz	s1,80005720 <_ZN15MemoryAllocator11IFreeMemoryEPv+0xdc>
    800056d8:	00b4b023          	sd	a1,0(s1)
    tryToMerge(newBlk);
    800056dc:	00090513          	mv	a0,s2
    800056e0:	00000097          	auipc	ra,0x0
    800056e4:	f10080e7          	jalr	-240(ra) # 800055f0 <_ZN15MemoryAllocator10tryToMergeEPNS_9FreeBlockE>
    tryToMerge(blk);
    800056e8:	00048593          	mv	a1,s1
    800056ec:	00090513          	mv	a0,s2
    800056f0:	00000097          	auipc	ra,0x0
    800056f4:	f00080e7          	jalr	-256(ra) # 800055f0 <_ZN15MemoryAllocator10tryToMergeEPNS_9FreeBlockE>
    return 0;
    800056f8:	00000513          	li	a0,0
}
    800056fc:	01813083          	ld	ra,24(sp)
    80005700:	01013403          	ld	s0,16(sp)
    80005704:	00813483          	ld	s1,8(sp)
    80005708:	00013903          	ld	s2,0(sp)
    8000570c:	02010113          	addi	sp,sp,32
    80005710:	00008067          	ret
    else newBlk->next = head;
    80005714:	00093783          	ld	a5,0(s2)
    80005718:	fef73423          	sd	a5,-24(a4)
    8000571c:	fadff06f          	j	800056c8 <_ZN15MemoryAllocator11IFreeMemoryEPv+0x84>
    else head = newBlk;
    80005720:	00b93023          	sd	a1,0(s2)
    80005724:	fb9ff06f          	j	800056dc <_ZN15MemoryAllocator11IFreeMemoryEPv+0x98>
        return -1;
    80005728:	fff00513          	li	a0,-1
}
    8000572c:	00008067          	ret
        return -1;
    80005730:	fff00513          	li	a0,-1
    80005734:	fc9ff06f          	j	800056fc <_ZN15MemoryAllocator11IFreeMemoryEPv+0xb8>
    80005738:	fff00513          	li	a0,-1
    8000573c:	fc1ff06f          	j	800056fc <_ZN15MemoryAllocator11IFreeMemoryEPv+0xb8>

0000000080005740 <_Z17kmem_cache_createPKcmPFvPvES3_>:
// Created by bogdan on 5.2.23..
//
#include "../h/slab.h"
#include "../h/SlabAllocator.hpp"

kmem_cache_t *kmem_cache_create(const char *name, size_t size, void (*ctor)(void *), void (*dtor)(void *)) {
    80005740:	fd010113          	addi	sp,sp,-48
    80005744:	02113423          	sd	ra,40(sp)
    80005748:	02813023          	sd	s0,32(sp)
    8000574c:	00913c23          	sd	s1,24(sp)
    80005750:	01213823          	sd	s2,16(sp)
    80005754:	01313423          	sd	s3,8(sp)
    80005758:	01413023          	sd	s4,0(sp)
    8000575c:	03010413          	addi	s0,sp,48
    80005760:	00050493          	mv	s1,a0
    80005764:	00058913          	mv	s2,a1
    80005768:	00060993          	mv	s3,a2
    8000576c:	00068a13          	mv	s4,a3
    kmem_cache_t* cache = (kmem_cache_t*)SlabAllocator::getInstance().createCache(name, size, ctor, dtor);
    80005770:	fffff097          	auipc	ra,0xfffff
    80005774:	358080e7          	jalr	856(ra) # 80004ac8 <_ZN13SlabAllocator11getInstanceEv>
    80005778:	000a0713          	mv	a4,s4
    8000577c:	00098693          	mv	a3,s3
    80005780:	00090613          	mv	a2,s2
    80005784:	00048593          	mv	a1,s1
    80005788:	fffff097          	auipc	ra,0xfffff
    8000578c:	39c080e7          	jalr	924(ra) # 80004b24 <_ZN13SlabAllocator11createCacheEPKcmPFvPvES4_>
    return cache;
}
    80005790:	02813083          	ld	ra,40(sp)
    80005794:	02013403          	ld	s0,32(sp)
    80005798:	01813483          	ld	s1,24(sp)
    8000579c:	01013903          	ld	s2,16(sp)
    800057a0:	00813983          	ld	s3,8(sp)
    800057a4:	00013a03          	ld	s4,0(sp)
    800057a8:	03010113          	addi	sp,sp,48
    800057ac:	00008067          	ret

00000000800057b0 <_Z17kmem_cache_shrinkP5Cache>:

int kmem_cache_shrink(kmem_cache_t *cachep) {
    800057b0:	ff010113          	addi	sp,sp,-16
    800057b4:	00113423          	sd	ra,8(sp)
    800057b8:	00813023          	sd	s0,0(sp)
    800057bc:	01010413          	addi	s0,sp,16
   Cache* c = (Cache*)cachep;
    c->shrink();
    800057c0:	00001097          	auipc	ra,0x1
    800057c4:	830080e7          	jalr	-2000(ra) # 80005ff0 <_ZN5Cache6shrinkEv>
    return 0;
}
    800057c8:	00000513          	li	a0,0
    800057cc:	00813083          	ld	ra,8(sp)
    800057d0:	00013403          	ld	s0,0(sp)
    800057d4:	01010113          	addi	sp,sp,16
    800057d8:	00008067          	ret

00000000800057dc <_Z16kmem_cache_allocP5Cache>:

void* kmem_cache_alloc(kmem_cache_t *cachep) {
    800057dc:	ff010113          	addi	sp,sp,-16
    800057e0:	00113423          	sd	ra,8(sp)
    800057e4:	00813023          	sd	s0,0(sp)
    800057e8:	01010413          	addi	s0,sp,16
    Cache* c = (Cache*)cachep;
    return c->alloc();;
    800057ec:	00000097          	auipc	ra,0x0
    800057f0:	15c080e7          	jalr	348(ra) # 80005948 <_ZN5Cache5allocEv>
}
    800057f4:	00813083          	ld	ra,8(sp)
    800057f8:	00013403          	ld	s0,0(sp)
    800057fc:	01010113          	addi	sp,sp,16
    80005800:	00008067          	ret

0000000080005804 <_Z15kmem_cache_freeP5CachePv>:

void kmem_cache_free(kmem_cache_t* cachep, void *objp) {
    80005804:	ff010113          	addi	sp,sp,-16
    80005808:	00113423          	sd	ra,8(sp)
    8000580c:	00813023          	sd	s0,0(sp)
    80005810:	01010413          	addi	s0,sp,16
    Cache* c = (Cache*)cachep;
    c->free(objp);
    80005814:	00000097          	auipc	ra,0x0
    80005818:	254080e7          	jalr	596(ra) # 80005a68 <_ZN5Cache4freeEPv>
}
    8000581c:	00813083          	ld	ra,8(sp)
    80005820:	00013403          	ld	s0,0(sp)
    80005824:	01010113          	addi	sp,sp,16
    80005828:	00008067          	ret

000000008000582c <_Z7kmallocm>:

void* kmalloc(size_t size) {
    8000582c:	fe010113          	addi	sp,sp,-32
    80005830:	00113c23          	sd	ra,24(sp)
    80005834:	00813823          	sd	s0,16(sp)
    80005838:	00913423          	sd	s1,8(sp)
    8000583c:	02010413          	addi	s0,sp,32
    80005840:	00050493          	mv	s1,a0
    return SlabAllocator::getInstance().allocBuffer(size);
    80005844:	fffff097          	auipc	ra,0xfffff
    80005848:	284080e7          	jalr	644(ra) # 80004ac8 <_ZN13SlabAllocator11getInstanceEv>
    8000584c:	00048593          	mv	a1,s1
    80005850:	fffff097          	auipc	ra,0xfffff
    80005854:	3e4080e7          	jalr	996(ra) # 80004c34 <_ZN13SlabAllocator11allocBufferEm>
}
    80005858:	01813083          	ld	ra,24(sp)
    8000585c:	01013403          	ld	s0,16(sp)
    80005860:	00813483          	ld	s1,8(sp)
    80005864:	02010113          	addi	sp,sp,32
    80005868:	00008067          	ret

000000008000586c <_Z5kfreePv>:

void kfree(void *objp) {
    8000586c:	fe010113          	addi	sp,sp,-32
    80005870:	00113c23          	sd	ra,24(sp)
    80005874:	00813823          	sd	s0,16(sp)
    80005878:	00913423          	sd	s1,8(sp)
    8000587c:	02010413          	addi	s0,sp,32
    80005880:	00050493          	mv	s1,a0
   SlabAllocator::getInstance().deallocBuffer(objp);
    80005884:	fffff097          	auipc	ra,0xfffff
    80005888:	244080e7          	jalr	580(ra) # 80004ac8 <_ZN13SlabAllocator11getInstanceEv>
    8000588c:	00048593          	mv	a1,s1
    80005890:	fffff097          	auipc	ra,0xfffff
    80005894:	54c080e7          	jalr	1356(ra) # 80004ddc <_ZN13SlabAllocator13deallocBufferEPv>
}
    80005898:	01813083          	ld	ra,24(sp)
    8000589c:	01013403          	ld	s0,16(sp)
    800058a0:	00813483          	ld	s1,8(sp)
    800058a4:	02010113          	addi	sp,sp,32
    800058a8:	00008067          	ret

00000000800058ac <_Z18kmem_cache_destroyP5Cache>:


void kmem_cache_destroy(Cache *cachep) {
    Cache* c = (Cache*)cachep;
    delete c;
    800058ac:	04050263          	beqz	a0,800058f0 <_Z18kmem_cache_destroyP5Cache+0x44>
void kmem_cache_destroy(Cache *cachep) {
    800058b0:	fe010113          	addi	sp,sp,-32
    800058b4:	00113c23          	sd	ra,24(sp)
    800058b8:	00813823          	sd	s0,16(sp)
    800058bc:	00913423          	sd	s1,8(sp)
    800058c0:	02010413          	addi	s0,sp,32
    800058c4:	00050493          	mv	s1,a0
    delete c;
    800058c8:	00000097          	auipc	ra,0x0
    800058cc:	33c080e7          	jalr	828(ra) # 80005c04 <_ZN5CacheD1Ev>
    800058d0:	00048513          	mv	a0,s1
    800058d4:	00000097          	auipc	ra,0x0
    800058d8:	2ec080e7          	jalr	748(ra) # 80005bc0 <_ZN5CachedlEPv>
}
    800058dc:	01813083          	ld	ra,24(sp)
    800058e0:	01013403          	ld	s0,16(sp)
    800058e4:	00813483          	ld	s1,8(sp)
    800058e8:	02010113          	addi	sp,sp,32
    800058ec:	00008067          	ret
    800058f0:	00008067          	ret

00000000800058f4 <_Z15kmem_cache_infoP5Cache>:

void kmem_cache_info(kmem_cache_t* cachep) {
    800058f4:	ff010113          	addi	sp,sp,-16
    800058f8:	00113423          	sd	ra,8(sp)
    800058fc:	00813023          	sd	s0,0(sp)
    80005900:	01010413          	addi	s0,sp,16
    Cache* c = (Cache*)cachep;
    c->printInfo();
    80005904:	00000097          	auipc	ra,0x0
    80005908:	598080e7          	jalr	1432(ra) # 80005e9c <_ZN5Cache9printInfoEv>
}
    8000590c:	00813083          	ld	ra,8(sp)
    80005910:	00013403          	ld	s0,0(sp)
    80005914:	01010113          	addi	sp,sp,16
    80005918:	00008067          	ret

000000008000591c <_Z16kmem_cache_errorP5Cache>:

int kmem_cache_error(kmem_cache_t *cachep) {
    8000591c:	ff010113          	addi	sp,sp,-16
    80005920:	00113423          	sd	ra,8(sp)
    80005924:	00813023          	sd	s0,0(sp)
    80005928:	01010413          	addi	s0,sp,16
    Cache* c = (Cache*)cachep;
    c->printError();
    8000592c:	00000097          	auipc	ra,0x0
    80005930:	694080e7          	jalr	1684(ra) # 80005fc0 <_ZN5Cache10printErrorEv>
    return 0;
    80005934:	00000513          	li	a0,0
    80005938:	00813083          	ld	ra,8(sp)
    8000593c:	00013403          	ld	s0,0(sp)
    80005940:	01010113          	addi	sp,sp,16
    80005944:	00008067          	ret

0000000080005948 <_ZN5Cache5allocEv>:
// Created by bogdan on 5.2.23..
//
#include "../h/Cache.hpp"


void *Cache::alloc() {
    80005948:	fe010113          	addi	sp,sp,-32
    8000594c:	00113c23          	sd	ra,24(sp)
    80005950:	00813823          	sd	s0,16(sp)
    80005954:	00913423          	sd	s1,8(sp)
    80005958:	01213023          	sd	s2,0(sp)
    8000595c:	02010413          	addi	s0,sp,32
    80005960:	00050493          	mv	s1,a0

    if(!halfHead){
    80005964:	03053783          	ld	a5,48(a0)
    80005968:	06078e63          	beqz	a5,800059e4 <_ZN5Cache5allocEv+0x9c>
        slab->setNext(nullptr);
        halfHead = slab;

    }
    void* obj = nullptr;
    if(halfHead)
    8000596c:	0304b903          	ld	s2,48(s1)
    80005970:	04090c63          	beqz	s2,800059c8 <_ZN5Cache5allocEv+0x80>
        obj = halfHead->getObject();
    80005974:	00090513          	mv	a0,s2
    80005978:	00001097          	auipc	ra,0x1
    8000597c:	bf0080e7          	jalr	-1040(ra) # 80006568 <_ZN5_slab9getObjectEv>
    80005980:	00050913          	mv	s2,a0
    else
        return nullptr;

    if(halfHead->isFull()){
    80005984:	0304b503          	ld	a0,48(s1)
    80005988:	00001097          	auipc	ra,0x1
    8000598c:	d7c080e7          	jalr	-644(ra) # 80006704 <_ZNK5_slab6isFullEv>
    80005990:	02050c63          	beqz	a0,800059c8 <_ZN5Cache5allocEv+0x80>
        _slab* nextFullHead = halfHead->getNext();
    80005994:	0304b783          	ld	a5,48(s1)

    _slab(size_t slotSize, _slab* next, _slab* prev, Func ctor, Func dtor);

    void setNext(_slab* next) { this->next = next;}
    void setPrev(_slab* prev) { this->prev = prev; }
    _slab* getNext() const { return next; }
    80005998:	0087b703          	ld	a4,8(a5)
        // move from half to full
        halfHead->setNext(fullHead);
    8000599c:	0384b683          	ld	a3,56(s1)
    void setNext(_slab* next) { this->next = next;}
    800059a0:	00d7b423          	sd	a3,8(a5)
        halfHead->setPrev(nullptr);
    800059a4:	0304b783          	ld	a5,48(s1)
    void setPrev(_slab* prev) { this->prev = prev; }
    800059a8:	0007b823          	sd	zero,16(a5)
        if(fullHead) fullHead->setPrev(halfHead);
    800059ac:	0384b783          	ld	a5,56(s1)
    800059b0:	00078663          	beqz	a5,800059bc <_ZN5Cache5allocEv+0x74>
    800059b4:	0304b683          	ld	a3,48(s1)
    800059b8:	00d7b823          	sd	a3,16(a5)
        fullHead = halfHead;
    800059bc:	0304b783          	ld	a5,48(s1)
    800059c0:	02f4bc23          	sd	a5,56(s1)
        halfHead = nextFullHead;
    800059c4:	02e4b823          	sd	a4,48(s1)
    }

    return obj;
}
    800059c8:	00090513          	mv	a0,s2
    800059cc:	01813083          	ld	ra,24(sp)
    800059d0:	01013403          	ld	s0,16(sp)
    800059d4:	00813483          	ld	s1,8(sp)
    800059d8:	00013903          	ld	s2,0(sp)
    800059dc:	02010113          	addi	sp,sp,32
    800059e0:	00008067          	ret
        if(!freeHead){
    800059e4:	02853783          	ld	a5,40(a0)
    800059e8:	02078463          	beqz	a5,80005a10 <_ZN5Cache5allocEv+0xc8>
        _slab* slab = freeHead;
    800059ec:	0284b783          	ld	a5,40(s1)
    _slab* getNext() const { return next; }
    800059f0:	0087b703          	ld	a4,8(a5)
        freeHead = freeHead->getNext();
    800059f4:	02e4b423          	sd	a4,40(s1)
        if(freeHead) freeHead->setPrev(nullptr);
    800059f8:	00070463          	beqz	a4,80005a00 <_ZN5Cache5allocEv+0xb8>
    void setPrev(_slab* prev) { this->prev = prev; }
    800059fc:	00073823          	sd	zero,16(a4)
    80005a00:	0007b823          	sd	zero,16(a5)
    void setNext(_slab* next) { this->next = next;}
    80005a04:	0007b423          	sd	zero,8(a5)
        halfHead = slab;
    80005a08:	02f4b823          	sd	a5,48(s1)
    80005a0c:	f61ff06f          	j	8000596c <_ZN5Cache5allocEv+0x24>
            freeHead = new _slab(objectSize, nullptr, nullptr, this->ctor, this->dtor);
    80005a10:	04000513          	li	a0,64
    80005a14:	00001097          	auipc	ra,0x1
    80005a18:	c6c080e7          	jalr	-916(ra) # 80006680 <_ZN5_slabnwEm>
    80005a1c:	00050913          	mv	s2,a0
    80005a20:	02050063          	beqz	a0,80005a40 <_ZN5Cache5allocEv+0xf8>
    80005a24:	0484b783          	ld	a5,72(s1)
    80005a28:	0404b703          	ld	a4,64(s1)
    80005a2c:	00000693          	li	a3,0
    80005a30:	00000613          	li	a2,0
    80005a34:	0204b583          	ld	a1,32(s1)
    80005a38:	00001097          	auipc	ra,0x1
    80005a3c:	a64080e7          	jalr	-1436(ra) # 8000649c <_ZN5_slabC1EmPS_S0_PFvPvES3_>
    80005a40:	0324b423          	sd	s2,40(s1)
            if(!freeHead)
    80005a44:	fa0914e3          	bnez	s2,800059ec <_ZN5Cache5allocEv+0xa4>
    80005a48:	f81ff06f          	j	800059c8 <_ZN5Cache5allocEv+0x80>
    80005a4c:	00050493          	mv	s1,a0
            freeHead = new _slab(objectSize, nullptr, nullptr, this->ctor, this->dtor);
    80005a50:	00090513          	mv	a0,s2
    80005a54:	00001097          	auipc	ra,0x1
    80005a58:	c6c080e7          	jalr	-916(ra) # 800066c0 <_ZN5_slabdlEPv>
    80005a5c:	00048513          	mv	a0,s1
    80005a60:	0000e097          	auipc	ra,0xe
    80005a64:	728080e7          	jalr	1832(ra) # 80014188 <_Unwind_Resume>

0000000080005a68 <_ZN5Cache4freeEPv>:

void Cache::free(void *obj) {
    80005a68:	fd010113          	addi	sp,sp,-48
    80005a6c:	02113423          	sd	ra,40(sp)
    80005a70:	02813023          	sd	s0,32(sp)
    80005a74:	00913c23          	sd	s1,24(sp)
    80005a78:	01213823          	sd	s2,16(sp)
    80005a7c:	01313423          	sd	s3,8(sp)
    80005a80:	03010413          	addi	s0,sp,48
    80005a84:	00050993          	mv	s3,a0
    80005a88:	00058913          	mv	s2,a1

    _slab* slab = nullptr;


    for(_slab* p = halfHead; p; p = p->getNext()){
    80005a8c:	03053483          	ld	s1,48(a0)
    80005a90:	02048663          	beqz	s1,80005abc <_ZN5Cache4freeEPv+0x54>
        if(p->freeObject(obj) == 0){
    80005a94:	00090593          	mv	a1,s2
    80005a98:	00048513          	mv	a0,s1
    80005a9c:	00001097          	auipc	ra,0x1
    80005aa0:	b6c080e7          	jalr	-1172(ra) # 80006608 <_ZN5_slab10freeObjectEPv>
    80005aa4:	00050663          	beqz	a0,80005ab0 <_ZN5Cache4freeEPv+0x48>
    _slab* getNext() const { return next; }
    80005aa8:	0084b483          	ld	s1,8(s1)
    for(_slab* p = halfHead; p; p = p->getNext()){
    80005aac:	fe5ff06f          	j	80005a90 <_ZN5Cache4freeEPv+0x28>
    _slab* getPrev() const {return prev;}

    bool isFull() const;
    bool isEmpty() const { return numOfSlots == numOfFreeSlots;}
    80005ab0:	0344a703          	lw	a4,52(s1)
    80005ab4:	0304a783          	lw	a5,48(s1)
            slab = p;

            if(!slab->isEmpty())
    80005ab8:	02f70263          	beq	a4,a5,80005adc <_ZN5Cache4freeEPv+0x74>
        }


    }

    if(!slab){
    80005abc:	06048063          	beqz	s1,80005b1c <_ZN5Cache4freeEPv+0xb4>


    }


}
    80005ac0:	02813083          	ld	ra,40(sp)
    80005ac4:	02013403          	ld	s0,32(sp)
    80005ac8:	01813483          	ld	s1,24(sp)
    80005acc:	01013903          	ld	s2,16(sp)
    80005ad0:	00813983          	ld	s3,8(sp)
    80005ad4:	03010113          	addi	sp,sp,48
    80005ad8:	00008067          	ret
            if(slab == halfHead){
    80005adc:	0309b783          	ld	a5,48(s3)
    80005ae0:	02978863          	beq	a5,s1,80005b10 <_ZN5Cache4freeEPv+0xa8>
    _slab* getPrev() const {return prev;}
    80005ae4:	0104b703          	ld	a4,16(s1)
    _slab* getNext() const { return next; }
    80005ae8:	0084b783          	ld	a5,8(s1)
            if(prev)
    80005aec:	00070463          	beqz	a4,80005af4 <_ZN5Cache4freeEPv+0x8c>
    void setNext(_slab* next) { this->next = next;}
    80005af0:	00f73423          	sd	a5,8(a4)
            if(next)
    80005af4:	00078463          	beqz	a5,80005afc <_ZN5Cache4freeEPv+0x94>
    void setPrev(_slab* prev) { this->prev = prev; }
    80005af8:	00e7b823          	sd	a4,16(a5)
            slab->setNext(freeHead);
    80005afc:	0289b783          	ld	a5,40(s3)
    void setNext(_slab* next) { this->next = next;}
    80005b00:	00f4b423          	sd	a5,8(s1)
    void setPrev(_slab* prev) { this->prev = prev; }
    80005b04:	0004b823          	sd	zero,16(s1)
            freeHead = slab;
    80005b08:	0299b423          	sd	s1,40(s3)
            break;
    80005b0c:	fb1ff06f          	j	80005abc <_ZN5Cache4freeEPv+0x54>
    _slab* getNext() const { return next; }
    80005b10:	0087b783          	ld	a5,8(a5)
                halfHead = halfHead->getNext();
    80005b14:	02f9b823          	sd	a5,48(s3)
    80005b18:	fcdff06f          	j	80005ae4 <_ZN5Cache4freeEPv+0x7c>
        for(_slab* p = fullHead; p; p = p->getNext()){
    80005b1c:	0389b483          	ld	s1,56(s3)
    80005b20:	fa0480e3          	beqz	s1,80005ac0 <_ZN5Cache4freeEPv+0x58>
            if(p->freeObject(obj) == 0){
    80005b24:	00090593          	mv	a1,s2
    80005b28:	00048513          	mv	a0,s1
    80005b2c:	00001097          	auipc	ra,0x1
    80005b30:	adc080e7          	jalr	-1316(ra) # 80006608 <_ZN5_slab10freeObjectEPv>
    80005b34:	00050663          	beqz	a0,80005b40 <_ZN5Cache4freeEPv+0xd8>
    80005b38:	0084b483          	ld	s1,8(s1)
        for(_slab* p = fullHead; p; p = p->getNext()){
    80005b3c:	fe5ff06f          	j	80005b20 <_ZN5Cache4freeEPv+0xb8>
                if(slab == fullHead){
    80005b40:	0389b783          	ld	a5,56(s3)
    80005b44:	02978863          	beq	a5,s1,80005b74 <_ZN5Cache4freeEPv+0x10c>
    _slab* getPrev() const {return prev;}
    80005b48:	0104b703          	ld	a4,16(s1)
    _slab* getNext() const { return next; }
    80005b4c:	0084b783          	ld	a5,8(s1)
                if(prev)
    80005b50:	00070463          	beqz	a4,80005b58 <_ZN5Cache4freeEPv+0xf0>
    void setNext(_slab* next) { this->next = next;}
    80005b54:	00f73423          	sd	a5,8(a4)
                if(next)
    80005b58:	00078463          	beqz	a5,80005b60 <_ZN5Cache4freeEPv+0xf8>
    void setPrev(_slab* prev) { this->prev = prev; }
    80005b5c:	00e7b823          	sd	a4,16(a5)
                slab->setNext(halfHead);
    80005b60:	0309b783          	ld	a5,48(s3)
    void setNext(_slab* next) { this->next = next;}
    80005b64:	00f4b423          	sd	a5,8(s1)
    void setPrev(_slab* prev) { this->prev = prev; }
    80005b68:	0004b823          	sd	zero,16(s1)
                halfHead = slab;
    80005b6c:	0299b823          	sd	s1,48(s3)
                break;
    80005b70:	f51ff06f          	j	80005ac0 <_ZN5Cache4freeEPv+0x58>
    _slab* getNext() const { return next; }
    80005b74:	0087b783          	ld	a5,8(a5)
                    fullHead = fullHead->getNext();
    80005b78:	02f9bc23          	sd	a5,56(s3)
    80005b7c:	fcdff06f          	j	80005b48 <_ZN5Cache4freeEPv+0xe0>

0000000080005b80 <_ZN5CachenwEm>:

void *Cache::operator new(size_t s) {
    80005b80:	fe010113          	addi	sp,sp,-32
    80005b84:	00113c23          	sd	ra,24(sp)
    80005b88:	00813823          	sd	s0,16(sp)
    80005b8c:	00913423          	sd	s1,8(sp)
    80005b90:	02010413          	addi	s0,sp,32
    80005b94:	00050493          	mv	s1,a0
    return BuddyAllocator::getInstance().alloc(s);
    80005b98:	fffff097          	auipc	ra,0xfffff
    80005b9c:	4e8080e7          	jalr	1256(ra) # 80005080 <_ZN14BuddyAllocator11getInstanceEv>
    80005ba0:	00048593          	mv	a1,s1
    80005ba4:	fffff097          	auipc	ra,0xfffff
    80005ba8:	67c080e7          	jalr	1660(ra) # 80005220 <_ZN14BuddyAllocator5allocEm>
}
    80005bac:	01813083          	ld	ra,24(sp)
    80005bb0:	01013403          	ld	s0,16(sp)
    80005bb4:	00813483          	ld	s1,8(sp)
    80005bb8:	02010113          	addi	sp,sp,32
    80005bbc:	00008067          	ret

0000000080005bc0 <_ZN5CachedlEPv>:

void Cache::operator delete(void *p) {
    80005bc0:	fe010113          	addi	sp,sp,-32
    80005bc4:	00113c23          	sd	ra,24(sp)
    80005bc8:	00813823          	sd	s0,16(sp)
    80005bcc:	00913423          	sd	s1,8(sp)
    80005bd0:	02010413          	addi	s0,sp,32
    80005bd4:	00050493          	mv	s1,a0
    BuddyAllocator::getInstance().dealloc(p, sizeof(Cache));
    80005bd8:	fffff097          	auipc	ra,0xfffff
    80005bdc:	4a8080e7          	jalr	1192(ra) # 80005080 <_ZN14BuddyAllocator11getInstanceEv>
    80005be0:	05000613          	li	a2,80
    80005be4:	00048593          	mv	a1,s1
    80005be8:	fffff097          	auipc	ra,0xfffff
    80005bec:	748080e7          	jalr	1864(ra) # 80005330 <_ZN14BuddyAllocator7deallocEPvm>
}
    80005bf0:	01813083          	ld	ra,24(sp)
    80005bf4:	01013403          	ld	s0,16(sp)
    80005bf8:	00813483          	ld	s1,8(sp)
    80005bfc:	02010113          	addi	sp,sp,32
    80005c00:	00008067          	ret

0000000080005c04 <_ZN5CacheD1Ev>:

Cache::~Cache() {
    80005c04:	fd010113          	addi	sp,sp,-48
    80005c08:	02113423          	sd	ra,40(sp)
    80005c0c:	02813023          	sd	s0,32(sp)
    80005c10:	00913c23          	sd	s1,24(sp)
    80005c14:	01213823          	sd	s2,16(sp)
    80005c18:	01313423          	sd	s3,8(sp)
    80005c1c:	03010413          	addi	s0,sp,48
    80005c20:	00050993          	mv	s3,a0
    for(_slab* p = fullHead; p;){
    80005c24:	03853483          	ld	s1,56(a0)
    80005c28:	0200006f          	j	80005c48 <_ZN5CacheD1Ev+0x44>
        _slab* q = p;
        p = p->getNext();
        delete q;
    80005c2c:	00048513          	mv	a0,s1
    80005c30:	00001097          	auipc	ra,0x1
    80005c34:	af4080e7          	jalr	-1292(ra) # 80006724 <_ZN5_slabD1Ev>
    80005c38:	00048513          	mv	a0,s1
    80005c3c:	00001097          	auipc	ra,0x1
    80005c40:	a84080e7          	jalr	-1404(ra) # 800066c0 <_ZN5_slabdlEPv>
Cache::~Cache() {
    80005c44:	00090493          	mv	s1,s2
    for(_slab* p = fullHead; p;){
    80005c48:	00048863          	beqz	s1,80005c58 <_ZN5CacheD1Ev+0x54>
    80005c4c:	0084b903          	ld	s2,8(s1)
        delete q;
    80005c50:	fc049ee3          	bnez	s1,80005c2c <_ZN5CacheD1Ev+0x28>
    80005c54:	ff1ff06f          	j	80005c44 <_ZN5CacheD1Ev+0x40>
    }
    for(_slab* p = halfHead; p;){
    80005c58:	0309b483          	ld	s1,48(s3)
    80005c5c:	0200006f          	j	80005c7c <_ZN5CacheD1Ev+0x78>
        _slab* q = p;
        p = p->getNext();
        delete q;
    80005c60:	00048513          	mv	a0,s1
    80005c64:	00001097          	auipc	ra,0x1
    80005c68:	ac0080e7          	jalr	-1344(ra) # 80006724 <_ZN5_slabD1Ev>
    80005c6c:	00048513          	mv	a0,s1
    80005c70:	00001097          	auipc	ra,0x1
    80005c74:	a50080e7          	jalr	-1456(ra) # 800066c0 <_ZN5_slabdlEPv>
Cache::~Cache() {
    80005c78:	00090493          	mv	s1,s2
    for(_slab* p = halfHead; p;){
    80005c7c:	00048863          	beqz	s1,80005c8c <_ZN5CacheD1Ev+0x88>
    80005c80:	0084b903          	ld	s2,8(s1)
        delete q;
    80005c84:	fc049ee3          	bnez	s1,80005c60 <_ZN5CacheD1Ev+0x5c>
    80005c88:	ff1ff06f          	j	80005c78 <_ZN5CacheD1Ev+0x74>
    }
    for(_slab* p = freeHead; p;){
    80005c8c:	0289b483          	ld	s1,40(s3)
    80005c90:	0200006f          	j	80005cb0 <_ZN5CacheD1Ev+0xac>
        _slab* q = p;
        p = p->getNext();
        delete q;
    80005c94:	00048513          	mv	a0,s1
    80005c98:	00001097          	auipc	ra,0x1
    80005c9c:	a8c080e7          	jalr	-1396(ra) # 80006724 <_ZN5_slabD1Ev>
    80005ca0:	00048513          	mv	a0,s1
    80005ca4:	00001097          	auipc	ra,0x1
    80005ca8:	a1c080e7          	jalr	-1508(ra) # 800066c0 <_ZN5_slabdlEPv>
Cache::~Cache() {
    80005cac:	00090493          	mv	s1,s2
    for(_slab* p = freeHead; p;){
    80005cb0:	00048863          	beqz	s1,80005cc0 <_ZN5CacheD1Ev+0xbc>
    80005cb4:	0084b903          	ld	s2,8(s1)
        delete q;
    80005cb8:	fc049ee3          	bnez	s1,80005c94 <_ZN5CacheD1Ev+0x90>
    80005cbc:	ff1ff06f          	j	80005cac <_ZN5CacheD1Ev+0xa8>
    }
}
    80005cc0:	02813083          	ld	ra,40(sp)
    80005cc4:	02013403          	ld	s0,32(sp)
    80005cc8:	01813483          	ld	s1,24(sp)
    80005ccc:	01013903          	ld	s2,16(sp)
    80005cd0:	00813983          	ld	s3,8(sp)
    80005cd4:	03010113          	addi	sp,sp,48
    80005cd8:	00008067          	ret

0000000080005cdc <_ZN5Cache8findInfoEPiS0_S0_S0_>:
    printInt(p);
    printString(" \n");

}

void Cache::findInfo(int* cacheSize, int* slabs, int* numberOfObjects, int* prs) {
    80005cdc:	ff010113          	addi	sp,sp,-16
    80005ce0:	00813423          	sd	s0,8(sp)
    80005ce4:	01010413          	addi	s0,sp,16
    int i = 0;
    for(_slab* p = fullHead;p;p = p->getNext())i++;
    80005ce8:	03853803          	ld	a6,56(a0)
    int i = 0;
    80005cec:	00000793          	li	a5,0
    for(_slab* p = fullHead;p;p = p->getNext())i++;
    80005cf0:	00080863          	beqz	a6,80005d00 <_ZN5Cache8findInfoEPiS0_S0_S0_+0x24>
    80005cf4:	0017879b          	addiw	a5,a5,1
    80005cf8:	00883803          	ld	a6,8(a6)
    80005cfc:	ff5ff06f          	j	80005cf0 <_ZN5Cache8findInfoEPiS0_S0_S0_+0x14>
    for(_slab* p = freeHead;p;p = p->getNext())i++;
    80005d00:	02853803          	ld	a6,40(a0)
    80005d04:	00080863          	beqz	a6,80005d14 <_ZN5Cache8findInfoEPiS0_S0_S0_+0x38>
    80005d08:	0017879b          	addiw	a5,a5,1
    80005d0c:	00883803          	ld	a6,8(a6)
    80005d10:	ff5ff06f          	j	80005d04 <_ZN5Cache8findInfoEPiS0_S0_S0_+0x28>
    for(_slab* p = halfHead;p;p = p->getNext())i++;
    80005d14:	03053803          	ld	a6,48(a0)
    80005d18:	00080863          	beqz	a6,80005d28 <_ZN5Cache8findInfoEPiS0_S0_S0_+0x4c>
    80005d1c:	0017879b          	addiw	a5,a5,1
    80005d20:	00883803          	ld	a6,8(a6)
    80005d24:	ff5ff06f          	j	80005d18 <_ZN5Cache8findInfoEPiS0_S0_S0_+0x3c>
    *slabs = i;
    80005d28:	00f62023          	sw	a5,0(a2)

    i = 0;
    for(_slab* p = fullHead;p;p = p->getNext())i += p->getNumOfObject();
    80005d2c:	03853783          	ld	a5,56(a0)
    i = 0;
    80005d30:	00000613          	li	a2,0
    for(_slab* p = fullHead;p;p = p->getNext())i += p->getNumOfObject();
    80005d34:	00078e63          	beqz	a5,80005d50 <_ZN5Cache8findInfoEPiS0_S0_S0_+0x74>
    void* getObject();
    int freeObject(void* addr);
    int getNumOfObject() const { return numOfSlots - numOfFreeSlots;}
    80005d38:	0347a803          	lw	a6,52(a5)
    80005d3c:	0307a883          	lw	a7,48(a5)
    80005d40:	4118083b          	subw	a6,a6,a7
    80005d44:	00c8063b          	addw	a2,a6,a2
    _slab* getNext() const { return next; }
    80005d48:	0087b783          	ld	a5,8(a5)
    80005d4c:	fe9ff06f          	j	80005d34 <_ZN5Cache8findInfoEPiS0_S0_S0_+0x58>
    //for(_slab* p = freeHead;p;p = p->getNext())i += p->getNumOfObject();
    for(_slab* p = halfHead;p;p = p->getNext())i += p->getNumOfObject();
    80005d50:	03053783          	ld	a5,48(a0)
    80005d54:	00078e63          	beqz	a5,80005d70 <_ZN5Cache8findInfoEPiS0_S0_S0_+0x94>
    int getNumOfObject() const { return numOfSlots - numOfFreeSlots;}
    80005d58:	0347a803          	lw	a6,52(a5)
    80005d5c:	0307a883          	lw	a7,48(a5)
    80005d60:	4118083b          	subw	a6,a6,a7
    80005d64:	00c8063b          	addw	a2,a6,a2
    _slab* getNext() const { return next; }
    80005d68:	0087b783          	ld	a5,8(a5)
    80005d6c:	fe9ff06f          	j	80005d54 <_ZN5Cache8findInfoEPiS0_S0_S0_+0x78>
    *numberOfObjects = i;
    80005d70:	00c6a023          	sw	a2,0(a3)

    i = 0;
    for(_slab* p = fullHead;p;p = p->getNext())i += p->getSize();
    80005d74:	03853603          	ld	a2,56(a0)
    i = 0;
    80005d78:	00000793          	li	a5,0
    for(_slab* p = fullHead;p;p = p->getNext())i += p->getSize();
    80005d7c:	00060e63          	beqz	a2,80005d98 <_ZN5Cache8findInfoEPiS0_S0_S0_+0xbc>
    int getSize() const { return (int)numOfSlots*slotSize;}
    80005d80:	03462883          	lw	a7,52(a2)
    80005d84:	00063803          	ld	a6,0(a2)
    80005d88:	0318083b          	mulw	a6,a6,a7
    80005d8c:	00f807bb          	addw	a5,a6,a5
    _slab* getNext() const { return next; }
    80005d90:	00863603          	ld	a2,8(a2)
    80005d94:	fe9ff06f          	j	80005d7c <_ZN5Cache8findInfoEPiS0_S0_S0_+0xa0>
    for(_slab* p = freeHead;p;p = p->getNext())i += p->getSize();
    80005d98:	02853603          	ld	a2,40(a0)
    80005d9c:	00060e63          	beqz	a2,80005db8 <_ZN5Cache8findInfoEPiS0_S0_S0_+0xdc>
    int getSize() const { return (int)numOfSlots*slotSize;}
    80005da0:	03462883          	lw	a7,52(a2)
    80005da4:	00063803          	ld	a6,0(a2)
    80005da8:	0318083b          	mulw	a6,a6,a7
    80005dac:	00f807bb          	addw	a5,a6,a5
    _slab* getNext() const { return next; }
    80005db0:	00863603          	ld	a2,8(a2)
    80005db4:	fe9ff06f          	j	80005d9c <_ZN5Cache8findInfoEPiS0_S0_S0_+0xc0>
    for(_slab* p = halfHead;p;p = p->getNext())i += p->getSize();
    80005db8:	03053603          	ld	a2,48(a0)
    80005dbc:	00060e63          	beqz	a2,80005dd8 <_ZN5Cache8findInfoEPiS0_S0_S0_+0xfc>
    int getSize() const { return (int)numOfSlots*slotSize;}
    80005dc0:	03462883          	lw	a7,52(a2)
    80005dc4:	00063803          	ld	a6,0(a2)
    80005dc8:	0318083b          	mulw	a6,a6,a7
    80005dcc:	00f807bb          	addw	a5,a6,a5
    _slab* getNext() const { return next; }
    80005dd0:	00863603          	ld	a2,8(a2)
    80005dd4:	fe9ff06f          	j	80005dbc <_ZN5Cache8findInfoEPiS0_S0_S0_+0xe0>

    *cacheSize = (i / 4096) + 1;
    80005dd8:	41f7d61b          	sraiw	a2,a5,0x1f
    80005ddc:	0146561b          	srliw	a2,a2,0x14
    80005de0:	00f607bb          	addw	a5,a2,a5
    80005de4:	40c7d79b          	sraiw	a5,a5,0xc
    80005de8:	0017879b          	addiw	a5,a5,1
    80005dec:	00f5a023          	sw	a5,0(a1)
    int maxObj = 0;
    for(_slab* p = fullHead;p;p = p->getNext())maxObj += p->getNumOfSlots();
    80005df0:	03853603          	ld	a2,56(a0)
    int maxObj = 0;
    80005df4:	00000793          	li	a5,0
    for(_slab* p = fullHead;p;p = p->getNext())maxObj += p->getNumOfSlots();
    80005df8:	00060a63          	beqz	a2,80005e0c <_ZN5Cache8findInfoEPiS0_S0_S0_+0x130>
    int getNumOfSlots() const {return numOfSlots;}
    80005dfc:	03462583          	lw	a1,52(a2)
    80005e00:	00b787bb          	addw	a5,a5,a1
    _slab* getNext() const { return next; }
    80005e04:	00863603          	ld	a2,8(a2)
    80005e08:	ff1ff06f          	j	80005df8 <_ZN5Cache8findInfoEPiS0_S0_S0_+0x11c>
    for(_slab* p = freeHead;p;p = p->getNext())maxObj += p->getNumOfObject();
    80005e0c:	02853603          	ld	a2,40(a0)
    80005e10:	00060e63          	beqz	a2,80005e2c <_ZN5Cache8findInfoEPiS0_S0_S0_+0x150>
    int getNumOfObject() const { return numOfSlots - numOfFreeSlots;}
    80005e14:	03462583          	lw	a1,52(a2)
    80005e18:	03062803          	lw	a6,48(a2)
    80005e1c:	410585bb          	subw	a1,a1,a6
    80005e20:	00f587bb          	addw	a5,a1,a5
    _slab* getNext() const { return next; }
    80005e24:	00863603          	ld	a2,8(a2)
    80005e28:	fe9ff06f          	j	80005e10 <_ZN5Cache8findInfoEPiS0_S0_S0_+0x134>
    for(_slab* p = halfHead;p;p = p->getNext())maxObj += p->getNumOfSlots();
    80005e2c:	03053603          	ld	a2,48(a0)
    80005e30:	00060a63          	beqz	a2,80005e44 <_ZN5Cache8findInfoEPiS0_S0_S0_+0x168>
    int getNumOfSlots() const {return numOfSlots;}
    80005e34:	03462583          	lw	a1,52(a2)
    80005e38:	00b787bb          	addw	a5,a5,a1
    _slab* getNext() const { return next; }
    80005e3c:	00863603          	ld	a2,8(a2)
    80005e40:	ff1ff06f          	j	80005e30 <_ZN5Cache8findInfoEPiS0_S0_S0_+0x154>
    *prs = (int)(*numberOfObjects*100 / maxObj);
    80005e44:	0006a583          	lw	a1,0(a3)
    80005e48:	06400613          	li	a2,100
    80005e4c:	02b6063b          	mulw	a2,a2,a1
    80005e50:	02f647bb          	divw	a5,a2,a5
    80005e54:	00f72023          	sw	a5,0(a4)

    if(fullHead) *numberOfObjects = fullHead->getNumOfSlots();
    80005e58:	03853783          	ld	a5,56(a0)
    80005e5c:	00078c63          	beqz	a5,80005e74 <_ZN5Cache8findInfoEPiS0_S0_S0_+0x198>
    int getNumOfSlots() const {return numOfSlots;}
    80005e60:	0347a783          	lw	a5,52(a5)
    80005e64:	00f6a023          	sw	a5,0(a3)
    else if(freeHead) *numberOfObjects = freeHead->getNumOfSlots();
    else if(halfHead) *numberOfObjects = halfHead->getNumOfSlots();



}
    80005e68:	00813403          	ld	s0,8(sp)
    80005e6c:	01010113          	addi	sp,sp,16
    80005e70:	00008067          	ret
    else if(freeHead) *numberOfObjects = freeHead->getNumOfSlots();
    80005e74:	02853783          	ld	a5,40(a0)
    80005e78:	00078863          	beqz	a5,80005e88 <_ZN5Cache8findInfoEPiS0_S0_S0_+0x1ac>
    80005e7c:	0347a783          	lw	a5,52(a5)
    80005e80:	00f6a023          	sw	a5,0(a3)
    80005e84:	fe5ff06f          	j	80005e68 <_ZN5Cache8findInfoEPiS0_S0_S0_+0x18c>
    else if(halfHead) *numberOfObjects = halfHead->getNumOfSlots();
    80005e88:	03053783          	ld	a5,48(a0)
    80005e8c:	fc078ee3          	beqz	a5,80005e68 <_ZN5Cache8findInfoEPiS0_S0_S0_+0x18c>
    80005e90:	0347a783          	lw	a5,52(a5)
    80005e94:	00f6a023          	sw	a5,0(a3)
}
    80005e98:	fd1ff06f          	j	80005e68 <_ZN5Cache8findInfoEPiS0_S0_S0_+0x18c>

0000000080005e9c <_ZN5Cache9printInfoEv>:
void Cache::printInfo() {
    80005e9c:	fd010113          	addi	sp,sp,-48
    80005ea0:	02113423          	sd	ra,40(sp)
    80005ea4:	02813023          	sd	s0,32(sp)
    80005ea8:	00913c23          	sd	s1,24(sp)
    80005eac:	03010413          	addi	s0,sp,48
    80005eb0:	00050493          	mv	s1,a0
    findInfo(&sz, &slab, &nob, &p);
    80005eb4:	fd040713          	addi	a4,s0,-48
    80005eb8:	fd440693          	addi	a3,s0,-44
    80005ebc:	fd840613          	addi	a2,s0,-40
    80005ec0:	fdc40593          	addi	a1,s0,-36
    80005ec4:	00000097          	auipc	ra,0x0
    80005ec8:	e18080e7          	jalr	-488(ra) # 80005cdc <_ZN5Cache8findInfoEPiS0_S0_S0_>
    printString("name \tobject size \tcache size(blocks) \t\tslabs \t\tnumber of objects \t\t%\n");
    80005ecc:	00004517          	auipc	a0,0x4
    80005ed0:	51450513          	addi	a0,a0,1300 # 8000a3e0 <CONSOLE_STATUS+0x3d0>
    80005ed4:	ffffd097          	auipc	ra,0xffffd
    80005ed8:	0f4080e7          	jalr	244(ra) # 80002fc8 <_Z11printStringPKc>
    printString(name);
    80005edc:	00048513          	mv	a0,s1
    80005ee0:	ffffd097          	auipc	ra,0xffffd
    80005ee4:	0e8080e7          	jalr	232(ra) # 80002fc8 <_Z11printStringPKc>
    printString(" \t");
    80005ee8:	00004517          	auipc	a0,0x4
    80005eec:	54050513          	addi	a0,a0,1344 # 8000a428 <CONSOLE_STATUS+0x418>
    80005ef0:	ffffd097          	auipc	ra,0xffffd
    80005ef4:	0d8080e7          	jalr	216(ra) # 80002fc8 <_Z11printStringPKc>
    printInt(objectSize);
    80005ef8:	00000613          	li	a2,0
    80005efc:	00a00593          	li	a1,10
    80005f00:	0204a503          	lw	a0,32(s1)
    80005f04:	ffffd097          	auipc	ra,0xffffd
    80005f08:	25c080e7          	jalr	604(ra) # 80003160 <_Z8printIntiii>
    printString("\t\t\t\t");
    80005f0c:	00004517          	auipc	a0,0x4
    80005f10:	52450513          	addi	a0,a0,1316 # 8000a430 <CONSOLE_STATUS+0x420>
    80005f14:	ffffd097          	auipc	ra,0xffffd
    80005f18:	0b4080e7          	jalr	180(ra) # 80002fc8 <_Z11printStringPKc>
    printInt(sz);
    80005f1c:	00000613          	li	a2,0
    80005f20:	00a00593          	li	a1,10
    80005f24:	fdc42503          	lw	a0,-36(s0)
    80005f28:	ffffd097          	auipc	ra,0xffffd
    80005f2c:	238080e7          	jalr	568(ra) # 80003160 <_Z8printIntiii>
    printString("\t\t\t\t\t\t");
    80005f30:	00004517          	auipc	a0,0x4
    80005f34:	50850513          	addi	a0,a0,1288 # 8000a438 <CONSOLE_STATUS+0x428>
    80005f38:	ffffd097          	auipc	ra,0xffffd
    80005f3c:	090080e7          	jalr	144(ra) # 80002fc8 <_Z11printStringPKc>
    printInt(slab);
    80005f40:	00000613          	li	a2,0
    80005f44:	00a00593          	li	a1,10
    80005f48:	fd842503          	lw	a0,-40(s0)
    80005f4c:	ffffd097          	auipc	ra,0xffffd
    80005f50:	214080e7          	jalr	532(ra) # 80003160 <_Z8printIntiii>
    printString("\t\t\t\t");
    80005f54:	00004517          	auipc	a0,0x4
    80005f58:	4dc50513          	addi	a0,a0,1244 # 8000a430 <CONSOLE_STATUS+0x420>
    80005f5c:	ffffd097          	auipc	ra,0xffffd
    80005f60:	06c080e7          	jalr	108(ra) # 80002fc8 <_Z11printStringPKc>
    printInt(nob);
    80005f64:	00000613          	li	a2,0
    80005f68:	00a00593          	li	a1,10
    80005f6c:	fd442503          	lw	a0,-44(s0)
    80005f70:	ffffd097          	auipc	ra,0xffffd
    80005f74:	1f0080e7          	jalr	496(ra) # 80003160 <_Z8printIntiii>
    printString("\t\t\t\t");
    80005f78:	00004517          	auipc	a0,0x4
    80005f7c:	4b850513          	addi	a0,a0,1208 # 8000a430 <CONSOLE_STATUS+0x420>
    80005f80:	ffffd097          	auipc	ra,0xffffd
    80005f84:	048080e7          	jalr	72(ra) # 80002fc8 <_Z11printStringPKc>
    printInt(p);
    80005f88:	00000613          	li	a2,0
    80005f8c:	00a00593          	li	a1,10
    80005f90:	fd042503          	lw	a0,-48(s0)
    80005f94:	ffffd097          	auipc	ra,0xffffd
    80005f98:	1cc080e7          	jalr	460(ra) # 80003160 <_Z8printIntiii>
    printString(" \n");
    80005f9c:	00004517          	auipc	a0,0x4
    80005fa0:	4a450513          	addi	a0,a0,1188 # 8000a440 <CONSOLE_STATUS+0x430>
    80005fa4:	ffffd097          	auipc	ra,0xffffd
    80005fa8:	024080e7          	jalr	36(ra) # 80002fc8 <_Z11printStringPKc>
}
    80005fac:	02813083          	ld	ra,40(sp)
    80005fb0:	02013403          	ld	s0,32(sp)
    80005fb4:	01813483          	ld	s1,24(sp)
    80005fb8:	03010113          	addi	sp,sp,48
    80005fbc:	00008067          	ret

0000000080005fc0 <_ZN5Cache10printErrorEv>:

void Cache::printError() {
    80005fc0:	ff010113          	addi	sp,sp,-16
    80005fc4:	00113423          	sd	ra,8(sp)
    80005fc8:	00813023          	sd	s0,0(sp)
    80005fcc:	01010413          	addi	s0,sp,16
    printString("Error\n");
    80005fd0:	00004517          	auipc	a0,0x4
    80005fd4:	47850513          	addi	a0,a0,1144 # 8000a448 <CONSOLE_STATUS+0x438>
    80005fd8:	ffffd097          	auipc	ra,0xffffd
    80005fdc:	ff0080e7          	jalr	-16(ra) # 80002fc8 <_Z11printStringPKc>
}
    80005fe0:	00813083          	ld	ra,8(sp)
    80005fe4:	00013403          	ld	s0,0(sp)
    80005fe8:	01010113          	addi	sp,sp,16
    80005fec:	00008067          	ret

0000000080005ff0 <_ZN5Cache6shrinkEv>:

void Cache::shrink() {
    80005ff0:	fe010113          	addi	sp,sp,-32
    80005ff4:	00113c23          	sd	ra,24(sp)
    80005ff8:	00813823          	sd	s0,16(sp)
    80005ffc:	00913423          	sd	s1,8(sp)
    80006000:	01213023          	sd	s2,0(sp)
    80006004:	02010413          	addi	s0,sp,32
    80006008:	00050913          	mv	s2,a0
    while(freeHead){
    8000600c:	02893483          	ld	s1,40(s2)
    80006010:	02048663          	beqz	s1,8000603c <_ZN5Cache6shrinkEv+0x4c>
    _slab* getNext() const { return next; }
    80006014:	0084b783          	ld	a5,8(s1)
        _slab* q = freeHead;
        freeHead = freeHead->getNext();
    80006018:	02f93423          	sd	a5,40(s2)
        delete q;
    8000601c:	fe0488e3          	beqz	s1,8000600c <_ZN5Cache6shrinkEv+0x1c>
    80006020:	00048513          	mv	a0,s1
    80006024:	00000097          	auipc	ra,0x0
    80006028:	700080e7          	jalr	1792(ra) # 80006724 <_ZN5_slabD1Ev>
    8000602c:	00048513          	mv	a0,s1
    80006030:	00000097          	auipc	ra,0x0
    80006034:	690080e7          	jalr	1680(ra) # 800066c0 <_ZN5_slabdlEPv>
    80006038:	fd5ff06f          	j	8000600c <_ZN5Cache6shrinkEv+0x1c>
    }

}
    8000603c:	01813083          	ld	ra,24(sp)
    80006040:	01013403          	ld	s0,16(sp)
    80006044:	00813483          	ld	s1,8(sp)
    80006048:	00013903          	ld	s2,0(sp)
    8000604c:	02010113          	addi	sp,sp,32
    80006050:	00008067          	ret

0000000080006054 <_ZN6ThreadD1Ev>:
    //uint64* stack = (uint64*)mem_alloc(sizeof(uint64)*DEFAULT_STACK_SIZE);
    //TCB::createThread(&myHandle,body, arg, stack, TCB::READY);
    thread_cpp_create(&myHandle, body, arg);
}

Thread::~Thread() {}
    80006054:	ff010113          	addi	sp,sp,-16
    80006058:	00813423          	sd	s0,8(sp)
    8000605c:	01010413          	addi	s0,sp,16
    80006060:	00813403          	ld	s0,8(sp)
    80006064:	01010113          	addi	sp,sp,16
    80006068:	00008067          	ret

000000008000606c <_ZN6Thread13threadWrapperEPv>:
}


void Thread::threadWrapper(void *arg){
    Thread* t = (Thread*)arg;
    if(t == nullptr)
    8000606c:	02050863          	beqz	a0,8000609c <_ZN6Thread13threadWrapperEPv+0x30>
void Thread::threadWrapper(void *arg){
    80006070:	ff010113          	addi	sp,sp,-16
    80006074:	00113423          	sd	ra,8(sp)
    80006078:	00813023          	sd	s0,0(sp)
    8000607c:	01010413          	addi	s0,sp,16
        return;
    t->run();
    80006080:	00053783          	ld	a5,0(a0)
    80006084:	0107b783          	ld	a5,16(a5)
    80006088:	000780e7          	jalr	a5
}
    8000608c:	00813083          	ld	ra,8(sp)
    80006090:	00013403          	ld	s0,0(sp)
    80006094:	01010113          	addi	sp,sp,16
    80006098:	00008067          	ret
    8000609c:	00008067          	ret

00000000800060a0 <_ZN9SemaphoreD1Ev>:

Semaphore::Semaphore(unsigned int init) {
    sem_open(&myHandle, init);
}

Semaphore::~Semaphore() {
    800060a0:	ff010113          	addi	sp,sp,-16
    800060a4:	00813423          	sd	s0,8(sp)
    800060a8:	01010413          	addi	s0,sp,16

}
    800060ac:	00813403          	ld	s0,8(sp)
    800060b0:	01010113          	addi	sp,sp,16
    800060b4:	00008067          	ret

00000000800060b8 <_ZN14PeriodicThread21periodicThreadWrapperEPv>:
void PeriodicThread::periodicThreadWrapper(void* arg){
    800060b8:	fe010113          	addi	sp,sp,-32
    800060bc:	00113c23          	sd	ra,24(sp)
    800060c0:	00813823          	sd	s0,16(sp)
    800060c4:	00913423          	sd	s1,8(sp)
    800060c8:	01213023          	sd	s2,0(sp)
    800060cc:	02010413          	addi	s0,sp,32
    800060d0:	00050493          	mv	s1,a0
    time_t t = p->period;
    800060d4:	00853903          	ld	s2,8(a0)
        p->thread->periodicActivation();
    800060d8:	0004b503          	ld	a0,0(s1)
    800060dc:	00053783          	ld	a5,0(a0)
    800060e0:	0187b783          	ld	a5,24(a5)
    800060e4:	000780e7          	jalr	a5
        time_sleep(t);
    800060e8:	00090513          	mv	a0,s2
    800060ec:	fffff097          	auipc	ra,0xfffff
    800060f0:	844080e7          	jalr	-1980(ra) # 80004930 <_Z10time_sleepm>
    while(true){
    800060f4:	fe5ff06f          	j	800060d8 <_ZN14PeriodicThread21periodicThreadWrapperEPv+0x20>

00000000800060f8 <_Znwm>:
void *operator new(size_t size){
    800060f8:	ff010113          	addi	sp,sp,-16
    800060fc:	00113423          	sd	ra,8(sp)
    80006100:	00813023          	sd	s0,0(sp)
    80006104:	01010413          	addi	s0,sp,16
    return mem_alloc(size);
    80006108:	ffffe097          	auipc	ra,0xffffe
    8000610c:	5b0080e7          	jalr	1456(ra) # 800046b8 <_Z9mem_allocm>
}
    80006110:	00813083          	ld	ra,8(sp)
    80006114:	00013403          	ld	s0,0(sp)
    80006118:	01010113          	addi	sp,sp,16
    8000611c:	00008067          	ret

0000000080006120 <_ZdlPv>:
void operator delete(void* addres){
    80006120:	ff010113          	addi	sp,sp,-16
    80006124:	00113423          	sd	ra,8(sp)
    80006128:	00813023          	sd	s0,0(sp)
    8000612c:	01010413          	addi	s0,sp,16
    mem_free(addres);
    80006130:	ffffe097          	auipc	ra,0xffffe
    80006134:	5dc080e7          	jalr	1500(ra) # 8000470c <_Z8mem_freePv>
}
    80006138:	00813083          	ld	ra,8(sp)
    8000613c:	00013403          	ld	s0,0(sp)
    80006140:	01010113          	addi	sp,sp,16
    80006144:	00008067          	ret

0000000080006148 <_ZN6ThreadD0Ev>:
Thread::~Thread() {}
    80006148:	ff010113          	addi	sp,sp,-16
    8000614c:	00113423          	sd	ra,8(sp)
    80006150:	00813023          	sd	s0,0(sp)
    80006154:	01010413          	addi	s0,sp,16
    80006158:	00000097          	auipc	ra,0x0
    8000615c:	fc8080e7          	jalr	-56(ra) # 80006120 <_ZdlPv>
    80006160:	00813083          	ld	ra,8(sp)
    80006164:	00013403          	ld	s0,0(sp)
    80006168:	01010113          	addi	sp,sp,16
    8000616c:	00008067          	ret

0000000080006170 <_ZN9SemaphoreD0Ev>:
Semaphore::~Semaphore() {
    80006170:	ff010113          	addi	sp,sp,-16
    80006174:	00113423          	sd	ra,8(sp)
    80006178:	00813023          	sd	s0,0(sp)
    8000617c:	01010413          	addi	s0,sp,16
}
    80006180:	00000097          	auipc	ra,0x0
    80006184:	fa0080e7          	jalr	-96(ra) # 80006120 <_ZdlPv>
    80006188:	00813083          	ld	ra,8(sp)
    8000618c:	00013403          	ld	s0,0(sp)
    80006190:	01010113          	addi	sp,sp,16
    80006194:	00008067          	ret

0000000080006198 <_ZN6ThreadC1EPFvPvES0_>:
Thread::Thread(void (*body)(void *), void *arg) {
    80006198:	ff010113          	addi	sp,sp,-16
    8000619c:	00113423          	sd	ra,8(sp)
    800061a0:	00813023          	sd	s0,0(sp)
    800061a4:	01010413          	addi	s0,sp,16
    800061a8:	00007797          	auipc	a5,0x7
    800061ac:	ad878793          	addi	a5,a5,-1320 # 8000cc80 <_ZTV6Thread+0x10>
    800061b0:	00f53023          	sd	a5,0(a0)
    thread_cpp_create(&myHandle, body, arg);
    800061b4:	00850513          	addi	a0,a0,8
    800061b8:	fffff097          	auipc	ra,0xfffff
    800061bc:	80c080e7          	jalr	-2036(ra) # 800049c4 <_Z17thread_cpp_createPP3TCBPFvPvES2_>
}
    800061c0:	00813083          	ld	ra,8(sp)
    800061c4:	00013403          	ld	s0,0(sp)
    800061c8:	01010113          	addi	sp,sp,16
    800061cc:	00008067          	ret

00000000800061d0 <_ZN14PeriodicThreadC1Em>:
PeriodicThread::PeriodicThread(time_t period) : Thread(periodicThreadWrapper, (void*)new Params(this, period)) {
    800061d0:	fe010113          	addi	sp,sp,-32
    800061d4:	00113c23          	sd	ra,24(sp)
    800061d8:	00813823          	sd	s0,16(sp)
    800061dc:	00913423          	sd	s1,8(sp)
    800061e0:	01213023          	sd	s2,0(sp)
    800061e4:	02010413          	addi	s0,sp,32
    800061e8:	00050493          	mv	s1,a0
    800061ec:	00058913          	mv	s2,a1
    800061f0:	01000513          	li	a0,16
    800061f4:	00000097          	auipc	ra,0x0
    800061f8:	f04080e7          	jalr	-252(ra) # 800060f8 <_Znwm>
    800061fc:	00050613          	mv	a2,a0
    80006200:	00050663          	beqz	a0,8000620c <_ZN14PeriodicThreadC1Em+0x3c>
    Params(PeriodicThread* t, time_t p) : thread(t), period(p) {}
    80006204:	00953023          	sd	s1,0(a0)
    80006208:	01253423          	sd	s2,8(a0)
PeriodicThread::PeriodicThread(time_t period) : Thread(periodicThreadWrapper, (void*)new Params(this, period)) {
    8000620c:	00000597          	auipc	a1,0x0
    80006210:	eac58593          	addi	a1,a1,-340 # 800060b8 <_ZN14PeriodicThread21periodicThreadWrapperEPv>
    80006214:	00048513          	mv	a0,s1
    80006218:	00000097          	auipc	ra,0x0
    8000621c:	f80080e7          	jalr	-128(ra) # 80006198 <_ZN6ThreadC1EPFvPvES0_>
    80006220:	00007797          	auipc	a5,0x7
    80006224:	a3078793          	addi	a5,a5,-1488 # 8000cc50 <_ZTV14PeriodicThread+0x10>
    80006228:	00f4b023          	sd	a5,0(s1)
}
    8000622c:	01813083          	ld	ra,24(sp)
    80006230:	01013403          	ld	s0,16(sp)
    80006234:	00813483          	ld	s1,8(sp)
    80006238:	00013903          	ld	s2,0(sp)
    8000623c:	02010113          	addi	sp,sp,32
    80006240:	00008067          	ret

0000000080006244 <_ZN6Thread5startEv>:
int Thread::start() {
    80006244:	fe010113          	addi	sp,sp,-32
    80006248:	00113c23          	sd	ra,24(sp)
    8000624c:	00813823          	sd	s0,16(sp)
    80006250:	00913423          	sd	s1,8(sp)
    80006254:	02010413          	addi	s0,sp,32
    80006258:	00050493          	mv	s1,a0
    if(myHandle == nullptr)
    8000625c:	00853503          	ld	a0,8(a0)
    80006260:	02050c63          	beqz	a0,80006298 <_ZN6Thread5startEv+0x54>
    if(TCB::createStack(myHandle) == -1)
    80006264:	00001097          	auipc	ra,0x1
    80006268:	97c080e7          	jalr	-1668(ra) # 80006be0 <_ZN3TCB11createStackEPS_>
    8000626c:	fff00793          	li	a5,-1
    80006270:	00f50a63          	beq	a0,a5,80006284 <_ZN6Thread5startEv+0x40>
    TCB::start(myHandle);
    80006274:	0084b503          	ld	a0,8(s1)
    80006278:	00001097          	auipc	ra,0x1
    8000627c:	8d8080e7          	jalr	-1832(ra) # 80006b50 <_ZN3TCB5startEPS_>
    return 0;
    80006280:	00000513          	li	a0,0
}
    80006284:	01813083          	ld	ra,24(sp)
    80006288:	01013403          	ld	s0,16(sp)
    8000628c:	00813483          	ld	s1,8(sp)
    80006290:	02010113          	addi	sp,sp,32
    80006294:	00008067          	ret
        return -1;
    80006298:	fff00513          	li	a0,-1
    8000629c:	fe9ff06f          	j	80006284 <_ZN6Thread5startEv+0x40>

00000000800062a0 <_ZN6Thread8dispatchEv>:
void Thread::dispatch() {
    800062a0:	ff010113          	addi	sp,sp,-16
    800062a4:	00113423          	sd	ra,8(sp)
    800062a8:	00813023          	sd	s0,0(sp)
    800062ac:	01010413          	addi	s0,sp,16
    thread_dispatch();
    800062b0:	ffffe097          	auipc	ra,0xffffe
    800062b4:	56c080e7          	jalr	1388(ra) # 8000481c <_Z15thread_dispatchv>
}
    800062b8:	00813083          	ld	ra,8(sp)
    800062bc:	00013403          	ld	s0,0(sp)
    800062c0:	01010113          	addi	sp,sp,16
    800062c4:	00008067          	ret

00000000800062c8 <_ZN6Thread5sleepEm>:
int Thread::sleep(time_t time) {
    800062c8:	ff010113          	addi	sp,sp,-16
    800062cc:	00113423          	sd	ra,8(sp)
    800062d0:	00813023          	sd	s0,0(sp)
    800062d4:	01010413          	addi	s0,sp,16
    return time_sleep(time);
    800062d8:	ffffe097          	auipc	ra,0xffffe
    800062dc:	658080e7          	jalr	1624(ra) # 80004930 <_Z10time_sleepm>
}
    800062e0:	00813083          	ld	ra,8(sp)
    800062e4:	00013403          	ld	s0,0(sp)
    800062e8:	01010113          	addi	sp,sp,16
    800062ec:	00008067          	ret

00000000800062f0 <_ZN6ThreadC1Ev>:
Thread::Thread() {
    800062f0:	ff010113          	addi	sp,sp,-16
    800062f4:	00113423          	sd	ra,8(sp)
    800062f8:	00813023          	sd	s0,0(sp)
    800062fc:	01010413          	addi	s0,sp,16
    80006300:	00007797          	auipc	a5,0x7
    80006304:	98078793          	addi	a5,a5,-1664 # 8000cc80 <_ZTV6Thread+0x10>
    80006308:	00f53023          	sd	a5,0(a0)
    thread_cpp_create(&myHandle, threadWrapper, (void*)this);
    8000630c:	00050613          	mv	a2,a0
    80006310:	00000597          	auipc	a1,0x0
    80006314:	d5c58593          	addi	a1,a1,-676 # 8000606c <_ZN6Thread13threadWrapperEPv>
    80006318:	00850513          	addi	a0,a0,8
    8000631c:	ffffe097          	auipc	ra,0xffffe
    80006320:	6a8080e7          	jalr	1704(ra) # 800049c4 <_Z17thread_cpp_createPP3TCBPFvPvES2_>
}
    80006324:	00813083          	ld	ra,8(sp)
    80006328:	00013403          	ld	s0,0(sp)
    8000632c:	01010113          	addi	sp,sp,16
    80006330:	00008067          	ret

0000000080006334 <_ZN7Console4getcEv>:
char Console::getc() {  // TODO pcb semafor buffer za konzolu sve liste
    80006334:	ff010113          	addi	sp,sp,-16
    80006338:	00113423          	sd	ra,8(sp)
    8000633c:	00813023          	sd	s0,0(sp)
    80006340:	01010413          	addi	s0,sp,16
    return ::getc();
    80006344:	ffffe097          	auipc	ra,0xffffe
    80006348:	624080e7          	jalr	1572(ra) # 80004968 <_Z4getcv>
}
    8000634c:	00813083          	ld	ra,8(sp)
    80006350:	00013403          	ld	s0,0(sp)
    80006354:	01010113          	addi	sp,sp,16
    80006358:	00008067          	ret

000000008000635c <_ZN7Console4putcEc>:
void Console::putc(char c) {
    8000635c:	ff010113          	addi	sp,sp,-16
    80006360:	00113423          	sd	ra,8(sp)
    80006364:	00813023          	sd	s0,0(sp)
    80006368:	01010413          	addi	s0,sp,16
    ::putc(c);
    8000636c:	ffffe097          	auipc	ra,0xffffe
    80006370:	630080e7          	jalr	1584(ra) # 8000499c <_Z4putcc>
}
    80006374:	00813083          	ld	ra,8(sp)
    80006378:	00013403          	ld	s0,0(sp)
    8000637c:	01010113          	addi	sp,sp,16
    80006380:	00008067          	ret

0000000080006384 <_ZN9SemaphoreC1Ej>:
Semaphore::Semaphore(unsigned int init) {
    80006384:	ff010113          	addi	sp,sp,-16
    80006388:	00113423          	sd	ra,8(sp)
    8000638c:	00813023          	sd	s0,0(sp)
    80006390:	01010413          	addi	s0,sp,16
    80006394:	00007797          	auipc	a5,0x7
    80006398:	91478793          	addi	a5,a5,-1772 # 8000cca8 <_ZTV9Semaphore+0x10>
    8000639c:	00f53023          	sd	a5,0(a0)
    sem_open(&myHandle, init);
    800063a0:	00850513          	addi	a0,a0,8
    800063a4:	ffffe097          	auipc	ra,0xffffe
    800063a8:	49c080e7          	jalr	1180(ra) # 80004840 <_Z8sem_openPP4_semj>
}
    800063ac:	00813083          	ld	ra,8(sp)
    800063b0:	00013403          	ld	s0,0(sp)
    800063b4:	01010113          	addi	sp,sp,16
    800063b8:	00008067          	ret

00000000800063bc <_ZN9Semaphore4waitEv>:

int Semaphore::wait() {
    800063bc:	ff010113          	addi	sp,sp,-16
    800063c0:	00113423          	sd	ra,8(sp)
    800063c4:	00813023          	sd	s0,0(sp)
    800063c8:	01010413          	addi	s0,sp,16
    return sem_wait(myHandle);
    800063cc:	00853503          	ld	a0,8(a0)
    800063d0:	ffffe097          	auipc	ra,0xffffe
    800063d4:	4f0080e7          	jalr	1264(ra) # 800048c0 <_Z8sem_waitP4_sem>
}
    800063d8:	00813083          	ld	ra,8(sp)
    800063dc:	00013403          	ld	s0,0(sp)
    800063e0:	01010113          	addi	sp,sp,16
    800063e4:	00008067          	ret

00000000800063e8 <_ZN9Semaphore6signalEv>:

int Semaphore::signal() {
    800063e8:	ff010113          	addi	sp,sp,-16
    800063ec:	00113423          	sd	ra,8(sp)
    800063f0:	00813023          	sd	s0,0(sp)
    800063f4:	01010413          	addi	s0,sp,16
    return sem_signal(myHandle);
    800063f8:	00853503          	ld	a0,8(a0)
    800063fc:	ffffe097          	auipc	ra,0xffffe
    80006400:	4fc080e7          	jalr	1276(ra) # 800048f8 <_Z10sem_signalP4_sem>
}
    80006404:	00813083          	ld	ra,8(sp)
    80006408:	00013403          	ld	s0,0(sp)
    8000640c:	01010113          	addi	sp,sp,16
    80006410:	00008067          	ret

0000000080006414 <_ZN6Thread3runEv>:
        static int sleep (time_t);
        static void threadWrapper(void*);

protected:
        Thread ();
        virtual void run () {}
    80006414:	ff010113          	addi	sp,sp,-16
    80006418:	00813423          	sd	s0,8(sp)
    8000641c:	01010413          	addi	s0,sp,16
    80006420:	00813403          	ld	s0,8(sp)
    80006424:	01010113          	addi	sp,sp,16
    80006428:	00008067          	ret

000000008000642c <_ZN14PeriodicThread18periodicActivationEv>:
class PeriodicThread : public Thread {
public:

protected:
        PeriodicThread (time_t period);
        virtual void periodicActivation () {}
    8000642c:	ff010113          	addi	sp,sp,-16
    80006430:	00813423          	sd	s0,8(sp)
    80006434:	01010413          	addi	s0,sp,16
    80006438:	00813403          	ld	s0,8(sp)
    8000643c:	01010113          	addi	sp,sp,16
    80006440:	00008067          	ret

0000000080006444 <_ZN14PeriodicThreadD1Ev>:
class PeriodicThread : public Thread {
    80006444:	ff010113          	addi	sp,sp,-16
    80006448:	00813423          	sd	s0,8(sp)
    8000644c:	01010413          	addi	s0,sp,16
    80006450:	00007797          	auipc	a5,0x7
    80006454:	80078793          	addi	a5,a5,-2048 # 8000cc50 <_ZTV14PeriodicThread+0x10>
    80006458:	00f53023          	sd	a5,0(a0)
    8000645c:	00813403          	ld	s0,8(sp)
    80006460:	01010113          	addi	sp,sp,16
    80006464:	00008067          	ret

0000000080006468 <_ZN14PeriodicThreadD0Ev>:
    80006468:	ff010113          	addi	sp,sp,-16
    8000646c:	00113423          	sd	ra,8(sp)
    80006470:	00813023          	sd	s0,0(sp)
    80006474:	01010413          	addi	s0,sp,16
    80006478:	00006797          	auipc	a5,0x6
    8000647c:	7d878793          	addi	a5,a5,2008 # 8000cc50 <_ZTV14PeriodicThread+0x10>
    80006480:	00f53023          	sd	a5,0(a0)
    80006484:	00000097          	auipc	ra,0x0
    80006488:	c9c080e7          	jalr	-868(ra) # 80006120 <_ZdlPv>
    8000648c:	00813083          	ld	ra,8(sp)
    80006490:	00013403          	ld	s0,0(sp)
    80006494:	01010113          	addi	sp,sp,16
    80006498:	00008067          	ret

000000008000649c <_ZN5_slabC1EmPS_S0_PFvPvES3_>:
// Created by bogdan on 4.2.23..
//

#include "../h/_slab.hpp"

_slab::_slab(size_t slotSize, _slab *next, _slab *prev, Func ctor, Func dtor) : slotSize(slotSize), next(next), prev(prev), ctor(ctor), dtor(dtor){
    8000649c:	fe010113          	addi	sp,sp,-32
    800064a0:	00113c23          	sd	ra,24(sp)
    800064a4:	00813823          	sd	s0,16(sp)
    800064a8:	00913423          	sd	s1,8(sp)
    800064ac:	01213023          	sd	s2,0(sp)
    800064b0:	02010413          	addi	s0,sp,32
    800064b4:	00050493          	mv	s1,a0
    800064b8:	00058913          	mv	s2,a1
    800064bc:	00b53023          	sd	a1,0(a0)
    800064c0:	00c53423          	sd	a2,8(a0)
    800064c4:	00d53823          	sd	a3,16(a0)
    800064c8:	02e53023          	sd	a4,32(a0)
    800064cc:	02f53423          	sd	a5,40(a0)

    //this->numOfSlots = (slotSize < 4069) ? (4096/(int)slotSize)  : 1; // radi za drugi test
    //this->numOfSlots = 8; // radi za prvi test
    this->numOfSlots = (slotSize + (4096/slotSize) < 4069) ? (4096/(int)slotSize)  : 1; // radi za drugi test
    800064d0:	000017b7          	lui	a5,0x1
    800064d4:	02b7d733          	divu	a4,a5,a1
    800064d8:	00b70733          	add	a4,a4,a1
    800064dc:	fe478793          	addi	a5,a5,-28 # fe4 <_entry-0x7ffff01c>
    800064e0:	04e7e863          	bltu	a5,a4,80006530 <_ZN5_slabC1EmPS_S0_PFvPvES3_+0x94>
    800064e4:	000017b7          	lui	a5,0x1
    800064e8:	02b7c7bb          	divw	a5,a5,a1
    800064ec:	02f4aa23          	sw	a5,52(s1)

    //this->numOfSlots = getNumOfSlots(slotSize);
    this->numOfFreeSlots = this->numOfSlots;
    800064f0:	02f4a823          	sw	a5,48(s1)

    //this->slots = BuddyAllocator::getInstance().alloc(this->slotSize*this->numOfSlots);
    //this->index = (char*)BuddyAllocator::getInstance().alloc(this->numOfSlots*sizeof(char));

    void* mem = BuddyAllocator::getInstance().alloc(this->numOfSlots*sizeof(char) + this->numOfSlots*slotSize);
    800064f4:	fffff097          	auipc	ra,0xfffff
    800064f8:	b8c080e7          	jalr	-1140(ra) # 80005080 <_ZN14BuddyAllocator11getInstanceEv>
    800064fc:	00190913          	addi	s2,s2,1
    80006500:	0344a583          	lw	a1,52(s1)
    80006504:	02b905b3          	mul	a1,s2,a1
    80006508:	fffff097          	auipc	ra,0xfffff
    8000650c:	d18080e7          	jalr	-744(ra) # 80005220 <_ZN14BuddyAllocator5allocEm>
    this->index = (char*)mem;
    80006510:	00a4bc23          	sd	a0,24(s1)
    if(mem)
    80006514:	00050863          	beqz	a0,80006524 <_ZN5_slabC1EmPS_S0_PFvPvES3_+0x88>
        this->slots = (void*)((char*)mem + this->numOfSlots*sizeof(char));
    80006518:	0344a783          	lw	a5,52(s1)
    8000651c:	00f507b3          	add	a5,a0,a5
    80006520:	02f4bc23          	sd	a5,56(s1)

    if(mem){
    80006524:	02050663          	beqz	a0,80006550 <_ZN5_slabC1EmPS_S0_PFvPvES3_+0xb4>
        for(int i = 0;i < numOfSlots; i++)
    80006528:	00000793          	li	a5,0
    8000652c:	01c0006f          	j	80006548 <_ZN5_slabC1EmPS_S0_PFvPvES3_+0xac>
    this->numOfSlots = (slotSize + (4096/slotSize) < 4069) ? (4096/(int)slotSize)  : 1; // radi za drugi test
    80006530:	00100793          	li	a5,1
    80006534:	fb9ff06f          	j	800064ec <_ZN5_slabC1EmPS_S0_PFvPvES3_+0x50>
            index[i] = 0;
    80006538:	0184b703          	ld	a4,24(s1)
    8000653c:	00f70733          	add	a4,a4,a5
    80006540:	00070023          	sb	zero,0(a4)
        for(int i = 0;i < numOfSlots; i++)
    80006544:	0017879b          	addiw	a5,a5,1
    80006548:	0344a703          	lw	a4,52(s1)
    8000654c:	fee7c6e3          	blt	a5,a4,80006538 <_ZN5_slabC1EmPS_S0_PFvPvES3_+0x9c>
    }

}
    80006550:	01813083          	ld	ra,24(sp)
    80006554:	01013403          	ld	s0,16(sp)
    80006558:	00813483          	ld	s1,8(sp)
    8000655c:	00013903          	ld	s2,0(sp)
    80006560:	02010113          	addi	sp,sp,32
    80006564:	00008067          	ret

0000000080006568 <_ZN5_slab9getObjectEv>:

void *_slab::getObject() {
    80006568:	fe010113          	addi	sp,sp,-32
    8000656c:	00113c23          	sd	ra,24(sp)
    80006570:	00813823          	sd	s0,16(sp)
    80006574:	00913423          	sd	s1,8(sp)
    80006578:	02010413          	addi	s0,sp,32

    if(numOfSlots == 0)
    8000657c:	03452783          	lw	a5,52(a0)
    80006580:	06078c63          	beqz	a5,800065f8 <_ZN5_slab9getObjectEv+0x90>
        return nullptr;

    int free = 0;

    if(!index || !slots)
    80006584:	01853483          	ld	s1,24(a0)
    80006588:	04048c63          	beqz	s1,800065e0 <_ZN5_slab9getObjectEv+0x78>
    8000658c:	03853803          	ld	a6,56(a0)
    80006590:	06080863          	beqz	a6,80006600 <_ZN5_slab9getObjectEv+0x98>
    int free = 0;
    80006594:	00000793          	li	a5,0
    80006598:	0080006f          	j	800065a0 <_ZN5_slab9getObjectEv+0x38>
        return nullptr;

    while(index[free] == 1)
        free++;
    8000659c:	0017879b          	addiw	a5,a5,1
    while(index[free] == 1)
    800065a0:	00f48733          	add	a4,s1,a5
    800065a4:	00074603          	lbu	a2,0(a4)
    800065a8:	00100693          	li	a3,1
    800065ac:	fed608e3          	beq	a2,a3,8000659c <_ZN5_slab9getObjectEv+0x34>

    void* obj = (void*) ((char*)slots + free*slotSize);
    800065b0:	00053483          	ld	s1,0(a0)
    800065b4:	029784b3          	mul	s1,a5,s1
    800065b8:	009804b3          	add	s1,a6,s1

    index[free] = 1;
    800065bc:	00100793          	li	a5,1
    800065c0:	00f70023          	sb	a5,0(a4)
    numOfFreeSlots--;
    800065c4:	03052783          	lw	a5,48(a0)
    800065c8:	fff7879b          	addiw	a5,a5,-1
    800065cc:	02f52823          	sw	a5,48(a0)

    if(ctor)
    800065d0:	02053783          	ld	a5,32(a0)
    800065d4:	00078663          	beqz	a5,800065e0 <_ZN5_slab9getObjectEv+0x78>
        ctor(obj);
    800065d8:	00048513          	mv	a0,s1
    800065dc:	000780e7          	jalr	a5 # 1000 <_entry-0x7ffff000>

    return obj;
}
    800065e0:	00048513          	mv	a0,s1
    800065e4:	01813083          	ld	ra,24(sp)
    800065e8:	01013403          	ld	s0,16(sp)
    800065ec:	00813483          	ld	s1,8(sp)
    800065f0:	02010113          	addi	sp,sp,32
    800065f4:	00008067          	ret
        return nullptr;
    800065f8:	00000493          	li	s1,0
    800065fc:	fe5ff06f          	j	800065e0 <_ZN5_slab9getObjectEv+0x78>
        return nullptr;
    80006600:	00080493          	mv	s1,a6
    80006604:	fddff06f          	j	800065e0 <_ZN5_slab9getObjectEv+0x78>

0000000080006608 <_ZN5_slab10freeObjectEPv>:

int _slab::freeObject(void *addr) {
    80006608:	ff010113          	addi	sp,sp,-16
    8000660c:	00813423          	sd	s0,8(sp)
    80006610:	01010413          	addi	s0,sp,16
    if (addr == nullptr || (char*)addr < (char*)slots || (char*)addr > (char*)slots + numOfSlots*slotSize)
    80006614:	04058a63          	beqz	a1,80006668 <_ZN5_slab10freeObjectEPv+0x60>
    80006618:	03853703          	ld	a4,56(a0)
    8000661c:	04e5ea63          	bltu	a1,a4,80006670 <_ZN5_slab10freeObjectEPv+0x68>
    80006620:	03452783          	lw	a5,52(a0)
    80006624:	00053683          	ld	a3,0(a0)
    80006628:	02d787b3          	mul	a5,a5,a3
    8000662c:	00f707b3          	add	a5,a4,a5
    80006630:	04b7e463          	bltu	a5,a1,80006678 <_ZN5_slab10freeObjectEPv+0x70>
        return -1; // Exception wrong address

    int entry = ((char*)addr - (char*)slots) / slotSize;
    80006634:	40e585b3          	sub	a1,a1,a4
    80006638:	02d5d5b3          	divu	a1,a1,a3
    8000663c:	0005859b          	sext.w	a1,a1
    index[entry] = 0;
    80006640:	01853783          	ld	a5,24(a0)
    80006644:	00b785b3          	add	a1,a5,a1
    80006648:	00058023          	sb	zero,0(a1)
    numOfFreeSlots++;
    8000664c:	03052783          	lw	a5,48(a0)
    80006650:	0017879b          	addiw	a5,a5,1
    80006654:	02f52823          	sw	a5,48(a0)
    return 0;
    80006658:	00000513          	li	a0,0
}
    8000665c:	00813403          	ld	s0,8(sp)
    80006660:	01010113          	addi	sp,sp,16
    80006664:	00008067          	ret
        return -1; // Exception wrong address
    80006668:	fff00513          	li	a0,-1
    8000666c:	ff1ff06f          	j	8000665c <_ZN5_slab10freeObjectEPv+0x54>
    80006670:	fff00513          	li	a0,-1
    80006674:	fe9ff06f          	j	8000665c <_ZN5_slab10freeObjectEPv+0x54>
    80006678:	fff00513          	li	a0,-1
    8000667c:	fe1ff06f          	j	8000665c <_ZN5_slab10freeObjectEPv+0x54>

0000000080006680 <_ZN5_slabnwEm>:

void *_slab::operator new(size_t s) {
    80006680:	fe010113          	addi	sp,sp,-32
    80006684:	00113c23          	sd	ra,24(sp)
    80006688:	00813823          	sd	s0,16(sp)
    8000668c:	00913423          	sd	s1,8(sp)
    80006690:	02010413          	addi	s0,sp,32
    80006694:	00050493          	mv	s1,a0
    return BuddyAllocator::getInstance().alloc(s);
    80006698:	fffff097          	auipc	ra,0xfffff
    8000669c:	9e8080e7          	jalr	-1560(ra) # 80005080 <_ZN14BuddyAllocator11getInstanceEv>
    800066a0:	00048593          	mv	a1,s1
    800066a4:	fffff097          	auipc	ra,0xfffff
    800066a8:	b7c080e7          	jalr	-1156(ra) # 80005220 <_ZN14BuddyAllocator5allocEm>
    //return mem_alloc(s);
}
    800066ac:	01813083          	ld	ra,24(sp)
    800066b0:	01013403          	ld	s0,16(sp)
    800066b4:	00813483          	ld	s1,8(sp)
    800066b8:	02010113          	addi	sp,sp,32
    800066bc:	00008067          	ret

00000000800066c0 <_ZN5_slabdlEPv>:

void _slab::operator delete(void *p) {
    800066c0:	fe010113          	addi	sp,sp,-32
    800066c4:	00113c23          	sd	ra,24(sp)
    800066c8:	00813823          	sd	s0,16(sp)
    800066cc:	00913423          	sd	s1,8(sp)
    800066d0:	02010413          	addi	s0,sp,32
    800066d4:	00050493          	mv	s1,a0
    BuddyAllocator::getInstance().dealloc(p, sizeof(_slab));
    800066d8:	fffff097          	auipc	ra,0xfffff
    800066dc:	9a8080e7          	jalr	-1624(ra) # 80005080 <_ZN14BuddyAllocator11getInstanceEv>
    800066e0:	04000613          	li	a2,64
    800066e4:	00048593          	mv	a1,s1
    800066e8:	fffff097          	auipc	ra,0xfffff
    800066ec:	c48080e7          	jalr	-952(ra) # 80005330 <_ZN14BuddyAllocator7deallocEPvm>
    //mem_free(p);
}
    800066f0:	01813083          	ld	ra,24(sp)
    800066f4:	01013403          	ld	s0,16(sp)
    800066f8:	00813483          	ld	s1,8(sp)
    800066fc:	02010113          	addi	sp,sp,32
    80006700:	00008067          	ret

0000000080006704 <_ZNK5_slab6isFullEv>:

bool _slab::isFull() const {
    80006704:	ff010113          	addi	sp,sp,-16
    80006708:	00813423          	sd	s0,8(sp)
    8000670c:	01010413          	addi	s0,sp,16
    return numOfFreeSlots == 0;
    80006710:	03052503          	lw	a0,48(a0)
}
    80006714:	00153513          	seqz	a0,a0
    80006718:	00813403          	ld	s0,8(sp)
    8000671c:	01010113          	addi	sp,sp,16
    80006720:	00008067          	ret

0000000080006724 <_ZN5_slabD1Ev>:

_slab::~_slab() {
    80006724:	fe010113          	addi	sp,sp,-32
    80006728:	00113c23          	sd	ra,24(sp)
    8000672c:	00813823          	sd	s0,16(sp)
    80006730:	00913423          	sd	s1,8(sp)
    80006734:	01213023          	sd	s2,0(sp)
    80006738:	02010413          	addi	s0,sp,32
    8000673c:	00050493          	mv	s1,a0


    if(dtor){ // call destructor of objects
    80006740:	02853783          	ld	a5,40(a0)
    80006744:	02078863          	beqz	a5,80006774 <_ZN5_slabD1Ev+0x50>
        for(int i = 0;i < numOfSlots; i++){
    80006748:	00000913          	li	s2,0
    8000674c:	0200006f          	j	8000676c <_ZN5_slabD1Ev+0x48>
            void* obj = (void*)((char*)slots + i*slotSize);
    80006750:	0384b503          	ld	a0,56(s1)
    80006754:	0004b783          	ld	a5,0(s1)
    80006758:	02f907b3          	mul	a5,s2,a5
            dtor(obj);
    8000675c:	0284b703          	ld	a4,40(s1)
    80006760:	00f50533          	add	a0,a0,a5
    80006764:	000700e7          	jalr	a4
        for(int i = 0;i < numOfSlots; i++){
    80006768:	0019091b          	addiw	s2,s2,1
    8000676c:	0344a783          	lw	a5,52(s1)
    80006770:	fef940e3          	blt	s2,a5,80006750 <_ZN5_slabD1Ev+0x2c>
    //BuddyAllocator::getInstance().dealloc(slots, size);

    //size = sizeof(int)*this->numOfSlots;
    //BuddyAllocator::getInstance().dealloc((void*)index, size);

    BuddyAllocator::getInstance().dealloc((void*)index, this->numOfSlots*sizeof(char) + this->numOfSlots*slotSize);
    80006774:	fffff097          	auipc	ra,0xfffff
    80006778:	90c080e7          	jalr	-1780(ra) # 80005080 <_ZN14BuddyAllocator11getInstanceEv>
    8000677c:	0004b783          	ld	a5,0(s1)
    80006780:	00178793          	addi	a5,a5,1
    80006784:	0344a603          	lw	a2,52(s1)
    80006788:	02c78633          	mul	a2,a5,a2
    8000678c:	0184b583          	ld	a1,24(s1)
    80006790:	fffff097          	auipc	ra,0xfffff
    80006794:	ba0080e7          	jalr	-1120(ra) # 80005330 <_ZN14BuddyAllocator7deallocEPvm>
    slots = nullptr;
    index = nullptr;

}
    80006798:	01813083          	ld	ra,24(sp)
    8000679c:	01013403          	ld	s0,16(sp)
    800067a0:	00813483          	ld	s1,8(sp)
    800067a4:	00013903          	ld	s2,0(sp)
    800067a8:	02010113          	addi	sp,sp,32
    800067ac:	00008067          	ret

00000000800067b0 <_ZN5_slab13getNumOfSlotsEm>:

int _slab::getNumOfSlots(size_t size) {
    800067b0:	fe010113          	addi	sp,sp,-32
    800067b4:	00113c23          	sd	ra,24(sp)
    800067b8:	00813823          	sd	s0,16(sp)
    800067bc:	00913423          	sd	s1,8(sp)
    800067c0:	02010413          	addi	s0,sp,32
    800067c4:	00050493          	mv	s1,a0

    if(size + (4096/size) < 4069){
    800067c8:	000017b7          	lui	a5,0x1
    800067cc:	02a7d733          	divu	a4,a5,a0
    800067d0:	00a70733          	add	a4,a4,a0
    800067d4:	fe478793          	addi	a5,a5,-28 # fe4 <_entry-0x7ffff01c>
    800067d8:	02e7e063          	bltu	a5,a4,800067f8 <_ZN5_slab13getNumOfSlotsEm+0x48>
        return 4096 / (int)size;
    800067dc:	00001537          	lui	a0,0x1
    800067e0:	0295453b          	divw	a0,a0,s1
            j = i / (int)size;
        }
    }
    return j;

}
    800067e4:	01813083          	ld	ra,24(sp)
    800067e8:	01013403          	ld	s0,16(sp)
    800067ec:	00813483          	ld	s1,8(sp)
    800067f0:	02010113          	addi	sp,sp,32
    800067f4:	00008067          	ret
    for(int i = (int)BuddyAllocator::roundToPow2(size); i <= 1<<15;i++){
    800067f8:	fffff097          	auipc	ra,0xfffff
    800067fc:	9b8080e7          	jalr	-1608(ra) # 800051b0 <_ZN14BuddyAllocator11roundToPow2Em>
    80006800:	0005079b          	sext.w	a5,a0
    int j = 1;
    80006804:	00100513          	li	a0,1
    size_t minFragment = 1 << 25;
    80006808:	020006b7          	lui	a3,0x2000
    8000680c:	0080006f          	j	80006814 <_ZN5_slab13getNumOfSlotsEm+0x64>
    for(int i = (int)BuddyAllocator::roundToPow2(size); i <= 1<<15;i++){
    80006810:	0017879b          	addiw	a5,a5,1
    80006814:	00008737          	lui	a4,0x8
    80006818:	fcf746e3          	blt	a4,a5,800067e4 <_ZN5_slab13getNumOfSlotsEm+0x34>
        size_t fragment = i % size;
    8000681c:	0297f733          	remu	a4,a5,s1
        if(fragment < minFragment){
    80006820:	fed778e3          	bgeu	a4,a3,80006810 <_ZN5_slab13getNumOfSlotsEm+0x60>
            j = i / (int)size;
    80006824:	0297c53b          	divw	a0,a5,s1
            minFragment = fragment;
    80006828:	00070693          	mv	a3,a4
    8000682c:	fe5ff06f          	j	80006810 <_ZN5_slab13getNumOfSlotsEm+0x60>

0000000080006830 <_Z41__static_initialization_and_destruction_0ii>:
    while(t){
        TCB* old = t;
        t = threads.removeFirst();
        delete old;
    }
}
    80006830:	ff010113          	addi	sp,sp,-16
    80006834:	00813423          	sd	s0,8(sp)
    80006838:	01010413          	addi	s0,sp,16
    8000683c:	00100793          	li	a5,1
    80006840:	00f50863          	beq	a0,a5,80006850 <_Z41__static_initialization_and_destruction_0ii+0x20>
    80006844:	00813403          	ld	s0,8(sp)
    80006848:	01010113          	addi	sp,sp,16
    8000684c:	00008067          	ret
    80006850:	000107b7          	lui	a5,0x10
    80006854:	fff78793          	addi	a5,a5,-1 # ffff <_entry-0x7fff0001>
    80006858:	fef596e3          	bne	a1,a5,80006844 <_Z41__static_initialization_and_destruction_0ii+0x14>
    8000685c:	0000d797          	auipc	a5,0xd
    80006860:	81c78793          	addi	a5,a5,-2020 # 80013078 <_ZN3TCB7threadsE>
    80006864:	0007b023          	sd	zero,0(a5)
    80006868:	0007b423          	sd	zero,8(a5)
    8000686c:	0007b823          	sd	zero,16(a5)
    80006870:	fd5ff06f          	j	80006844 <_Z41__static_initialization_and_destruction_0ii+0x14>

0000000080006874 <_ZN3TCB5yieldEv>:
void TCB::yield() {
    80006874:	ff010113          	addi	sp,sp,-16
    80006878:	00813423          	sd	s0,8(sp)
    8000687c:	01010413          	addi	s0,sp,16
    __asm__ volatile("mv a0, %[var]" : : [var] "r"(THREAD_YIELD));
    80006880:	01400793          	li	a5,20
    80006884:	00078513          	mv	a0,a5
    __asm__ volatile("ecall");
    80006888:	00000073          	ecall
}
    8000688c:	00813403          	ld	s0,8(sp)
    80006890:	01010113          	addi	sp,sp,16
    80006894:	00008067          	ret

0000000080006898 <_ZN3TCB13threadWrapperEv>:
void TCB::threadWrapper(){
    80006898:	fe010113          	addi	sp,sp,-32
    8000689c:	00113c23          	sd	ra,24(sp)
    800068a0:	00813823          	sd	s0,16(sp)
    800068a4:	00913423          	sd	s1,8(sp)
    800068a8:	02010413          	addi	s0,sp,32
    Riscv::popSppSpie();
    800068ac:	ffffd097          	auipc	ra,0xffffd
    800068b0:	b48080e7          	jalr	-1208(ra) # 800033f4 <_ZN5Riscv10popSppSpieEv>
    running->body(running->args);
    800068b4:	0000c497          	auipc	s1,0xc
    800068b8:	7c448493          	addi	s1,s1,1988 # 80013078 <_ZN3TCB7threadsE>
    800068bc:	0184b783          	ld	a5,24(s1)
    800068c0:	0087b703          	ld	a4,8(a5)
    800068c4:	0107b503          	ld	a0,16(a5)
    800068c8:	000700e7          	jalr	a4 # 8000 <_entry-0x7fff8000>
    running->setStatus(FINISHED);
    800068cc:	0184b483          	ld	s1,24(s1)
    void setStatus(threadStatus status) { this->status = status; }
    800068d0:	0204ac23          	sw	zero,56(s1)
            void* addr = SlabAllocator::getInstance().allocKernel(size, SlabAllocator::LISTELEM);
    800068d4:	ffffe097          	auipc	ra,0xffffe
    800068d8:	1f4080e7          	jalr	500(ra) # 80004ac8 <_ZN13SlabAllocator11getInstanceEv>
    800068dc:	00200613          	li	a2,2
    800068e0:	01000593          	li	a1,16
    800068e4:	ffffe097          	auipc	ra,0xffffe
    800068e8:	570080e7          	jalr	1392(ra) # 80004e54 <_ZN13SlabAllocator11allocKernelEmNS_16kernelCacheEntryE>
        Elem *elem = new Elem(data, 0);
    800068ec:	00050663          	beqz	a0,800068f8 <_ZN3TCB13threadWrapperEv+0x60>
        Elem(T *data, Elem *next) : data(data), next(next) {}
    800068f0:	00953023          	sd	s1,0(a0) # 1000 <_entry-0x7ffff000>
    800068f4:	00053423          	sd	zero,8(a0)
        if(!elem)
    800068f8:	00050e63          	beqz	a0,80006914 <_ZN3TCB13threadWrapperEv+0x7c>
        if (tail){
    800068fc:	0000c797          	auipc	a5,0xc
    80006900:	7847b783          	ld	a5,1924(a5) # 80013080 <_ZN3TCB7threadsE+0x8>
    80006904:	02078663          	beqz	a5,80006930 <_ZN3TCB13threadWrapperEv+0x98>
            tail->next = elem;
    80006908:	00a7b423          	sd	a0,8(a5)
            tail = elem;
    8000690c:	0000c797          	auipc	a5,0xc
    80006910:	76a7ba23          	sd	a0,1908(a5) # 80013080 <_ZN3TCB7threadsE+0x8>
    TCB::yield();
    80006914:	00000097          	auipc	ra,0x0
    80006918:	f60080e7          	jalr	-160(ra) # 80006874 <_ZN3TCB5yieldEv>
}
    8000691c:	01813083          	ld	ra,24(sp)
    80006920:	01013403          	ld	s0,16(sp)
    80006924:	00813483          	ld	s1,8(sp)
    80006928:	02010113          	addi	sp,sp,32
    8000692c:	00008067          	ret
            head = tail = elem;
    80006930:	0000c797          	auipc	a5,0xc
    80006934:	74878793          	addi	a5,a5,1864 # 80013078 <_ZN3TCB7threadsE>
    80006938:	00a7b423          	sd	a0,8(a5)
    8000693c:	00a7b023          	sd	a0,0(a5)
    80006940:	fd5ff06f          	j	80006914 <_ZN3TCB13threadWrapperEv+0x7c>

0000000080006944 <_ZN3TCB8dispatchEv>:
void TCB::dispatch(){
    80006944:	fe010113          	addi	sp,sp,-32
    80006948:	00113c23          	sd	ra,24(sp)
    8000694c:	00813823          	sd	s0,16(sp)
    80006950:	00913423          	sd	s1,8(sp)
    80006954:	02010413          	addi	s0,sp,32
    TCB* old = running;
    80006958:	0000c497          	auipc	s1,0xc
    8000695c:	7384b483          	ld	s1,1848(s1) # 80013090 <_ZN3TCB7runningE>
    threadStatus getStatus() const { return status; }
    80006960:	0384a703          	lw	a4,56(s1)
    if(old->getStatus() == RUNNING) {
    80006964:	00100793          	li	a5,1
    80006968:	02f70663          	beq	a4,a5,80006994 <_ZN3TCB8dispatchEv+0x50>
    while((running = Scheduler::get()) == nullptr){ // If some nullptr in scheduler
    8000696c:	ffffd097          	auipc	ra,0xffffd
    80006970:	94c080e7          	jalr	-1716(ra) # 800032b8 <_ZN9Scheduler3getEv>
    80006974:	0000c797          	auipc	a5,0xc
    80006978:	70a7be23          	sd	a0,1820(a5) # 80013090 <_ZN3TCB7runningE>
    8000697c:	02051463          	bnez	a0,800069a4 <_ZN3TCB8dispatchEv+0x60>
        running = Scheduler::get();
    80006980:	ffffd097          	auipc	ra,0xffffd
    80006984:	938080e7          	jalr	-1736(ra) # 800032b8 <_ZN9Scheduler3getEv>
    80006988:	0000c797          	auipc	a5,0xc
    8000698c:	70a7b423          	sd	a0,1800(a5) # 80013090 <_ZN3TCB7runningE>
    while((running = Scheduler::get()) == nullptr){ // If some nullptr in scheduler
    80006990:	fddff06f          	j	8000696c <_ZN3TCB8dispatchEv+0x28>
        Scheduler::put(old);
    80006994:	00048513          	mv	a0,s1
    80006998:	ffffd097          	auipc	ra,0xffffd
    8000699c:	9a0080e7          	jalr	-1632(ra) # 80003338 <_ZN9Scheduler3putEP3TCB>
    800069a0:	fcdff06f          	j	8000696c <_ZN3TCB8dispatchEv+0x28>
    TCB::contextSwitch(&old->context, &running->context);
    800069a4:	02050593          	addi	a1,a0,32
    800069a8:	02048513          	addi	a0,s1,32
    800069ac:	ffffa097          	auipc	ra,0xffffa
    800069b0:	674080e7          	jalr	1652(ra) # 80001020 <_ZN3TCB13contextSwitchEPNS_7ContextES1_>
}
    800069b4:	01813083          	ld	ra,24(sp)
    800069b8:	01013403          	ld	s0,16(sp)
    800069bc:	00813483          	ld	s1,8(sp)
    800069c0:	02010113          	addi	sp,sp,32
    800069c4:	00008067          	ret

00000000800069c8 <_ZN3TCB5inputEPv>:
void TCB::input(void* arg){
    800069c8:	fe010113          	addi	sp,sp,-32
    800069cc:	00113c23          	sd	ra,24(sp)
    800069d0:	00813823          	sd	s0,16(sp)
    800069d4:	00913423          	sd	s1,8(sp)
    800069d8:	02010413          	addi	s0,sp,32
    800069dc:	00c0006f          	j	800069e8 <_ZN3TCB5inputEPv+0x20>
        dispatch();
    800069e0:	00000097          	auipc	ra,0x0
    800069e4:	f64080e7          	jalr	-156(ra) # 80006944 <_ZN3TCB8dispatchEv>
    __asm__ volatile ("csrc sstatus, %[mask]" : : [mask] "r"(mask));
    800069e8:	00200793          	li	a5,2
    800069ec:	1007b073          	csrc	sstatus,a5
        char status = *((char *)CONSOLE_STATUS);
    800069f0:	00006797          	auipc	a5,0x6
    800069f4:	2d87b783          	ld	a5,728(a5) # 8000ccc8 <_GLOBAL_OFFSET_TABLE_+0x10>
    800069f8:	0007b483          	ld	s1,0(a5)
    800069fc:	0004c783          	lbu	a5,0(s1)
        while (status & CONSOLE_RX_STATUS_BIT) {
    80006a00:	0017f793          	andi	a5,a5,1
    80006a04:	fc078ee3          	beqz	a5,800069e0 <_ZN3TCB5inputEPv+0x18>
            c = (*(char*) CONSOLE_RX_DATA);
    80006a08:	00006797          	auipc	a5,0x6
    80006a0c:	2b87b783          	ld	a5,696(a5) # 8000ccc0 <_GLOBAL_OFFSET_TABLE_+0x8>
    80006a10:	0007b783          	ld	a5,0(a5)
            Riscv::inputBuffer->put(c);
    80006a14:	0007c583          	lbu	a1,0(a5)
    80006a18:	00006797          	auipc	a5,0x6
    80006a1c:	3207b783          	ld	a5,800(a5) # 8000cd38 <_GLOBAL_OFFSET_TABLE_+0x80>
    80006a20:	0007b503          	ld	a0,0(a5)
    80006a24:	ffffd097          	auipc	ra,0xffffd
    80006a28:	138080e7          	jalr	312(ra) # 80003b5c <_ZN7_buffer3putEc>
            status = *((char*)CONSOLE_STATUS);
    80006a2c:	0004c783          	lbu	a5,0(s1)
        while (status & CONSOLE_RX_STATUS_BIT) {
    80006a30:	fd1ff06f          	j	80006a00 <_ZN3TCB5inputEPv+0x38>

0000000080006a34 <_ZN3TCB6outputEPv>:
void TCB::output(void* arg) {
    80006a34:	fe010113          	addi	sp,sp,-32
    80006a38:	00113c23          	sd	ra,24(sp)
    80006a3c:	00813823          	sd	s0,16(sp)
    80006a40:	00913423          	sd	s1,8(sp)
    80006a44:	02010413          	addi	s0,sp,32
    80006a48:	00c0006f          	j	80006a54 <_ZN3TCB6outputEPv+0x20>
        dispatch();
    80006a4c:	00000097          	auipc	ra,0x0
    80006a50:	ef8080e7          	jalr	-264(ra) # 80006944 <_ZN3TCB8dispatchEv>
    80006a54:	00200793          	li	a5,2
    80006a58:	1007b073          	csrc	sstatus,a5
        char status = *((char *) CONSOLE_STATUS);
    80006a5c:	00006797          	auipc	a5,0x6
    80006a60:	26c7b783          	ld	a5,620(a5) # 8000ccc8 <_GLOBAL_OFFSET_TABLE_+0x10>
    80006a64:	0007b483          	ld	s1,0(a5)
    80006a68:	0004c783          	lbu	a5,0(s1)
        while (status & CONSOLE_TX_STATUS_BIT) {
    80006a6c:	0207f793          	andi	a5,a5,32
    80006a70:	fc078ee3          	beqz	a5,80006a4c <_ZN3TCB6outputEPv+0x18>
            c = Riscv::outputBuffer->get();
    80006a74:	00006797          	auipc	a5,0x6
    80006a78:	2a47b783          	ld	a5,676(a5) # 8000cd18 <_GLOBAL_OFFSET_TABLE_+0x60>
    80006a7c:	0007b503          	ld	a0,0(a5)
    80006a80:	ffffd097          	auipc	ra,0xffffd
    80006a84:	168080e7          	jalr	360(ra) # 80003be8 <_ZN7_buffer3getEv>
            (*(char*) CONSOLE_TX_DATA) = c;
    80006a88:	00006797          	auipc	a5,0x6
    80006a8c:	2707b783          	ld	a5,624(a5) # 8000ccf8 <_GLOBAL_OFFSET_TABLE_+0x40>
    80006a90:	0007b783          	ld	a5,0(a5)
    80006a94:	00a78023          	sb	a0,0(a5)
            status = *((char*)CONSOLE_STATUS);
    80006a98:	0004c783          	lbu	a5,0(s1)
        while (status & CONSOLE_TX_STATUS_BIT) {
    80006a9c:	fd1ff06f          	j	80006a6c <_ZN3TCB6outputEPv+0x38>

0000000080006aa0 <_ZN3TCB10stopThreadEv>:
int TCB::stopThread() {
    80006aa0:	fe010113          	addi	sp,sp,-32
    80006aa4:	00113c23          	sd	ra,24(sp)
    80006aa8:	00813823          	sd	s0,16(sp)
    80006aac:	00913423          	sd	s1,8(sp)
    80006ab0:	02010413          	addi	s0,sp,32
    running->setStatus(FINISHED);
    80006ab4:	0000c497          	auipc	s1,0xc
    80006ab8:	5dc4b483          	ld	s1,1500(s1) # 80013090 <_ZN3TCB7runningE>
    void setStatus(threadStatus status) { this->status = status; }
    80006abc:	0204ac23          	sw	zero,56(s1)
            void* addr = SlabAllocator::getInstance().allocKernel(size, SlabAllocator::LISTELEM);
    80006ac0:	ffffe097          	auipc	ra,0xffffe
    80006ac4:	008080e7          	jalr	8(ra) # 80004ac8 <_ZN13SlabAllocator11getInstanceEv>
    80006ac8:	00200613          	li	a2,2
    80006acc:	01000593          	li	a1,16
    80006ad0:	ffffe097          	auipc	ra,0xffffe
    80006ad4:	384080e7          	jalr	900(ra) # 80004e54 <_ZN13SlabAllocator11allocKernelEmNS_16kernelCacheEntryE>
        Elem *elem = new Elem(data, 0);
    80006ad8:	00050663          	beqz	a0,80006ae4 <_ZN3TCB10stopThreadEv+0x44>
        Elem(T *data, Elem *next) : data(data), next(next) {}
    80006adc:	00953023          	sd	s1,0(a0)
    80006ae0:	00053423          	sd	zero,8(a0)
        if(!elem)
    80006ae4:	00050e63          	beqz	a0,80006b00 <_ZN3TCB10stopThreadEv+0x60>
        if (tail){
    80006ae8:	0000c797          	auipc	a5,0xc
    80006aec:	5987b783          	ld	a5,1432(a5) # 80013080 <_ZN3TCB7threadsE+0x8>
    80006af0:	02078863          	beqz	a5,80006b20 <_ZN3TCB10stopThreadEv+0x80>
            tail->next = elem;
    80006af4:	00a7b423          	sd	a0,8(a5)
            tail = elem;
    80006af8:	0000c797          	auipc	a5,0xc
    80006afc:	58a7b423          	sd	a0,1416(a5) # 80013080 <_ZN3TCB7threadsE+0x8>
    TCB::dispatch();
    80006b00:	00000097          	auipc	ra,0x0
    80006b04:	e44080e7          	jalr	-444(ra) # 80006944 <_ZN3TCB8dispatchEv>
}
    80006b08:	00000513          	li	a0,0
    80006b0c:	01813083          	ld	ra,24(sp)
    80006b10:	01013403          	ld	s0,16(sp)
    80006b14:	00813483          	ld	s1,8(sp)
    80006b18:	02010113          	addi	sp,sp,32
    80006b1c:	00008067          	ret
            head = tail = elem;
    80006b20:	0000c797          	auipc	a5,0xc
    80006b24:	55878793          	addi	a5,a5,1368 # 80013078 <_ZN3TCB7threadsE>
    80006b28:	00a7b423          	sd	a0,8(a5)
    80006b2c:	00a7b023          	sd	a0,0(a5)
    80006b30:	fd1ff06f          	j	80006b00 <_ZN3TCB10stopThreadEv+0x60>

0000000080006b34 <_ZN3TCB4idleEPv>:
void TCB::idle(void* arg){
    80006b34:	ff010113          	addi	sp,sp,-16
    80006b38:	00113423          	sd	ra,8(sp)
    80006b3c:	00813023          	sd	s0,0(sp)
    80006b40:	01010413          	addi	s0,sp,16
        thread_dispatch();
    80006b44:	ffffe097          	auipc	ra,0xffffe
    80006b48:	cd8080e7          	jalr	-808(ra) # 8000481c <_Z15thread_dispatchv>
     while(true){
    80006b4c:	ff9ff06f          	j	80006b44 <_ZN3TCB4idleEPv+0x10>

0000000080006b50 <_ZN3TCB5startEPS_>:
    if(pid == nullptr)
    80006b50:	04050063          	beqz	a0,80006b90 <_ZN3TCB5startEPS_+0x40>
    if(pid->stack == nullptr)
    80006b54:	01853783          	ld	a5,24(a0)
    80006b58:	04078063          	beqz	a5,80006b98 <_ZN3TCB5startEPS_+0x48>
int TCB::start(thread_t pid){
    80006b5c:	ff010113          	addi	sp,sp,-16
    80006b60:	00113423          	sd	ra,8(sp)
    80006b64:	00813023          	sd	s0,0(sp)
    80006b68:	01010413          	addi	s0,sp,16
    80006b6c:	00100793          	li	a5,1
    80006b70:	02f52c23          	sw	a5,56(a0)
    Scheduler::put(pid);
    80006b74:	ffffc097          	auipc	ra,0xffffc
    80006b78:	7c4080e7          	jalr	1988(ra) # 80003338 <_ZN9Scheduler3putEP3TCB>
    return 1;
    80006b7c:	00100513          	li	a0,1
}
    80006b80:	00813083          	ld	ra,8(sp)
    80006b84:	00013403          	ld	s0,0(sp)
    80006b88:	01010113          	addi	sp,sp,16
    80006b8c:	00008067          	ret
        return -1;
    80006b90:	fff00513          	li	a0,-1
    80006b94:	00008067          	ret
        return -1;
    80006b98:	fff00513          	li	a0,-1
}
    80006b9c:	00008067          	ret

0000000080006ba0 <_ZN3TCB11mainWrapperEPv>:
void TCB::mainWrapper(void* sem) {
    80006ba0:	fe010113          	addi	sp,sp,-32
    80006ba4:	00113c23          	sd	ra,24(sp)
    80006ba8:	00813823          	sd	s0,16(sp)
    80006bac:	00913423          	sd	s1,8(sp)
    80006bb0:	02010413          	addi	s0,sp,32
    80006bb4:	00050493          	mv	s1,a0
    userMain();
    80006bb8:	ffffc097          	auipc	ra,0xffffc
    80006bbc:	080080e7          	jalr	128(ra) # 80002c38 <_Z8userMainv>
    sem_signal((sem_t)sem);
    80006bc0:	00048513          	mv	a0,s1
    80006bc4:	ffffe097          	auipc	ra,0xffffe
    80006bc8:	d34080e7          	jalr	-716(ra) # 800048f8 <_Z10sem_signalP4_sem>
}
    80006bcc:	01813083          	ld	ra,24(sp)
    80006bd0:	01013403          	ld	s0,16(sp)
    80006bd4:	00813483          	ld	s1,8(sp)
    80006bd8:	02010113          	addi	sp,sp,32
    80006bdc:	00008067          	ret

0000000080006be0 <_ZN3TCB11createStackEPS_>:
    if(pid == nullptr){
    80006be0:	06050663          	beqz	a0,80006c4c <_ZN3TCB11createStackEPS_+0x6c>
int TCB::createStack(thread_t pid) {
    80006be4:	fe010113          	addi	sp,sp,-32
    80006be8:	00113c23          	sd	ra,24(sp)
    80006bec:	00813823          	sd	s0,16(sp)
    80006bf0:	00913423          	sd	s1,8(sp)
    80006bf4:	02010413          	addi	s0,sp,32
    80006bf8:	00050493          	mv	s1,a0
    pid->stack =  (uint64*)SlabAllocator::getInstance().allocKernel(DEFAULT_STACK_SIZE, SlabAllocator::STACK);
    80006bfc:	ffffe097          	auipc	ra,0xffffe
    80006c00:	ecc080e7          	jalr	-308(ra) # 80004ac8 <_ZN13SlabAllocator11getInstanceEv>
    80006c04:	00400613          	li	a2,4
    80006c08:	000015b7          	lui	a1,0x1
    80006c0c:	ffffe097          	auipc	ra,0xffffe
    80006c10:	248080e7          	jalr	584(ra) # 80004e54 <_ZN13SlabAllocator11allocKernelEmNS_16kernelCacheEntryE>
    80006c14:	00a4bc23          	sd	a0,24(s1)
    pid->context.ra  = pid->stack != nullptr ? (uint64)&pid->stack[DEFAULT_STACK_SIZE] : 0;
    80006c18:	02050663          	beqz	a0,80006c44 <_ZN3TCB11createStackEPS_+0x64>
    80006c1c:	000087b7          	lui	a5,0x8
    80006c20:	00f507b3          	add	a5,a0,a5
    80006c24:	02f4b423          	sd	a5,40(s1)
    if(pid->stack == nullptr)
    80006c28:	02050663          	beqz	a0,80006c54 <_ZN3TCB11createStackEPS_+0x74>
    return 0;
    80006c2c:	00000513          	li	a0,0
}
    80006c30:	01813083          	ld	ra,24(sp)
    80006c34:	01013403          	ld	s0,16(sp)
    80006c38:	00813483          	ld	s1,8(sp)
    80006c3c:	02010113          	addi	sp,sp,32
    80006c40:	00008067          	ret
    pid->context.ra  = pid->stack != nullptr ? (uint64)&pid->stack[DEFAULT_STACK_SIZE] : 0;
    80006c44:	00000793          	li	a5,0
    80006c48:	fddff06f          	j	80006c24 <_ZN3TCB11createStackEPS_+0x44>
        return -1;
    80006c4c:	fff00513          	li	a0,-1
}
    80006c50:	00008067          	ret
        return -1;
    80006c54:	fff00513          	li	a0,-1
    80006c58:	fd9ff06f          	j	80006c30 <_ZN3TCB11createStackEPS_+0x50>

0000000080006c5c <_ZN3TCBnwEm>:
void* TCB::operator new(size_t size) {
    80006c5c:	fe010113          	addi	sp,sp,-32
    80006c60:	00113c23          	sd	ra,24(sp)
    80006c64:	00813823          	sd	s0,16(sp)
    80006c68:	00913423          	sd	s1,8(sp)
    80006c6c:	02010413          	addi	s0,sp,32
    80006c70:	00050493          	mv	s1,a0
    return SlabAllocator::getInstance().allocKernel(size, SlabAllocator::TCB);
    80006c74:	ffffe097          	auipc	ra,0xffffe
    80006c78:	e54080e7          	jalr	-428(ra) # 80004ac8 <_ZN13SlabAllocator11getInstanceEv>
    80006c7c:	00000613          	li	a2,0
    80006c80:	00048593          	mv	a1,s1
    80006c84:	ffffe097          	auipc	ra,0xffffe
    80006c88:	1d0080e7          	jalr	464(ra) # 80004e54 <_ZN13SlabAllocator11allocKernelEmNS_16kernelCacheEntryE>
}
    80006c8c:	01813083          	ld	ra,24(sp)
    80006c90:	01013403          	ld	s0,16(sp)
    80006c94:	00813483          	ld	s1,8(sp)
    80006c98:	02010113          	addi	sp,sp,32
    80006c9c:	00008067          	ret

0000000080006ca0 <_ZN3TCBnaEm>:
void* TCB::operator new[](size_t size) {
    80006ca0:	fe010113          	addi	sp,sp,-32
    80006ca4:	00113c23          	sd	ra,24(sp)
    80006ca8:	00813823          	sd	s0,16(sp)
    80006cac:	00913423          	sd	s1,8(sp)
    80006cb0:	02010413          	addi	s0,sp,32
    80006cb4:	00050493          	mv	s1,a0
    static void* getMemory(size_t size) { return getInstance().IGetMemory(size); }
    80006cb8:	fffff097          	auipc	ra,0xfffff
    80006cbc:	804080e7          	jalr	-2044(ra) # 800054bc <_ZN15MemoryAllocator11getInstanceEv>
    80006cc0:	00048593          	mv	a1,s1
    80006cc4:	fffff097          	auipc	ra,0xfffff
    80006cc8:	854080e7          	jalr	-1964(ra) # 80005518 <_ZN15MemoryAllocator10IGetMemoryEm>
}
    80006ccc:	01813083          	ld	ra,24(sp)
    80006cd0:	01013403          	ld	s0,16(sp)
    80006cd4:	00813483          	ld	s1,8(sp)
    80006cd8:	02010113          	addi	sp,sp,32
    80006cdc:	00008067          	ret

0000000080006ce0 <_ZN3TCBdlEPv>:
void TCB::operator delete(void* addr) {
    80006ce0:	fe010113          	addi	sp,sp,-32
    80006ce4:	00113c23          	sd	ra,24(sp)
    80006ce8:	00813823          	sd	s0,16(sp)
    80006cec:	00913423          	sd	s1,8(sp)
    80006cf0:	02010413          	addi	s0,sp,32
    80006cf4:	00050493          	mv	s1,a0
    SlabAllocator::getInstance().deallocKernel(addr, SlabAllocator::TCB);
    80006cf8:	ffffe097          	auipc	ra,0xffffe
    80006cfc:	dd0080e7          	jalr	-560(ra) # 80004ac8 <_ZN13SlabAllocator11getInstanceEv>
    80006d00:	00000613          	li	a2,0
    80006d04:	00048593          	mv	a1,s1
    80006d08:	ffffe097          	auipc	ra,0xffffe
    80006d0c:	2a8080e7          	jalr	680(ra) # 80004fb0 <_ZN13SlabAllocator13deallocKernelEPvNS_16kernelCacheEntryE>
}
    80006d10:	01813083          	ld	ra,24(sp)
    80006d14:	01013403          	ld	s0,16(sp)
    80006d18:	00813483          	ld	s1,8(sp)
    80006d1c:	02010113          	addi	sp,sp,32
    80006d20:	00008067          	ret

0000000080006d24 <_ZN3TCB12createThreadEPPS_PFvPvES2_Pm>:
int TCB::createThread(thread_t* handle, Body body, void* args, uint64* stack) {
    80006d24:	fc010113          	addi	sp,sp,-64
    80006d28:	02113c23          	sd	ra,56(sp)
    80006d2c:	02813823          	sd	s0,48(sp)
    80006d30:	02913423          	sd	s1,40(sp)
    80006d34:	03213023          	sd	s2,32(sp)
    80006d38:	01313c23          	sd	s3,24(sp)
    80006d3c:	01413823          	sd	s4,16(sp)
    80006d40:	01513423          	sd	s5,8(sp)
    80006d44:	04010413          	addi	s0,sp,64
    80006d48:	00050a13          	mv	s4,a0
    80006d4c:	00058993          	mv	s3,a1
    80006d50:	00060a93          	mv	s5,a2
    80006d54:	00068913          	mv	s2,a3
    TCB* thread  = new TCB(body, args, stack);
    80006d58:	04000513          	li	a0,64
    80006d5c:	00000097          	auipc	ra,0x0
    80006d60:	f00080e7          	jalr	-256(ra) # 80006c5c <_ZN3TCBnwEm>
    80006d64:	00050493          	mv	s1,a0
    80006d68:	06050863          	beqz	a0,80006dd8 <_ZN3TCB12createThreadEPPS_PFvPvES2_Pm+0xb4>
        body(body),
        args(args),
        stack(stack),
        context({(uint64)&threadWrapper, stack != nullptr ? (uint64)&stack[DEFAULT_STACK_SIZE] : 0}),
        timeSlice(DEFAULT_TIME_SLICE),
        status(RUNNING){
    80006d6c:	01353423          	sd	s3,8(a0)
    80006d70:	01553823          	sd	s5,16(a0)
    80006d74:	01253c23          	sd	s2,24(a0)
    80006d78:	00000797          	auipc	a5,0x0
    80006d7c:	b2078793          	addi	a5,a5,-1248 # 80006898 <_ZN3TCB13threadWrapperEv>
    80006d80:	02f53023          	sd	a5,32(a0)
        context({(uint64)&threadWrapper, stack != nullptr ? (uint64)&stack[DEFAULT_STACK_SIZE] : 0}),
    80006d84:	04090663          	beqz	s2,80006dd0 <_ZN3TCB12createThreadEPPS_PFvPvES2_Pm+0xac>
    80006d88:	000086b7          	lui	a3,0x8
    80006d8c:	00d90933          	add	s2,s2,a3
        status(RUNNING){
    80006d90:	0324b423          	sd	s2,40(s1)
    80006d94:	00200793          	li	a5,2
    80006d98:	02f4b823          	sd	a5,48(s1)
    80006d9c:	00100793          	li	a5,1
    80006da0:	02f4ac23          	sw	a5,56(s1)
          pid = ++counter;
    80006da4:	0000c717          	auipc	a4,0xc
    80006da8:	2d470713          	addi	a4,a4,724 # 80013078 <_ZN3TCB7threadsE>
    80006dac:	02072783          	lw	a5,32(a4)
    80006db0:	0017879b          	addiw	a5,a5,1
    80006db4:	02f72023          	sw	a5,32(a4)
    80006db8:	00f4a023          	sw	a5,0(s1)
          if (body != nullptr) {
    80006dbc:	00098e63          	beqz	s3,80006dd8 <_ZN3TCB12createThreadEPPS_PFvPvES2_Pm+0xb4>
              Scheduler::put(this);
    80006dc0:	00048513          	mv	a0,s1
    80006dc4:	ffffc097          	auipc	ra,0xffffc
    80006dc8:	574080e7          	jalr	1396(ra) # 80003338 <_ZN9Scheduler3putEP3TCB>
    80006dcc:	00c0006f          	j	80006dd8 <_ZN3TCB12createThreadEPPS_PFvPvES2_Pm+0xb4>
        context({(uint64)&threadWrapper, stack != nullptr ? (uint64)&stack[DEFAULT_STACK_SIZE] : 0}),
    80006dd0:	00000913          	li	s2,0
    80006dd4:	fbdff06f          	j	80006d90 <_ZN3TCB12createThreadEPPS_PFvPvES2_Pm+0x6c>
    if(thread == nullptr){
    80006dd8:	02048863          	beqz	s1,80006e08 <_ZN3TCB12createThreadEPPS_PFvPvES2_Pm+0xe4>
    *handle = thread;
    80006ddc:	009a3023          	sd	s1,0(s4)
    return 0;
    80006de0:	00000513          	li	a0,0
}
    80006de4:	03813083          	ld	ra,56(sp)
    80006de8:	03013403          	ld	s0,48(sp)
    80006dec:	02813483          	ld	s1,40(sp)
    80006df0:	02013903          	ld	s2,32(sp)
    80006df4:	01813983          	ld	s3,24(sp)
    80006df8:	01013a03          	ld	s4,16(sp)
    80006dfc:	00813a83          	ld	s5,8(sp)
    80006e00:	04010113          	addi	sp,sp,64
    80006e04:	00008067          	ret
        *handle = nullptr;
    80006e08:	000a3023          	sd	zero,0(s4)
        return -1;
    80006e0c:	fff00513          	li	a0,-1
    80006e10:	fd5ff06f          	j	80006de4 <_ZN3TCB12createThreadEPPS_PFvPvES2_Pm+0xc0>
    80006e14:	00050913          	mv	s2,a0
    TCB* thread  = new TCB(body, args, stack);
    80006e18:	00048513          	mv	a0,s1
    80006e1c:	00000097          	auipc	ra,0x0
    80006e20:	ec4080e7          	jalr	-316(ra) # 80006ce0 <_ZN3TCBdlEPv>
    80006e24:	00090513          	mv	a0,s2
    80006e28:	0000d097          	auipc	ra,0xd
    80006e2c:	360080e7          	jalr	864(ra) # 80014188 <_Unwind_Resume>

0000000080006e30 <_ZN3TCB12createThreadEPPS_PFvPvES2_PmNS_12threadStatusE>:
int TCB::createThread(thread_t* handle, Body body, void* args, uint64* stack, threadStatus status) {
    80006e30:	fc010113          	addi	sp,sp,-64
    80006e34:	02113c23          	sd	ra,56(sp)
    80006e38:	02813823          	sd	s0,48(sp)
    80006e3c:	02913423          	sd	s1,40(sp)
    80006e40:	03213023          	sd	s2,32(sp)
    80006e44:	01313c23          	sd	s3,24(sp)
    80006e48:	01413823          	sd	s4,16(sp)
    80006e4c:	01513423          	sd	s5,8(sp)
    80006e50:	01613023          	sd	s6,0(sp)
    80006e54:	04010413          	addi	s0,sp,64
    80006e58:	00050a13          	mv	s4,a0
    80006e5c:	00058993          	mv	s3,a1
    80006e60:	00060a93          	mv	s5,a2
    80006e64:	00068913          	mv	s2,a3
    80006e68:	00070b13          	mv	s6,a4
    TCB* thread  = new TCB(body, args, stack, status);
    80006e6c:	04000513          	li	a0,64
    80006e70:	00000097          	auipc	ra,0x0
    80006e74:	dec080e7          	jalr	-532(ra) # 80006c5c <_ZN3TCBnwEm>
    80006e78:	00050493          	mv	s1,a0
    80006e7c:	04050e63          	beqz	a0,80006ed8 <_ZN3TCB12createThreadEPPS_PFvPvES2_PmNS_12threadStatusE+0xa8>
    body(body),
    args(args),
    stack(stack),
    context({(uint64)&threadWrapper, stack != nullptr ? (uint64)&stack[DEFAULT_STACK_SIZE] : 0}),
    timeSlice(DEFAULT_TIME_SLICE),
    status(status){
    80006e80:	01353423          	sd	s3,8(a0)
    80006e84:	01553823          	sd	s5,16(a0)
    80006e88:	01253c23          	sd	s2,24(a0)
    80006e8c:	00000797          	auipc	a5,0x0
    80006e90:	a0c78793          	addi	a5,a5,-1524 # 80006898 <_ZN3TCB13threadWrapperEv>
    80006e94:	02f53023          	sd	a5,32(a0)
    context({(uint64)&threadWrapper, stack != nullptr ? (uint64)&stack[DEFAULT_STACK_SIZE] : 0}),
    80006e98:	06090a63          	beqz	s2,80006f0c <_ZN3TCB12createThreadEPPS_PFvPvES2_PmNS_12threadStatusE+0xdc>
    80006e9c:	000086b7          	lui	a3,0x8
    80006ea0:	00d90933          	add	s2,s2,a3
    status(status){
    80006ea4:	0324b423          	sd	s2,40(s1)
    80006ea8:	00200793          	li	a5,2
    80006eac:	02f4b823          	sd	a5,48(s1)
    80006eb0:	0364ac23          	sw	s6,56(s1)
        pid = ++counter;
    80006eb4:	0000c697          	auipc	a3,0xc
    80006eb8:	1c468693          	addi	a3,a3,452 # 80013078 <_ZN3TCB7threadsE>
    80006ebc:	0206a783          	lw	a5,32(a3)
    80006ec0:	0017879b          	addiw	a5,a5,1
    80006ec4:	02f6a023          	sw	a5,32(a3)
    80006ec8:	00f4a023          	sw	a5,0(s1)
        if (body != nullptr && this->status == RUNNING) {
    80006ecc:	00098663          	beqz	s3,80006ed8 <_ZN3TCB12createThreadEPPS_PFvPvES2_PmNS_12threadStatusE+0xa8>
    80006ed0:	00100793          	li	a5,1
    80006ed4:	04fb0063          	beq	s6,a5,80006f14 <_ZN3TCB12createThreadEPPS_PFvPvES2_PmNS_12threadStatusE+0xe4>
    if(thread == nullptr){
    80006ed8:	04048663          	beqz	s1,80006f24 <_ZN3TCB12createThreadEPPS_PFvPvES2_PmNS_12threadStatusE+0xf4>
    *handle = thread;
    80006edc:	009a3023          	sd	s1,0(s4)
    return 0;
    80006ee0:	00000513          	li	a0,0
}
    80006ee4:	03813083          	ld	ra,56(sp)
    80006ee8:	03013403          	ld	s0,48(sp)
    80006eec:	02813483          	ld	s1,40(sp)
    80006ef0:	02013903          	ld	s2,32(sp)
    80006ef4:	01813983          	ld	s3,24(sp)
    80006ef8:	01013a03          	ld	s4,16(sp)
    80006efc:	00813a83          	ld	s5,8(sp)
    80006f00:	00013b03          	ld	s6,0(sp)
    80006f04:	04010113          	addi	sp,sp,64
    80006f08:	00008067          	ret
    context({(uint64)&threadWrapper, stack != nullptr ? (uint64)&stack[DEFAULT_STACK_SIZE] : 0}),
    80006f0c:	00000913          	li	s2,0
    80006f10:	f95ff06f          	j	80006ea4 <_ZN3TCB12createThreadEPPS_PFvPvES2_PmNS_12threadStatusE+0x74>
            Scheduler::put(this);
    80006f14:	00048513          	mv	a0,s1
    80006f18:	ffffc097          	auipc	ra,0xffffc
    80006f1c:	420080e7          	jalr	1056(ra) # 80003338 <_ZN9Scheduler3putEP3TCB>
    80006f20:	fb9ff06f          	j	80006ed8 <_ZN3TCB12createThreadEPPS_PFvPvES2_PmNS_12threadStatusE+0xa8>
        *handle = nullptr;
    80006f24:	000a3023          	sd	zero,0(s4)
        return -1;
    80006f28:	fff00513          	li	a0,-1
    80006f2c:	fb9ff06f          	j	80006ee4 <_ZN3TCB12createThreadEPPS_PFvPvES2_PmNS_12threadStatusE+0xb4>
    80006f30:	00050913          	mv	s2,a0
    TCB* thread  = new TCB(body, args, stack, status);
    80006f34:	00048513          	mv	a0,s1
    80006f38:	00000097          	auipc	ra,0x0
    80006f3c:	da8080e7          	jalr	-600(ra) # 80006ce0 <_ZN3TCBdlEPv>
    80006f40:	00090513          	mv	a0,s2
    80006f44:	0000d097          	auipc	ra,0xd
    80006f48:	244080e7          	jalr	580(ra) # 80014188 <_Unwind_Resume>

0000000080006f4c <_ZN3TCBdaEPv>:
void TCB::operator delete[](void* addr) {
    80006f4c:	fe010113          	addi	sp,sp,-32
    80006f50:	00113c23          	sd	ra,24(sp)
    80006f54:	00813823          	sd	s0,16(sp)
    80006f58:	00913423          	sd	s1,8(sp)
    80006f5c:	02010413          	addi	s0,sp,32
    80006f60:	00050493          	mv	s1,a0
    static int freeMemory(void* addr) { return getInstance().IFreeMemory(addr); }
    80006f64:	ffffe097          	auipc	ra,0xffffe
    80006f68:	558080e7          	jalr	1368(ra) # 800054bc <_ZN15MemoryAllocator11getInstanceEv>
    80006f6c:	00048593          	mv	a1,s1
    80006f70:	ffffe097          	auipc	ra,0xffffe
    80006f74:	6d4080e7          	jalr	1748(ra) # 80005644 <_ZN15MemoryAllocator11IFreeMemoryEPv>
}
    80006f78:	01813083          	ld	ra,24(sp)
    80006f7c:	01013403          	ld	s0,16(sp)
    80006f80:	00813483          	ld	s1,8(sp)
    80006f84:	02010113          	addi	sp,sp,32
    80006f88:	00008067          	ret

0000000080006f8c <_ZN3TCB13deleteThreadsEv>:
void TCB::deleteThreads() {
    80006f8c:	fd010113          	addi	sp,sp,-48
    80006f90:	02113423          	sd	ra,40(sp)
    80006f94:	02813023          	sd	s0,32(sp)
    80006f98:	00913c23          	sd	s1,24(sp)
    80006f9c:	01213823          	sd	s2,16(sp)
    80006fa0:	01313423          	sd	s3,8(sp)
    80006fa4:	03010413          	addi	s0,sp,48
        if (!head)
    80006fa8:	0000c497          	auipc	s1,0xc
    80006fac:	0d04b483          	ld	s1,208(s1) # 80013078 <_ZN3TCB7threadsE>
    80006fb0:	04048063          	beqz	s1,80006ff0 <_ZN3TCB13deleteThreadsEv+0x64>
        head = head->next;
    80006fb4:	0084b783          	ld	a5,8(s1)
    80006fb8:	0000c717          	auipc	a4,0xc
    80006fbc:	0cf73023          	sd	a5,192(a4) # 80013078 <_ZN3TCB7threadsE>
        if (!head)
    80006fc0:	02078263          	beqz	a5,80006fe4 <_ZN3TCB13deleteThreadsEv+0x58>
        T *ret = elem->data;
    80006fc4:	0004b903          	ld	s2,0(s1)
            SlabAllocator::getInstance().deallocKernel(addr, SlabAllocator::LISTELEM);
    80006fc8:	ffffe097          	auipc	ra,0xffffe
    80006fcc:	b00080e7          	jalr	-1280(ra) # 80004ac8 <_ZN13SlabAllocator11getInstanceEv>
    80006fd0:	00200613          	li	a2,2
    80006fd4:	00048593          	mv	a1,s1
    80006fd8:	ffffe097          	auipc	ra,0xffffe
    80006fdc:	fd8080e7          	jalr	-40(ra) # 80004fb0 <_ZN13SlabAllocator13deallocKernelEPvNS_16kernelCacheEntryE>
        return ret;
    80006fe0:	03c0006f          	j	8000701c <_ZN3TCB13deleteThreadsEv+0x90>
            tail = 0;
    80006fe4:	0000c797          	auipc	a5,0xc
    80006fe8:	0807be23          	sd	zero,156(a5) # 80013080 <_ZN3TCB7threadsE+0x8>
    80006fec:	fd9ff06f          	j	80006fc4 <_ZN3TCB13deleteThreadsEv+0x38>
            return 0;
    80006ff0:	00048913          	mv	s2,s1
    80006ff4:	0280006f          	j	8000701c <_ZN3TCB13deleteThreadsEv+0x90>
            tail = 0;
    80006ff8:	0000c797          	auipc	a5,0xc
    80006ffc:	0807b423          	sd	zero,136(a5) # 80013080 <_ZN3TCB7threadsE+0x8>
    80007000:	03c0006f          	j	8000703c <_ZN3TCB13deleteThreadsEv+0xb0>
            return 0;
    80007004:	00048993          	mv	s3,s1
    80007008:	0500006f          	j	80007058 <_ZN3TCB13deleteThreadsEv+0xcc>
        delete old;
    8000700c:	00090513          	mv	a0,s2
    80007010:	00000097          	auipc	ra,0x0
    80007014:	cd0080e7          	jalr	-816(ra) # 80006ce0 <_ZN3TCBdlEPv>
    80007018:	00098913          	mv	s2,s3
    while(t){
    8000701c:	06090263          	beqz	s2,80007080 <_ZN3TCB13deleteThreadsEv+0xf4>
        if (!head)
    80007020:	0000c497          	auipc	s1,0xc
    80007024:	0584b483          	ld	s1,88(s1) # 80013078 <_ZN3TCB7threadsE>
    80007028:	fc048ee3          	beqz	s1,80007004 <_ZN3TCB13deleteThreadsEv+0x78>
        head = head->next;
    8000702c:	0084b783          	ld	a5,8(s1)
    80007030:	0000c717          	auipc	a4,0xc
    80007034:	04f73423          	sd	a5,72(a4) # 80013078 <_ZN3TCB7threadsE>
        if (!head)
    80007038:	fc0780e3          	beqz	a5,80006ff8 <_ZN3TCB13deleteThreadsEv+0x6c>
        T *ret = elem->data;
    8000703c:	0004b983          	ld	s3,0(s1)
            SlabAllocator::getInstance().deallocKernel(addr, SlabAllocator::LISTELEM);
    80007040:	ffffe097          	auipc	ra,0xffffe
    80007044:	a88080e7          	jalr	-1400(ra) # 80004ac8 <_ZN13SlabAllocator11getInstanceEv>
    80007048:	00200613          	li	a2,2
    8000704c:	00048593          	mv	a1,s1
    80007050:	ffffe097          	auipc	ra,0xffffe
    80007054:	f60080e7          	jalr	-160(ra) # 80004fb0 <_ZN13SlabAllocator13deallocKernelEPvNS_16kernelCacheEntryE>
        delete old;
    80007058:	fc0900e3          	beqz	s2,80007018 <_ZN3TCB13deleteThreadsEv+0x8c>
        if(stack) SlabAllocator::getInstance().deallocKernel(stack, SlabAllocator::STACK);
    8000705c:	01893783          	ld	a5,24(s2)
    80007060:	fa0786e3          	beqz	a5,8000700c <_ZN3TCB13deleteThreadsEv+0x80>
    80007064:	ffffe097          	auipc	ra,0xffffe
    80007068:	a64080e7          	jalr	-1436(ra) # 80004ac8 <_ZN13SlabAllocator11getInstanceEv>
    8000706c:	00400613          	li	a2,4
    80007070:	01893583          	ld	a1,24(s2)
    80007074:	ffffe097          	auipc	ra,0xffffe
    80007078:	f3c080e7          	jalr	-196(ra) # 80004fb0 <_ZN13SlabAllocator13deallocKernelEPvNS_16kernelCacheEntryE>
    8000707c:	f91ff06f          	j	8000700c <_ZN3TCB13deleteThreadsEv+0x80>
}
    80007080:	02813083          	ld	ra,40(sp)
    80007084:	02013403          	ld	s0,32(sp)
    80007088:	01813483          	ld	s1,24(sp)
    8000708c:	01013903          	ld	s2,16(sp)
    80007090:	00813983          	ld	s3,8(sp)
    80007094:	03010113          	addi	sp,sp,48
    80007098:	00008067          	ret

000000008000709c <_GLOBAL__sub_I__ZN3TCB16timeSliceCounterE>:
    8000709c:	ff010113          	addi	sp,sp,-16
    800070a0:	00113423          	sd	ra,8(sp)
    800070a4:	00813023          	sd	s0,0(sp)
    800070a8:	01010413          	addi	s0,sp,16
    800070ac:	000105b7          	lui	a1,0x10
    800070b0:	fff58593          	addi	a1,a1,-1 # ffff <_entry-0x7fff0001>
    800070b4:	00100513          	li	a0,1
    800070b8:	fffff097          	auipc	ra,0xfffff
    800070bc:	778080e7          	jalr	1912(ra) # 80006830 <_Z41__static_initialization_and_destruction_0ii>
    800070c0:	00813083          	ld	ra,8(sp)
    800070c4:	00013403          	ld	s0,0(sp)
    800070c8:	01010113          	addi	sp,sp,16
    800070cc:	00008067          	ret

00000000800070d0 <_Z41__static_initialization_and_destruction_0ii>:
        TCB* t = old->thread;
        TCB::threads.addLast(t);
        MemoryAllocator::freeMemory(old);
    }

}
    800070d0:	ff010113          	addi	sp,sp,-16
    800070d4:	00813423          	sd	s0,8(sp)
    800070d8:	01010413          	addi	s0,sp,16
    800070dc:	00100793          	li	a5,1
    800070e0:	00f50863          	beq	a0,a5,800070f0 <_Z41__static_initialization_and_destruction_0ii+0x20>
    800070e4:	00813403          	ld	s0,8(sp)
    800070e8:	01010113          	addi	sp,sp,16
    800070ec:	00008067          	ret
    800070f0:	000107b7          	lui	a5,0x10
    800070f4:	fff78793          	addi	a5,a5,-1 # ffff <_entry-0x7fff0001>
    800070f8:	fef596e3          	bne	a1,a5,800070e4 <_Z41__static_initialization_and_destruction_0ii+0x14>
    List() : head(0), tail(0), current(0) {}
    800070fc:	0000c797          	auipc	a5,0xc
    80007100:	fac78793          	addi	a5,a5,-84 # 800130a8 <_ZN9SleepList15sleepingThreadsE>
    80007104:	0007b023          	sd	zero,0(a5)
    80007108:	0007b423          	sd	zero,8(a5)
    8000710c:	0007b823          	sd	zero,16(a5)
    80007110:	fd5ff06f          	j	800070e4 <_Z41__static_initialization_and_destruction_0ii+0x14>

0000000080007114 <_ZN9SleepList3putEP3TCBm>:
    if(sleepTime <= 0)
    80007114:	00059463          	bnez	a1,8000711c <_ZN9SleepList3putEP3TCBm+0x8>
    80007118:	00008067          	ret
void SleepList::put(TCB* thread, time_t sleepTime) {
    8000711c:	fd010113          	addi	sp,sp,-48
    80007120:	02113423          	sd	ra,40(sp)
    80007124:	02813023          	sd	s0,32(sp)
    80007128:	00913c23          	sd	s1,24(sp)
    8000712c:	01213823          	sd	s2,16(sp)
    80007130:	01313423          	sd	s3,8(sp)
    80007134:	03010413          	addi	s0,sp,48
    80007138:	00050993          	mv	s3,a0
    8000713c:	00058493          	mv	s1,a1
    SleepList::Sleep* elem = new SleepList::Sleep(thread);
    80007140:	01000513          	li	a0,16
    80007144:	fffff097          	auipc	ra,0xfffff
    80007148:	fb4080e7          	jalr	-76(ra) # 800060f8 <_Znwm>
    8000714c:	00050913          	mv	s2,a0
    80007150:	00050463          	beqz	a0,80007158 <_ZN9SleepList3putEP3TCBm+0x44>
    void operator delete[](void*);

    struct Sleep{
        time_t difference;
        TCB* thread;
        Sleep(TCB* thread) : thread(thread) {}
    80007154:	01353423          	sd	s3,8(a0)
            return 0;
        return tail->data;
    }

    void resetCurrent(){
        current = head;
    80007158:	0000c717          	auipc	a4,0xc
    8000715c:	f5070713          	addi	a4,a4,-176 # 800130a8 <_ZN9SleepList15sleepingThreadsE>
    80007160:	00073783          	ld	a5,0(a4)
    80007164:	00f73823          	sd	a5,16(a4)
            current = current->next;

    }

    T* getCurrent(){
        if(!current)
    80007168:	00078463          	beqz	a5,80007170 <_ZN9SleepList3putEP3TCBm+0x5c>
            return 0;
        return current->data;
    8000716c:	0007b783          	ld	a5,0(a5)
void SleepList::put(TCB* thread, time_t sleepTime) {
    80007170:	00000713          	li	a4,0
    80007174:	00000693          	li	a3,0
    80007178:	0180006f          	j	80007190 <_ZN9SleepList3putEP3TCBm+0x7c>
        if(!current)
    8000717c:	0000c797          	auipc	a5,0xc
    80007180:	f3c7b783          	ld	a5,-196(a5) # 800130b8 <_ZN9SleepList15sleepingThreadsE+0x10>
    80007184:	00078463          	beqz	a5,8000718c <_ZN9SleepList3putEP3TCBm+0x78>
        return current->data;
    80007188:	0007b783          	ld	a5,0(a5)
        position++;
    8000718c:	0016869b          	addiw	a3,a3,1
    while(p){
    80007190:	02078663          	beqz	a5,800071bc <_ZN9SleepList3putEP3TCBm+0xa8>
        listTime += p->difference;
    80007194:	0007b603          	ld	a2,0(a5)
    80007198:	00c70733          	add	a4,a4,a2
        if(sleepTime < listTime)
    8000719c:	02e4e063          	bltu	s1,a4,800071bc <_ZN9SleepList3putEP3TCBm+0xa8>
        if(current)
    800071a0:	0000c797          	auipc	a5,0xc
    800071a4:	f187b783          	ld	a5,-232(a5) # 800130b8 <_ZN9SleepList15sleepingThreadsE+0x10>
    800071a8:	fc078ae3          	beqz	a5,8000717c <_ZN9SleepList3putEP3TCBm+0x68>
            current = current->next;
    800071ac:	0087b783          	ld	a5,8(a5)
    800071b0:	0000c617          	auipc	a2,0xc
    800071b4:	f0f63423          	sd	a5,-248(a2) # 800130b8 <_ZN9SleepList15sleepingThreadsE+0x10>
    800071b8:	fc5ff06f          	j	8000717c <_ZN9SleepList3putEP3TCBm+0x68>
    if(!position){
    800071bc:	08069c63          	bnez	a3,80007254 <_ZN9SleepList3putEP3TCBm+0x140>
        elem->difference = sleepTime;
    800071c0:	00993023          	sd	s1,0(s2)
        if(p)
    800071c4:	00078863          	beqz	a5,800071d4 <_ZN9SleepList3putEP3TCBm+0xc0>
           p->difference = p->difference - sleepTime;
    800071c8:	0007b703          	ld	a4,0(a5)
    800071cc:	40970733          	sub	a4,a4,s1
    800071d0:	00e7b023          	sd	a4,0(a5)
            void* addr = SlabAllocator::getInstance().allocKernel(size, SlabAllocator::LISTELEM);
    800071d4:	ffffe097          	auipc	ra,0xffffe
    800071d8:	8f4080e7          	jalr	-1804(ra) # 80004ac8 <_ZN13SlabAllocator11getInstanceEv>
    800071dc:	00200613          	li	a2,2
    800071e0:	01000593          	li	a1,16
    800071e4:	ffffe097          	auipc	ra,0xffffe
    800071e8:	c70080e7          	jalr	-912(ra) # 80004e54 <_ZN13SlabAllocator11allocKernelEmNS_16kernelCacheEntryE>
        Elem *elem = new Elem(data, head);
    800071ec:	00050a63          	beqz	a0,80007200 <_ZN9SleepList3putEP3TCBm+0xec>
    800071f0:	0000c797          	auipc	a5,0xc
    800071f4:	eb87b783          	ld	a5,-328(a5) # 800130a8 <_ZN9SleepList15sleepingThreadsE>
        Elem(T *data, Elem *next) : data(data), next(next) {}
    800071f8:	01253023          	sd	s2,0(a0)
    800071fc:	00f53423          	sd	a5,8(a0)
        if(!elem)
    80007200:	00050c63          	beqz	a0,80007218 <_ZN9SleepList3putEP3TCBm+0x104>
        head = elem;
    80007204:	0000c797          	auipc	a5,0xc
    80007208:	ea478793          	addi	a5,a5,-348 # 800130a8 <_ZN9SleepList15sleepingThreadsE>
    8000720c:	00a7b023          	sd	a0,0(a5)
        if (!tail) { tail = head; }
    80007210:	0087b783          	ld	a5,8(a5)
    80007214:	02078a63          	beqz	a5,80007248 <_ZN9SleepList3putEP3TCBm+0x134>
    TCB::running->setStatus(TCB::SLEEPING);
    80007218:	00006797          	auipc	a5,0x6
    8000721c:	b087b783          	ld	a5,-1272(a5) # 8000cd20 <_GLOBAL_OFFSET_TABLE_+0x68>
    80007220:	0007b783          	ld	a5,0(a5)
    80007224:	00300713          	li	a4,3
    80007228:	02e7ac23          	sw	a4,56(a5)
}
    8000722c:	02813083          	ld	ra,40(sp)
    80007230:	02013403          	ld	s0,32(sp)
    80007234:	01813483          	ld	s1,24(sp)
    80007238:	01013903          	ld	s2,16(sp)
    8000723c:	00813983          	ld	s3,8(sp)
    80007240:	03010113          	addi	sp,sp,48
    80007244:	00008067          	ret
    80007248:	0000c797          	auipc	a5,0xc
    8000724c:	e6a7b423          	sd	a0,-408(a5) # 800130b0 <_ZN9SleepList15sleepingThreadsE+0x8>
    80007250:	fc9ff06f          	j	80007218 <_ZN9SleepList3putEP3TCBm+0x104>
    }else if(!p){ // add as last
    80007254:	02078c63          	beqz	a5,8000728c <_ZN9SleepList3putEP3TCBm+0x178>
        elem->difference = sleepTime - (listTime - p->difference);
    80007258:	0007b603          	ld	a2,0(a5)
    8000725c:	40e60633          	sub	a2,a2,a4
    80007260:	00960633          	add	a2,a2,s1
    80007264:	00c93023          	sd	a2,0(s2)
        p->difference = listTime - sleepTime;
    80007268:	40970733          	sub	a4,a4,s1
    8000726c:	00e7b023          	sd	a4,0(a5)
    }

    void insertAtPosition(T* elem, int pos){
        if(!pos){
    80007270:	06068e63          	beqz	a3,800072ec <_ZN9SleepList3putEP3TCBm+0x1d8>
        current = head;
    80007274:	0000c797          	auipc	a5,0xc
    80007278:	e3478793          	addi	a5,a5,-460 # 800130a8 <_ZN9SleepList15sleepingThreadsE>
    8000727c:	0007b703          	ld	a4,0(a5)
    80007280:	00e7b823          	sd	a4,16(a5)
            addFirst(elem);
            return;
        }
        resetCurrent();
        for(int i = 0;i < pos - 1;i++) moveCurrent();
    80007284:	00000793          	li	a5,0
    80007288:	0b80006f          	j	80007340 <_ZN9SleepList3putEP3TCBm+0x22c>
        elem->difference = sleepTime - listTime;
    8000728c:	40e48733          	sub	a4,s1,a4
    80007290:	00e93023          	sd	a4,0(s2)
            void* addr = SlabAllocator::getInstance().allocKernel(size, SlabAllocator::LISTELEM);
    80007294:	ffffe097          	auipc	ra,0xffffe
    80007298:	834080e7          	jalr	-1996(ra) # 80004ac8 <_ZN13SlabAllocator11getInstanceEv>
    8000729c:	00200613          	li	a2,2
    800072a0:	01000593          	li	a1,16
    800072a4:	ffffe097          	auipc	ra,0xffffe
    800072a8:	bb0080e7          	jalr	-1104(ra) # 80004e54 <_ZN13SlabAllocator11allocKernelEmNS_16kernelCacheEntryE>
        Elem *elem = new Elem(data, 0);
    800072ac:	00050663          	beqz	a0,800072b8 <_ZN9SleepList3putEP3TCBm+0x1a4>
        Elem(T *data, Elem *next) : data(data), next(next) {}
    800072b0:	01253023          	sd	s2,0(a0)
    800072b4:	00053423          	sd	zero,8(a0)
        if(!elem)
    800072b8:	f60500e3          	beqz	a0,80007218 <_ZN9SleepList3putEP3TCBm+0x104>
        if (tail){
    800072bc:	0000c797          	auipc	a5,0xc
    800072c0:	df47b783          	ld	a5,-524(a5) # 800130b0 <_ZN9SleepList15sleepingThreadsE+0x8>
    800072c4:	00078a63          	beqz	a5,800072d8 <_ZN9SleepList3putEP3TCBm+0x1c4>
            tail->next = elem;
    800072c8:	00a7b423          	sd	a0,8(a5)
            tail = elem;
    800072cc:	0000c797          	auipc	a5,0xc
    800072d0:	dea7b223          	sd	a0,-540(a5) # 800130b0 <_ZN9SleepList15sleepingThreadsE+0x8>
    800072d4:	f45ff06f          	j	80007218 <_ZN9SleepList3putEP3TCBm+0x104>
            head = tail = elem;
    800072d8:	0000c797          	auipc	a5,0xc
    800072dc:	dd078793          	addi	a5,a5,-560 # 800130a8 <_ZN9SleepList15sleepingThreadsE>
    800072e0:	00a7b423          	sd	a0,8(a5)
    800072e4:	00a7b023          	sd	a0,0(a5)
    800072e8:	f31ff06f          	j	80007218 <_ZN9SleepList3putEP3TCBm+0x104>
            void* addr = SlabAllocator::getInstance().allocKernel(size, SlabAllocator::LISTELEM);
    800072ec:	ffffd097          	auipc	ra,0xffffd
    800072f0:	7dc080e7          	jalr	2012(ra) # 80004ac8 <_ZN13SlabAllocator11getInstanceEv>
    800072f4:	00200613          	li	a2,2
    800072f8:	01000593          	li	a1,16
    800072fc:	ffffe097          	auipc	ra,0xffffe
    80007300:	b58080e7          	jalr	-1192(ra) # 80004e54 <_ZN13SlabAllocator11allocKernelEmNS_16kernelCacheEntryE>
        Elem *elem = new Elem(data, head);
    80007304:	00050a63          	beqz	a0,80007318 <_ZN9SleepList3putEP3TCBm+0x204>
    80007308:	0000c797          	auipc	a5,0xc
    8000730c:	da07b783          	ld	a5,-608(a5) # 800130a8 <_ZN9SleepList15sleepingThreadsE>
        Elem(T *data, Elem *next) : data(data), next(next) {}
    80007310:	01253023          	sd	s2,0(a0)
    80007314:	00f53423          	sd	a5,8(a0)
        if(!elem)
    80007318:	f00500e3          	beqz	a0,80007218 <_ZN9SleepList3putEP3TCBm+0x104>
        head = elem;
    8000731c:	0000c797          	auipc	a5,0xc
    80007320:	d8c78793          	addi	a5,a5,-628 # 800130a8 <_ZN9SleepList15sleepingThreadsE>
    80007324:	00a7b023          	sd	a0,0(a5)
        if (!tail) { tail = head; }
    80007328:	0087b783          	ld	a5,8(a5)
    8000732c:	ee0796e3          	bnez	a5,80007218 <_ZN9SleepList3putEP3TCBm+0x104>
    80007330:	0000c797          	auipc	a5,0xc
    80007334:	d8a7b023          	sd	a0,-640(a5) # 800130b0 <_ZN9SleepList15sleepingThreadsE+0x8>
    80007338:	ee1ff06f          	j	80007218 <_ZN9SleepList3putEP3TCBm+0x104>
        for(int i = 0;i < pos - 1;i++) moveCurrent();
    8000733c:	0017879b          	addiw	a5,a5,1
    80007340:	fff6871b          	addiw	a4,a3,-1
    80007344:	02e7d063          	bge	a5,a4,80007364 <_ZN9SleepList3putEP3TCBm+0x250>
        if(current)
    80007348:	0000c717          	auipc	a4,0xc
    8000734c:	d7073703          	ld	a4,-656(a4) # 800130b8 <_ZN9SleepList15sleepingThreadsE+0x10>
    80007350:	fe0706e3          	beqz	a4,8000733c <_ZN9SleepList3putEP3TCBm+0x228>
            current = current->next;
    80007354:	00873703          	ld	a4,8(a4)
    80007358:	0000c617          	auipc	a2,0xc
    8000735c:	d6e63023          	sd	a4,-672(a2) # 800130b8 <_ZN9SleepList15sleepingThreadsE+0x10>
    80007360:	fddff06f          	j	8000733c <_ZN9SleepList3putEP3TCBm+0x228>
            void* addr = SlabAllocator::getInstance().allocKernel(size, SlabAllocator::LISTELEM);
    80007364:	ffffd097          	auipc	ra,0xffffd
    80007368:	764080e7          	jalr	1892(ra) # 80004ac8 <_ZN13SlabAllocator11getInstanceEv>
    8000736c:	00200613          	li	a2,2
    80007370:	01000593          	li	a1,16
    80007374:	ffffe097          	auipc	ra,0xffffe
    80007378:	ae0080e7          	jalr	-1312(ra) # 80004e54 <_ZN13SlabAllocator11allocKernelEmNS_16kernelCacheEntryE>
        current->next = new Elem(elem, current->next);
    8000737c:	00050c63          	beqz	a0,80007394 <_ZN9SleepList3putEP3TCBm+0x280>
    80007380:	0000c797          	auipc	a5,0xc
    80007384:	d387b783          	ld	a5,-712(a5) # 800130b8 <_ZN9SleepList15sleepingThreadsE+0x10>
    80007388:	0087b783          	ld	a5,8(a5)
        Elem(T *data, Elem *next) : data(data), next(next) {}
    8000738c:	01253023          	sd	s2,0(a0)
    80007390:	00f53423          	sd	a5,8(a0)
        current->next = new Elem(elem, current->next);
    80007394:	0000c797          	auipc	a5,0xc
    80007398:	d247b783          	ld	a5,-732(a5) # 800130b8 <_ZN9SleepList15sleepingThreadsE+0x10>
    8000739c:	00a7b423          	sd	a0,8(a5)
    800073a0:	e79ff06f          	j	80007218 <_ZN9SleepList3putEP3TCBm+0x104>

00000000800073a4 <_ZN9SleepList9decrementEv>:
int SleepList::decrement() {
    800073a4:	ff010113          	addi	sp,sp,-16
    800073a8:	00813423          	sd	s0,8(sp)
    800073ac:	01010413          	addi	s0,sp,16
        if (!head)
    800073b0:	0000c797          	auipc	a5,0xc
    800073b4:	cf87b783          	ld	a5,-776(a5) # 800130a8 <_ZN9SleepList15sleepingThreadsE>
    800073b8:	02078463          	beqz	a5,800073e0 <_ZN9SleepList9decrementEv+0x3c>
        return head->data;
    800073bc:	0007b783          	ld	a5,0(a5)
    if(!p)
    800073c0:	02078463          	beqz	a5,800073e8 <_ZN9SleepList9decrementEv+0x44>
    p->difference--;
    800073c4:	0007b703          	ld	a4,0(a5)
    800073c8:	fff70713          	addi	a4,a4,-1
    800073cc:	00e7b023          	sd	a4,0(a5)
    return 1;
    800073d0:	00100513          	li	a0,1
}
    800073d4:	00813403          	ld	s0,8(sp)
    800073d8:	01010113          	addi	sp,sp,16
    800073dc:	00008067          	ret
        return 0;
    800073e0:	00000513          	li	a0,0
    800073e4:	ff1ff06f          	j	800073d4 <_ZN9SleepList9decrementEv+0x30>
    800073e8:	00000513          	li	a0,0
    800073ec:	fe9ff06f          	j	800073d4 <_ZN9SleepList9decrementEv+0x30>

00000000800073f0 <_ZN9SleepList14releaseThreadsEv>:
void SleepList::releaseThreads(){
    800073f0:	fd010113          	addi	sp,sp,-48
    800073f4:	02113423          	sd	ra,40(sp)
    800073f8:	02813023          	sd	s0,32(sp)
    800073fc:	00913c23          	sd	s1,24(sp)
    80007400:	01213823          	sd	s2,16(sp)
    80007404:	01313423          	sd	s3,8(sp)
    80007408:	03010413          	addi	s0,sp,48
    if(!decrement())
    8000740c:	00000097          	auipc	ra,0x0
    80007410:	f98080e7          	jalr	-104(ra) # 800073a4 <_ZN9SleepList9decrementEv>
    80007414:	0a050263          	beqz	a0,800074b8 <_ZN9SleepList14releaseThreadsEv+0xc8>
        if (!head)
    80007418:	0000c497          	auipc	s1,0xc
    8000741c:	c904b483          	ld	s1,-880(s1) # 800130a8 <_ZN9SleepList15sleepingThreadsE>
    80007420:	06048063          	beqz	s1,80007480 <_ZN9SleepList14releaseThreadsEv+0x90>
        return head->data;
    80007424:	0004b483          	ld	s1,0(s1)
    80007428:	0580006f          	j	80007480 <_ZN9SleepList14releaseThreadsEv+0x90>
            tail = 0;
    8000742c:	0000c797          	auipc	a5,0xc
    80007430:	c807b223          	sd	zero,-892(a5) # 800130b0 <_ZN9SleepList15sleepingThreadsE+0x8>
            SlabAllocator::getInstance().deallocKernel(addr, SlabAllocator::LISTELEM);
    80007434:	ffffd097          	auipc	ra,0xffffd
    80007438:	694080e7          	jalr	1684(ra) # 80004ac8 <_ZN13SlabAllocator11getInstanceEv>
    8000743c:	00200613          	li	a2,2
    80007440:	00090593          	mv	a1,s2
    80007444:	ffffe097          	auipc	ra,0xffffe
    80007448:	b6c080e7          	jalr	-1172(ra) # 80004fb0 <_ZN13SlabAllocator13deallocKernelEPvNS_16kernelCacheEntryE>
        Scheduler::put(t);
    8000744c:	00098513          	mv	a0,s3
    80007450:	ffffc097          	auipc	ra,0xffffc
    80007454:	ee8080e7          	jalr	-280(ra) # 80003338 <_ZN9Scheduler3putEP3TCB>
        if (!head)
    80007458:	0000c917          	auipc	s2,0xc
    8000745c:	c5093903          	ld	s2,-944(s2) # 800130a8 <_ZN9SleepList15sleepingThreadsE>
    80007460:	00090463          	beqz	s2,80007468 <_ZN9SleepList14releaseThreadsEv+0x78>
        return head->data;
    80007464:	00093903          	ld	s2,0(s2)
    80007468:	ffffe097          	auipc	ra,0xffffe
    8000746c:	054080e7          	jalr	84(ra) # 800054bc <_ZN15MemoryAllocator11getInstanceEv>
    80007470:	00048593          	mv	a1,s1
    80007474:	ffffe097          	auipc	ra,0xffffe
    80007478:	1d0080e7          	jalr	464(ra) # 80005644 <_ZN15MemoryAllocator11IFreeMemoryEPv>
        p = sleepingThreads.peekFirst();
    8000747c:	00090493          	mv	s1,s2
    while(p && p->difference == 0){
    80007480:	02048c63          	beqz	s1,800074b8 <_ZN9SleepList14releaseThreadsEv+0xc8>
    80007484:	0004b783          	ld	a5,0(s1)
    80007488:	02079863          	bnez	a5,800074b8 <_ZN9SleepList14releaseThreadsEv+0xc8>
        TCB* t = p->thread;
    8000748c:	0084b983          	ld	s3,8(s1)
        t->status = TCB::RUNNING;
    80007490:	00100793          	li	a5,1
    80007494:	02f9ac23          	sw	a5,56(s3)
        if (!head)
    80007498:	0000c917          	auipc	s2,0xc
    8000749c:	c1093903          	ld	s2,-1008(s2) # 800130a8 <_ZN9SleepList15sleepingThreadsE>
    800074a0:	fa0906e3          	beqz	s2,8000744c <_ZN9SleepList14releaseThreadsEv+0x5c>
        head = head->next;
    800074a4:	00893783          	ld	a5,8(s2)
    800074a8:	0000c717          	auipc	a4,0xc
    800074ac:	c0f73023          	sd	a5,-1024(a4) # 800130a8 <_ZN9SleepList15sleepingThreadsE>
        if (!head)
    800074b0:	f80792e3          	bnez	a5,80007434 <_ZN9SleepList14releaseThreadsEv+0x44>
    800074b4:	f79ff06f          	j	8000742c <_ZN9SleepList14releaseThreadsEv+0x3c>
}
    800074b8:	02813083          	ld	ra,40(sp)
    800074bc:	02013403          	ld	s0,32(sp)
    800074c0:	01813483          	ld	s1,24(sp)
    800074c4:	01013903          	ld	s2,16(sp)
    800074c8:	00813983          	ld	s3,8(sp)
    800074cc:	03010113          	addi	sp,sp,48
    800074d0:	00008067          	ret

00000000800074d4 <_ZN9SleepListnwEm>:
void *SleepList::operator new(size_t size) {
    800074d4:	fe010113          	addi	sp,sp,-32
    800074d8:	00113c23          	sd	ra,24(sp)
    800074dc:	00813823          	sd	s0,16(sp)
    800074e0:	00913423          	sd	s1,8(sp)
    800074e4:	02010413          	addi	s0,sp,32
    800074e8:	00050493          	mv	s1,a0
    static void* getMemory(size_t size) { return getInstance().IGetMemory(size); }
    800074ec:	ffffe097          	auipc	ra,0xffffe
    800074f0:	fd0080e7          	jalr	-48(ra) # 800054bc <_ZN15MemoryAllocator11getInstanceEv>
    800074f4:	00048593          	mv	a1,s1
    800074f8:	ffffe097          	auipc	ra,0xffffe
    800074fc:	020080e7          	jalr	32(ra) # 80005518 <_ZN15MemoryAllocator10IGetMemoryEm>
}
    80007500:	01813083          	ld	ra,24(sp)
    80007504:	01013403          	ld	s0,16(sp)
    80007508:	00813483          	ld	s1,8(sp)
    8000750c:	02010113          	addi	sp,sp,32
    80007510:	00008067          	ret

0000000080007514 <_ZN9SleepListnaEm>:
void *SleepList::operator new[](size_t size) {
    80007514:	fe010113          	addi	sp,sp,-32
    80007518:	00113c23          	sd	ra,24(sp)
    8000751c:	00813823          	sd	s0,16(sp)
    80007520:	00913423          	sd	s1,8(sp)
    80007524:	02010413          	addi	s0,sp,32
    80007528:	00050493          	mv	s1,a0
    8000752c:	ffffe097          	auipc	ra,0xffffe
    80007530:	f90080e7          	jalr	-112(ra) # 800054bc <_ZN15MemoryAllocator11getInstanceEv>
    80007534:	00048593          	mv	a1,s1
    80007538:	ffffe097          	auipc	ra,0xffffe
    8000753c:	fe0080e7          	jalr	-32(ra) # 80005518 <_ZN15MemoryAllocator10IGetMemoryEm>
}
    80007540:	01813083          	ld	ra,24(sp)
    80007544:	01013403          	ld	s0,16(sp)
    80007548:	00813483          	ld	s1,8(sp)
    8000754c:	02010113          	addi	sp,sp,32
    80007550:	00008067          	ret

0000000080007554 <_ZN9SleepListdlEPv>:
void SleepList::operator delete(void *addr) {
    80007554:	fe010113          	addi	sp,sp,-32
    80007558:	00113c23          	sd	ra,24(sp)
    8000755c:	00813823          	sd	s0,16(sp)
    80007560:	00913423          	sd	s1,8(sp)
    80007564:	02010413          	addi	s0,sp,32
    80007568:	00050493          	mv	s1,a0
    static int freeMemory(void* addr) { return getInstance().IFreeMemory(addr); }
    8000756c:	ffffe097          	auipc	ra,0xffffe
    80007570:	f50080e7          	jalr	-176(ra) # 800054bc <_ZN15MemoryAllocator11getInstanceEv>
    80007574:	00048593          	mv	a1,s1
    80007578:	ffffe097          	auipc	ra,0xffffe
    8000757c:	0cc080e7          	jalr	204(ra) # 80005644 <_ZN15MemoryAllocator11IFreeMemoryEPv>
}
    80007580:	01813083          	ld	ra,24(sp)
    80007584:	01013403          	ld	s0,16(sp)
    80007588:	00813483          	ld	s1,8(sp)
    8000758c:	02010113          	addi	sp,sp,32
    80007590:	00008067          	ret

0000000080007594 <_ZN9SleepListdaEPv>:
void SleepList::operator delete[](void *addr) {
    80007594:	fe010113          	addi	sp,sp,-32
    80007598:	00113c23          	sd	ra,24(sp)
    8000759c:	00813823          	sd	s0,16(sp)
    800075a0:	00913423          	sd	s1,8(sp)
    800075a4:	02010413          	addi	s0,sp,32
    800075a8:	00050493          	mv	s1,a0
    800075ac:	ffffe097          	auipc	ra,0xffffe
    800075b0:	f10080e7          	jalr	-240(ra) # 800054bc <_ZN15MemoryAllocator11getInstanceEv>
    800075b4:	00048593          	mv	a1,s1
    800075b8:	ffffe097          	auipc	ra,0xffffe
    800075bc:	08c080e7          	jalr	140(ra) # 80005644 <_ZN15MemoryAllocator11IFreeMemoryEPv>
}
    800075c0:	01813083          	ld	ra,24(sp)
    800075c4:	01013403          	ld	s0,16(sp)
    800075c8:	00813483          	ld	s1,8(sp)
    800075cc:	02010113          	addi	sp,sp,32
    800075d0:	00008067          	ret

00000000800075d4 <_ZN9SleepList9emptyListEv>:
void SleepList::emptyList() {
    800075d4:	fd010113          	addi	sp,sp,-48
    800075d8:	02113423          	sd	ra,40(sp)
    800075dc:	02813023          	sd	s0,32(sp)
    800075e0:	00913c23          	sd	s1,24(sp)
    800075e4:	01213823          	sd	s2,16(sp)
    800075e8:	01313423          	sd	s3,8(sp)
    800075ec:	03010413          	addi	s0,sp,48
        if (!head)
    800075f0:	0000c497          	auipc	s1,0xc
    800075f4:	ab84b483          	ld	s1,-1352(s1) # 800130a8 <_ZN9SleepList15sleepingThreadsE>
    800075f8:	04048063          	beqz	s1,80007638 <_ZN9SleepList9emptyListEv+0x64>
        head = head->next;
    800075fc:	0084b783          	ld	a5,8(s1)
    80007600:	0000c717          	auipc	a4,0xc
    80007604:	aaf73423          	sd	a5,-1368(a4) # 800130a8 <_ZN9SleepList15sleepingThreadsE>
        if (!head)
    80007608:	02078263          	beqz	a5,8000762c <_ZN9SleepList9emptyListEv+0x58>
        T *ret = elem->data;
    8000760c:	0004b903          	ld	s2,0(s1)
            SlabAllocator::getInstance().deallocKernel(addr, SlabAllocator::LISTELEM);
    80007610:	ffffd097          	auipc	ra,0xffffd
    80007614:	4b8080e7          	jalr	1208(ra) # 80004ac8 <_ZN13SlabAllocator11getInstanceEv>
    80007618:	00200613          	li	a2,2
    8000761c:	00048593          	mv	a1,s1
    80007620:	ffffe097          	auipc	ra,0xffffe
    80007624:	990080e7          	jalr	-1648(ra) # 80004fb0 <_ZN13SlabAllocator13deallocKernelEPvNS_16kernelCacheEntryE>
        return ret;
    80007628:	0540006f          	j	8000767c <_ZN9SleepList9emptyListEv+0xa8>
            tail = 0;
    8000762c:	0000c797          	auipc	a5,0xc
    80007630:	a807b223          	sd	zero,-1404(a5) # 800130b0 <_ZN9SleepList15sleepingThreadsE+0x8>
    80007634:	fd9ff06f          	j	8000760c <_ZN9SleepList9emptyListEv+0x38>
            return 0;
    80007638:	00048913          	mv	s2,s1
    Sleep* old = nullptr;
    8000763c:	0400006f          	j	8000767c <_ZN9SleepList9emptyListEv+0xa8>
            tail = 0;
    80007640:	0000c797          	auipc	a5,0xc
    80007644:	a607b823          	sd	zero,-1424(a5) # 800130b0 <_ZN9SleepList15sleepingThreadsE+0x8>
    80007648:	0540006f          	j	8000769c <_ZN9SleepList9emptyListEv+0xc8>
            return 0;
    8000764c:	00048993          	mv	s3,s1
    80007650:	0680006f          	j	800076b8 <_ZN9SleepList9emptyListEv+0xe4>
            head = tail = elem;
    80007654:	00005797          	auipc	a5,0x5
    80007658:	6947b783          	ld	a5,1684(a5) # 8000cce8 <_GLOBAL_OFFSET_TABLE_+0x30>
    8000765c:	00a7b423          	sd	a0,8(a5)
    80007660:	00a7b023          	sd	a0,0(a5)
    80007664:	ffffe097          	auipc	ra,0xffffe
    80007668:	e58080e7          	jalr	-424(ra) # 800054bc <_ZN15MemoryAllocator11getInstanceEv>
    8000766c:	00090593          	mv	a1,s2
    80007670:	ffffe097          	auipc	ra,0xffffe
    80007674:	fd4080e7          	jalr	-44(ra) # 80005644 <_ZN15MemoryAllocator11IFreeMemoryEPv>
        p = sleepingThreads.removeFirst();
    80007678:	00098913          	mv	s2,s3
    while(p){
    8000767c:	08090663          	beqz	s2,80007708 <_ZN9SleepList9emptyListEv+0x134>
        if (!head)
    80007680:	0000c497          	auipc	s1,0xc
    80007684:	a284b483          	ld	s1,-1496(s1) # 800130a8 <_ZN9SleepList15sleepingThreadsE>
    80007688:	fc0482e3          	beqz	s1,8000764c <_ZN9SleepList9emptyListEv+0x78>
        head = head->next;
    8000768c:	0084b783          	ld	a5,8(s1)
    80007690:	0000c717          	auipc	a4,0xc
    80007694:	a0f73c23          	sd	a5,-1512(a4) # 800130a8 <_ZN9SleepList15sleepingThreadsE>
        if (!head)
    80007698:	fa0784e3          	beqz	a5,80007640 <_ZN9SleepList9emptyListEv+0x6c>
        T *ret = elem->data;
    8000769c:	0004b983          	ld	s3,0(s1)
            SlabAllocator::getInstance().deallocKernel(addr, SlabAllocator::LISTELEM);
    800076a0:	ffffd097          	auipc	ra,0xffffd
    800076a4:	428080e7          	jalr	1064(ra) # 80004ac8 <_ZN13SlabAllocator11getInstanceEv>
    800076a8:	00200613          	li	a2,2
    800076ac:	00048593          	mv	a1,s1
    800076b0:	ffffe097          	auipc	ra,0xffffe
    800076b4:	900080e7          	jalr	-1792(ra) # 80004fb0 <_ZN13SlabAllocator13deallocKernelEPvNS_16kernelCacheEntryE>
        TCB* t = old->thread;
    800076b8:	00893483          	ld	s1,8(s2)
            void* addr = SlabAllocator::getInstance().allocKernel(size, SlabAllocator::LISTELEM);
    800076bc:	ffffd097          	auipc	ra,0xffffd
    800076c0:	40c080e7          	jalr	1036(ra) # 80004ac8 <_ZN13SlabAllocator11getInstanceEv>
    800076c4:	00200613          	li	a2,2
    800076c8:	01000593          	li	a1,16
    800076cc:	ffffd097          	auipc	ra,0xffffd
    800076d0:	788080e7          	jalr	1928(ra) # 80004e54 <_ZN13SlabAllocator11allocKernelEmNS_16kernelCacheEntryE>
        Elem *elem = new Elem(data, 0);
    800076d4:	00050663          	beqz	a0,800076e0 <_ZN9SleepList9emptyListEv+0x10c>
        Elem(T *data, Elem *next) : data(data), next(next) {}
    800076d8:	00953023          	sd	s1,0(a0)
    800076dc:	00053423          	sd	zero,8(a0)
        if(!elem)
    800076e0:	f80502e3          	beqz	a0,80007664 <_ZN9SleepList9emptyListEv+0x90>
        if (tail){
    800076e4:	00005797          	auipc	a5,0x5
    800076e8:	6047b783          	ld	a5,1540(a5) # 8000cce8 <_GLOBAL_OFFSET_TABLE_+0x30>
    800076ec:	0087b783          	ld	a5,8(a5)
    800076f0:	f60782e3          	beqz	a5,80007654 <_ZN9SleepList9emptyListEv+0x80>
            tail->next = elem;
    800076f4:	00a7b423          	sd	a0,8(a5)
            tail = elem;
    800076f8:	00005797          	auipc	a5,0x5
    800076fc:	5f07b783          	ld	a5,1520(a5) # 8000cce8 <_GLOBAL_OFFSET_TABLE_+0x30>
    80007700:	00a7b423          	sd	a0,8(a5)
    80007704:	f61ff06f          	j	80007664 <_ZN9SleepList9emptyListEv+0x90>
}
    80007708:	02813083          	ld	ra,40(sp)
    8000770c:	02013403          	ld	s0,32(sp)
    80007710:	01813483          	ld	s1,24(sp)
    80007714:	01013903          	ld	s2,16(sp)
    80007718:	00813983          	ld	s3,8(sp)
    8000771c:	03010113          	addi	sp,sp,48
    80007720:	00008067          	ret

0000000080007724 <_GLOBAL__sub_I__ZN9SleepList15sleepingThreadsE>:
    80007724:	ff010113          	addi	sp,sp,-16
    80007728:	00113423          	sd	ra,8(sp)
    8000772c:	00813023          	sd	s0,0(sp)
    80007730:	01010413          	addi	s0,sp,16
    80007734:	000105b7          	lui	a1,0x10
    80007738:	fff58593          	addi	a1,a1,-1 # ffff <_entry-0x7fff0001>
    8000773c:	00100513          	li	a0,1
    80007740:	00000097          	auipc	ra,0x0
    80007744:	990080e7          	jalr	-1648(ra) # 800070d0 <_Z41__static_initialization_and_destruction_0ii>
    80007748:	00813083          	ld	ra,8(sp)
    8000774c:	00013403          	ld	s0,0(sp)
    80007750:	01010113          	addi	sp,sp,16
    80007754:	00008067          	ret

0000000080007758 <start>:
    80007758:	ff010113          	addi	sp,sp,-16
    8000775c:	00813423          	sd	s0,8(sp)
    80007760:	01010413          	addi	s0,sp,16
    80007764:	300027f3          	csrr	a5,mstatus
    80007768:	ffffe737          	lui	a4,0xffffe
    8000776c:	7ff70713          	addi	a4,a4,2047 # ffffffffffffe7ff <end+0xffffffff7ffea4df>
    80007770:	00e7f7b3          	and	a5,a5,a4
    80007774:	00001737          	lui	a4,0x1
    80007778:	80070713          	addi	a4,a4,-2048 # 800 <_entry-0x7ffff800>
    8000777c:	00e7e7b3          	or	a5,a5,a4
    80007780:	30079073          	csrw	mstatus,a5
    80007784:	00000797          	auipc	a5,0x0
    80007788:	16078793          	addi	a5,a5,352 # 800078e4 <system_main>
    8000778c:	34179073          	csrw	mepc,a5
    80007790:	00000793          	li	a5,0
    80007794:	18079073          	csrw	satp,a5
    80007798:	000107b7          	lui	a5,0x10
    8000779c:	fff78793          	addi	a5,a5,-1 # ffff <_entry-0x7fff0001>
    800077a0:	30279073          	csrw	medeleg,a5
    800077a4:	30379073          	csrw	mideleg,a5
    800077a8:	104027f3          	csrr	a5,sie
    800077ac:	2227e793          	ori	a5,a5,546
    800077b0:	10479073          	csrw	sie,a5
    800077b4:	fff00793          	li	a5,-1
    800077b8:	00a7d793          	srli	a5,a5,0xa
    800077bc:	3b079073          	csrw	pmpaddr0,a5
    800077c0:	00f00793          	li	a5,15
    800077c4:	3a079073          	csrw	pmpcfg0,a5
    800077c8:	f14027f3          	csrr	a5,mhartid
    800077cc:	0200c737          	lui	a4,0x200c
    800077d0:	ff873583          	ld	a1,-8(a4) # 200bff8 <_entry-0x7dff4008>
    800077d4:	0007869b          	sext.w	a3,a5
    800077d8:	00269713          	slli	a4,a3,0x2
    800077dc:	000f4637          	lui	a2,0xf4
    800077e0:	24060613          	addi	a2,a2,576 # f4240 <_entry-0x7ff0bdc0>
    800077e4:	00d70733          	add	a4,a4,a3
    800077e8:	0037979b          	slliw	a5,a5,0x3
    800077ec:	020046b7          	lui	a3,0x2004
    800077f0:	00d787b3          	add	a5,a5,a3
    800077f4:	00c585b3          	add	a1,a1,a2
    800077f8:	00371693          	slli	a3,a4,0x3
    800077fc:	0000c717          	auipc	a4,0xc
    80007800:	8c470713          	addi	a4,a4,-1852 # 800130c0 <timer_scratch>
    80007804:	00b7b023          	sd	a1,0(a5)
    80007808:	00d70733          	add	a4,a4,a3
    8000780c:	00f73c23          	sd	a5,24(a4)
    80007810:	02c73023          	sd	a2,32(a4)
    80007814:	34071073          	csrw	mscratch,a4
    80007818:	00000797          	auipc	a5,0x0
    8000781c:	6e878793          	addi	a5,a5,1768 # 80007f00 <timervec>
    80007820:	30579073          	csrw	mtvec,a5
    80007824:	300027f3          	csrr	a5,mstatus
    80007828:	0087e793          	ori	a5,a5,8
    8000782c:	30079073          	csrw	mstatus,a5
    80007830:	304027f3          	csrr	a5,mie
    80007834:	0807e793          	ori	a5,a5,128
    80007838:	30479073          	csrw	mie,a5
    8000783c:	f14027f3          	csrr	a5,mhartid
    80007840:	0007879b          	sext.w	a5,a5
    80007844:	00078213          	mv	tp,a5
    80007848:	30200073          	mret
    8000784c:	00813403          	ld	s0,8(sp)
    80007850:	01010113          	addi	sp,sp,16
    80007854:	00008067          	ret

0000000080007858 <timerinit>:
    80007858:	ff010113          	addi	sp,sp,-16
    8000785c:	00813423          	sd	s0,8(sp)
    80007860:	01010413          	addi	s0,sp,16
    80007864:	f14027f3          	csrr	a5,mhartid
    80007868:	0200c737          	lui	a4,0x200c
    8000786c:	ff873583          	ld	a1,-8(a4) # 200bff8 <_entry-0x7dff4008>
    80007870:	0007869b          	sext.w	a3,a5
    80007874:	00269713          	slli	a4,a3,0x2
    80007878:	000f4637          	lui	a2,0xf4
    8000787c:	24060613          	addi	a2,a2,576 # f4240 <_entry-0x7ff0bdc0>
    80007880:	00d70733          	add	a4,a4,a3
    80007884:	0037979b          	slliw	a5,a5,0x3
    80007888:	020046b7          	lui	a3,0x2004
    8000788c:	00d787b3          	add	a5,a5,a3
    80007890:	00c585b3          	add	a1,a1,a2
    80007894:	00371693          	slli	a3,a4,0x3
    80007898:	0000c717          	auipc	a4,0xc
    8000789c:	82870713          	addi	a4,a4,-2008 # 800130c0 <timer_scratch>
    800078a0:	00b7b023          	sd	a1,0(a5)
    800078a4:	00d70733          	add	a4,a4,a3
    800078a8:	00f73c23          	sd	a5,24(a4)
    800078ac:	02c73023          	sd	a2,32(a4)
    800078b0:	34071073          	csrw	mscratch,a4
    800078b4:	00000797          	auipc	a5,0x0
    800078b8:	64c78793          	addi	a5,a5,1612 # 80007f00 <timervec>
    800078bc:	30579073          	csrw	mtvec,a5
    800078c0:	300027f3          	csrr	a5,mstatus
    800078c4:	0087e793          	ori	a5,a5,8
    800078c8:	30079073          	csrw	mstatus,a5
    800078cc:	304027f3          	csrr	a5,mie
    800078d0:	0807e793          	ori	a5,a5,128
    800078d4:	30479073          	csrw	mie,a5
    800078d8:	00813403          	ld	s0,8(sp)
    800078dc:	01010113          	addi	sp,sp,16
    800078e0:	00008067          	ret

00000000800078e4 <system_main>:
    800078e4:	fe010113          	addi	sp,sp,-32
    800078e8:	00813823          	sd	s0,16(sp)
    800078ec:	00913423          	sd	s1,8(sp)
    800078f0:	00113c23          	sd	ra,24(sp)
    800078f4:	02010413          	addi	s0,sp,32
    800078f8:	00000097          	auipc	ra,0x0
    800078fc:	0c4080e7          	jalr	196(ra) # 800079bc <cpuid>
    80007900:	00005497          	auipc	s1,0x5
    80007904:	47048493          	addi	s1,s1,1136 # 8000cd70 <started>
    80007908:	02050263          	beqz	a0,8000792c <system_main+0x48>
    8000790c:	0004a783          	lw	a5,0(s1)
    80007910:	0007879b          	sext.w	a5,a5
    80007914:	fe078ce3          	beqz	a5,8000790c <system_main+0x28>
    80007918:	0ff0000f          	fence
    8000791c:	00003517          	auipc	a0,0x3
    80007920:	b6450513          	addi	a0,a0,-1180 # 8000a480 <CONSOLE_STATUS+0x470>
    80007924:	00001097          	auipc	ra,0x1
    80007928:	a78080e7          	jalr	-1416(ra) # 8000839c <panic>
    8000792c:	00001097          	auipc	ra,0x1
    80007930:	9cc080e7          	jalr	-1588(ra) # 800082f8 <consoleinit>
    80007934:	00001097          	auipc	ra,0x1
    80007938:	158080e7          	jalr	344(ra) # 80008a8c <printfinit>
    8000793c:	00003517          	auipc	a0,0x3
    80007940:	87c50513          	addi	a0,a0,-1924 # 8000a1b8 <CONSOLE_STATUS+0x1a8>
    80007944:	00001097          	auipc	ra,0x1
    80007948:	ab4080e7          	jalr	-1356(ra) # 800083f8 <__printf>
    8000794c:	00003517          	auipc	a0,0x3
    80007950:	b0450513          	addi	a0,a0,-1276 # 8000a450 <CONSOLE_STATUS+0x440>
    80007954:	00001097          	auipc	ra,0x1
    80007958:	aa4080e7          	jalr	-1372(ra) # 800083f8 <__printf>
    8000795c:	00003517          	auipc	a0,0x3
    80007960:	85c50513          	addi	a0,a0,-1956 # 8000a1b8 <CONSOLE_STATUS+0x1a8>
    80007964:	00001097          	auipc	ra,0x1
    80007968:	a94080e7          	jalr	-1388(ra) # 800083f8 <__printf>
    8000796c:	00001097          	auipc	ra,0x1
    80007970:	4ac080e7          	jalr	1196(ra) # 80008e18 <kinit>
    80007974:	00000097          	auipc	ra,0x0
    80007978:	148080e7          	jalr	328(ra) # 80007abc <trapinit>
    8000797c:	00000097          	auipc	ra,0x0
    80007980:	16c080e7          	jalr	364(ra) # 80007ae8 <trapinithart>
    80007984:	00000097          	auipc	ra,0x0
    80007988:	5bc080e7          	jalr	1468(ra) # 80007f40 <plicinit>
    8000798c:	00000097          	auipc	ra,0x0
    80007990:	5dc080e7          	jalr	1500(ra) # 80007f68 <plicinithart>
    80007994:	00000097          	auipc	ra,0x0
    80007998:	078080e7          	jalr	120(ra) # 80007a0c <userinit>
    8000799c:	0ff0000f          	fence
    800079a0:	00100793          	li	a5,1
    800079a4:	00003517          	auipc	a0,0x3
    800079a8:	ac450513          	addi	a0,a0,-1340 # 8000a468 <CONSOLE_STATUS+0x458>
    800079ac:	00f4a023          	sw	a5,0(s1)
    800079b0:	00001097          	auipc	ra,0x1
    800079b4:	a48080e7          	jalr	-1464(ra) # 800083f8 <__printf>
    800079b8:	0000006f          	j	800079b8 <system_main+0xd4>

00000000800079bc <cpuid>:
    800079bc:	ff010113          	addi	sp,sp,-16
    800079c0:	00813423          	sd	s0,8(sp)
    800079c4:	01010413          	addi	s0,sp,16
    800079c8:	00020513          	mv	a0,tp
    800079cc:	00813403          	ld	s0,8(sp)
    800079d0:	0005051b          	sext.w	a0,a0
    800079d4:	01010113          	addi	sp,sp,16
    800079d8:	00008067          	ret

00000000800079dc <mycpu>:
    800079dc:	ff010113          	addi	sp,sp,-16
    800079e0:	00813423          	sd	s0,8(sp)
    800079e4:	01010413          	addi	s0,sp,16
    800079e8:	00020793          	mv	a5,tp
    800079ec:	00813403          	ld	s0,8(sp)
    800079f0:	0007879b          	sext.w	a5,a5
    800079f4:	00779793          	slli	a5,a5,0x7
    800079f8:	0000c517          	auipc	a0,0xc
    800079fc:	6f850513          	addi	a0,a0,1784 # 800140f0 <cpus>
    80007a00:	00f50533          	add	a0,a0,a5
    80007a04:	01010113          	addi	sp,sp,16
    80007a08:	00008067          	ret

0000000080007a0c <userinit>:
    80007a0c:	ff010113          	addi	sp,sp,-16
    80007a10:	00813423          	sd	s0,8(sp)
    80007a14:	01010413          	addi	s0,sp,16
    80007a18:	00813403          	ld	s0,8(sp)
    80007a1c:	01010113          	addi	sp,sp,16
    80007a20:	ffffc317          	auipc	t1,0xffffc
    80007a24:	5d030067          	jr	1488(t1) # 80003ff0 <main>

0000000080007a28 <either_copyout>:
    80007a28:	ff010113          	addi	sp,sp,-16
    80007a2c:	00813023          	sd	s0,0(sp)
    80007a30:	00113423          	sd	ra,8(sp)
    80007a34:	01010413          	addi	s0,sp,16
    80007a38:	02051663          	bnez	a0,80007a64 <either_copyout+0x3c>
    80007a3c:	00058513          	mv	a0,a1
    80007a40:	00060593          	mv	a1,a2
    80007a44:	0006861b          	sext.w	a2,a3
    80007a48:	00002097          	auipc	ra,0x2
    80007a4c:	c5c080e7          	jalr	-932(ra) # 800096a4 <__memmove>
    80007a50:	00813083          	ld	ra,8(sp)
    80007a54:	00013403          	ld	s0,0(sp)
    80007a58:	00000513          	li	a0,0
    80007a5c:	01010113          	addi	sp,sp,16
    80007a60:	00008067          	ret
    80007a64:	00003517          	auipc	a0,0x3
    80007a68:	a4450513          	addi	a0,a0,-1468 # 8000a4a8 <CONSOLE_STATUS+0x498>
    80007a6c:	00001097          	auipc	ra,0x1
    80007a70:	930080e7          	jalr	-1744(ra) # 8000839c <panic>

0000000080007a74 <either_copyin>:
    80007a74:	ff010113          	addi	sp,sp,-16
    80007a78:	00813023          	sd	s0,0(sp)
    80007a7c:	00113423          	sd	ra,8(sp)
    80007a80:	01010413          	addi	s0,sp,16
    80007a84:	02059463          	bnez	a1,80007aac <either_copyin+0x38>
    80007a88:	00060593          	mv	a1,a2
    80007a8c:	0006861b          	sext.w	a2,a3
    80007a90:	00002097          	auipc	ra,0x2
    80007a94:	c14080e7          	jalr	-1004(ra) # 800096a4 <__memmove>
    80007a98:	00813083          	ld	ra,8(sp)
    80007a9c:	00013403          	ld	s0,0(sp)
    80007aa0:	00000513          	li	a0,0
    80007aa4:	01010113          	addi	sp,sp,16
    80007aa8:	00008067          	ret
    80007aac:	00003517          	auipc	a0,0x3
    80007ab0:	a2450513          	addi	a0,a0,-1500 # 8000a4d0 <CONSOLE_STATUS+0x4c0>
    80007ab4:	00001097          	auipc	ra,0x1
    80007ab8:	8e8080e7          	jalr	-1816(ra) # 8000839c <panic>

0000000080007abc <trapinit>:
    80007abc:	ff010113          	addi	sp,sp,-16
    80007ac0:	00813423          	sd	s0,8(sp)
    80007ac4:	01010413          	addi	s0,sp,16
    80007ac8:	00813403          	ld	s0,8(sp)
    80007acc:	00003597          	auipc	a1,0x3
    80007ad0:	a2c58593          	addi	a1,a1,-1492 # 8000a4f8 <CONSOLE_STATUS+0x4e8>
    80007ad4:	0000c517          	auipc	a0,0xc
    80007ad8:	69c50513          	addi	a0,a0,1692 # 80014170 <tickslock>
    80007adc:	01010113          	addi	sp,sp,16
    80007ae0:	00001317          	auipc	t1,0x1
    80007ae4:	5c830067          	jr	1480(t1) # 800090a8 <initlock>

0000000080007ae8 <trapinithart>:
    80007ae8:	ff010113          	addi	sp,sp,-16
    80007aec:	00813423          	sd	s0,8(sp)
    80007af0:	01010413          	addi	s0,sp,16
    80007af4:	00000797          	auipc	a5,0x0
    80007af8:	2fc78793          	addi	a5,a5,764 # 80007df0 <kernelvec>
    80007afc:	10579073          	csrw	stvec,a5
    80007b00:	00813403          	ld	s0,8(sp)
    80007b04:	01010113          	addi	sp,sp,16
    80007b08:	00008067          	ret

0000000080007b0c <usertrap>:
    80007b0c:	ff010113          	addi	sp,sp,-16
    80007b10:	00813423          	sd	s0,8(sp)
    80007b14:	01010413          	addi	s0,sp,16
    80007b18:	00813403          	ld	s0,8(sp)
    80007b1c:	01010113          	addi	sp,sp,16
    80007b20:	00008067          	ret

0000000080007b24 <usertrapret>:
    80007b24:	ff010113          	addi	sp,sp,-16
    80007b28:	00813423          	sd	s0,8(sp)
    80007b2c:	01010413          	addi	s0,sp,16
    80007b30:	00813403          	ld	s0,8(sp)
    80007b34:	01010113          	addi	sp,sp,16
    80007b38:	00008067          	ret

0000000080007b3c <kerneltrap>:
    80007b3c:	fe010113          	addi	sp,sp,-32
    80007b40:	00813823          	sd	s0,16(sp)
    80007b44:	00113c23          	sd	ra,24(sp)
    80007b48:	00913423          	sd	s1,8(sp)
    80007b4c:	02010413          	addi	s0,sp,32
    80007b50:	142025f3          	csrr	a1,scause
    80007b54:	100027f3          	csrr	a5,sstatus
    80007b58:	0027f793          	andi	a5,a5,2
    80007b5c:	10079c63          	bnez	a5,80007c74 <kerneltrap+0x138>
    80007b60:	142027f3          	csrr	a5,scause
    80007b64:	0207ce63          	bltz	a5,80007ba0 <kerneltrap+0x64>
    80007b68:	00003517          	auipc	a0,0x3
    80007b6c:	9d850513          	addi	a0,a0,-1576 # 8000a540 <CONSOLE_STATUS+0x530>
    80007b70:	00001097          	auipc	ra,0x1
    80007b74:	888080e7          	jalr	-1912(ra) # 800083f8 <__printf>
    80007b78:	141025f3          	csrr	a1,sepc
    80007b7c:	14302673          	csrr	a2,stval
    80007b80:	00003517          	auipc	a0,0x3
    80007b84:	9d050513          	addi	a0,a0,-1584 # 8000a550 <CONSOLE_STATUS+0x540>
    80007b88:	00001097          	auipc	ra,0x1
    80007b8c:	870080e7          	jalr	-1936(ra) # 800083f8 <__printf>
    80007b90:	00003517          	auipc	a0,0x3
    80007b94:	9d850513          	addi	a0,a0,-1576 # 8000a568 <CONSOLE_STATUS+0x558>
    80007b98:	00001097          	auipc	ra,0x1
    80007b9c:	804080e7          	jalr	-2044(ra) # 8000839c <panic>
    80007ba0:	0ff7f713          	andi	a4,a5,255
    80007ba4:	00900693          	li	a3,9
    80007ba8:	04d70063          	beq	a4,a3,80007be8 <kerneltrap+0xac>
    80007bac:	fff00713          	li	a4,-1
    80007bb0:	03f71713          	slli	a4,a4,0x3f
    80007bb4:	00170713          	addi	a4,a4,1
    80007bb8:	fae798e3          	bne	a5,a4,80007b68 <kerneltrap+0x2c>
    80007bbc:	00000097          	auipc	ra,0x0
    80007bc0:	e00080e7          	jalr	-512(ra) # 800079bc <cpuid>
    80007bc4:	06050663          	beqz	a0,80007c30 <kerneltrap+0xf4>
    80007bc8:	144027f3          	csrr	a5,sip
    80007bcc:	ffd7f793          	andi	a5,a5,-3
    80007bd0:	14479073          	csrw	sip,a5
    80007bd4:	01813083          	ld	ra,24(sp)
    80007bd8:	01013403          	ld	s0,16(sp)
    80007bdc:	00813483          	ld	s1,8(sp)
    80007be0:	02010113          	addi	sp,sp,32
    80007be4:	00008067          	ret
    80007be8:	00000097          	auipc	ra,0x0
    80007bec:	3cc080e7          	jalr	972(ra) # 80007fb4 <plic_claim>
    80007bf0:	00a00793          	li	a5,10
    80007bf4:	00050493          	mv	s1,a0
    80007bf8:	06f50863          	beq	a0,a5,80007c68 <kerneltrap+0x12c>
    80007bfc:	fc050ce3          	beqz	a0,80007bd4 <kerneltrap+0x98>
    80007c00:	00050593          	mv	a1,a0
    80007c04:	00003517          	auipc	a0,0x3
    80007c08:	91c50513          	addi	a0,a0,-1764 # 8000a520 <CONSOLE_STATUS+0x510>
    80007c0c:	00000097          	auipc	ra,0x0
    80007c10:	7ec080e7          	jalr	2028(ra) # 800083f8 <__printf>
    80007c14:	01013403          	ld	s0,16(sp)
    80007c18:	01813083          	ld	ra,24(sp)
    80007c1c:	00048513          	mv	a0,s1
    80007c20:	00813483          	ld	s1,8(sp)
    80007c24:	02010113          	addi	sp,sp,32
    80007c28:	00000317          	auipc	t1,0x0
    80007c2c:	3c430067          	jr	964(t1) # 80007fec <plic_complete>
    80007c30:	0000c517          	auipc	a0,0xc
    80007c34:	54050513          	addi	a0,a0,1344 # 80014170 <tickslock>
    80007c38:	00001097          	auipc	ra,0x1
    80007c3c:	494080e7          	jalr	1172(ra) # 800090cc <acquire>
    80007c40:	00005717          	auipc	a4,0x5
    80007c44:	13470713          	addi	a4,a4,308 # 8000cd74 <ticks>
    80007c48:	00072783          	lw	a5,0(a4)
    80007c4c:	0000c517          	auipc	a0,0xc
    80007c50:	52450513          	addi	a0,a0,1316 # 80014170 <tickslock>
    80007c54:	0017879b          	addiw	a5,a5,1
    80007c58:	00f72023          	sw	a5,0(a4)
    80007c5c:	00001097          	auipc	ra,0x1
    80007c60:	53c080e7          	jalr	1340(ra) # 80009198 <release>
    80007c64:	f65ff06f          	j	80007bc8 <kerneltrap+0x8c>
    80007c68:	00001097          	auipc	ra,0x1
    80007c6c:	098080e7          	jalr	152(ra) # 80008d00 <uartintr>
    80007c70:	fa5ff06f          	j	80007c14 <kerneltrap+0xd8>
    80007c74:	00003517          	auipc	a0,0x3
    80007c78:	88c50513          	addi	a0,a0,-1908 # 8000a500 <CONSOLE_STATUS+0x4f0>
    80007c7c:	00000097          	auipc	ra,0x0
    80007c80:	720080e7          	jalr	1824(ra) # 8000839c <panic>

0000000080007c84 <clockintr>:
    80007c84:	fe010113          	addi	sp,sp,-32
    80007c88:	00813823          	sd	s0,16(sp)
    80007c8c:	00913423          	sd	s1,8(sp)
    80007c90:	00113c23          	sd	ra,24(sp)
    80007c94:	02010413          	addi	s0,sp,32
    80007c98:	0000c497          	auipc	s1,0xc
    80007c9c:	4d848493          	addi	s1,s1,1240 # 80014170 <tickslock>
    80007ca0:	00048513          	mv	a0,s1
    80007ca4:	00001097          	auipc	ra,0x1
    80007ca8:	428080e7          	jalr	1064(ra) # 800090cc <acquire>
    80007cac:	00005717          	auipc	a4,0x5
    80007cb0:	0c870713          	addi	a4,a4,200 # 8000cd74 <ticks>
    80007cb4:	00072783          	lw	a5,0(a4)
    80007cb8:	01013403          	ld	s0,16(sp)
    80007cbc:	01813083          	ld	ra,24(sp)
    80007cc0:	00048513          	mv	a0,s1
    80007cc4:	0017879b          	addiw	a5,a5,1
    80007cc8:	00813483          	ld	s1,8(sp)
    80007ccc:	00f72023          	sw	a5,0(a4)
    80007cd0:	02010113          	addi	sp,sp,32
    80007cd4:	00001317          	auipc	t1,0x1
    80007cd8:	4c430067          	jr	1220(t1) # 80009198 <release>

0000000080007cdc <devintr>:
    80007cdc:	142027f3          	csrr	a5,scause
    80007ce0:	00000513          	li	a0,0
    80007ce4:	0007c463          	bltz	a5,80007cec <devintr+0x10>
    80007ce8:	00008067          	ret
    80007cec:	fe010113          	addi	sp,sp,-32
    80007cf0:	00813823          	sd	s0,16(sp)
    80007cf4:	00113c23          	sd	ra,24(sp)
    80007cf8:	00913423          	sd	s1,8(sp)
    80007cfc:	02010413          	addi	s0,sp,32
    80007d00:	0ff7f713          	andi	a4,a5,255
    80007d04:	00900693          	li	a3,9
    80007d08:	04d70c63          	beq	a4,a3,80007d60 <devintr+0x84>
    80007d0c:	fff00713          	li	a4,-1
    80007d10:	03f71713          	slli	a4,a4,0x3f
    80007d14:	00170713          	addi	a4,a4,1
    80007d18:	00e78c63          	beq	a5,a4,80007d30 <devintr+0x54>
    80007d1c:	01813083          	ld	ra,24(sp)
    80007d20:	01013403          	ld	s0,16(sp)
    80007d24:	00813483          	ld	s1,8(sp)
    80007d28:	02010113          	addi	sp,sp,32
    80007d2c:	00008067          	ret
    80007d30:	00000097          	auipc	ra,0x0
    80007d34:	c8c080e7          	jalr	-884(ra) # 800079bc <cpuid>
    80007d38:	06050663          	beqz	a0,80007da4 <devintr+0xc8>
    80007d3c:	144027f3          	csrr	a5,sip
    80007d40:	ffd7f793          	andi	a5,a5,-3
    80007d44:	14479073          	csrw	sip,a5
    80007d48:	01813083          	ld	ra,24(sp)
    80007d4c:	01013403          	ld	s0,16(sp)
    80007d50:	00813483          	ld	s1,8(sp)
    80007d54:	00200513          	li	a0,2
    80007d58:	02010113          	addi	sp,sp,32
    80007d5c:	00008067          	ret
    80007d60:	00000097          	auipc	ra,0x0
    80007d64:	254080e7          	jalr	596(ra) # 80007fb4 <plic_claim>
    80007d68:	00a00793          	li	a5,10
    80007d6c:	00050493          	mv	s1,a0
    80007d70:	06f50663          	beq	a0,a5,80007ddc <devintr+0x100>
    80007d74:	00100513          	li	a0,1
    80007d78:	fa0482e3          	beqz	s1,80007d1c <devintr+0x40>
    80007d7c:	00048593          	mv	a1,s1
    80007d80:	00002517          	auipc	a0,0x2
    80007d84:	7a050513          	addi	a0,a0,1952 # 8000a520 <CONSOLE_STATUS+0x510>
    80007d88:	00000097          	auipc	ra,0x0
    80007d8c:	670080e7          	jalr	1648(ra) # 800083f8 <__printf>
    80007d90:	00048513          	mv	a0,s1
    80007d94:	00000097          	auipc	ra,0x0
    80007d98:	258080e7          	jalr	600(ra) # 80007fec <plic_complete>
    80007d9c:	00100513          	li	a0,1
    80007da0:	f7dff06f          	j	80007d1c <devintr+0x40>
    80007da4:	0000c517          	auipc	a0,0xc
    80007da8:	3cc50513          	addi	a0,a0,972 # 80014170 <tickslock>
    80007dac:	00001097          	auipc	ra,0x1
    80007db0:	320080e7          	jalr	800(ra) # 800090cc <acquire>
    80007db4:	00005717          	auipc	a4,0x5
    80007db8:	fc070713          	addi	a4,a4,-64 # 8000cd74 <ticks>
    80007dbc:	00072783          	lw	a5,0(a4)
    80007dc0:	0000c517          	auipc	a0,0xc
    80007dc4:	3b050513          	addi	a0,a0,944 # 80014170 <tickslock>
    80007dc8:	0017879b          	addiw	a5,a5,1
    80007dcc:	00f72023          	sw	a5,0(a4)
    80007dd0:	00001097          	auipc	ra,0x1
    80007dd4:	3c8080e7          	jalr	968(ra) # 80009198 <release>
    80007dd8:	f65ff06f          	j	80007d3c <devintr+0x60>
    80007ddc:	00001097          	auipc	ra,0x1
    80007de0:	f24080e7          	jalr	-220(ra) # 80008d00 <uartintr>
    80007de4:	fadff06f          	j	80007d90 <devintr+0xb4>
	...

0000000080007df0 <kernelvec>:
    80007df0:	f0010113          	addi	sp,sp,-256
    80007df4:	00113023          	sd	ra,0(sp)
    80007df8:	00213423          	sd	sp,8(sp)
    80007dfc:	00313823          	sd	gp,16(sp)
    80007e00:	00413c23          	sd	tp,24(sp)
    80007e04:	02513023          	sd	t0,32(sp)
    80007e08:	02613423          	sd	t1,40(sp)
    80007e0c:	02713823          	sd	t2,48(sp)
    80007e10:	02813c23          	sd	s0,56(sp)
    80007e14:	04913023          	sd	s1,64(sp)
    80007e18:	04a13423          	sd	a0,72(sp)
    80007e1c:	04b13823          	sd	a1,80(sp)
    80007e20:	04c13c23          	sd	a2,88(sp)
    80007e24:	06d13023          	sd	a3,96(sp)
    80007e28:	06e13423          	sd	a4,104(sp)
    80007e2c:	06f13823          	sd	a5,112(sp)
    80007e30:	07013c23          	sd	a6,120(sp)
    80007e34:	09113023          	sd	a7,128(sp)
    80007e38:	09213423          	sd	s2,136(sp)
    80007e3c:	09313823          	sd	s3,144(sp)
    80007e40:	09413c23          	sd	s4,152(sp)
    80007e44:	0b513023          	sd	s5,160(sp)
    80007e48:	0b613423          	sd	s6,168(sp)
    80007e4c:	0b713823          	sd	s7,176(sp)
    80007e50:	0b813c23          	sd	s8,184(sp)
    80007e54:	0d913023          	sd	s9,192(sp)
    80007e58:	0da13423          	sd	s10,200(sp)
    80007e5c:	0db13823          	sd	s11,208(sp)
    80007e60:	0dc13c23          	sd	t3,216(sp)
    80007e64:	0fd13023          	sd	t4,224(sp)
    80007e68:	0fe13423          	sd	t5,232(sp)
    80007e6c:	0ff13823          	sd	t6,240(sp)
    80007e70:	ccdff0ef          	jal	ra,80007b3c <kerneltrap>
    80007e74:	00013083          	ld	ra,0(sp)
    80007e78:	00813103          	ld	sp,8(sp)
    80007e7c:	01013183          	ld	gp,16(sp)
    80007e80:	02013283          	ld	t0,32(sp)
    80007e84:	02813303          	ld	t1,40(sp)
    80007e88:	03013383          	ld	t2,48(sp)
    80007e8c:	03813403          	ld	s0,56(sp)
    80007e90:	04013483          	ld	s1,64(sp)
    80007e94:	04813503          	ld	a0,72(sp)
    80007e98:	05013583          	ld	a1,80(sp)
    80007e9c:	05813603          	ld	a2,88(sp)
    80007ea0:	06013683          	ld	a3,96(sp)
    80007ea4:	06813703          	ld	a4,104(sp)
    80007ea8:	07013783          	ld	a5,112(sp)
    80007eac:	07813803          	ld	a6,120(sp)
    80007eb0:	08013883          	ld	a7,128(sp)
    80007eb4:	08813903          	ld	s2,136(sp)
    80007eb8:	09013983          	ld	s3,144(sp)
    80007ebc:	09813a03          	ld	s4,152(sp)
    80007ec0:	0a013a83          	ld	s5,160(sp)
    80007ec4:	0a813b03          	ld	s6,168(sp)
    80007ec8:	0b013b83          	ld	s7,176(sp)
    80007ecc:	0b813c03          	ld	s8,184(sp)
    80007ed0:	0c013c83          	ld	s9,192(sp)
    80007ed4:	0c813d03          	ld	s10,200(sp)
    80007ed8:	0d013d83          	ld	s11,208(sp)
    80007edc:	0d813e03          	ld	t3,216(sp)
    80007ee0:	0e013e83          	ld	t4,224(sp)
    80007ee4:	0e813f03          	ld	t5,232(sp)
    80007ee8:	0f013f83          	ld	t6,240(sp)
    80007eec:	10010113          	addi	sp,sp,256
    80007ef0:	10200073          	sret
    80007ef4:	00000013          	nop
    80007ef8:	00000013          	nop
    80007efc:	00000013          	nop

0000000080007f00 <timervec>:
    80007f00:	34051573          	csrrw	a0,mscratch,a0
    80007f04:	00b53023          	sd	a1,0(a0)
    80007f08:	00c53423          	sd	a2,8(a0)
    80007f0c:	00d53823          	sd	a3,16(a0)
    80007f10:	01853583          	ld	a1,24(a0)
    80007f14:	02053603          	ld	a2,32(a0)
    80007f18:	0005b683          	ld	a3,0(a1)
    80007f1c:	00c686b3          	add	a3,a3,a2
    80007f20:	00d5b023          	sd	a3,0(a1)
    80007f24:	00200593          	li	a1,2
    80007f28:	14459073          	csrw	sip,a1
    80007f2c:	01053683          	ld	a3,16(a0)
    80007f30:	00853603          	ld	a2,8(a0)
    80007f34:	00053583          	ld	a1,0(a0)
    80007f38:	34051573          	csrrw	a0,mscratch,a0
    80007f3c:	30200073          	mret

0000000080007f40 <plicinit>:
    80007f40:	ff010113          	addi	sp,sp,-16
    80007f44:	00813423          	sd	s0,8(sp)
    80007f48:	01010413          	addi	s0,sp,16
    80007f4c:	00813403          	ld	s0,8(sp)
    80007f50:	0c0007b7          	lui	a5,0xc000
    80007f54:	00100713          	li	a4,1
    80007f58:	02e7a423          	sw	a4,40(a5) # c000028 <_entry-0x73ffffd8>
    80007f5c:	00e7a223          	sw	a4,4(a5)
    80007f60:	01010113          	addi	sp,sp,16
    80007f64:	00008067          	ret

0000000080007f68 <plicinithart>:
    80007f68:	ff010113          	addi	sp,sp,-16
    80007f6c:	00813023          	sd	s0,0(sp)
    80007f70:	00113423          	sd	ra,8(sp)
    80007f74:	01010413          	addi	s0,sp,16
    80007f78:	00000097          	auipc	ra,0x0
    80007f7c:	a44080e7          	jalr	-1468(ra) # 800079bc <cpuid>
    80007f80:	0085171b          	slliw	a4,a0,0x8
    80007f84:	0c0027b7          	lui	a5,0xc002
    80007f88:	00e787b3          	add	a5,a5,a4
    80007f8c:	40200713          	li	a4,1026
    80007f90:	08e7a023          	sw	a4,128(a5) # c002080 <_entry-0x73ffdf80>
    80007f94:	00813083          	ld	ra,8(sp)
    80007f98:	00013403          	ld	s0,0(sp)
    80007f9c:	00d5151b          	slliw	a0,a0,0xd
    80007fa0:	0c2017b7          	lui	a5,0xc201
    80007fa4:	00a78533          	add	a0,a5,a0
    80007fa8:	00052023          	sw	zero,0(a0)
    80007fac:	01010113          	addi	sp,sp,16
    80007fb0:	00008067          	ret

0000000080007fb4 <plic_claim>:
    80007fb4:	ff010113          	addi	sp,sp,-16
    80007fb8:	00813023          	sd	s0,0(sp)
    80007fbc:	00113423          	sd	ra,8(sp)
    80007fc0:	01010413          	addi	s0,sp,16
    80007fc4:	00000097          	auipc	ra,0x0
    80007fc8:	9f8080e7          	jalr	-1544(ra) # 800079bc <cpuid>
    80007fcc:	00813083          	ld	ra,8(sp)
    80007fd0:	00013403          	ld	s0,0(sp)
    80007fd4:	00d5151b          	slliw	a0,a0,0xd
    80007fd8:	0c2017b7          	lui	a5,0xc201
    80007fdc:	00a78533          	add	a0,a5,a0
    80007fe0:	00452503          	lw	a0,4(a0)
    80007fe4:	01010113          	addi	sp,sp,16
    80007fe8:	00008067          	ret

0000000080007fec <plic_complete>:
    80007fec:	fe010113          	addi	sp,sp,-32
    80007ff0:	00813823          	sd	s0,16(sp)
    80007ff4:	00913423          	sd	s1,8(sp)
    80007ff8:	00113c23          	sd	ra,24(sp)
    80007ffc:	02010413          	addi	s0,sp,32
    80008000:	00050493          	mv	s1,a0
    80008004:	00000097          	auipc	ra,0x0
    80008008:	9b8080e7          	jalr	-1608(ra) # 800079bc <cpuid>
    8000800c:	01813083          	ld	ra,24(sp)
    80008010:	01013403          	ld	s0,16(sp)
    80008014:	00d5179b          	slliw	a5,a0,0xd
    80008018:	0c201737          	lui	a4,0xc201
    8000801c:	00f707b3          	add	a5,a4,a5
    80008020:	0097a223          	sw	s1,4(a5) # c201004 <_entry-0x73dfeffc>
    80008024:	00813483          	ld	s1,8(sp)
    80008028:	02010113          	addi	sp,sp,32
    8000802c:	00008067          	ret

0000000080008030 <consolewrite>:
    80008030:	fb010113          	addi	sp,sp,-80
    80008034:	04813023          	sd	s0,64(sp)
    80008038:	04113423          	sd	ra,72(sp)
    8000803c:	02913c23          	sd	s1,56(sp)
    80008040:	03213823          	sd	s2,48(sp)
    80008044:	03313423          	sd	s3,40(sp)
    80008048:	03413023          	sd	s4,32(sp)
    8000804c:	01513c23          	sd	s5,24(sp)
    80008050:	05010413          	addi	s0,sp,80
    80008054:	06c05c63          	blez	a2,800080cc <consolewrite+0x9c>
    80008058:	00060993          	mv	s3,a2
    8000805c:	00050a13          	mv	s4,a0
    80008060:	00058493          	mv	s1,a1
    80008064:	00000913          	li	s2,0
    80008068:	fff00a93          	li	s5,-1
    8000806c:	01c0006f          	j	80008088 <consolewrite+0x58>
    80008070:	fbf44503          	lbu	a0,-65(s0)
    80008074:	0019091b          	addiw	s2,s2,1
    80008078:	00148493          	addi	s1,s1,1
    8000807c:	00001097          	auipc	ra,0x1
    80008080:	a9c080e7          	jalr	-1380(ra) # 80008b18 <uartputc>
    80008084:	03298063          	beq	s3,s2,800080a4 <consolewrite+0x74>
    80008088:	00048613          	mv	a2,s1
    8000808c:	00100693          	li	a3,1
    80008090:	000a0593          	mv	a1,s4
    80008094:	fbf40513          	addi	a0,s0,-65
    80008098:	00000097          	auipc	ra,0x0
    8000809c:	9dc080e7          	jalr	-1572(ra) # 80007a74 <either_copyin>
    800080a0:	fd5518e3          	bne	a0,s5,80008070 <consolewrite+0x40>
    800080a4:	04813083          	ld	ra,72(sp)
    800080a8:	04013403          	ld	s0,64(sp)
    800080ac:	03813483          	ld	s1,56(sp)
    800080b0:	02813983          	ld	s3,40(sp)
    800080b4:	02013a03          	ld	s4,32(sp)
    800080b8:	01813a83          	ld	s5,24(sp)
    800080bc:	00090513          	mv	a0,s2
    800080c0:	03013903          	ld	s2,48(sp)
    800080c4:	05010113          	addi	sp,sp,80
    800080c8:	00008067          	ret
    800080cc:	00000913          	li	s2,0
    800080d0:	fd5ff06f          	j	800080a4 <consolewrite+0x74>

00000000800080d4 <consoleread>:
    800080d4:	f9010113          	addi	sp,sp,-112
    800080d8:	06813023          	sd	s0,96(sp)
    800080dc:	04913c23          	sd	s1,88(sp)
    800080e0:	05213823          	sd	s2,80(sp)
    800080e4:	05313423          	sd	s3,72(sp)
    800080e8:	05413023          	sd	s4,64(sp)
    800080ec:	03513c23          	sd	s5,56(sp)
    800080f0:	03613823          	sd	s6,48(sp)
    800080f4:	03713423          	sd	s7,40(sp)
    800080f8:	03813023          	sd	s8,32(sp)
    800080fc:	06113423          	sd	ra,104(sp)
    80008100:	01913c23          	sd	s9,24(sp)
    80008104:	07010413          	addi	s0,sp,112
    80008108:	00060b93          	mv	s7,a2
    8000810c:	00050913          	mv	s2,a0
    80008110:	00058c13          	mv	s8,a1
    80008114:	00060b1b          	sext.w	s6,a2
    80008118:	0000c497          	auipc	s1,0xc
    8000811c:	08048493          	addi	s1,s1,128 # 80014198 <cons>
    80008120:	00400993          	li	s3,4
    80008124:	fff00a13          	li	s4,-1
    80008128:	00a00a93          	li	s5,10
    8000812c:	05705e63          	blez	s7,80008188 <consoleread+0xb4>
    80008130:	09c4a703          	lw	a4,156(s1)
    80008134:	0984a783          	lw	a5,152(s1)
    80008138:	0007071b          	sext.w	a4,a4
    8000813c:	08e78463          	beq	a5,a4,800081c4 <consoleread+0xf0>
    80008140:	07f7f713          	andi	a4,a5,127
    80008144:	00e48733          	add	a4,s1,a4
    80008148:	01874703          	lbu	a4,24(a4) # c201018 <_entry-0x73dfefe8>
    8000814c:	0017869b          	addiw	a3,a5,1
    80008150:	08d4ac23          	sw	a3,152(s1)
    80008154:	00070c9b          	sext.w	s9,a4
    80008158:	0b370663          	beq	a4,s3,80008204 <consoleread+0x130>
    8000815c:	00100693          	li	a3,1
    80008160:	f9f40613          	addi	a2,s0,-97
    80008164:	000c0593          	mv	a1,s8
    80008168:	00090513          	mv	a0,s2
    8000816c:	f8e40fa3          	sb	a4,-97(s0)
    80008170:	00000097          	auipc	ra,0x0
    80008174:	8b8080e7          	jalr	-1864(ra) # 80007a28 <either_copyout>
    80008178:	01450863          	beq	a0,s4,80008188 <consoleread+0xb4>
    8000817c:	001c0c13          	addi	s8,s8,1
    80008180:	fffb8b9b          	addiw	s7,s7,-1
    80008184:	fb5c94e3          	bne	s9,s5,8000812c <consoleread+0x58>
    80008188:	000b851b          	sext.w	a0,s7
    8000818c:	06813083          	ld	ra,104(sp)
    80008190:	06013403          	ld	s0,96(sp)
    80008194:	05813483          	ld	s1,88(sp)
    80008198:	05013903          	ld	s2,80(sp)
    8000819c:	04813983          	ld	s3,72(sp)
    800081a0:	04013a03          	ld	s4,64(sp)
    800081a4:	03813a83          	ld	s5,56(sp)
    800081a8:	02813b83          	ld	s7,40(sp)
    800081ac:	02013c03          	ld	s8,32(sp)
    800081b0:	01813c83          	ld	s9,24(sp)
    800081b4:	40ab053b          	subw	a0,s6,a0
    800081b8:	03013b03          	ld	s6,48(sp)
    800081bc:	07010113          	addi	sp,sp,112
    800081c0:	00008067          	ret
    800081c4:	00001097          	auipc	ra,0x1
    800081c8:	1d8080e7          	jalr	472(ra) # 8000939c <push_on>
    800081cc:	0984a703          	lw	a4,152(s1)
    800081d0:	09c4a783          	lw	a5,156(s1)
    800081d4:	0007879b          	sext.w	a5,a5
    800081d8:	fef70ce3          	beq	a4,a5,800081d0 <consoleread+0xfc>
    800081dc:	00001097          	auipc	ra,0x1
    800081e0:	234080e7          	jalr	564(ra) # 80009410 <pop_on>
    800081e4:	0984a783          	lw	a5,152(s1)
    800081e8:	07f7f713          	andi	a4,a5,127
    800081ec:	00e48733          	add	a4,s1,a4
    800081f0:	01874703          	lbu	a4,24(a4)
    800081f4:	0017869b          	addiw	a3,a5,1
    800081f8:	08d4ac23          	sw	a3,152(s1)
    800081fc:	00070c9b          	sext.w	s9,a4
    80008200:	f5371ee3          	bne	a4,s3,8000815c <consoleread+0x88>
    80008204:	000b851b          	sext.w	a0,s7
    80008208:	f96bf2e3          	bgeu	s7,s6,8000818c <consoleread+0xb8>
    8000820c:	08f4ac23          	sw	a5,152(s1)
    80008210:	f7dff06f          	j	8000818c <consoleread+0xb8>

0000000080008214 <consputc>:
    80008214:	10000793          	li	a5,256
    80008218:	00f50663          	beq	a0,a5,80008224 <consputc+0x10>
    8000821c:	00001317          	auipc	t1,0x1
    80008220:	9f430067          	jr	-1548(t1) # 80008c10 <uartputc_sync>
    80008224:	ff010113          	addi	sp,sp,-16
    80008228:	00113423          	sd	ra,8(sp)
    8000822c:	00813023          	sd	s0,0(sp)
    80008230:	01010413          	addi	s0,sp,16
    80008234:	00800513          	li	a0,8
    80008238:	00001097          	auipc	ra,0x1
    8000823c:	9d8080e7          	jalr	-1576(ra) # 80008c10 <uartputc_sync>
    80008240:	02000513          	li	a0,32
    80008244:	00001097          	auipc	ra,0x1
    80008248:	9cc080e7          	jalr	-1588(ra) # 80008c10 <uartputc_sync>
    8000824c:	00013403          	ld	s0,0(sp)
    80008250:	00813083          	ld	ra,8(sp)
    80008254:	00800513          	li	a0,8
    80008258:	01010113          	addi	sp,sp,16
    8000825c:	00001317          	auipc	t1,0x1
    80008260:	9b430067          	jr	-1612(t1) # 80008c10 <uartputc_sync>

0000000080008264 <consoleintr>:
    80008264:	fe010113          	addi	sp,sp,-32
    80008268:	00813823          	sd	s0,16(sp)
    8000826c:	00913423          	sd	s1,8(sp)
    80008270:	01213023          	sd	s2,0(sp)
    80008274:	00113c23          	sd	ra,24(sp)
    80008278:	02010413          	addi	s0,sp,32
    8000827c:	0000c917          	auipc	s2,0xc
    80008280:	f1c90913          	addi	s2,s2,-228 # 80014198 <cons>
    80008284:	00050493          	mv	s1,a0
    80008288:	00090513          	mv	a0,s2
    8000828c:	00001097          	auipc	ra,0x1
    80008290:	e40080e7          	jalr	-448(ra) # 800090cc <acquire>
    80008294:	02048c63          	beqz	s1,800082cc <consoleintr+0x68>
    80008298:	0a092783          	lw	a5,160(s2)
    8000829c:	09892703          	lw	a4,152(s2)
    800082a0:	07f00693          	li	a3,127
    800082a4:	40e7873b          	subw	a4,a5,a4
    800082a8:	02e6e263          	bltu	a3,a4,800082cc <consoleintr+0x68>
    800082ac:	00d00713          	li	a4,13
    800082b0:	04e48063          	beq	s1,a4,800082f0 <consoleintr+0x8c>
    800082b4:	07f7f713          	andi	a4,a5,127
    800082b8:	00e90733          	add	a4,s2,a4
    800082bc:	0017879b          	addiw	a5,a5,1
    800082c0:	0af92023          	sw	a5,160(s2)
    800082c4:	00970c23          	sb	s1,24(a4)
    800082c8:	08f92e23          	sw	a5,156(s2)
    800082cc:	01013403          	ld	s0,16(sp)
    800082d0:	01813083          	ld	ra,24(sp)
    800082d4:	00813483          	ld	s1,8(sp)
    800082d8:	00013903          	ld	s2,0(sp)
    800082dc:	0000c517          	auipc	a0,0xc
    800082e0:	ebc50513          	addi	a0,a0,-324 # 80014198 <cons>
    800082e4:	02010113          	addi	sp,sp,32
    800082e8:	00001317          	auipc	t1,0x1
    800082ec:	eb030067          	jr	-336(t1) # 80009198 <release>
    800082f0:	00a00493          	li	s1,10
    800082f4:	fc1ff06f          	j	800082b4 <consoleintr+0x50>

00000000800082f8 <consoleinit>:
    800082f8:	fe010113          	addi	sp,sp,-32
    800082fc:	00113c23          	sd	ra,24(sp)
    80008300:	00813823          	sd	s0,16(sp)
    80008304:	00913423          	sd	s1,8(sp)
    80008308:	02010413          	addi	s0,sp,32
    8000830c:	0000c497          	auipc	s1,0xc
    80008310:	e8c48493          	addi	s1,s1,-372 # 80014198 <cons>
    80008314:	00048513          	mv	a0,s1
    80008318:	00002597          	auipc	a1,0x2
    8000831c:	26058593          	addi	a1,a1,608 # 8000a578 <CONSOLE_STATUS+0x568>
    80008320:	00001097          	auipc	ra,0x1
    80008324:	d88080e7          	jalr	-632(ra) # 800090a8 <initlock>
    80008328:	00000097          	auipc	ra,0x0
    8000832c:	7ac080e7          	jalr	1964(ra) # 80008ad4 <uartinit>
    80008330:	01813083          	ld	ra,24(sp)
    80008334:	01013403          	ld	s0,16(sp)
    80008338:	00000797          	auipc	a5,0x0
    8000833c:	d9c78793          	addi	a5,a5,-612 # 800080d4 <consoleread>
    80008340:	0af4bc23          	sd	a5,184(s1)
    80008344:	00000797          	auipc	a5,0x0
    80008348:	cec78793          	addi	a5,a5,-788 # 80008030 <consolewrite>
    8000834c:	0cf4b023          	sd	a5,192(s1)
    80008350:	00813483          	ld	s1,8(sp)
    80008354:	02010113          	addi	sp,sp,32
    80008358:	00008067          	ret

000000008000835c <console_read>:
    8000835c:	ff010113          	addi	sp,sp,-16
    80008360:	00813423          	sd	s0,8(sp)
    80008364:	01010413          	addi	s0,sp,16
    80008368:	00813403          	ld	s0,8(sp)
    8000836c:	0000c317          	auipc	t1,0xc
    80008370:	ee433303          	ld	t1,-284(t1) # 80014250 <devsw+0x10>
    80008374:	01010113          	addi	sp,sp,16
    80008378:	00030067          	jr	t1

000000008000837c <console_write>:
    8000837c:	ff010113          	addi	sp,sp,-16
    80008380:	00813423          	sd	s0,8(sp)
    80008384:	01010413          	addi	s0,sp,16
    80008388:	00813403          	ld	s0,8(sp)
    8000838c:	0000c317          	auipc	t1,0xc
    80008390:	ecc33303          	ld	t1,-308(t1) # 80014258 <devsw+0x18>
    80008394:	01010113          	addi	sp,sp,16
    80008398:	00030067          	jr	t1

000000008000839c <panic>:
    8000839c:	fe010113          	addi	sp,sp,-32
    800083a0:	00113c23          	sd	ra,24(sp)
    800083a4:	00813823          	sd	s0,16(sp)
    800083a8:	00913423          	sd	s1,8(sp)
    800083ac:	02010413          	addi	s0,sp,32
    800083b0:	00050493          	mv	s1,a0
    800083b4:	00002517          	auipc	a0,0x2
    800083b8:	1cc50513          	addi	a0,a0,460 # 8000a580 <CONSOLE_STATUS+0x570>
    800083bc:	0000c797          	auipc	a5,0xc
    800083c0:	f207ae23          	sw	zero,-196(a5) # 800142f8 <pr+0x18>
    800083c4:	00000097          	auipc	ra,0x0
    800083c8:	034080e7          	jalr	52(ra) # 800083f8 <__printf>
    800083cc:	00048513          	mv	a0,s1
    800083d0:	00000097          	auipc	ra,0x0
    800083d4:	028080e7          	jalr	40(ra) # 800083f8 <__printf>
    800083d8:	00002517          	auipc	a0,0x2
    800083dc:	de050513          	addi	a0,a0,-544 # 8000a1b8 <CONSOLE_STATUS+0x1a8>
    800083e0:	00000097          	auipc	ra,0x0
    800083e4:	018080e7          	jalr	24(ra) # 800083f8 <__printf>
    800083e8:	00100793          	li	a5,1
    800083ec:	00005717          	auipc	a4,0x5
    800083f0:	98f72623          	sw	a5,-1652(a4) # 8000cd78 <panicked>
    800083f4:	0000006f          	j	800083f4 <panic+0x58>

00000000800083f8 <__printf>:
    800083f8:	f3010113          	addi	sp,sp,-208
    800083fc:	08813023          	sd	s0,128(sp)
    80008400:	07313423          	sd	s3,104(sp)
    80008404:	09010413          	addi	s0,sp,144
    80008408:	05813023          	sd	s8,64(sp)
    8000840c:	08113423          	sd	ra,136(sp)
    80008410:	06913c23          	sd	s1,120(sp)
    80008414:	07213823          	sd	s2,112(sp)
    80008418:	07413023          	sd	s4,96(sp)
    8000841c:	05513c23          	sd	s5,88(sp)
    80008420:	05613823          	sd	s6,80(sp)
    80008424:	05713423          	sd	s7,72(sp)
    80008428:	03913c23          	sd	s9,56(sp)
    8000842c:	03a13823          	sd	s10,48(sp)
    80008430:	03b13423          	sd	s11,40(sp)
    80008434:	0000c317          	auipc	t1,0xc
    80008438:	eac30313          	addi	t1,t1,-340 # 800142e0 <pr>
    8000843c:	01832c03          	lw	s8,24(t1)
    80008440:	00b43423          	sd	a1,8(s0)
    80008444:	00c43823          	sd	a2,16(s0)
    80008448:	00d43c23          	sd	a3,24(s0)
    8000844c:	02e43023          	sd	a4,32(s0)
    80008450:	02f43423          	sd	a5,40(s0)
    80008454:	03043823          	sd	a6,48(s0)
    80008458:	03143c23          	sd	a7,56(s0)
    8000845c:	00050993          	mv	s3,a0
    80008460:	4a0c1663          	bnez	s8,8000890c <__printf+0x514>
    80008464:	60098c63          	beqz	s3,80008a7c <__printf+0x684>
    80008468:	0009c503          	lbu	a0,0(s3)
    8000846c:	00840793          	addi	a5,s0,8
    80008470:	f6f43c23          	sd	a5,-136(s0)
    80008474:	00000493          	li	s1,0
    80008478:	22050063          	beqz	a0,80008698 <__printf+0x2a0>
    8000847c:	00002a37          	lui	s4,0x2
    80008480:	00018ab7          	lui	s5,0x18
    80008484:	000f4b37          	lui	s6,0xf4
    80008488:	00989bb7          	lui	s7,0x989
    8000848c:	70fa0a13          	addi	s4,s4,1807 # 270f <_entry-0x7fffd8f1>
    80008490:	69fa8a93          	addi	s5,s5,1695 # 1869f <_entry-0x7ffe7961>
    80008494:	23fb0b13          	addi	s6,s6,575 # f423f <_entry-0x7ff0bdc1>
    80008498:	67fb8b93          	addi	s7,s7,1663 # 98967f <_entry-0x7f676981>
    8000849c:	00148c9b          	addiw	s9,s1,1
    800084a0:	02500793          	li	a5,37
    800084a4:	01998933          	add	s2,s3,s9
    800084a8:	38f51263          	bne	a0,a5,8000882c <__printf+0x434>
    800084ac:	00094783          	lbu	a5,0(s2)
    800084b0:	00078c9b          	sext.w	s9,a5
    800084b4:	1e078263          	beqz	a5,80008698 <__printf+0x2a0>
    800084b8:	0024849b          	addiw	s1,s1,2
    800084bc:	07000713          	li	a4,112
    800084c0:	00998933          	add	s2,s3,s1
    800084c4:	38e78a63          	beq	a5,a4,80008858 <__printf+0x460>
    800084c8:	20f76863          	bltu	a4,a5,800086d8 <__printf+0x2e0>
    800084cc:	42a78863          	beq	a5,a0,800088fc <__printf+0x504>
    800084d0:	06400713          	li	a4,100
    800084d4:	40e79663          	bne	a5,a4,800088e0 <__printf+0x4e8>
    800084d8:	f7843783          	ld	a5,-136(s0)
    800084dc:	0007a603          	lw	a2,0(a5)
    800084e0:	00878793          	addi	a5,a5,8
    800084e4:	f6f43c23          	sd	a5,-136(s0)
    800084e8:	42064a63          	bltz	a2,8000891c <__printf+0x524>
    800084ec:	00a00713          	li	a4,10
    800084f0:	02e677bb          	remuw	a5,a2,a4
    800084f4:	00002d97          	auipc	s11,0x2
    800084f8:	0b4d8d93          	addi	s11,s11,180 # 8000a5a8 <digits>
    800084fc:	00900593          	li	a1,9
    80008500:	0006051b          	sext.w	a0,a2
    80008504:	00000c93          	li	s9,0
    80008508:	02079793          	slli	a5,a5,0x20
    8000850c:	0207d793          	srli	a5,a5,0x20
    80008510:	00fd87b3          	add	a5,s11,a5
    80008514:	0007c783          	lbu	a5,0(a5)
    80008518:	02e656bb          	divuw	a3,a2,a4
    8000851c:	f8f40023          	sb	a5,-128(s0)
    80008520:	14c5d863          	bge	a1,a2,80008670 <__printf+0x278>
    80008524:	06300593          	li	a1,99
    80008528:	00100c93          	li	s9,1
    8000852c:	02e6f7bb          	remuw	a5,a3,a4
    80008530:	02079793          	slli	a5,a5,0x20
    80008534:	0207d793          	srli	a5,a5,0x20
    80008538:	00fd87b3          	add	a5,s11,a5
    8000853c:	0007c783          	lbu	a5,0(a5)
    80008540:	02e6d73b          	divuw	a4,a3,a4
    80008544:	f8f400a3          	sb	a5,-127(s0)
    80008548:	12a5f463          	bgeu	a1,a0,80008670 <__printf+0x278>
    8000854c:	00a00693          	li	a3,10
    80008550:	00900593          	li	a1,9
    80008554:	02d777bb          	remuw	a5,a4,a3
    80008558:	02079793          	slli	a5,a5,0x20
    8000855c:	0207d793          	srli	a5,a5,0x20
    80008560:	00fd87b3          	add	a5,s11,a5
    80008564:	0007c503          	lbu	a0,0(a5)
    80008568:	02d757bb          	divuw	a5,a4,a3
    8000856c:	f8a40123          	sb	a0,-126(s0)
    80008570:	48e5f263          	bgeu	a1,a4,800089f4 <__printf+0x5fc>
    80008574:	06300513          	li	a0,99
    80008578:	02d7f5bb          	remuw	a1,a5,a3
    8000857c:	02059593          	slli	a1,a1,0x20
    80008580:	0205d593          	srli	a1,a1,0x20
    80008584:	00bd85b3          	add	a1,s11,a1
    80008588:	0005c583          	lbu	a1,0(a1)
    8000858c:	02d7d7bb          	divuw	a5,a5,a3
    80008590:	f8b401a3          	sb	a1,-125(s0)
    80008594:	48e57263          	bgeu	a0,a4,80008a18 <__printf+0x620>
    80008598:	3e700513          	li	a0,999
    8000859c:	02d7f5bb          	remuw	a1,a5,a3
    800085a0:	02059593          	slli	a1,a1,0x20
    800085a4:	0205d593          	srli	a1,a1,0x20
    800085a8:	00bd85b3          	add	a1,s11,a1
    800085ac:	0005c583          	lbu	a1,0(a1)
    800085b0:	02d7d7bb          	divuw	a5,a5,a3
    800085b4:	f8b40223          	sb	a1,-124(s0)
    800085b8:	46e57663          	bgeu	a0,a4,80008a24 <__printf+0x62c>
    800085bc:	02d7f5bb          	remuw	a1,a5,a3
    800085c0:	02059593          	slli	a1,a1,0x20
    800085c4:	0205d593          	srli	a1,a1,0x20
    800085c8:	00bd85b3          	add	a1,s11,a1
    800085cc:	0005c583          	lbu	a1,0(a1)
    800085d0:	02d7d7bb          	divuw	a5,a5,a3
    800085d4:	f8b402a3          	sb	a1,-123(s0)
    800085d8:	46ea7863          	bgeu	s4,a4,80008a48 <__printf+0x650>
    800085dc:	02d7f5bb          	remuw	a1,a5,a3
    800085e0:	02059593          	slli	a1,a1,0x20
    800085e4:	0205d593          	srli	a1,a1,0x20
    800085e8:	00bd85b3          	add	a1,s11,a1
    800085ec:	0005c583          	lbu	a1,0(a1)
    800085f0:	02d7d7bb          	divuw	a5,a5,a3
    800085f4:	f8b40323          	sb	a1,-122(s0)
    800085f8:	3eeaf863          	bgeu	s5,a4,800089e8 <__printf+0x5f0>
    800085fc:	02d7f5bb          	remuw	a1,a5,a3
    80008600:	02059593          	slli	a1,a1,0x20
    80008604:	0205d593          	srli	a1,a1,0x20
    80008608:	00bd85b3          	add	a1,s11,a1
    8000860c:	0005c583          	lbu	a1,0(a1)
    80008610:	02d7d7bb          	divuw	a5,a5,a3
    80008614:	f8b403a3          	sb	a1,-121(s0)
    80008618:	42eb7e63          	bgeu	s6,a4,80008a54 <__printf+0x65c>
    8000861c:	02d7f5bb          	remuw	a1,a5,a3
    80008620:	02059593          	slli	a1,a1,0x20
    80008624:	0205d593          	srli	a1,a1,0x20
    80008628:	00bd85b3          	add	a1,s11,a1
    8000862c:	0005c583          	lbu	a1,0(a1)
    80008630:	02d7d7bb          	divuw	a5,a5,a3
    80008634:	f8b40423          	sb	a1,-120(s0)
    80008638:	42ebfc63          	bgeu	s7,a4,80008a70 <__printf+0x678>
    8000863c:	02079793          	slli	a5,a5,0x20
    80008640:	0207d793          	srli	a5,a5,0x20
    80008644:	00fd8db3          	add	s11,s11,a5
    80008648:	000dc703          	lbu	a4,0(s11)
    8000864c:	00a00793          	li	a5,10
    80008650:	00900c93          	li	s9,9
    80008654:	f8e404a3          	sb	a4,-119(s0)
    80008658:	00065c63          	bgez	a2,80008670 <__printf+0x278>
    8000865c:	f9040713          	addi	a4,s0,-112
    80008660:	00f70733          	add	a4,a4,a5
    80008664:	02d00693          	li	a3,45
    80008668:	fed70823          	sb	a3,-16(a4)
    8000866c:	00078c93          	mv	s9,a5
    80008670:	f8040793          	addi	a5,s0,-128
    80008674:	01978cb3          	add	s9,a5,s9
    80008678:	f7f40d13          	addi	s10,s0,-129
    8000867c:	000cc503          	lbu	a0,0(s9)
    80008680:	fffc8c93          	addi	s9,s9,-1
    80008684:	00000097          	auipc	ra,0x0
    80008688:	b90080e7          	jalr	-1136(ra) # 80008214 <consputc>
    8000868c:	ffac98e3          	bne	s9,s10,8000867c <__printf+0x284>
    80008690:	00094503          	lbu	a0,0(s2)
    80008694:	e00514e3          	bnez	a0,8000849c <__printf+0xa4>
    80008698:	1a0c1663          	bnez	s8,80008844 <__printf+0x44c>
    8000869c:	08813083          	ld	ra,136(sp)
    800086a0:	08013403          	ld	s0,128(sp)
    800086a4:	07813483          	ld	s1,120(sp)
    800086a8:	07013903          	ld	s2,112(sp)
    800086ac:	06813983          	ld	s3,104(sp)
    800086b0:	06013a03          	ld	s4,96(sp)
    800086b4:	05813a83          	ld	s5,88(sp)
    800086b8:	05013b03          	ld	s6,80(sp)
    800086bc:	04813b83          	ld	s7,72(sp)
    800086c0:	04013c03          	ld	s8,64(sp)
    800086c4:	03813c83          	ld	s9,56(sp)
    800086c8:	03013d03          	ld	s10,48(sp)
    800086cc:	02813d83          	ld	s11,40(sp)
    800086d0:	0d010113          	addi	sp,sp,208
    800086d4:	00008067          	ret
    800086d8:	07300713          	li	a4,115
    800086dc:	1ce78a63          	beq	a5,a4,800088b0 <__printf+0x4b8>
    800086e0:	07800713          	li	a4,120
    800086e4:	1ee79e63          	bne	a5,a4,800088e0 <__printf+0x4e8>
    800086e8:	f7843783          	ld	a5,-136(s0)
    800086ec:	0007a703          	lw	a4,0(a5)
    800086f0:	00878793          	addi	a5,a5,8
    800086f4:	f6f43c23          	sd	a5,-136(s0)
    800086f8:	28074263          	bltz	a4,8000897c <__printf+0x584>
    800086fc:	00002d97          	auipc	s11,0x2
    80008700:	eacd8d93          	addi	s11,s11,-340 # 8000a5a8 <digits>
    80008704:	00f77793          	andi	a5,a4,15
    80008708:	00fd87b3          	add	a5,s11,a5
    8000870c:	0007c683          	lbu	a3,0(a5)
    80008710:	00f00613          	li	a2,15
    80008714:	0007079b          	sext.w	a5,a4
    80008718:	f8d40023          	sb	a3,-128(s0)
    8000871c:	0047559b          	srliw	a1,a4,0x4
    80008720:	0047569b          	srliw	a3,a4,0x4
    80008724:	00000c93          	li	s9,0
    80008728:	0ee65063          	bge	a2,a4,80008808 <__printf+0x410>
    8000872c:	00f6f693          	andi	a3,a3,15
    80008730:	00dd86b3          	add	a3,s11,a3
    80008734:	0006c683          	lbu	a3,0(a3) # 2004000 <_entry-0x7dffc000>
    80008738:	0087d79b          	srliw	a5,a5,0x8
    8000873c:	00100c93          	li	s9,1
    80008740:	f8d400a3          	sb	a3,-127(s0)
    80008744:	0cb67263          	bgeu	a2,a1,80008808 <__printf+0x410>
    80008748:	00f7f693          	andi	a3,a5,15
    8000874c:	00dd86b3          	add	a3,s11,a3
    80008750:	0006c583          	lbu	a1,0(a3)
    80008754:	00f00613          	li	a2,15
    80008758:	0047d69b          	srliw	a3,a5,0x4
    8000875c:	f8b40123          	sb	a1,-126(s0)
    80008760:	0047d593          	srli	a1,a5,0x4
    80008764:	28f67e63          	bgeu	a2,a5,80008a00 <__printf+0x608>
    80008768:	00f6f693          	andi	a3,a3,15
    8000876c:	00dd86b3          	add	a3,s11,a3
    80008770:	0006c503          	lbu	a0,0(a3)
    80008774:	0087d813          	srli	a6,a5,0x8
    80008778:	0087d69b          	srliw	a3,a5,0x8
    8000877c:	f8a401a3          	sb	a0,-125(s0)
    80008780:	28b67663          	bgeu	a2,a1,80008a0c <__printf+0x614>
    80008784:	00f6f693          	andi	a3,a3,15
    80008788:	00dd86b3          	add	a3,s11,a3
    8000878c:	0006c583          	lbu	a1,0(a3)
    80008790:	00c7d513          	srli	a0,a5,0xc
    80008794:	00c7d69b          	srliw	a3,a5,0xc
    80008798:	f8b40223          	sb	a1,-124(s0)
    8000879c:	29067a63          	bgeu	a2,a6,80008a30 <__printf+0x638>
    800087a0:	00f6f693          	andi	a3,a3,15
    800087a4:	00dd86b3          	add	a3,s11,a3
    800087a8:	0006c583          	lbu	a1,0(a3)
    800087ac:	0107d813          	srli	a6,a5,0x10
    800087b0:	0107d69b          	srliw	a3,a5,0x10
    800087b4:	f8b402a3          	sb	a1,-123(s0)
    800087b8:	28a67263          	bgeu	a2,a0,80008a3c <__printf+0x644>
    800087bc:	00f6f693          	andi	a3,a3,15
    800087c0:	00dd86b3          	add	a3,s11,a3
    800087c4:	0006c683          	lbu	a3,0(a3)
    800087c8:	0147d79b          	srliw	a5,a5,0x14
    800087cc:	f8d40323          	sb	a3,-122(s0)
    800087d0:	21067663          	bgeu	a2,a6,800089dc <__printf+0x5e4>
    800087d4:	02079793          	slli	a5,a5,0x20
    800087d8:	0207d793          	srli	a5,a5,0x20
    800087dc:	00fd8db3          	add	s11,s11,a5
    800087e0:	000dc683          	lbu	a3,0(s11)
    800087e4:	00800793          	li	a5,8
    800087e8:	00700c93          	li	s9,7
    800087ec:	f8d403a3          	sb	a3,-121(s0)
    800087f0:	00075c63          	bgez	a4,80008808 <__printf+0x410>
    800087f4:	f9040713          	addi	a4,s0,-112
    800087f8:	00f70733          	add	a4,a4,a5
    800087fc:	02d00693          	li	a3,45
    80008800:	fed70823          	sb	a3,-16(a4)
    80008804:	00078c93          	mv	s9,a5
    80008808:	f8040793          	addi	a5,s0,-128
    8000880c:	01978cb3          	add	s9,a5,s9
    80008810:	f7f40d13          	addi	s10,s0,-129
    80008814:	000cc503          	lbu	a0,0(s9)
    80008818:	fffc8c93          	addi	s9,s9,-1
    8000881c:	00000097          	auipc	ra,0x0
    80008820:	9f8080e7          	jalr	-1544(ra) # 80008214 <consputc>
    80008824:	ff9d18e3          	bne	s10,s9,80008814 <__printf+0x41c>
    80008828:	0100006f          	j	80008838 <__printf+0x440>
    8000882c:	00000097          	auipc	ra,0x0
    80008830:	9e8080e7          	jalr	-1560(ra) # 80008214 <consputc>
    80008834:	000c8493          	mv	s1,s9
    80008838:	00094503          	lbu	a0,0(s2)
    8000883c:	c60510e3          	bnez	a0,8000849c <__printf+0xa4>
    80008840:	e40c0ee3          	beqz	s8,8000869c <__printf+0x2a4>
    80008844:	0000c517          	auipc	a0,0xc
    80008848:	a9c50513          	addi	a0,a0,-1380 # 800142e0 <pr>
    8000884c:	00001097          	auipc	ra,0x1
    80008850:	94c080e7          	jalr	-1716(ra) # 80009198 <release>
    80008854:	e49ff06f          	j	8000869c <__printf+0x2a4>
    80008858:	f7843783          	ld	a5,-136(s0)
    8000885c:	03000513          	li	a0,48
    80008860:	01000d13          	li	s10,16
    80008864:	00878713          	addi	a4,a5,8
    80008868:	0007bc83          	ld	s9,0(a5)
    8000886c:	f6e43c23          	sd	a4,-136(s0)
    80008870:	00000097          	auipc	ra,0x0
    80008874:	9a4080e7          	jalr	-1628(ra) # 80008214 <consputc>
    80008878:	07800513          	li	a0,120
    8000887c:	00000097          	auipc	ra,0x0
    80008880:	998080e7          	jalr	-1640(ra) # 80008214 <consputc>
    80008884:	00002d97          	auipc	s11,0x2
    80008888:	d24d8d93          	addi	s11,s11,-732 # 8000a5a8 <digits>
    8000888c:	03ccd793          	srli	a5,s9,0x3c
    80008890:	00fd87b3          	add	a5,s11,a5
    80008894:	0007c503          	lbu	a0,0(a5)
    80008898:	fffd0d1b          	addiw	s10,s10,-1
    8000889c:	004c9c93          	slli	s9,s9,0x4
    800088a0:	00000097          	auipc	ra,0x0
    800088a4:	974080e7          	jalr	-1676(ra) # 80008214 <consputc>
    800088a8:	fe0d12e3          	bnez	s10,8000888c <__printf+0x494>
    800088ac:	f8dff06f          	j	80008838 <__printf+0x440>
    800088b0:	f7843783          	ld	a5,-136(s0)
    800088b4:	0007bc83          	ld	s9,0(a5)
    800088b8:	00878793          	addi	a5,a5,8
    800088bc:	f6f43c23          	sd	a5,-136(s0)
    800088c0:	000c9a63          	bnez	s9,800088d4 <__printf+0x4dc>
    800088c4:	1080006f          	j	800089cc <__printf+0x5d4>
    800088c8:	001c8c93          	addi	s9,s9,1
    800088cc:	00000097          	auipc	ra,0x0
    800088d0:	948080e7          	jalr	-1720(ra) # 80008214 <consputc>
    800088d4:	000cc503          	lbu	a0,0(s9)
    800088d8:	fe0518e3          	bnez	a0,800088c8 <__printf+0x4d0>
    800088dc:	f5dff06f          	j	80008838 <__printf+0x440>
    800088e0:	02500513          	li	a0,37
    800088e4:	00000097          	auipc	ra,0x0
    800088e8:	930080e7          	jalr	-1744(ra) # 80008214 <consputc>
    800088ec:	000c8513          	mv	a0,s9
    800088f0:	00000097          	auipc	ra,0x0
    800088f4:	924080e7          	jalr	-1756(ra) # 80008214 <consputc>
    800088f8:	f41ff06f          	j	80008838 <__printf+0x440>
    800088fc:	02500513          	li	a0,37
    80008900:	00000097          	auipc	ra,0x0
    80008904:	914080e7          	jalr	-1772(ra) # 80008214 <consputc>
    80008908:	f31ff06f          	j	80008838 <__printf+0x440>
    8000890c:	00030513          	mv	a0,t1
    80008910:	00000097          	auipc	ra,0x0
    80008914:	7bc080e7          	jalr	1980(ra) # 800090cc <acquire>
    80008918:	b4dff06f          	j	80008464 <__printf+0x6c>
    8000891c:	40c0053b          	negw	a0,a2
    80008920:	00a00713          	li	a4,10
    80008924:	02e576bb          	remuw	a3,a0,a4
    80008928:	00002d97          	auipc	s11,0x2
    8000892c:	c80d8d93          	addi	s11,s11,-896 # 8000a5a8 <digits>
    80008930:	ff700593          	li	a1,-9
    80008934:	02069693          	slli	a3,a3,0x20
    80008938:	0206d693          	srli	a3,a3,0x20
    8000893c:	00dd86b3          	add	a3,s11,a3
    80008940:	0006c683          	lbu	a3,0(a3)
    80008944:	02e557bb          	divuw	a5,a0,a4
    80008948:	f8d40023          	sb	a3,-128(s0)
    8000894c:	10b65e63          	bge	a2,a1,80008a68 <__printf+0x670>
    80008950:	06300593          	li	a1,99
    80008954:	02e7f6bb          	remuw	a3,a5,a4
    80008958:	02069693          	slli	a3,a3,0x20
    8000895c:	0206d693          	srli	a3,a3,0x20
    80008960:	00dd86b3          	add	a3,s11,a3
    80008964:	0006c683          	lbu	a3,0(a3)
    80008968:	02e7d73b          	divuw	a4,a5,a4
    8000896c:	00200793          	li	a5,2
    80008970:	f8d400a3          	sb	a3,-127(s0)
    80008974:	bca5ece3          	bltu	a1,a0,8000854c <__printf+0x154>
    80008978:	ce5ff06f          	j	8000865c <__printf+0x264>
    8000897c:	40e007bb          	negw	a5,a4
    80008980:	00002d97          	auipc	s11,0x2
    80008984:	c28d8d93          	addi	s11,s11,-984 # 8000a5a8 <digits>
    80008988:	00f7f693          	andi	a3,a5,15
    8000898c:	00dd86b3          	add	a3,s11,a3
    80008990:	0006c583          	lbu	a1,0(a3)
    80008994:	ff100613          	li	a2,-15
    80008998:	0047d69b          	srliw	a3,a5,0x4
    8000899c:	f8b40023          	sb	a1,-128(s0)
    800089a0:	0047d59b          	srliw	a1,a5,0x4
    800089a4:	0ac75e63          	bge	a4,a2,80008a60 <__printf+0x668>
    800089a8:	00f6f693          	andi	a3,a3,15
    800089ac:	00dd86b3          	add	a3,s11,a3
    800089b0:	0006c603          	lbu	a2,0(a3)
    800089b4:	00f00693          	li	a3,15
    800089b8:	0087d79b          	srliw	a5,a5,0x8
    800089bc:	f8c400a3          	sb	a2,-127(s0)
    800089c0:	d8b6e4e3          	bltu	a3,a1,80008748 <__printf+0x350>
    800089c4:	00200793          	li	a5,2
    800089c8:	e2dff06f          	j	800087f4 <__printf+0x3fc>
    800089cc:	00002c97          	auipc	s9,0x2
    800089d0:	bbcc8c93          	addi	s9,s9,-1092 # 8000a588 <CONSOLE_STATUS+0x578>
    800089d4:	02800513          	li	a0,40
    800089d8:	ef1ff06f          	j	800088c8 <__printf+0x4d0>
    800089dc:	00700793          	li	a5,7
    800089e0:	00600c93          	li	s9,6
    800089e4:	e0dff06f          	j	800087f0 <__printf+0x3f8>
    800089e8:	00700793          	li	a5,7
    800089ec:	00600c93          	li	s9,6
    800089f0:	c69ff06f          	j	80008658 <__printf+0x260>
    800089f4:	00300793          	li	a5,3
    800089f8:	00200c93          	li	s9,2
    800089fc:	c5dff06f          	j	80008658 <__printf+0x260>
    80008a00:	00300793          	li	a5,3
    80008a04:	00200c93          	li	s9,2
    80008a08:	de9ff06f          	j	800087f0 <__printf+0x3f8>
    80008a0c:	00400793          	li	a5,4
    80008a10:	00300c93          	li	s9,3
    80008a14:	dddff06f          	j	800087f0 <__printf+0x3f8>
    80008a18:	00400793          	li	a5,4
    80008a1c:	00300c93          	li	s9,3
    80008a20:	c39ff06f          	j	80008658 <__printf+0x260>
    80008a24:	00500793          	li	a5,5
    80008a28:	00400c93          	li	s9,4
    80008a2c:	c2dff06f          	j	80008658 <__printf+0x260>
    80008a30:	00500793          	li	a5,5
    80008a34:	00400c93          	li	s9,4
    80008a38:	db9ff06f          	j	800087f0 <__printf+0x3f8>
    80008a3c:	00600793          	li	a5,6
    80008a40:	00500c93          	li	s9,5
    80008a44:	dadff06f          	j	800087f0 <__printf+0x3f8>
    80008a48:	00600793          	li	a5,6
    80008a4c:	00500c93          	li	s9,5
    80008a50:	c09ff06f          	j	80008658 <__printf+0x260>
    80008a54:	00800793          	li	a5,8
    80008a58:	00700c93          	li	s9,7
    80008a5c:	bfdff06f          	j	80008658 <__printf+0x260>
    80008a60:	00100793          	li	a5,1
    80008a64:	d91ff06f          	j	800087f4 <__printf+0x3fc>
    80008a68:	00100793          	li	a5,1
    80008a6c:	bf1ff06f          	j	8000865c <__printf+0x264>
    80008a70:	00900793          	li	a5,9
    80008a74:	00800c93          	li	s9,8
    80008a78:	be1ff06f          	j	80008658 <__printf+0x260>
    80008a7c:	00002517          	auipc	a0,0x2
    80008a80:	b1450513          	addi	a0,a0,-1260 # 8000a590 <CONSOLE_STATUS+0x580>
    80008a84:	00000097          	auipc	ra,0x0
    80008a88:	918080e7          	jalr	-1768(ra) # 8000839c <panic>

0000000080008a8c <printfinit>:
    80008a8c:	fe010113          	addi	sp,sp,-32
    80008a90:	00813823          	sd	s0,16(sp)
    80008a94:	00913423          	sd	s1,8(sp)
    80008a98:	00113c23          	sd	ra,24(sp)
    80008a9c:	02010413          	addi	s0,sp,32
    80008aa0:	0000c497          	auipc	s1,0xc
    80008aa4:	84048493          	addi	s1,s1,-1984 # 800142e0 <pr>
    80008aa8:	00048513          	mv	a0,s1
    80008aac:	00002597          	auipc	a1,0x2
    80008ab0:	af458593          	addi	a1,a1,-1292 # 8000a5a0 <CONSOLE_STATUS+0x590>
    80008ab4:	00000097          	auipc	ra,0x0
    80008ab8:	5f4080e7          	jalr	1524(ra) # 800090a8 <initlock>
    80008abc:	01813083          	ld	ra,24(sp)
    80008ac0:	01013403          	ld	s0,16(sp)
    80008ac4:	0004ac23          	sw	zero,24(s1)
    80008ac8:	00813483          	ld	s1,8(sp)
    80008acc:	02010113          	addi	sp,sp,32
    80008ad0:	00008067          	ret

0000000080008ad4 <uartinit>:
    80008ad4:	ff010113          	addi	sp,sp,-16
    80008ad8:	00813423          	sd	s0,8(sp)
    80008adc:	01010413          	addi	s0,sp,16
    80008ae0:	100007b7          	lui	a5,0x10000
    80008ae4:	000780a3          	sb	zero,1(a5) # 10000001 <_entry-0x6fffffff>
    80008ae8:	f8000713          	li	a4,-128
    80008aec:	00e781a3          	sb	a4,3(a5)
    80008af0:	00300713          	li	a4,3
    80008af4:	00e78023          	sb	a4,0(a5)
    80008af8:	000780a3          	sb	zero,1(a5)
    80008afc:	00e781a3          	sb	a4,3(a5)
    80008b00:	00700693          	li	a3,7
    80008b04:	00d78123          	sb	a3,2(a5)
    80008b08:	00e780a3          	sb	a4,1(a5)
    80008b0c:	00813403          	ld	s0,8(sp)
    80008b10:	01010113          	addi	sp,sp,16
    80008b14:	00008067          	ret

0000000080008b18 <uartputc>:
    80008b18:	00004797          	auipc	a5,0x4
    80008b1c:	2607a783          	lw	a5,608(a5) # 8000cd78 <panicked>
    80008b20:	00078463          	beqz	a5,80008b28 <uartputc+0x10>
    80008b24:	0000006f          	j	80008b24 <uartputc+0xc>
    80008b28:	fd010113          	addi	sp,sp,-48
    80008b2c:	02813023          	sd	s0,32(sp)
    80008b30:	00913c23          	sd	s1,24(sp)
    80008b34:	01213823          	sd	s2,16(sp)
    80008b38:	01313423          	sd	s3,8(sp)
    80008b3c:	02113423          	sd	ra,40(sp)
    80008b40:	03010413          	addi	s0,sp,48
    80008b44:	00004917          	auipc	s2,0x4
    80008b48:	23c90913          	addi	s2,s2,572 # 8000cd80 <uart_tx_r>
    80008b4c:	00093783          	ld	a5,0(s2)
    80008b50:	00004497          	auipc	s1,0x4
    80008b54:	23848493          	addi	s1,s1,568 # 8000cd88 <uart_tx_w>
    80008b58:	0004b703          	ld	a4,0(s1)
    80008b5c:	02078693          	addi	a3,a5,32
    80008b60:	00050993          	mv	s3,a0
    80008b64:	02e69c63          	bne	a3,a4,80008b9c <uartputc+0x84>
    80008b68:	00001097          	auipc	ra,0x1
    80008b6c:	834080e7          	jalr	-1996(ra) # 8000939c <push_on>
    80008b70:	00093783          	ld	a5,0(s2)
    80008b74:	0004b703          	ld	a4,0(s1)
    80008b78:	02078793          	addi	a5,a5,32
    80008b7c:	00e79463          	bne	a5,a4,80008b84 <uartputc+0x6c>
    80008b80:	0000006f          	j	80008b80 <uartputc+0x68>
    80008b84:	00001097          	auipc	ra,0x1
    80008b88:	88c080e7          	jalr	-1908(ra) # 80009410 <pop_on>
    80008b8c:	00093783          	ld	a5,0(s2)
    80008b90:	0004b703          	ld	a4,0(s1)
    80008b94:	02078693          	addi	a3,a5,32
    80008b98:	fce688e3          	beq	a3,a4,80008b68 <uartputc+0x50>
    80008b9c:	01f77693          	andi	a3,a4,31
    80008ba0:	0000b597          	auipc	a1,0xb
    80008ba4:	76058593          	addi	a1,a1,1888 # 80014300 <uart_tx_buf>
    80008ba8:	00d586b3          	add	a3,a1,a3
    80008bac:	00170713          	addi	a4,a4,1
    80008bb0:	01368023          	sb	s3,0(a3)
    80008bb4:	00e4b023          	sd	a4,0(s1)
    80008bb8:	10000637          	lui	a2,0x10000
    80008bbc:	02f71063          	bne	a4,a5,80008bdc <uartputc+0xc4>
    80008bc0:	0340006f          	j	80008bf4 <uartputc+0xdc>
    80008bc4:	00074703          	lbu	a4,0(a4)
    80008bc8:	00f93023          	sd	a5,0(s2)
    80008bcc:	00e60023          	sb	a4,0(a2) # 10000000 <_entry-0x70000000>
    80008bd0:	00093783          	ld	a5,0(s2)
    80008bd4:	0004b703          	ld	a4,0(s1)
    80008bd8:	00f70e63          	beq	a4,a5,80008bf4 <uartputc+0xdc>
    80008bdc:	00564683          	lbu	a3,5(a2)
    80008be0:	01f7f713          	andi	a4,a5,31
    80008be4:	00e58733          	add	a4,a1,a4
    80008be8:	0206f693          	andi	a3,a3,32
    80008bec:	00178793          	addi	a5,a5,1
    80008bf0:	fc069ae3          	bnez	a3,80008bc4 <uartputc+0xac>
    80008bf4:	02813083          	ld	ra,40(sp)
    80008bf8:	02013403          	ld	s0,32(sp)
    80008bfc:	01813483          	ld	s1,24(sp)
    80008c00:	01013903          	ld	s2,16(sp)
    80008c04:	00813983          	ld	s3,8(sp)
    80008c08:	03010113          	addi	sp,sp,48
    80008c0c:	00008067          	ret

0000000080008c10 <uartputc_sync>:
    80008c10:	ff010113          	addi	sp,sp,-16
    80008c14:	00813423          	sd	s0,8(sp)
    80008c18:	01010413          	addi	s0,sp,16
    80008c1c:	00004717          	auipc	a4,0x4
    80008c20:	15c72703          	lw	a4,348(a4) # 8000cd78 <panicked>
    80008c24:	02071663          	bnez	a4,80008c50 <uartputc_sync+0x40>
    80008c28:	00050793          	mv	a5,a0
    80008c2c:	100006b7          	lui	a3,0x10000
    80008c30:	0056c703          	lbu	a4,5(a3) # 10000005 <_entry-0x6ffffffb>
    80008c34:	02077713          	andi	a4,a4,32
    80008c38:	fe070ce3          	beqz	a4,80008c30 <uartputc_sync+0x20>
    80008c3c:	0ff7f793          	andi	a5,a5,255
    80008c40:	00f68023          	sb	a5,0(a3)
    80008c44:	00813403          	ld	s0,8(sp)
    80008c48:	01010113          	addi	sp,sp,16
    80008c4c:	00008067          	ret
    80008c50:	0000006f          	j	80008c50 <uartputc_sync+0x40>

0000000080008c54 <uartstart>:
    80008c54:	ff010113          	addi	sp,sp,-16
    80008c58:	00813423          	sd	s0,8(sp)
    80008c5c:	01010413          	addi	s0,sp,16
    80008c60:	00004617          	auipc	a2,0x4
    80008c64:	12060613          	addi	a2,a2,288 # 8000cd80 <uart_tx_r>
    80008c68:	00004517          	auipc	a0,0x4
    80008c6c:	12050513          	addi	a0,a0,288 # 8000cd88 <uart_tx_w>
    80008c70:	00063783          	ld	a5,0(a2)
    80008c74:	00053703          	ld	a4,0(a0)
    80008c78:	04f70263          	beq	a4,a5,80008cbc <uartstart+0x68>
    80008c7c:	100005b7          	lui	a1,0x10000
    80008c80:	0000b817          	auipc	a6,0xb
    80008c84:	68080813          	addi	a6,a6,1664 # 80014300 <uart_tx_buf>
    80008c88:	01c0006f          	j	80008ca4 <uartstart+0x50>
    80008c8c:	0006c703          	lbu	a4,0(a3)
    80008c90:	00f63023          	sd	a5,0(a2)
    80008c94:	00e58023          	sb	a4,0(a1) # 10000000 <_entry-0x70000000>
    80008c98:	00063783          	ld	a5,0(a2)
    80008c9c:	00053703          	ld	a4,0(a0)
    80008ca0:	00f70e63          	beq	a4,a5,80008cbc <uartstart+0x68>
    80008ca4:	01f7f713          	andi	a4,a5,31
    80008ca8:	00e806b3          	add	a3,a6,a4
    80008cac:	0055c703          	lbu	a4,5(a1)
    80008cb0:	00178793          	addi	a5,a5,1
    80008cb4:	02077713          	andi	a4,a4,32
    80008cb8:	fc071ae3          	bnez	a4,80008c8c <uartstart+0x38>
    80008cbc:	00813403          	ld	s0,8(sp)
    80008cc0:	01010113          	addi	sp,sp,16
    80008cc4:	00008067          	ret

0000000080008cc8 <uartgetc>:
    80008cc8:	ff010113          	addi	sp,sp,-16
    80008ccc:	00813423          	sd	s0,8(sp)
    80008cd0:	01010413          	addi	s0,sp,16
    80008cd4:	10000737          	lui	a4,0x10000
    80008cd8:	00574783          	lbu	a5,5(a4) # 10000005 <_entry-0x6ffffffb>
    80008cdc:	0017f793          	andi	a5,a5,1
    80008ce0:	00078c63          	beqz	a5,80008cf8 <uartgetc+0x30>
    80008ce4:	00074503          	lbu	a0,0(a4)
    80008ce8:	0ff57513          	andi	a0,a0,255
    80008cec:	00813403          	ld	s0,8(sp)
    80008cf0:	01010113          	addi	sp,sp,16
    80008cf4:	00008067          	ret
    80008cf8:	fff00513          	li	a0,-1
    80008cfc:	ff1ff06f          	j	80008cec <uartgetc+0x24>

0000000080008d00 <uartintr>:
    80008d00:	100007b7          	lui	a5,0x10000
    80008d04:	0057c783          	lbu	a5,5(a5) # 10000005 <_entry-0x6ffffffb>
    80008d08:	0017f793          	andi	a5,a5,1
    80008d0c:	0a078463          	beqz	a5,80008db4 <uartintr+0xb4>
    80008d10:	fe010113          	addi	sp,sp,-32
    80008d14:	00813823          	sd	s0,16(sp)
    80008d18:	00913423          	sd	s1,8(sp)
    80008d1c:	00113c23          	sd	ra,24(sp)
    80008d20:	02010413          	addi	s0,sp,32
    80008d24:	100004b7          	lui	s1,0x10000
    80008d28:	0004c503          	lbu	a0,0(s1) # 10000000 <_entry-0x70000000>
    80008d2c:	0ff57513          	andi	a0,a0,255
    80008d30:	fffff097          	auipc	ra,0xfffff
    80008d34:	534080e7          	jalr	1332(ra) # 80008264 <consoleintr>
    80008d38:	0054c783          	lbu	a5,5(s1)
    80008d3c:	0017f793          	andi	a5,a5,1
    80008d40:	fe0794e3          	bnez	a5,80008d28 <uartintr+0x28>
    80008d44:	00004617          	auipc	a2,0x4
    80008d48:	03c60613          	addi	a2,a2,60 # 8000cd80 <uart_tx_r>
    80008d4c:	00004517          	auipc	a0,0x4
    80008d50:	03c50513          	addi	a0,a0,60 # 8000cd88 <uart_tx_w>
    80008d54:	00063783          	ld	a5,0(a2)
    80008d58:	00053703          	ld	a4,0(a0)
    80008d5c:	04f70263          	beq	a4,a5,80008da0 <uartintr+0xa0>
    80008d60:	100005b7          	lui	a1,0x10000
    80008d64:	0000b817          	auipc	a6,0xb
    80008d68:	59c80813          	addi	a6,a6,1436 # 80014300 <uart_tx_buf>
    80008d6c:	01c0006f          	j	80008d88 <uartintr+0x88>
    80008d70:	0006c703          	lbu	a4,0(a3)
    80008d74:	00f63023          	sd	a5,0(a2)
    80008d78:	00e58023          	sb	a4,0(a1) # 10000000 <_entry-0x70000000>
    80008d7c:	00063783          	ld	a5,0(a2)
    80008d80:	00053703          	ld	a4,0(a0)
    80008d84:	00f70e63          	beq	a4,a5,80008da0 <uartintr+0xa0>
    80008d88:	01f7f713          	andi	a4,a5,31
    80008d8c:	00e806b3          	add	a3,a6,a4
    80008d90:	0055c703          	lbu	a4,5(a1)
    80008d94:	00178793          	addi	a5,a5,1
    80008d98:	02077713          	andi	a4,a4,32
    80008d9c:	fc071ae3          	bnez	a4,80008d70 <uartintr+0x70>
    80008da0:	01813083          	ld	ra,24(sp)
    80008da4:	01013403          	ld	s0,16(sp)
    80008da8:	00813483          	ld	s1,8(sp)
    80008dac:	02010113          	addi	sp,sp,32
    80008db0:	00008067          	ret
    80008db4:	00004617          	auipc	a2,0x4
    80008db8:	fcc60613          	addi	a2,a2,-52 # 8000cd80 <uart_tx_r>
    80008dbc:	00004517          	auipc	a0,0x4
    80008dc0:	fcc50513          	addi	a0,a0,-52 # 8000cd88 <uart_tx_w>
    80008dc4:	00063783          	ld	a5,0(a2)
    80008dc8:	00053703          	ld	a4,0(a0)
    80008dcc:	04f70263          	beq	a4,a5,80008e10 <uartintr+0x110>
    80008dd0:	100005b7          	lui	a1,0x10000
    80008dd4:	0000b817          	auipc	a6,0xb
    80008dd8:	52c80813          	addi	a6,a6,1324 # 80014300 <uart_tx_buf>
    80008ddc:	01c0006f          	j	80008df8 <uartintr+0xf8>
    80008de0:	0006c703          	lbu	a4,0(a3)
    80008de4:	00f63023          	sd	a5,0(a2)
    80008de8:	00e58023          	sb	a4,0(a1) # 10000000 <_entry-0x70000000>
    80008dec:	00063783          	ld	a5,0(a2)
    80008df0:	00053703          	ld	a4,0(a0)
    80008df4:	02f70063          	beq	a4,a5,80008e14 <uartintr+0x114>
    80008df8:	01f7f713          	andi	a4,a5,31
    80008dfc:	00e806b3          	add	a3,a6,a4
    80008e00:	0055c703          	lbu	a4,5(a1)
    80008e04:	00178793          	addi	a5,a5,1
    80008e08:	02077713          	andi	a4,a4,32
    80008e0c:	fc071ae3          	bnez	a4,80008de0 <uartintr+0xe0>
    80008e10:	00008067          	ret
    80008e14:	00008067          	ret

0000000080008e18 <kinit>:
    80008e18:	fc010113          	addi	sp,sp,-64
    80008e1c:	02913423          	sd	s1,40(sp)
    80008e20:	fffff7b7          	lui	a5,0xfffff
    80008e24:	0000c497          	auipc	s1,0xc
    80008e28:	4fb48493          	addi	s1,s1,1275 # 8001531f <end+0xfff>
    80008e2c:	02813823          	sd	s0,48(sp)
    80008e30:	01313c23          	sd	s3,24(sp)
    80008e34:	00f4f4b3          	and	s1,s1,a5
    80008e38:	02113c23          	sd	ra,56(sp)
    80008e3c:	03213023          	sd	s2,32(sp)
    80008e40:	01413823          	sd	s4,16(sp)
    80008e44:	01513423          	sd	s5,8(sp)
    80008e48:	04010413          	addi	s0,sp,64
    80008e4c:	000017b7          	lui	a5,0x1
    80008e50:	01100993          	li	s3,17
    80008e54:	00f487b3          	add	a5,s1,a5
    80008e58:	01b99993          	slli	s3,s3,0x1b
    80008e5c:	06f9e063          	bltu	s3,a5,80008ebc <kinit+0xa4>
    80008e60:	0000ba97          	auipc	s5,0xb
    80008e64:	4c0a8a93          	addi	s5,s5,1216 # 80014320 <end>
    80008e68:	0754ec63          	bltu	s1,s5,80008ee0 <kinit+0xc8>
    80008e6c:	0734fa63          	bgeu	s1,s3,80008ee0 <kinit+0xc8>
    80008e70:	00088a37          	lui	s4,0x88
    80008e74:	fffa0a13          	addi	s4,s4,-1 # 87fff <_entry-0x7ff78001>
    80008e78:	00004917          	auipc	s2,0x4
    80008e7c:	f1890913          	addi	s2,s2,-232 # 8000cd90 <kmem>
    80008e80:	00ca1a13          	slli	s4,s4,0xc
    80008e84:	0140006f          	j	80008e98 <kinit+0x80>
    80008e88:	000017b7          	lui	a5,0x1
    80008e8c:	00f484b3          	add	s1,s1,a5
    80008e90:	0554e863          	bltu	s1,s5,80008ee0 <kinit+0xc8>
    80008e94:	0534f663          	bgeu	s1,s3,80008ee0 <kinit+0xc8>
    80008e98:	00001637          	lui	a2,0x1
    80008e9c:	00100593          	li	a1,1
    80008ea0:	00048513          	mv	a0,s1
    80008ea4:	00000097          	auipc	ra,0x0
    80008ea8:	5e4080e7          	jalr	1508(ra) # 80009488 <__memset>
    80008eac:	00093783          	ld	a5,0(s2)
    80008eb0:	00f4b023          	sd	a5,0(s1)
    80008eb4:	00993023          	sd	s1,0(s2)
    80008eb8:	fd4498e3          	bne	s1,s4,80008e88 <kinit+0x70>
    80008ebc:	03813083          	ld	ra,56(sp)
    80008ec0:	03013403          	ld	s0,48(sp)
    80008ec4:	02813483          	ld	s1,40(sp)
    80008ec8:	02013903          	ld	s2,32(sp)
    80008ecc:	01813983          	ld	s3,24(sp)
    80008ed0:	01013a03          	ld	s4,16(sp)
    80008ed4:	00813a83          	ld	s5,8(sp)
    80008ed8:	04010113          	addi	sp,sp,64
    80008edc:	00008067          	ret
    80008ee0:	00001517          	auipc	a0,0x1
    80008ee4:	6e050513          	addi	a0,a0,1760 # 8000a5c0 <digits+0x18>
    80008ee8:	fffff097          	auipc	ra,0xfffff
    80008eec:	4b4080e7          	jalr	1204(ra) # 8000839c <panic>

0000000080008ef0 <freerange>:
    80008ef0:	fc010113          	addi	sp,sp,-64
    80008ef4:	000017b7          	lui	a5,0x1
    80008ef8:	02913423          	sd	s1,40(sp)
    80008efc:	fff78493          	addi	s1,a5,-1 # fff <_entry-0x7ffff001>
    80008f00:	009504b3          	add	s1,a0,s1
    80008f04:	fffff537          	lui	a0,0xfffff
    80008f08:	02813823          	sd	s0,48(sp)
    80008f0c:	02113c23          	sd	ra,56(sp)
    80008f10:	03213023          	sd	s2,32(sp)
    80008f14:	01313c23          	sd	s3,24(sp)
    80008f18:	01413823          	sd	s4,16(sp)
    80008f1c:	01513423          	sd	s5,8(sp)
    80008f20:	01613023          	sd	s6,0(sp)
    80008f24:	04010413          	addi	s0,sp,64
    80008f28:	00a4f4b3          	and	s1,s1,a0
    80008f2c:	00f487b3          	add	a5,s1,a5
    80008f30:	06f5e463          	bltu	a1,a5,80008f98 <freerange+0xa8>
    80008f34:	0000ba97          	auipc	s5,0xb
    80008f38:	3eca8a93          	addi	s5,s5,1004 # 80014320 <end>
    80008f3c:	0954e263          	bltu	s1,s5,80008fc0 <freerange+0xd0>
    80008f40:	01100993          	li	s3,17
    80008f44:	01b99993          	slli	s3,s3,0x1b
    80008f48:	0734fc63          	bgeu	s1,s3,80008fc0 <freerange+0xd0>
    80008f4c:	00058a13          	mv	s4,a1
    80008f50:	00004917          	auipc	s2,0x4
    80008f54:	e4090913          	addi	s2,s2,-448 # 8000cd90 <kmem>
    80008f58:	00002b37          	lui	s6,0x2
    80008f5c:	0140006f          	j	80008f70 <freerange+0x80>
    80008f60:	000017b7          	lui	a5,0x1
    80008f64:	00f484b3          	add	s1,s1,a5
    80008f68:	0554ec63          	bltu	s1,s5,80008fc0 <freerange+0xd0>
    80008f6c:	0534fa63          	bgeu	s1,s3,80008fc0 <freerange+0xd0>
    80008f70:	00001637          	lui	a2,0x1
    80008f74:	00100593          	li	a1,1
    80008f78:	00048513          	mv	a0,s1
    80008f7c:	00000097          	auipc	ra,0x0
    80008f80:	50c080e7          	jalr	1292(ra) # 80009488 <__memset>
    80008f84:	00093703          	ld	a4,0(s2)
    80008f88:	016487b3          	add	a5,s1,s6
    80008f8c:	00e4b023          	sd	a4,0(s1)
    80008f90:	00993023          	sd	s1,0(s2)
    80008f94:	fcfa76e3          	bgeu	s4,a5,80008f60 <freerange+0x70>
    80008f98:	03813083          	ld	ra,56(sp)
    80008f9c:	03013403          	ld	s0,48(sp)
    80008fa0:	02813483          	ld	s1,40(sp)
    80008fa4:	02013903          	ld	s2,32(sp)
    80008fa8:	01813983          	ld	s3,24(sp)
    80008fac:	01013a03          	ld	s4,16(sp)
    80008fb0:	00813a83          	ld	s5,8(sp)
    80008fb4:	00013b03          	ld	s6,0(sp)
    80008fb8:	04010113          	addi	sp,sp,64
    80008fbc:	00008067          	ret
    80008fc0:	00001517          	auipc	a0,0x1
    80008fc4:	60050513          	addi	a0,a0,1536 # 8000a5c0 <digits+0x18>
    80008fc8:	fffff097          	auipc	ra,0xfffff
    80008fcc:	3d4080e7          	jalr	980(ra) # 8000839c <panic>

0000000080008fd0 <kfree>:
    80008fd0:	fe010113          	addi	sp,sp,-32
    80008fd4:	00813823          	sd	s0,16(sp)
    80008fd8:	00113c23          	sd	ra,24(sp)
    80008fdc:	00913423          	sd	s1,8(sp)
    80008fe0:	02010413          	addi	s0,sp,32
    80008fe4:	03451793          	slli	a5,a0,0x34
    80008fe8:	04079c63          	bnez	a5,80009040 <kfree+0x70>
    80008fec:	0000b797          	auipc	a5,0xb
    80008ff0:	33478793          	addi	a5,a5,820 # 80014320 <end>
    80008ff4:	00050493          	mv	s1,a0
    80008ff8:	04f56463          	bltu	a0,a5,80009040 <kfree+0x70>
    80008ffc:	01100793          	li	a5,17
    80009000:	01b79793          	slli	a5,a5,0x1b
    80009004:	02f57e63          	bgeu	a0,a5,80009040 <kfree+0x70>
    80009008:	00001637          	lui	a2,0x1
    8000900c:	00100593          	li	a1,1
    80009010:	00000097          	auipc	ra,0x0
    80009014:	478080e7          	jalr	1144(ra) # 80009488 <__memset>
    80009018:	00004797          	auipc	a5,0x4
    8000901c:	d7878793          	addi	a5,a5,-648 # 8000cd90 <kmem>
    80009020:	0007b703          	ld	a4,0(a5)
    80009024:	01813083          	ld	ra,24(sp)
    80009028:	01013403          	ld	s0,16(sp)
    8000902c:	00e4b023          	sd	a4,0(s1)
    80009030:	0097b023          	sd	s1,0(a5)
    80009034:	00813483          	ld	s1,8(sp)
    80009038:	02010113          	addi	sp,sp,32
    8000903c:	00008067          	ret
    80009040:	00001517          	auipc	a0,0x1
    80009044:	58050513          	addi	a0,a0,1408 # 8000a5c0 <digits+0x18>
    80009048:	fffff097          	auipc	ra,0xfffff
    8000904c:	354080e7          	jalr	852(ra) # 8000839c <panic>

0000000080009050 <kalloc>:
    80009050:	fe010113          	addi	sp,sp,-32
    80009054:	00813823          	sd	s0,16(sp)
    80009058:	00913423          	sd	s1,8(sp)
    8000905c:	00113c23          	sd	ra,24(sp)
    80009060:	02010413          	addi	s0,sp,32
    80009064:	00004797          	auipc	a5,0x4
    80009068:	d2c78793          	addi	a5,a5,-724 # 8000cd90 <kmem>
    8000906c:	0007b483          	ld	s1,0(a5)
    80009070:	02048063          	beqz	s1,80009090 <kalloc+0x40>
    80009074:	0004b703          	ld	a4,0(s1)
    80009078:	00001637          	lui	a2,0x1
    8000907c:	00500593          	li	a1,5
    80009080:	00048513          	mv	a0,s1
    80009084:	00e7b023          	sd	a4,0(a5)
    80009088:	00000097          	auipc	ra,0x0
    8000908c:	400080e7          	jalr	1024(ra) # 80009488 <__memset>
    80009090:	01813083          	ld	ra,24(sp)
    80009094:	01013403          	ld	s0,16(sp)
    80009098:	00048513          	mv	a0,s1
    8000909c:	00813483          	ld	s1,8(sp)
    800090a0:	02010113          	addi	sp,sp,32
    800090a4:	00008067          	ret

00000000800090a8 <initlock>:
    800090a8:	ff010113          	addi	sp,sp,-16
    800090ac:	00813423          	sd	s0,8(sp)
    800090b0:	01010413          	addi	s0,sp,16
    800090b4:	00813403          	ld	s0,8(sp)
    800090b8:	00b53423          	sd	a1,8(a0)
    800090bc:	00052023          	sw	zero,0(a0)
    800090c0:	00053823          	sd	zero,16(a0)
    800090c4:	01010113          	addi	sp,sp,16
    800090c8:	00008067          	ret

00000000800090cc <acquire>:
    800090cc:	fe010113          	addi	sp,sp,-32
    800090d0:	00813823          	sd	s0,16(sp)
    800090d4:	00913423          	sd	s1,8(sp)
    800090d8:	00113c23          	sd	ra,24(sp)
    800090dc:	01213023          	sd	s2,0(sp)
    800090e0:	02010413          	addi	s0,sp,32
    800090e4:	00050493          	mv	s1,a0
    800090e8:	10002973          	csrr	s2,sstatus
    800090ec:	100027f3          	csrr	a5,sstatus
    800090f0:	ffd7f793          	andi	a5,a5,-3
    800090f4:	10079073          	csrw	sstatus,a5
    800090f8:	fffff097          	auipc	ra,0xfffff
    800090fc:	8e4080e7          	jalr	-1820(ra) # 800079dc <mycpu>
    80009100:	07852783          	lw	a5,120(a0)
    80009104:	06078e63          	beqz	a5,80009180 <acquire+0xb4>
    80009108:	fffff097          	auipc	ra,0xfffff
    8000910c:	8d4080e7          	jalr	-1836(ra) # 800079dc <mycpu>
    80009110:	07852783          	lw	a5,120(a0)
    80009114:	0004a703          	lw	a4,0(s1)
    80009118:	0017879b          	addiw	a5,a5,1
    8000911c:	06f52c23          	sw	a5,120(a0)
    80009120:	04071063          	bnez	a4,80009160 <acquire+0x94>
    80009124:	00100713          	li	a4,1
    80009128:	00070793          	mv	a5,a4
    8000912c:	0cf4a7af          	amoswap.w.aq	a5,a5,(s1)
    80009130:	0007879b          	sext.w	a5,a5
    80009134:	fe079ae3          	bnez	a5,80009128 <acquire+0x5c>
    80009138:	0ff0000f          	fence
    8000913c:	fffff097          	auipc	ra,0xfffff
    80009140:	8a0080e7          	jalr	-1888(ra) # 800079dc <mycpu>
    80009144:	01813083          	ld	ra,24(sp)
    80009148:	01013403          	ld	s0,16(sp)
    8000914c:	00a4b823          	sd	a0,16(s1)
    80009150:	00013903          	ld	s2,0(sp)
    80009154:	00813483          	ld	s1,8(sp)
    80009158:	02010113          	addi	sp,sp,32
    8000915c:	00008067          	ret
    80009160:	0104b903          	ld	s2,16(s1)
    80009164:	fffff097          	auipc	ra,0xfffff
    80009168:	878080e7          	jalr	-1928(ra) # 800079dc <mycpu>
    8000916c:	faa91ce3          	bne	s2,a0,80009124 <acquire+0x58>
    80009170:	00001517          	auipc	a0,0x1
    80009174:	45850513          	addi	a0,a0,1112 # 8000a5c8 <digits+0x20>
    80009178:	fffff097          	auipc	ra,0xfffff
    8000917c:	224080e7          	jalr	548(ra) # 8000839c <panic>
    80009180:	00195913          	srli	s2,s2,0x1
    80009184:	fffff097          	auipc	ra,0xfffff
    80009188:	858080e7          	jalr	-1960(ra) # 800079dc <mycpu>
    8000918c:	00197913          	andi	s2,s2,1
    80009190:	07252e23          	sw	s2,124(a0)
    80009194:	f75ff06f          	j	80009108 <acquire+0x3c>

0000000080009198 <release>:
    80009198:	fe010113          	addi	sp,sp,-32
    8000919c:	00813823          	sd	s0,16(sp)
    800091a0:	00113c23          	sd	ra,24(sp)
    800091a4:	00913423          	sd	s1,8(sp)
    800091a8:	01213023          	sd	s2,0(sp)
    800091ac:	02010413          	addi	s0,sp,32
    800091b0:	00052783          	lw	a5,0(a0)
    800091b4:	00079a63          	bnez	a5,800091c8 <release+0x30>
    800091b8:	00001517          	auipc	a0,0x1
    800091bc:	41850513          	addi	a0,a0,1048 # 8000a5d0 <digits+0x28>
    800091c0:	fffff097          	auipc	ra,0xfffff
    800091c4:	1dc080e7          	jalr	476(ra) # 8000839c <panic>
    800091c8:	01053903          	ld	s2,16(a0)
    800091cc:	00050493          	mv	s1,a0
    800091d0:	fffff097          	auipc	ra,0xfffff
    800091d4:	80c080e7          	jalr	-2036(ra) # 800079dc <mycpu>
    800091d8:	fea910e3          	bne	s2,a0,800091b8 <release+0x20>
    800091dc:	0004b823          	sd	zero,16(s1)
    800091e0:	0ff0000f          	fence
    800091e4:	0f50000f          	fence	iorw,ow
    800091e8:	0804a02f          	amoswap.w	zero,zero,(s1)
    800091ec:	ffffe097          	auipc	ra,0xffffe
    800091f0:	7f0080e7          	jalr	2032(ra) # 800079dc <mycpu>
    800091f4:	100027f3          	csrr	a5,sstatus
    800091f8:	0027f793          	andi	a5,a5,2
    800091fc:	04079a63          	bnez	a5,80009250 <release+0xb8>
    80009200:	07852783          	lw	a5,120(a0)
    80009204:	02f05e63          	blez	a5,80009240 <release+0xa8>
    80009208:	fff7871b          	addiw	a4,a5,-1
    8000920c:	06e52c23          	sw	a4,120(a0)
    80009210:	00071c63          	bnez	a4,80009228 <release+0x90>
    80009214:	07c52783          	lw	a5,124(a0)
    80009218:	00078863          	beqz	a5,80009228 <release+0x90>
    8000921c:	100027f3          	csrr	a5,sstatus
    80009220:	0027e793          	ori	a5,a5,2
    80009224:	10079073          	csrw	sstatus,a5
    80009228:	01813083          	ld	ra,24(sp)
    8000922c:	01013403          	ld	s0,16(sp)
    80009230:	00813483          	ld	s1,8(sp)
    80009234:	00013903          	ld	s2,0(sp)
    80009238:	02010113          	addi	sp,sp,32
    8000923c:	00008067          	ret
    80009240:	00001517          	auipc	a0,0x1
    80009244:	3b050513          	addi	a0,a0,944 # 8000a5f0 <digits+0x48>
    80009248:	fffff097          	auipc	ra,0xfffff
    8000924c:	154080e7          	jalr	340(ra) # 8000839c <panic>
    80009250:	00001517          	auipc	a0,0x1
    80009254:	38850513          	addi	a0,a0,904 # 8000a5d8 <digits+0x30>
    80009258:	fffff097          	auipc	ra,0xfffff
    8000925c:	144080e7          	jalr	324(ra) # 8000839c <panic>

0000000080009260 <holding>:
    80009260:	00052783          	lw	a5,0(a0)
    80009264:	00079663          	bnez	a5,80009270 <holding+0x10>
    80009268:	00000513          	li	a0,0
    8000926c:	00008067          	ret
    80009270:	fe010113          	addi	sp,sp,-32
    80009274:	00813823          	sd	s0,16(sp)
    80009278:	00913423          	sd	s1,8(sp)
    8000927c:	00113c23          	sd	ra,24(sp)
    80009280:	02010413          	addi	s0,sp,32
    80009284:	01053483          	ld	s1,16(a0)
    80009288:	ffffe097          	auipc	ra,0xffffe
    8000928c:	754080e7          	jalr	1876(ra) # 800079dc <mycpu>
    80009290:	01813083          	ld	ra,24(sp)
    80009294:	01013403          	ld	s0,16(sp)
    80009298:	40a48533          	sub	a0,s1,a0
    8000929c:	00153513          	seqz	a0,a0
    800092a0:	00813483          	ld	s1,8(sp)
    800092a4:	02010113          	addi	sp,sp,32
    800092a8:	00008067          	ret

00000000800092ac <push_off>:
    800092ac:	fe010113          	addi	sp,sp,-32
    800092b0:	00813823          	sd	s0,16(sp)
    800092b4:	00113c23          	sd	ra,24(sp)
    800092b8:	00913423          	sd	s1,8(sp)
    800092bc:	02010413          	addi	s0,sp,32
    800092c0:	100024f3          	csrr	s1,sstatus
    800092c4:	100027f3          	csrr	a5,sstatus
    800092c8:	ffd7f793          	andi	a5,a5,-3
    800092cc:	10079073          	csrw	sstatus,a5
    800092d0:	ffffe097          	auipc	ra,0xffffe
    800092d4:	70c080e7          	jalr	1804(ra) # 800079dc <mycpu>
    800092d8:	07852783          	lw	a5,120(a0)
    800092dc:	02078663          	beqz	a5,80009308 <push_off+0x5c>
    800092e0:	ffffe097          	auipc	ra,0xffffe
    800092e4:	6fc080e7          	jalr	1788(ra) # 800079dc <mycpu>
    800092e8:	07852783          	lw	a5,120(a0)
    800092ec:	01813083          	ld	ra,24(sp)
    800092f0:	01013403          	ld	s0,16(sp)
    800092f4:	0017879b          	addiw	a5,a5,1
    800092f8:	06f52c23          	sw	a5,120(a0)
    800092fc:	00813483          	ld	s1,8(sp)
    80009300:	02010113          	addi	sp,sp,32
    80009304:	00008067          	ret
    80009308:	0014d493          	srli	s1,s1,0x1
    8000930c:	ffffe097          	auipc	ra,0xffffe
    80009310:	6d0080e7          	jalr	1744(ra) # 800079dc <mycpu>
    80009314:	0014f493          	andi	s1,s1,1
    80009318:	06952e23          	sw	s1,124(a0)
    8000931c:	fc5ff06f          	j	800092e0 <push_off+0x34>

0000000080009320 <pop_off>:
    80009320:	ff010113          	addi	sp,sp,-16
    80009324:	00813023          	sd	s0,0(sp)
    80009328:	00113423          	sd	ra,8(sp)
    8000932c:	01010413          	addi	s0,sp,16
    80009330:	ffffe097          	auipc	ra,0xffffe
    80009334:	6ac080e7          	jalr	1708(ra) # 800079dc <mycpu>
    80009338:	100027f3          	csrr	a5,sstatus
    8000933c:	0027f793          	andi	a5,a5,2
    80009340:	04079663          	bnez	a5,8000938c <pop_off+0x6c>
    80009344:	07852783          	lw	a5,120(a0)
    80009348:	02f05a63          	blez	a5,8000937c <pop_off+0x5c>
    8000934c:	fff7871b          	addiw	a4,a5,-1
    80009350:	06e52c23          	sw	a4,120(a0)
    80009354:	00071c63          	bnez	a4,8000936c <pop_off+0x4c>
    80009358:	07c52783          	lw	a5,124(a0)
    8000935c:	00078863          	beqz	a5,8000936c <pop_off+0x4c>
    80009360:	100027f3          	csrr	a5,sstatus
    80009364:	0027e793          	ori	a5,a5,2
    80009368:	10079073          	csrw	sstatus,a5
    8000936c:	00813083          	ld	ra,8(sp)
    80009370:	00013403          	ld	s0,0(sp)
    80009374:	01010113          	addi	sp,sp,16
    80009378:	00008067          	ret
    8000937c:	00001517          	auipc	a0,0x1
    80009380:	27450513          	addi	a0,a0,628 # 8000a5f0 <digits+0x48>
    80009384:	fffff097          	auipc	ra,0xfffff
    80009388:	018080e7          	jalr	24(ra) # 8000839c <panic>
    8000938c:	00001517          	auipc	a0,0x1
    80009390:	24c50513          	addi	a0,a0,588 # 8000a5d8 <digits+0x30>
    80009394:	fffff097          	auipc	ra,0xfffff
    80009398:	008080e7          	jalr	8(ra) # 8000839c <panic>

000000008000939c <push_on>:
    8000939c:	fe010113          	addi	sp,sp,-32
    800093a0:	00813823          	sd	s0,16(sp)
    800093a4:	00113c23          	sd	ra,24(sp)
    800093a8:	00913423          	sd	s1,8(sp)
    800093ac:	02010413          	addi	s0,sp,32
    800093b0:	100024f3          	csrr	s1,sstatus
    800093b4:	100027f3          	csrr	a5,sstatus
    800093b8:	0027e793          	ori	a5,a5,2
    800093bc:	10079073          	csrw	sstatus,a5
    800093c0:	ffffe097          	auipc	ra,0xffffe
    800093c4:	61c080e7          	jalr	1564(ra) # 800079dc <mycpu>
    800093c8:	07852783          	lw	a5,120(a0)
    800093cc:	02078663          	beqz	a5,800093f8 <push_on+0x5c>
    800093d0:	ffffe097          	auipc	ra,0xffffe
    800093d4:	60c080e7          	jalr	1548(ra) # 800079dc <mycpu>
    800093d8:	07852783          	lw	a5,120(a0)
    800093dc:	01813083          	ld	ra,24(sp)
    800093e0:	01013403          	ld	s0,16(sp)
    800093e4:	0017879b          	addiw	a5,a5,1
    800093e8:	06f52c23          	sw	a5,120(a0)
    800093ec:	00813483          	ld	s1,8(sp)
    800093f0:	02010113          	addi	sp,sp,32
    800093f4:	00008067          	ret
    800093f8:	0014d493          	srli	s1,s1,0x1
    800093fc:	ffffe097          	auipc	ra,0xffffe
    80009400:	5e0080e7          	jalr	1504(ra) # 800079dc <mycpu>
    80009404:	0014f493          	andi	s1,s1,1
    80009408:	06952e23          	sw	s1,124(a0)
    8000940c:	fc5ff06f          	j	800093d0 <push_on+0x34>

0000000080009410 <pop_on>:
    80009410:	ff010113          	addi	sp,sp,-16
    80009414:	00813023          	sd	s0,0(sp)
    80009418:	00113423          	sd	ra,8(sp)
    8000941c:	01010413          	addi	s0,sp,16
    80009420:	ffffe097          	auipc	ra,0xffffe
    80009424:	5bc080e7          	jalr	1468(ra) # 800079dc <mycpu>
    80009428:	100027f3          	csrr	a5,sstatus
    8000942c:	0027f793          	andi	a5,a5,2
    80009430:	04078463          	beqz	a5,80009478 <pop_on+0x68>
    80009434:	07852783          	lw	a5,120(a0)
    80009438:	02f05863          	blez	a5,80009468 <pop_on+0x58>
    8000943c:	fff7879b          	addiw	a5,a5,-1
    80009440:	06f52c23          	sw	a5,120(a0)
    80009444:	07853783          	ld	a5,120(a0)
    80009448:	00079863          	bnez	a5,80009458 <pop_on+0x48>
    8000944c:	100027f3          	csrr	a5,sstatus
    80009450:	ffd7f793          	andi	a5,a5,-3
    80009454:	10079073          	csrw	sstatus,a5
    80009458:	00813083          	ld	ra,8(sp)
    8000945c:	00013403          	ld	s0,0(sp)
    80009460:	01010113          	addi	sp,sp,16
    80009464:	00008067          	ret
    80009468:	00001517          	auipc	a0,0x1
    8000946c:	1b050513          	addi	a0,a0,432 # 8000a618 <digits+0x70>
    80009470:	fffff097          	auipc	ra,0xfffff
    80009474:	f2c080e7          	jalr	-212(ra) # 8000839c <panic>
    80009478:	00001517          	auipc	a0,0x1
    8000947c:	18050513          	addi	a0,a0,384 # 8000a5f8 <digits+0x50>
    80009480:	fffff097          	auipc	ra,0xfffff
    80009484:	f1c080e7          	jalr	-228(ra) # 8000839c <panic>

0000000080009488 <__memset>:
    80009488:	ff010113          	addi	sp,sp,-16
    8000948c:	00813423          	sd	s0,8(sp)
    80009490:	01010413          	addi	s0,sp,16
    80009494:	1a060e63          	beqz	a2,80009650 <__memset+0x1c8>
    80009498:	40a007b3          	neg	a5,a0
    8000949c:	0077f793          	andi	a5,a5,7
    800094a0:	00778693          	addi	a3,a5,7
    800094a4:	00b00813          	li	a6,11
    800094a8:	0ff5f593          	andi	a1,a1,255
    800094ac:	fff6071b          	addiw	a4,a2,-1
    800094b0:	1b06e663          	bltu	a3,a6,8000965c <__memset+0x1d4>
    800094b4:	1cd76463          	bltu	a4,a3,8000967c <__memset+0x1f4>
    800094b8:	1a078e63          	beqz	a5,80009674 <__memset+0x1ec>
    800094bc:	00b50023          	sb	a1,0(a0)
    800094c0:	00100713          	li	a4,1
    800094c4:	1ae78463          	beq	a5,a4,8000966c <__memset+0x1e4>
    800094c8:	00b500a3          	sb	a1,1(a0)
    800094cc:	00200713          	li	a4,2
    800094d0:	1ae78a63          	beq	a5,a4,80009684 <__memset+0x1fc>
    800094d4:	00b50123          	sb	a1,2(a0)
    800094d8:	00300713          	li	a4,3
    800094dc:	18e78463          	beq	a5,a4,80009664 <__memset+0x1dc>
    800094e0:	00b501a3          	sb	a1,3(a0)
    800094e4:	00400713          	li	a4,4
    800094e8:	1ae78263          	beq	a5,a4,8000968c <__memset+0x204>
    800094ec:	00b50223          	sb	a1,4(a0)
    800094f0:	00500713          	li	a4,5
    800094f4:	1ae78063          	beq	a5,a4,80009694 <__memset+0x20c>
    800094f8:	00b502a3          	sb	a1,5(a0)
    800094fc:	00700713          	li	a4,7
    80009500:	18e79e63          	bne	a5,a4,8000969c <__memset+0x214>
    80009504:	00b50323          	sb	a1,6(a0)
    80009508:	00700e93          	li	t4,7
    8000950c:	00859713          	slli	a4,a1,0x8
    80009510:	00e5e733          	or	a4,a1,a4
    80009514:	01059e13          	slli	t3,a1,0x10
    80009518:	01c76e33          	or	t3,a4,t3
    8000951c:	01859313          	slli	t1,a1,0x18
    80009520:	006e6333          	or	t1,t3,t1
    80009524:	02059893          	slli	a7,a1,0x20
    80009528:	40f60e3b          	subw	t3,a2,a5
    8000952c:	011368b3          	or	a7,t1,a7
    80009530:	02859813          	slli	a6,a1,0x28
    80009534:	0108e833          	or	a6,a7,a6
    80009538:	03059693          	slli	a3,a1,0x30
    8000953c:	003e589b          	srliw	a7,t3,0x3
    80009540:	00d866b3          	or	a3,a6,a3
    80009544:	03859713          	slli	a4,a1,0x38
    80009548:	00389813          	slli	a6,a7,0x3
    8000954c:	00f507b3          	add	a5,a0,a5
    80009550:	00e6e733          	or	a4,a3,a4
    80009554:	000e089b          	sext.w	a7,t3
    80009558:	00f806b3          	add	a3,a6,a5
    8000955c:	00e7b023          	sd	a4,0(a5)
    80009560:	00878793          	addi	a5,a5,8
    80009564:	fed79ce3          	bne	a5,a3,8000955c <__memset+0xd4>
    80009568:	ff8e7793          	andi	a5,t3,-8
    8000956c:	0007871b          	sext.w	a4,a5
    80009570:	01d787bb          	addw	a5,a5,t4
    80009574:	0ce88e63          	beq	a7,a4,80009650 <__memset+0x1c8>
    80009578:	00f50733          	add	a4,a0,a5
    8000957c:	00b70023          	sb	a1,0(a4)
    80009580:	0017871b          	addiw	a4,a5,1
    80009584:	0cc77663          	bgeu	a4,a2,80009650 <__memset+0x1c8>
    80009588:	00e50733          	add	a4,a0,a4
    8000958c:	00b70023          	sb	a1,0(a4)
    80009590:	0027871b          	addiw	a4,a5,2
    80009594:	0ac77e63          	bgeu	a4,a2,80009650 <__memset+0x1c8>
    80009598:	00e50733          	add	a4,a0,a4
    8000959c:	00b70023          	sb	a1,0(a4)
    800095a0:	0037871b          	addiw	a4,a5,3
    800095a4:	0ac77663          	bgeu	a4,a2,80009650 <__memset+0x1c8>
    800095a8:	00e50733          	add	a4,a0,a4
    800095ac:	00b70023          	sb	a1,0(a4)
    800095b0:	0047871b          	addiw	a4,a5,4
    800095b4:	08c77e63          	bgeu	a4,a2,80009650 <__memset+0x1c8>
    800095b8:	00e50733          	add	a4,a0,a4
    800095bc:	00b70023          	sb	a1,0(a4)
    800095c0:	0057871b          	addiw	a4,a5,5
    800095c4:	08c77663          	bgeu	a4,a2,80009650 <__memset+0x1c8>
    800095c8:	00e50733          	add	a4,a0,a4
    800095cc:	00b70023          	sb	a1,0(a4)
    800095d0:	0067871b          	addiw	a4,a5,6
    800095d4:	06c77e63          	bgeu	a4,a2,80009650 <__memset+0x1c8>
    800095d8:	00e50733          	add	a4,a0,a4
    800095dc:	00b70023          	sb	a1,0(a4)
    800095e0:	0077871b          	addiw	a4,a5,7
    800095e4:	06c77663          	bgeu	a4,a2,80009650 <__memset+0x1c8>
    800095e8:	00e50733          	add	a4,a0,a4
    800095ec:	00b70023          	sb	a1,0(a4)
    800095f0:	0087871b          	addiw	a4,a5,8
    800095f4:	04c77e63          	bgeu	a4,a2,80009650 <__memset+0x1c8>
    800095f8:	00e50733          	add	a4,a0,a4
    800095fc:	00b70023          	sb	a1,0(a4)
    80009600:	0097871b          	addiw	a4,a5,9
    80009604:	04c77663          	bgeu	a4,a2,80009650 <__memset+0x1c8>
    80009608:	00e50733          	add	a4,a0,a4
    8000960c:	00b70023          	sb	a1,0(a4)
    80009610:	00a7871b          	addiw	a4,a5,10
    80009614:	02c77e63          	bgeu	a4,a2,80009650 <__memset+0x1c8>
    80009618:	00e50733          	add	a4,a0,a4
    8000961c:	00b70023          	sb	a1,0(a4)
    80009620:	00b7871b          	addiw	a4,a5,11
    80009624:	02c77663          	bgeu	a4,a2,80009650 <__memset+0x1c8>
    80009628:	00e50733          	add	a4,a0,a4
    8000962c:	00b70023          	sb	a1,0(a4)
    80009630:	00c7871b          	addiw	a4,a5,12
    80009634:	00c77e63          	bgeu	a4,a2,80009650 <__memset+0x1c8>
    80009638:	00e50733          	add	a4,a0,a4
    8000963c:	00b70023          	sb	a1,0(a4)
    80009640:	00d7879b          	addiw	a5,a5,13
    80009644:	00c7f663          	bgeu	a5,a2,80009650 <__memset+0x1c8>
    80009648:	00f507b3          	add	a5,a0,a5
    8000964c:	00b78023          	sb	a1,0(a5)
    80009650:	00813403          	ld	s0,8(sp)
    80009654:	01010113          	addi	sp,sp,16
    80009658:	00008067          	ret
    8000965c:	00b00693          	li	a3,11
    80009660:	e55ff06f          	j	800094b4 <__memset+0x2c>
    80009664:	00300e93          	li	t4,3
    80009668:	ea5ff06f          	j	8000950c <__memset+0x84>
    8000966c:	00100e93          	li	t4,1
    80009670:	e9dff06f          	j	8000950c <__memset+0x84>
    80009674:	00000e93          	li	t4,0
    80009678:	e95ff06f          	j	8000950c <__memset+0x84>
    8000967c:	00000793          	li	a5,0
    80009680:	ef9ff06f          	j	80009578 <__memset+0xf0>
    80009684:	00200e93          	li	t4,2
    80009688:	e85ff06f          	j	8000950c <__memset+0x84>
    8000968c:	00400e93          	li	t4,4
    80009690:	e7dff06f          	j	8000950c <__memset+0x84>
    80009694:	00500e93          	li	t4,5
    80009698:	e75ff06f          	j	8000950c <__memset+0x84>
    8000969c:	00600e93          	li	t4,6
    800096a0:	e6dff06f          	j	8000950c <__memset+0x84>

00000000800096a4 <__memmove>:
    800096a4:	ff010113          	addi	sp,sp,-16
    800096a8:	00813423          	sd	s0,8(sp)
    800096ac:	01010413          	addi	s0,sp,16
    800096b0:	0e060863          	beqz	a2,800097a0 <__memmove+0xfc>
    800096b4:	fff6069b          	addiw	a3,a2,-1
    800096b8:	0006881b          	sext.w	a6,a3
    800096bc:	0ea5e863          	bltu	a1,a0,800097ac <__memmove+0x108>
    800096c0:	00758713          	addi	a4,a1,7
    800096c4:	00a5e7b3          	or	a5,a1,a0
    800096c8:	40a70733          	sub	a4,a4,a0
    800096cc:	0077f793          	andi	a5,a5,7
    800096d0:	00f73713          	sltiu	a4,a4,15
    800096d4:	00174713          	xori	a4,a4,1
    800096d8:	0017b793          	seqz	a5,a5
    800096dc:	00e7f7b3          	and	a5,a5,a4
    800096e0:	10078863          	beqz	a5,800097f0 <__memmove+0x14c>
    800096e4:	00900793          	li	a5,9
    800096e8:	1107f463          	bgeu	a5,a6,800097f0 <__memmove+0x14c>
    800096ec:	0036581b          	srliw	a6,a2,0x3
    800096f0:	fff8081b          	addiw	a6,a6,-1
    800096f4:	02081813          	slli	a6,a6,0x20
    800096f8:	01d85893          	srli	a7,a6,0x1d
    800096fc:	00858813          	addi	a6,a1,8
    80009700:	00058793          	mv	a5,a1
    80009704:	00050713          	mv	a4,a0
    80009708:	01088833          	add	a6,a7,a6
    8000970c:	0007b883          	ld	a7,0(a5)
    80009710:	00878793          	addi	a5,a5,8
    80009714:	00870713          	addi	a4,a4,8
    80009718:	ff173c23          	sd	a7,-8(a4)
    8000971c:	ff0798e3          	bne	a5,a6,8000970c <__memmove+0x68>
    80009720:	ff867713          	andi	a4,a2,-8
    80009724:	02071793          	slli	a5,a4,0x20
    80009728:	0207d793          	srli	a5,a5,0x20
    8000972c:	00f585b3          	add	a1,a1,a5
    80009730:	40e686bb          	subw	a3,a3,a4
    80009734:	00f507b3          	add	a5,a0,a5
    80009738:	06e60463          	beq	a2,a4,800097a0 <__memmove+0xfc>
    8000973c:	0005c703          	lbu	a4,0(a1)
    80009740:	00e78023          	sb	a4,0(a5)
    80009744:	04068e63          	beqz	a3,800097a0 <__memmove+0xfc>
    80009748:	0015c603          	lbu	a2,1(a1)
    8000974c:	00100713          	li	a4,1
    80009750:	00c780a3          	sb	a2,1(a5)
    80009754:	04e68663          	beq	a3,a4,800097a0 <__memmove+0xfc>
    80009758:	0025c603          	lbu	a2,2(a1)
    8000975c:	00200713          	li	a4,2
    80009760:	00c78123          	sb	a2,2(a5)
    80009764:	02e68e63          	beq	a3,a4,800097a0 <__memmove+0xfc>
    80009768:	0035c603          	lbu	a2,3(a1)
    8000976c:	00300713          	li	a4,3
    80009770:	00c781a3          	sb	a2,3(a5)
    80009774:	02e68663          	beq	a3,a4,800097a0 <__memmove+0xfc>
    80009778:	0045c603          	lbu	a2,4(a1)
    8000977c:	00400713          	li	a4,4
    80009780:	00c78223          	sb	a2,4(a5)
    80009784:	00e68e63          	beq	a3,a4,800097a0 <__memmove+0xfc>
    80009788:	0055c603          	lbu	a2,5(a1)
    8000978c:	00500713          	li	a4,5
    80009790:	00c782a3          	sb	a2,5(a5)
    80009794:	00e68663          	beq	a3,a4,800097a0 <__memmove+0xfc>
    80009798:	0065c703          	lbu	a4,6(a1)
    8000979c:	00e78323          	sb	a4,6(a5)
    800097a0:	00813403          	ld	s0,8(sp)
    800097a4:	01010113          	addi	sp,sp,16
    800097a8:	00008067          	ret
    800097ac:	02061713          	slli	a4,a2,0x20
    800097b0:	02075713          	srli	a4,a4,0x20
    800097b4:	00e587b3          	add	a5,a1,a4
    800097b8:	f0f574e3          	bgeu	a0,a5,800096c0 <__memmove+0x1c>
    800097bc:	02069613          	slli	a2,a3,0x20
    800097c0:	02065613          	srli	a2,a2,0x20
    800097c4:	fff64613          	not	a2,a2
    800097c8:	00e50733          	add	a4,a0,a4
    800097cc:	00c78633          	add	a2,a5,a2
    800097d0:	fff7c683          	lbu	a3,-1(a5)
    800097d4:	fff78793          	addi	a5,a5,-1
    800097d8:	fff70713          	addi	a4,a4,-1
    800097dc:	00d70023          	sb	a3,0(a4)
    800097e0:	fec798e3          	bne	a5,a2,800097d0 <__memmove+0x12c>
    800097e4:	00813403          	ld	s0,8(sp)
    800097e8:	01010113          	addi	sp,sp,16
    800097ec:	00008067          	ret
    800097f0:	02069713          	slli	a4,a3,0x20
    800097f4:	02075713          	srli	a4,a4,0x20
    800097f8:	00170713          	addi	a4,a4,1
    800097fc:	00e50733          	add	a4,a0,a4
    80009800:	00050793          	mv	a5,a0
    80009804:	0005c683          	lbu	a3,0(a1)
    80009808:	00178793          	addi	a5,a5,1
    8000980c:	00158593          	addi	a1,a1,1
    80009810:	fed78fa3          	sb	a3,-1(a5)
    80009814:	fee798e3          	bne	a5,a4,80009804 <__memmove+0x160>
    80009818:	f89ff06f          	j	800097a0 <__memmove+0xfc>
	...

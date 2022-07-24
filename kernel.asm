
kernel:     file format elf64-littleriscv


Disassembly of section .text:

0000000080000000 <_entry>:
    80000000:	00008117          	auipc	sp,0x8
    80000004:	48813103          	ld	sp,1160(sp) # 80008488 <_GLOBAL_OFFSET_TABLE_+0x40>
    80000008:	00001537          	lui	a0,0x1
    8000000c:	f14025f3          	csrr	a1,mhartid
    80000010:	00158593          	addi	a1,a1,1
    80000014:	02b50533          	mul	a0,a0,a1
    80000018:	00a10133          	add	sp,sp,a0
    8000001c:	1e8040ef          	jal	ra,80004204 <start>

0000000080000020 <spin>:
    80000020:	0000006f          	j	80000020 <spin>
	...

0000000080001000 <_ZN5Riscv13pushRegistersEv>:

.global _ZN5Riscv13pushRegistersEv
.type _ZN5Riscv13pushRegistersEv, @function

_ZN5Riscv13pushRegistersEv:
    addi sp, sp, -256
    80001000:	f0010113          	addi	sp,sp,-256
    .irp index, 3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28,29,30,31
    sd x\index, \index*8(sp)
    .endr
    80001004:	00313c23          	sd	gp,24(sp)
    80001008:	02413023          	sd	tp,32(sp)
    8000100c:	02513423          	sd	t0,40(sp)
    80001010:	02613823          	sd	t1,48(sp)
    80001014:	02713c23          	sd	t2,56(sp)
    80001018:	04813023          	sd	s0,64(sp)
    8000101c:	04913423          	sd	s1,72(sp)
    80001020:	04a13823          	sd	a0,80(sp)
    80001024:	04b13c23          	sd	a1,88(sp)
    80001028:	06c13023          	sd	a2,96(sp)
    8000102c:	06d13423          	sd	a3,104(sp)
    80001030:	06e13823          	sd	a4,112(sp)
    80001034:	06f13c23          	sd	a5,120(sp)
    80001038:	09013023          	sd	a6,128(sp)
    8000103c:	09113423          	sd	a7,136(sp)
    80001040:	09213823          	sd	s2,144(sp)
    80001044:	09313c23          	sd	s3,152(sp)
    80001048:	0b413023          	sd	s4,160(sp)
    8000104c:	0b513423          	sd	s5,168(sp)
    80001050:	0b613823          	sd	s6,176(sp)
    80001054:	0b713c23          	sd	s7,184(sp)
    80001058:	0d813023          	sd	s8,192(sp)
    8000105c:	0d913423          	sd	s9,200(sp)
    80001060:	0da13823          	sd	s10,208(sp)
    80001064:	0db13c23          	sd	s11,216(sp)
    80001068:	0fc13023          	sd	t3,224(sp)
    8000106c:	0fd13423          	sd	t4,232(sp)
    80001070:	0fe13823          	sd	t5,240(sp)
    80001074:	0ff13c23          	sd	t6,248(sp)
    ret
    80001078:	00008067          	ret

000000008000107c <_ZN5Riscv12popRegistersEv>:
.global _ZN5Riscv12popRegistersEv
.type _ZN5Riscv12popRegistersEv, @function
_ZN5Riscv12popRegistersEv:
    .irp index, 3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28,29,30,31
    ld x\index, \index*8(sp)
    .endr
    8000107c:	01813183          	ld	gp,24(sp)
    80001080:	02013203          	ld	tp,32(sp)
    80001084:	02813283          	ld	t0,40(sp)
    80001088:	03013303          	ld	t1,48(sp)
    8000108c:	03813383          	ld	t2,56(sp)
    80001090:	04013403          	ld	s0,64(sp)
    80001094:	04813483          	ld	s1,72(sp)
    80001098:	05013503          	ld	a0,80(sp)
    8000109c:	05813583          	ld	a1,88(sp)
    800010a0:	06013603          	ld	a2,96(sp)
    800010a4:	06813683          	ld	a3,104(sp)
    800010a8:	07013703          	ld	a4,112(sp)
    800010ac:	07813783          	ld	a5,120(sp)
    800010b0:	08013803          	ld	a6,128(sp)
    800010b4:	08813883          	ld	a7,136(sp)
    800010b8:	09013903          	ld	s2,144(sp)
    800010bc:	09813983          	ld	s3,152(sp)
    800010c0:	0a013a03          	ld	s4,160(sp)
    800010c4:	0a813a83          	ld	s5,168(sp)
    800010c8:	0b013b03          	ld	s6,176(sp)
    800010cc:	0b813b83          	ld	s7,184(sp)
    800010d0:	0c013c03          	ld	s8,192(sp)
    800010d4:	0c813c83          	ld	s9,200(sp)
    800010d8:	0d013d03          	ld	s10,208(sp)
    800010dc:	0d813d83          	ld	s11,216(sp)
    800010e0:	0e013e03          	ld	t3,224(sp)
    800010e4:	0e813e83          	ld	t4,232(sp)
    800010e8:	0f013f03          	ld	t5,240(sp)
    800010ec:	0f813f83          	ld	t6,248(sp)
    add sp, sp, 256
    800010f0:	10010113          	addi	sp,sp,256
    800010f4:	00008067          	ret
	...

0000000080001100 <_ZN5Riscv14supervisorTrapEv>:
.global _ZN5Riscv14supervisorTrapEv
.align 4
.type _ZN5Riscv14supervisorTrapEv, @function

_ZN5Riscv14supervisorTrapEv:
    addi sp, sp, -256
    80001100:	f0010113          	addi	sp,sp,-256

    .irp index, 0,1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28,29,30,31
    sd x\index, \index * 8(sp)
    .endr
    80001104:	00013023          	sd	zero,0(sp)
    80001108:	00113423          	sd	ra,8(sp)
    8000110c:	00213823          	sd	sp,16(sp)
    80001110:	00313c23          	sd	gp,24(sp)
    80001114:	02413023          	sd	tp,32(sp)
    80001118:	02513423          	sd	t0,40(sp)
    8000111c:	02613823          	sd	t1,48(sp)
    80001120:	02713c23          	sd	t2,56(sp)
    80001124:	04813023          	sd	s0,64(sp)
    80001128:	04913423          	sd	s1,72(sp)
    8000112c:	04a13823          	sd	a0,80(sp)
    80001130:	04b13c23          	sd	a1,88(sp)
    80001134:	06c13023          	sd	a2,96(sp)
    80001138:	06d13423          	sd	a3,104(sp)
    8000113c:	06e13823          	sd	a4,112(sp)
    80001140:	06f13c23          	sd	a5,120(sp)
    80001144:	09013023          	sd	a6,128(sp)
    80001148:	09113423          	sd	a7,136(sp)
    8000114c:	09213823          	sd	s2,144(sp)
    80001150:	09313c23          	sd	s3,152(sp)
    80001154:	0b413023          	sd	s4,160(sp)
    80001158:	0b513423          	sd	s5,168(sp)
    8000115c:	0b613823          	sd	s6,176(sp)
    80001160:	0b713c23          	sd	s7,184(sp)
    80001164:	0d813023          	sd	s8,192(sp)
    80001168:	0d913423          	sd	s9,200(sp)
    8000116c:	0da13823          	sd	s10,208(sp)
    80001170:	0db13c23          	sd	s11,216(sp)
    80001174:	0fc13023          	sd	t3,224(sp)
    80001178:	0fd13423          	sd	t4,232(sp)
    8000117c:	0fe13823          	sd	t5,240(sp)
    80001180:	0ff13c23          	sd	t6,248(sp)
    call _ZN5Riscv21supervisorTrapHandlerEv
    80001184:	591000ef          	jal	ra,80001f14 <_ZN5Riscv21supervisorTrapHandlerEv>

    csrr a1, scause
    80001188:	142025f3          	csrr	a1,scause
    addi a1, a1, -8
    8000118c:	ff858593          	addi	a1,a1,-8
    beqz a1, syscall
    80001190:	00058663          	beqz	a1,8000119c <syscall>
    addi a1, a1, -1
    80001194:	fff58593          	addi	a1,a1,-1
    bnez a1, other
    80001198:	00059463          	bnez	a1,800011a0 <other>

000000008000119c <syscall>:

syscall:
    sd x10, 0x50(sp)
    8000119c:	04a13823          	sd	a0,80(sp)

00000000800011a0 <other>:
other:

    .irp index, 0,1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28,29,30,31
    ld x\index, \index * 8(sp)
    .endr
    800011a0:	00013003          	ld	zero,0(sp)
    800011a4:	00813083          	ld	ra,8(sp)
    800011a8:	01013103          	ld	sp,16(sp)
    800011ac:	01813183          	ld	gp,24(sp)
    800011b0:	02013203          	ld	tp,32(sp)
    800011b4:	02813283          	ld	t0,40(sp)
    800011b8:	03013303          	ld	t1,48(sp)
    800011bc:	03813383          	ld	t2,56(sp)
    800011c0:	04013403          	ld	s0,64(sp)
    800011c4:	04813483          	ld	s1,72(sp)
    800011c8:	05013503          	ld	a0,80(sp)
    800011cc:	05813583          	ld	a1,88(sp)
    800011d0:	06013603          	ld	a2,96(sp)
    800011d4:	06813683          	ld	a3,104(sp)
    800011d8:	07013703          	ld	a4,112(sp)
    800011dc:	07813783          	ld	a5,120(sp)
    800011e0:	08013803          	ld	a6,128(sp)
    800011e4:	08813883          	ld	a7,136(sp)
    800011e8:	09013903          	ld	s2,144(sp)
    800011ec:	09813983          	ld	s3,152(sp)
    800011f0:	0a013a03          	ld	s4,160(sp)
    800011f4:	0a813a83          	ld	s5,168(sp)
    800011f8:	0b013b03          	ld	s6,176(sp)
    800011fc:	0b813b83          	ld	s7,184(sp)
    80001200:	0c013c03          	ld	s8,192(sp)
    80001204:	0c813c83          	ld	s9,200(sp)
    80001208:	0d013d03          	ld	s10,208(sp)
    8000120c:	0d813d83          	ld	s11,216(sp)
    80001210:	0e013e03          	ld	t3,224(sp)
    80001214:	0e813e83          	ld	t4,232(sp)
    80001218:	0f013f03          	ld	t5,240(sp)
    8000121c:	0f813f83          	ld	t6,248(sp)

    add sp, sp, 256
    80001220:	10010113          	addi	sp,sp,256

    80001224:	10200073          	sret
	...

0000000080001230 <_ZN3TCB13contextSwitchEPNS_7ContextES1_>:
.global _ZN3TCB13contextSwitchEPNS_7ContextES1_
.type _ZN3TCB13contextSwitchEPNS_7ContextES1_, @function
_ZN3TCB13contextSwitchEPNS_7ContextES1_:
    sd ra, 0 * 8(a0)
    80001230:	00153023          	sd	ra,0(a0) # 1000 <_entry-0x7ffff000>
    sd sp, 1 * 8(a0)
    80001234:	00253423          	sd	sp,8(a0)

    ld ra, 0 * 8(a1)
    80001238:	0005b083          	ld	ra,0(a1)
    ld sp, 1 * 8(a1)
    8000123c:	0085b103          	ld	sp,8(a1)

    ret
    80001240:	00008067          	ret

0000000080001244 <copy_and_swap>:
# a1 holds expected value
# a2 holds desired value
# a0 holds return value, 0 if successful, !0 otherwise
.global copy_and_swap
copy_and_swap:
    lr.w t0, (a0)          # Load original value.
    80001244:	100522af          	lr.w	t0,(a0)
    bne t0, a1, fail       # Doesn’t match, so fail.
    80001248:	00b29a63          	bne	t0,a1,8000125c <fail>
    sc.w t0, a2, (a0)      # Try to update.
    8000124c:	18c522af          	sc.w	t0,a2,(a0)
    bnez t0, copy_and_swap # Retry if store-conditional failed.
    80001250:	fe029ae3          	bnez	t0,80001244 <copy_and_swap>
    li a0, 0               # Set return to success.
    80001254:	00000513          	li	a0,0
    jr ra                  # Return.
    80001258:	00008067          	ret

000000008000125c <fail>:
    fail:
    li a0, 1               # Set return to failure.
    8000125c:	00100513          	li	a0,1
    80001260:	00008067          	ret

0000000080001264 <_Znwm>:

// TODO zameni sa svojim funckcijama

using size_t = decltype(sizeof(0));

void *operator new(size_t n){
    80001264:	ff010113          	addi	sp,sp,-16
    80001268:	00113423          	sd	ra,8(sp)
    8000126c:	00813023          	sd	s0,0(sp)
    80001270:	01010413          	addi	s0,sp,16
    return __mem_alloc(n);
    80001274:	00005097          	auipc	ra,0x5
    80001278:	124080e7          	jalr	292(ra) # 80006398 <__mem_alloc>
}
    8000127c:	00813083          	ld	ra,8(sp)
    80001280:	00013403          	ld	s0,0(sp)
    80001284:	01010113          	addi	sp,sp,16
    80001288:	00008067          	ret

000000008000128c <_Znam>:

void *operator new[](size_t n){
    8000128c:	ff010113          	addi	sp,sp,-16
    80001290:	00113423          	sd	ra,8(sp)
    80001294:	00813023          	sd	s0,0(sp)
    80001298:	01010413          	addi	s0,sp,16
    return __mem_alloc(n);
    8000129c:	00005097          	auipc	ra,0x5
    800012a0:	0fc080e7          	jalr	252(ra) # 80006398 <__mem_alloc>
}
    800012a4:	00813083          	ld	ra,8(sp)
    800012a8:	00013403          	ld	s0,0(sp)
    800012ac:	01010113          	addi	sp,sp,16
    800012b0:	00008067          	ret

00000000800012b4 <_ZdlPv>:

void operator delete(void *p) noexcept{
    800012b4:	ff010113          	addi	sp,sp,-16
    800012b8:	00113423          	sd	ra,8(sp)
    800012bc:	00813023          	sd	s0,0(sp)
    800012c0:	01010413          	addi	s0,sp,16
    __mem_free(p);
    800012c4:	00005097          	auipc	ra,0x5
    800012c8:	008080e7          	jalr	8(ra) # 800062cc <__mem_free>
}
    800012cc:	00813083          	ld	ra,8(sp)
    800012d0:	00013403          	ld	s0,0(sp)
    800012d4:	01010113          	addi	sp,sp,16
    800012d8:	00008067          	ret

00000000800012dc <_ZdaPv>:


void operator delete[](void *p) noexcept{
    800012dc:	ff010113          	addi	sp,sp,-16
    800012e0:	00113423          	sd	ra,8(sp)
    800012e4:	00813023          	sd	s0,0(sp)
    800012e8:	01010413          	addi	s0,sp,16
    __mem_free(p);
    800012ec:	00005097          	auipc	ra,0x5
    800012f0:	fe0080e7          	jalr	-32(ra) # 800062cc <__mem_free>
}
    800012f4:	00813083          	ld	ra,8(sp)
    800012f8:	00013403          	ld	s0,0(sp)
    800012fc:	01010113          	addi	sp,sp,16
    80001300:	00008067          	ret

0000000080001304 <_ZN15MemoryAllocatorC1Ev>:
//

#include "../h/MemoryAllocator.hpp"


MemoryAllocator::MemoryAllocator() {
    80001304:	ff010113          	addi	sp,sp,-16
    80001308:	00813423          	sd	s0,8(sp)
    8000130c:	01010413          	addi	s0,sp,16
    head = (FreeBlock*)HEAP_START_ADDR;
    80001310:	00007797          	auipc	a5,0x7
    80001314:	1507b783          	ld	a5,336(a5) # 80008460 <_GLOBAL_OFFSET_TABLE_+0x18>
    80001318:	0007b703          	ld	a4,0(a5)
    8000131c:	00e53023          	sd	a4,0(a0)
    head->size = (size_t)HEAP_END_ADDR - (size_t)HEAP_START_ADDR - sizeof(FreeBlock);
    80001320:	00007797          	auipc	a5,0x7
    80001324:	1987b783          	ld	a5,408(a5) # 800084b8 <_GLOBAL_OFFSET_TABLE_+0x70>
    80001328:	0007b783          	ld	a5,0(a5)
    8000132c:	40e787b3          	sub	a5,a5,a4
    80001330:	fe878793          	addi	a5,a5,-24
    80001334:	00f73823          	sd	a5,16(a4)
    head->next = 0;
    80001338:	00053783          	ld	a5,0(a0)
    8000133c:	0007b023          	sd	zero,0(a5)
    head->prev = 0;
    80001340:	00053783          	ld	a5,0(a0)
    80001344:	0007b423          	sd	zero,8(a5)
    tail = head;
    80001348:	00053783          	ld	a5,0(a0)
    8000134c:	00f53423          	sd	a5,8(a0)
}
    80001350:	00813403          	ld	s0,8(sp)
    80001354:	01010113          	addi	sp,sp,16
    80001358:	00008067          	ret

000000008000135c <_ZN15MemoryAllocator11getInstanceEv>:


MemoryAllocator& MemoryAllocator::getInstance() {
    static MemoryAllocator instance;
    8000135c:	00007797          	auipc	a5,0x7
    80001360:	1c47c783          	lbu	a5,452(a5) # 80008520 <_ZGVZN15MemoryAllocator11getInstanceEvE8instance>
    80001364:	00078863          	beqz	a5,80001374 <_ZN15MemoryAllocator11getInstanceEv+0x18>
    return instance;
}
    80001368:	00007517          	auipc	a0,0x7
    8000136c:	1c050513          	addi	a0,a0,448 # 80008528 <_ZZN15MemoryAllocator11getInstanceEvE8instance>
    80001370:	00008067          	ret
MemoryAllocator& MemoryAllocator::getInstance() {
    80001374:	ff010113          	addi	sp,sp,-16
    80001378:	00113423          	sd	ra,8(sp)
    8000137c:	00813023          	sd	s0,0(sp)
    80001380:	01010413          	addi	s0,sp,16
    static MemoryAllocator instance;
    80001384:	00007517          	auipc	a0,0x7
    80001388:	1a450513          	addi	a0,a0,420 # 80008528 <_ZZN15MemoryAllocator11getInstanceEvE8instance>
    8000138c:	00000097          	auipc	ra,0x0
    80001390:	f78080e7          	jalr	-136(ra) # 80001304 <_ZN15MemoryAllocatorC1Ev>
    80001394:	00100793          	li	a5,1
    80001398:	00007717          	auipc	a4,0x7
    8000139c:	18f70423          	sb	a5,392(a4) # 80008520 <_ZGVZN15MemoryAllocator11getInstanceEvE8instance>
}
    800013a0:	00007517          	auipc	a0,0x7
    800013a4:	18850513          	addi	a0,a0,392 # 80008528 <_ZZN15MemoryAllocator11getInstanceEvE8instance>
    800013a8:	00813083          	ld	ra,8(sp)
    800013ac:	00013403          	ld	s0,0(sp)
    800013b0:	01010113          	addi	sp,sp,16
    800013b4:	00008067          	ret

00000000800013b8 <_ZN15MemoryAllocator10IGetMemoryEm>:


void* MemoryAllocator::IGetMemory(size_t size)  {
    800013b8:	ff010113          	addi	sp,sp,-16
    800013bc:	00813423          	sd	s0,8(sp)
    800013c0:	01010413          	addi	s0,sp,16
    800013c4:	00050713          	mv	a4,a0
    FreeBlock* blk = head;
    800013c8:	00053503          	ld	a0,0(a0)

    // round size to MEM_BLOCK_SIZE
    size_t temp = size / MEM_BLOCK_SIZE;
    size = (temp * MEM_BLOCK_SIZE == size) ? size : (temp + 1)*MEM_BLOCK_SIZE;
    800013cc:	fc05f693          	andi	a3,a1,-64
    800013d0:	00b68863          	beq	a3,a1,800013e0 <_ZN15MemoryAllocator10IGetMemoryEm+0x28>
    800013d4:	0065d793          	srli	a5,a1,0x6
    800013d8:	00178593          	addi	a1,a5,1
    800013dc:	00659593          	slli	a1,a1,0x6

    // Try to find free block
    for (; blk != nullptr; blk = blk->next)
    800013e0:	00050a63          	beqz	a0,800013f4 <_ZN15MemoryAllocator10IGetMemoryEm+0x3c>
        if (blk->size >= size) break;
    800013e4:	01053783          	ld	a5,16(a0)
    800013e8:	00b7f663          	bgeu	a5,a1,800013f4 <_ZN15MemoryAllocator10IGetMemoryEm+0x3c>
    for (; blk != nullptr; blk = blk->next)
    800013ec:	00053503          	ld	a0,0(a0)
    800013f0:	ff1ff06f          	j	800013e0 <_ZN15MemoryAllocator10IGetMemoryEm+0x28>

    // If not found
    if (blk == nullptr) {
    800013f4:	04050863          	beqz	a0,80001444 <_ZN15MemoryAllocator10IGetMemoryEm+0x8c>
        return 0;
    }

    size_t remainingSize = blk->size - size;
    800013f8:	01053783          	ld	a5,16(a0)
    800013fc:	40b787b3          	sub	a5,a5,a1

    if (remainingSize >= sizeof(FreeBlock) + MEM_BLOCK_SIZE) { // Shrink block and make a new one
    80001400:	05700693          	li	a3,87
    80001404:	04f6fc63          	bgeu	a3,a5,8000145c <_ZN15MemoryAllocator10IGetMemoryEm+0xa4>
        blk->size = size;
    80001408:	00b53823          	sd	a1,16(a0)
        size_t offset = sizeof(FreeBlock) + size;
    8000140c:	01858593          	addi	a1,a1,24
        FreeBlock* newBlk = (FreeBlock*)((char*)blk + offset);
    80001410:	00b505b3          	add	a1,a0,a1
        if (blk->prev) {
    80001414:	00853683          	ld	a3,8(a0)
    80001418:	02068c63          	beqz	a3,80001450 <_ZN15MemoryAllocator10IGetMemoryEm+0x98>
            blk->prev->next = newBlk;
    8000141c:	00b6b023          	sd	a1,0(a3)
            newBlk->prev = blk->prev;
    80001420:	00853703          	ld	a4,8(a0)
    80001424:	00e5b423          	sd	a4,8(a1)
        }
        else {
            head = newBlk;
            head->prev = 0;
        }
        newBlk->next = blk->next;
    80001428:	00053703          	ld	a4,0(a0)
    8000142c:	00e5b023          	sd	a4,0(a1)
        newBlk->size = remainingSize - sizeof(FreeBlock);
    80001430:	fe878793          	addi	a5,a5,-24
    80001434:	00f5b823          	sd	a5,16(a1)
        else {
            head = blk->next;
            head->prev = 0;
        }
    }
    blk->next = 0;
    80001438:	00053023          	sd	zero,0(a0)
    blk->prev = 0;
    8000143c:	00053423          	sd	zero,8(a0)
    return (char*)blk + sizeof(FreeBlock);
    80001440:	01850513          	addi	a0,a0,24
}
    80001444:	00813403          	ld	s0,8(sp)
    80001448:	01010113          	addi	sp,sp,16
    8000144c:	00008067          	ret
            head = newBlk;
    80001450:	00b73023          	sd	a1,0(a4)
            head->prev = 0;
    80001454:	0005b423          	sd	zero,8(a1)
    80001458:	fd1ff06f          	j	80001428 <_ZN15MemoryAllocator10IGetMemoryEm+0x70>
        if (blk->prev) {
    8000145c:	00853783          	ld	a5,8(a0)
    80001460:	02078063          	beqz	a5,80001480 <_ZN15MemoryAllocator10IGetMemoryEm+0xc8>
            blk->prev->next = blk->next;
    80001464:	00053703          	ld	a4,0(a0)
    80001468:	00e7b023          	sd	a4,0(a5)
            if(blk->next) blk->next->prev = blk->prev;
    8000146c:	00053783          	ld	a5,0(a0)
    80001470:	fc0784e3          	beqz	a5,80001438 <_ZN15MemoryAllocator10IGetMemoryEm+0x80>
    80001474:	00853703          	ld	a4,8(a0)
    80001478:	00e7b423          	sd	a4,8(a5)
    8000147c:	fbdff06f          	j	80001438 <_ZN15MemoryAllocator10IGetMemoryEm+0x80>
            head = blk->next;
    80001480:	00053783          	ld	a5,0(a0)
    80001484:	00f73023          	sd	a5,0(a4)
            head->prev = 0;
    80001488:	0007b423          	sd	zero,8(a5)
    8000148c:	fadff06f          	j	80001438 <_ZN15MemoryAllocator10IGetMemoryEm+0x80>

0000000080001490 <_ZN15MemoryAllocator10tryToMergeEPNS_9FreeBlockE>:
    tryToMerge(blk);

    return 0;
}

void MemoryAllocator::tryToMerge(FreeBlock* blk)  {
    80001490:	ff010113          	addi	sp,sp,-16
    80001494:	00813423          	sd	s0,8(sp)
    80001498:	01010413          	addi	s0,sp,16
    if (!blk)
    8000149c:	00058c63          	beqz	a1,800014b4 <_ZN15MemoryAllocator10tryToMergeEPNS_9FreeBlockE+0x24>
        return ;

    if (blk->next && (char*)blk + blk->size == (char*)(blk->next)) {
    800014a0:	0005b783          	ld	a5,0(a1)
    800014a4:	00078863          	beqz	a5,800014b4 <_ZN15MemoryAllocator10tryToMergeEPNS_9FreeBlockE+0x24>
    800014a8:	0105b703          	ld	a4,16(a1)
    800014ac:	00e586b3          	add	a3,a1,a4
    800014b0:	00d78863          	beq	a5,a3,800014c0 <_ZN15MemoryAllocator10tryToMergeEPNS_9FreeBlockE+0x30>
        blk->size += blk->next->size;
        blk->size += sizeof(FreeBlock);
        blk->next = blk->next->next;
        if (blk->next) blk->next->prev = blk;
    }
    800014b4:	00813403          	ld	s0,8(sp)
    800014b8:	01010113          	addi	sp,sp,16
    800014bc:	00008067          	ret
        blk->size += blk->next->size;
    800014c0:	0107b683          	ld	a3,16(a5)
    800014c4:	00d70733          	add	a4,a4,a3
        blk->size += sizeof(FreeBlock);
    800014c8:	01870713          	addi	a4,a4,24
    800014cc:	00e5b823          	sd	a4,16(a1)
        blk->next = blk->next->next;
    800014d0:	0007b783          	ld	a5,0(a5)
    800014d4:	00f5b023          	sd	a5,0(a1)
        if (blk->next) blk->next->prev = blk;
    800014d8:	fc078ee3          	beqz	a5,800014b4 <_ZN15MemoryAllocator10tryToMergeEPNS_9FreeBlockE+0x24>
    800014dc:	00b7b423          	sd	a1,8(a5)
    800014e0:	fd5ff06f          	j	800014b4 <_ZN15MemoryAllocator10tryToMergeEPNS_9FreeBlockE+0x24>

00000000800014e4 <_ZN15MemoryAllocator11IFreeMemoryEPv>:
    if( addr == 0 || (char*)addr < HEAP_START_ADDR || (char*)addr > HEAP_END_ADDR){
    800014e4:	0e058263          	beqz	a1,800015c8 <_ZN15MemoryAllocator11IFreeMemoryEPv+0xe4>
int MemoryAllocator::IFreeMemory(void* addr) {
    800014e8:	fe010113          	addi	sp,sp,-32
    800014ec:	00113c23          	sd	ra,24(sp)
    800014f0:	00813823          	sd	s0,16(sp)
    800014f4:	00913423          	sd	s1,8(sp)
    800014f8:	01213023          	sd	s2,0(sp)
    800014fc:	02010413          	addi	s0,sp,32
    80001500:	00050913          	mv	s2,a0
    80001504:	00058713          	mv	a4,a1
    if( addr == 0 || (char*)addr < HEAP_START_ADDR || (char*)addr > HEAP_END_ADDR){
    80001508:	00007797          	auipc	a5,0x7
    8000150c:	f587b783          	ld	a5,-168(a5) # 80008460 <_GLOBAL_OFFSET_TABLE_+0x18>
    80001510:	0007b783          	ld	a5,0(a5)
    80001514:	0af5ee63          	bltu	a1,a5,800015d0 <_ZN15MemoryAllocator11IFreeMemoryEPv+0xec>
    80001518:	00007797          	auipc	a5,0x7
    8000151c:	fa07b783          	ld	a5,-96(a5) # 800084b8 <_GLOBAL_OFFSET_TABLE_+0x70>
    80001520:	0007b783          	ld	a5,0(a5)
    80001524:	0ab7ea63          	bltu	a5,a1,800015d8 <_ZN15MemoryAllocator11IFreeMemoryEPv+0xf4>
    if ( !head || (char*)addr < (char*)head)
    80001528:	00053783          	ld	a5,0(a0)
    8000152c:	00078e63          	beqz	a5,80001548 <_ZN15MemoryAllocator11IFreeMemoryEPv+0x64>
    80001530:	02f5e063          	bltu	a1,a5,80001550 <_ZN15MemoryAllocator11IFreeMemoryEPv+0x6c>
        for ( blk = head; blk->next != 0 && (char*)addr > (char*)(blk->next); blk = blk->next);
    80001534:	00078493          	mv	s1,a5
    80001538:	0007b783          	ld	a5,0(a5)
    8000153c:	00078c63          	beqz	a5,80001554 <_ZN15MemoryAllocator11IFreeMemoryEPv+0x70>
    80001540:	fee7eae3          	bltu	a5,a4,80001534 <_ZN15MemoryAllocator11IFreeMemoryEPv+0x50>
    80001544:	0100006f          	j	80001554 <_ZN15MemoryAllocator11IFreeMemoryEPv+0x70>
        blk = 0;
    80001548:	00078493          	mv	s1,a5
    8000154c:	0080006f          	j	80001554 <_ZN15MemoryAllocator11IFreeMemoryEPv+0x70>
    80001550:	00000493          	li	s1,0
    FreeBlock* newBlk = (FreeBlock*)((char*)addr - sizeof(FreeBlock));
    80001554:	fe870593          	addi	a1,a4,-24
    newBlk->prev = blk;
    80001558:	fe973823          	sd	s1,-16(a4)
    if (blk) newBlk->next = blk->next;
    8000155c:	04048c63          	beqz	s1,800015b4 <_ZN15MemoryAllocator11IFreeMemoryEPv+0xd0>
    80001560:	0004b783          	ld	a5,0(s1)
    80001564:	fef73423          	sd	a5,-24(a4)
    if (newBlk->next) newBlk->next->prev = newBlk;
    80001568:	fe873783          	ld	a5,-24(a4)
    8000156c:	00078463          	beqz	a5,80001574 <_ZN15MemoryAllocator11IFreeMemoryEPv+0x90>
    80001570:	00b7b423          	sd	a1,8(a5)
    if (blk) blk->next = newBlk;
    80001574:	04048663          	beqz	s1,800015c0 <_ZN15MemoryAllocator11IFreeMemoryEPv+0xdc>
    80001578:	00b4b023          	sd	a1,0(s1)
    tryToMerge(newBlk);
    8000157c:	00090513          	mv	a0,s2
    80001580:	00000097          	auipc	ra,0x0
    80001584:	f10080e7          	jalr	-240(ra) # 80001490 <_ZN15MemoryAllocator10tryToMergeEPNS_9FreeBlockE>
    tryToMerge(blk);
    80001588:	00048593          	mv	a1,s1
    8000158c:	00090513          	mv	a0,s2
    80001590:	00000097          	auipc	ra,0x0
    80001594:	f00080e7          	jalr	-256(ra) # 80001490 <_ZN15MemoryAllocator10tryToMergeEPNS_9FreeBlockE>
    return 0;
    80001598:	00000513          	li	a0,0
}
    8000159c:	01813083          	ld	ra,24(sp)
    800015a0:	01013403          	ld	s0,16(sp)
    800015a4:	00813483          	ld	s1,8(sp)
    800015a8:	00013903          	ld	s2,0(sp)
    800015ac:	02010113          	addi	sp,sp,32
    800015b0:	00008067          	ret
    else newBlk->next = head;
    800015b4:	00093783          	ld	a5,0(s2)
    800015b8:	fef73423          	sd	a5,-24(a4)
    800015bc:	fadff06f          	j	80001568 <_ZN15MemoryAllocator11IFreeMemoryEPv+0x84>
    else head = newBlk;
    800015c0:	00b93023          	sd	a1,0(s2)
    800015c4:	fb9ff06f          	j	8000157c <_ZN15MemoryAllocator11IFreeMemoryEPv+0x98>
        return -1;
    800015c8:	fff00513          	li	a0,-1
}
    800015cc:	00008067          	ret
        return -1;
    800015d0:	fff00513          	li	a0,-1
    800015d4:	fc9ff06f          	j	8000159c <_ZN15MemoryAllocator11IFreeMemoryEPv+0xb8>
    800015d8:	fff00513          	li	a0,-1
    800015dc:	fc1ff06f          	j	8000159c <_ZN15MemoryAllocator11IFreeMemoryEPv+0xb8>

00000000800015e0 <_Z9mem_allocm>:

#include "../h/syscall_c.h"

void* mem_alloc(size_t size){

    if(size <= 0)
    800015e0:	04050663          	beqz	a0,8000162c <_Z9mem_allocm+0x4c>
void* mem_alloc(size_t size){
    800015e4:	fe010113          	addi	sp,sp,-32
    800015e8:	00813c23          	sd	s0,24(sp)
    800015ec:	02010413          	addi	s0,sp,32
        return 0;
    size_t temp = size / MEM_BLOCK_SIZE;
    800015f0:	00655793          	srli	a5,a0,0x6
    size_t sz = (temp * MEM_BLOCK_SIZE == size) ? size : (temp + 1)*MEM_BLOCK_SIZE;
    800015f4:	fc057713          	andi	a4,a0,-64
    800015f8:	00a70663          	beq	a4,a0,80001604 <_Z9mem_allocm+0x24>
    800015fc:	00178513          	addi	a0,a5,1
    80001600:	00651513          	slli	a0,a0,0x6

    __asm__ volatile("mv a1, %[var]" : : [var] "r"(sz));
    80001604:	00050593          	mv	a1,a0
    __asm__ volatile("mv a0, %[var]" : : [var] "r"(MEM_ALLOC));
    80001608:	00100793          	li	a5,1
    8000160c:	00078513          	mv	a0,a5
    __asm__ volatile("ecall");
    80001610:	00000073          	ecall
    uint64 volatile ret;
    __asm__ volatile ("mv %0, a0" : "=r" (ret));
    80001614:	00050793          	mv	a5,a0
    80001618:	fef43423          	sd	a5,-24(s0)

    return (void*)ret;
    8000161c:	fe843503          	ld	a0,-24(s0)
}
    80001620:	01813403          	ld	s0,24(sp)
    80001624:	02010113          	addi	sp,sp,32
    80001628:	00008067          	ret
        return 0;
    8000162c:	00000513          	li	a0,0
}
    80001630:	00008067          	ret

0000000080001634 <_Z8mem_freePv>:

int mem_free(void* addr){

    if(!addr)
    80001634:	02050e63          	beqz	a0,80001670 <_Z8mem_freePv+0x3c>
int mem_free(void* addr){
    80001638:	fe010113          	addi	sp,sp,-32
    8000163c:	00813c23          	sd	s0,24(sp)
    80001640:	02010413          	addi	s0,sp,32
        return 0;

    uint64 param = (uint64)(addr);
    __asm__ volatile("mv a1, %[var]" : : [var] "r"(param));
    80001644:	00050593          	mv	a1,a0
    __asm__ volatile("mv a0, %[var]" : : [var] "r"(MEM_FREE));
    80001648:	00200793          	li	a5,2
    8000164c:	00078513          	mv	a0,a5
    __asm__ volatile("ecall");
    80001650:	00000073          	ecall
    uint64 volatile ret;
    __asm__ volatile ("mv %0, a0" : "=r" (ret));
    80001654:	00050793          	mv	a5,a0
    80001658:	fef43423          	sd	a5,-24(s0)

    return (int)ret;
    8000165c:	fe843503          	ld	a0,-24(s0)
    80001660:	0005051b          	sext.w	a0,a0
}
    80001664:	01813403          	ld	s0,24(sp)
    80001668:	02010113          	addi	sp,sp,32
    8000166c:	00008067          	ret
        return 0;
    80001670:	00000513          	li	a0,0
}
    80001674:	00008067          	ret

0000000080001678 <_Z13thread_createPP3TCBPFvPvES2_>:


int thread_create(thread_t* handle, void(*start_routine)(void*), void* arg){
    80001678:	fc010113          	addi	sp,sp,-64
    8000167c:	02113c23          	sd	ra,56(sp)
    80001680:	02813823          	sd	s0,48(sp)
    80001684:	02913423          	sd	s1,40(sp)
    80001688:	03213023          	sd	s2,32(sp)
    8000168c:	01313c23          	sd	s3,24(sp)
    80001690:	04010413          	addi	s0,sp,64
    80001694:	00050493          	mv	s1,a0
    80001698:	00058913          	mv	s2,a1
    8000169c:	00060993          	mv	s3,a2

    void* stack = mem_alloc(sizeof(uint64) * DEFAULT_STACK_SIZE);
    800016a0:	00008537          	lui	a0,0x8
    800016a4:	00000097          	auipc	ra,0x0
    800016a8:	f3c080e7          	jalr	-196(ra) # 800015e0 <_Z9mem_allocm>

    __asm__ volatile("mv a4, %[var]" : : [var] "r"(stack));
    800016ac:	00050713          	mv	a4,a0
    __asm__ volatile("mv a3, %[var]" : : [var] "r"(arg));
    800016b0:	00098693          	mv	a3,s3
    __asm__ volatile("mv a2, %[var]" : : [var] "r"(start_routine));
    800016b4:	00090613          	mv	a2,s2
    __asm__ volatile("mv a1, %[var]" : : [var] "r"(handle));
    800016b8:	00048593          	mv	a1,s1
    __asm__ volatile("mv a0, %[var]" : : [var] "r"(THREAD_CREATE));
    800016bc:	01100793          	li	a5,17
    800016c0:	00078513          	mv	a0,a5
    __asm__ volatile("ecall");
    800016c4:	00000073          	ecall

    uint64 volatile ret;
    __asm__ volatile ("mv %0, a0" : "=r" (ret));
    800016c8:	00050793          	mv	a5,a0
    800016cc:	fcf43423          	sd	a5,-56(s0)
    return (int)ret;
    800016d0:	fc843503          	ld	a0,-56(s0)

}
    800016d4:	0005051b          	sext.w	a0,a0
    800016d8:	03813083          	ld	ra,56(sp)
    800016dc:	03013403          	ld	s0,48(sp)
    800016e0:	02813483          	ld	s1,40(sp)
    800016e4:	02013903          	ld	s2,32(sp)
    800016e8:	01813983          	ld	s3,24(sp)
    800016ec:	04010113          	addi	sp,sp,64
    800016f0:	00008067          	ret

00000000800016f4 <_Z11thread_exitv>:
int thread_exit (){
    800016f4:	fe010113          	addi	sp,sp,-32
    800016f8:	00813c23          	sd	s0,24(sp)
    800016fc:	02010413          	addi	s0,sp,32
    __asm__ volatile("mv a0, %[var]" : : [var] "r"(THREAD_EXIT));
    80001700:	01200793          	li	a5,18
    80001704:	00078513          	mv	a0,a5
    __asm__ volatile("ecall");
    80001708:	00000073          	ecall
    uint64 volatile ret;
    __asm__ volatile ("mv %0, a0" : "=r" (ret));
    8000170c:	00050793          	mv	a5,a0
    80001710:	fef43423          	sd	a5,-24(s0)

    return (int)ret;
    80001714:	fe843503          	ld	a0,-24(s0)
}
    80001718:	0005051b          	sext.w	a0,a0
    8000171c:	01813403          	ld	s0,24(sp)
    80001720:	02010113          	addi	sp,sp,32
    80001724:	00008067          	ret

0000000080001728 <_Z15thread_dispatchv>:


void thread_dispatch (){
    80001728:	ff010113          	addi	sp,sp,-16
    8000172c:	00813423          	sd	s0,8(sp)
    80001730:	01010413          	addi	s0,sp,16
    __asm__ volatile("mv a0, %[var]" : : [var] "r"(THREAD_DISPATCH));
    80001734:	01300793          	li	a5,19
    80001738:	00078513          	mv	a0,a5
    __asm__ volatile("ecall");
    8000173c:	00000073          	ecall
}
    80001740:	00813403          	ld	s0,8(sp)
    80001744:	01010113          	addi	sp,sp,16
    80001748:	00008067          	ret

000000008000174c <_Z8sem_openPP4_semj>:

int sem_open (sem_t* handle, unsigned init){
    8000174c:	fe010113          	addi	sp,sp,-32
    80001750:	00813c23          	sd	s0,24(sp)
    80001754:	02010413          	addi	s0,sp,32
    __asm__ volatile("mv a2, %[var]" : : [var] "r"(init));
    80001758:	00058613          	mv	a2,a1
    __asm__ volatile("mv a1, %[var]" : : [var] "r"(handle));
    8000175c:	00050593          	mv	a1,a0
    __asm__ volatile("mv a0, %[var]" : : [var] "r"(SEM_OPEN));
    80001760:	02100793          	li	a5,33
    80001764:	00078513          	mv	a0,a5
    __asm__ volatile("ecall");
    80001768:	00000073          	ecall
    uint64 volatile ret;
    __asm__ volatile ("mv %0, a0" : "=r" (ret));
    8000176c:	00050793          	mv	a5,a0
    80001770:	fef43423          	sd	a5,-24(s0)

    return (int)ret;
    80001774:	fe843503          	ld	a0,-24(s0)
}
    80001778:	0005051b          	sext.w	a0,a0
    8000177c:	01813403          	ld	s0,24(sp)
    80001780:	02010113          	addi	sp,sp,32
    80001784:	00008067          	ret

0000000080001788 <_Z9sem_closeP4_sem>:

int sem_close(sem_t handle){
    80001788:	fe010113          	addi	sp,sp,-32
    8000178c:	00813c23          	sd	s0,24(sp)
    80001790:	02010413          	addi	s0,sp,32
    __asm__ volatile("mv a1, %[var]" : : [var] "r"(handle));
    80001794:	00050593          	mv	a1,a0
    __asm__ volatile("mv a0, %[var]" : : [var] "r"(SEM_CLOSE));
    80001798:	02200793          	li	a5,34
    8000179c:	00078513          	mv	a0,a5
    __asm__ volatile("ecall");
    800017a0:	00000073          	ecall
    uint64 volatile ret;
    __asm__ volatile ("mv %0, a0" : "=r" (ret));
    800017a4:	00050793          	mv	a5,a0
    800017a8:	fef43423          	sd	a5,-24(s0)

    return (int)ret;
    800017ac:	fe843503          	ld	a0,-24(s0)
}
    800017b0:	0005051b          	sext.w	a0,a0
    800017b4:	01813403          	ld	s0,24(sp)
    800017b8:	02010113          	addi	sp,sp,32
    800017bc:	00008067          	ret

00000000800017c0 <_Z8sem_waitP4_sem>:

int sem_wait (sem_t id){
    800017c0:	fe010113          	addi	sp,sp,-32
    800017c4:	00813c23          	sd	s0,24(sp)
    800017c8:	02010413          	addi	s0,sp,32
    __asm__ volatile("mv a1, %[var]" : : [var] "r"(id));
    800017cc:	00050593          	mv	a1,a0
    __asm__ volatile("mv a0, %[var]" : : [var] "r"(SEM_WAIT));
    800017d0:	02300793          	li	a5,35
    800017d4:	00078513          	mv	a0,a5
    __asm__ volatile("ecall");
    800017d8:	00000073          	ecall
    uint64 volatile ret;
    __asm__ volatile ("mv %0, a0" : "=r" (ret));
    800017dc:	00050793          	mv	a5,a0
    800017e0:	fef43423          	sd	a5,-24(s0)

    return (int)ret;
    800017e4:	fe843503          	ld	a0,-24(s0)
}
    800017e8:	0005051b          	sext.w	a0,a0
    800017ec:	01813403          	ld	s0,24(sp)
    800017f0:	02010113          	addi	sp,sp,32
    800017f4:	00008067          	ret

00000000800017f8 <_Z10sem_signalP4_sem>:

int sem_signal(sem_t id){
    800017f8:	fe010113          	addi	sp,sp,-32
    800017fc:	00813c23          	sd	s0,24(sp)
    80001800:	02010413          	addi	s0,sp,32
    __asm__ volatile("mv a1, %[var]" : : [var] "r"(id));
    80001804:	00050593          	mv	a1,a0
    __asm__ volatile("mv a0, %[var]" : : [var] "r"(SEM_SIGNAL));
    80001808:	02400793          	li	a5,36
    8000180c:	00078513          	mv	a0,a5
    __asm__ volatile("ecall");
    80001810:	00000073          	ecall
    uint64 volatile ret;
    __asm__ volatile ("mv %0, a0" : "=r" (ret));
    80001814:	00050793          	mv	a5,a0
    80001818:	fef43423          	sd	a5,-24(s0)

    return (int)ret;
    8000181c:	fe843503          	ld	a0,-24(s0)
}
    80001820:	0005051b          	sext.w	a0,a0
    80001824:	01813403          	ld	s0,24(sp)
    80001828:	02010113          	addi	sp,sp,32
    8000182c:	00008067          	ret

0000000080001830 <_Z10time_sleepm>:

int time_sleep(size_t time){
    80001830:	fe010113          	addi	sp,sp,-32
    80001834:	00813c23          	sd	s0,24(sp)
    80001838:	02010413          	addi	s0,sp,32
    __asm__ volatile("mv a1, %[var]" : : [var] "r"(time));
    8000183c:	00050593          	mv	a1,a0
    __asm__ volatile("mv a0, %[var]" : : [var] "r"(TIME_SLEEP));
    80001840:	03100793          	li	a5,49
    80001844:	00078513          	mv	a0,a5
    __asm__ volatile("ecall");
    80001848:	00000073          	ecall
    uint64 volatile ret;
    __asm__ volatile ("mv %0, a0" : "=r" (ret));
    8000184c:	00050793          	mv	a5,a0
    80001850:	fef43423          	sd	a5,-24(s0)

    return (int)ret;
    80001854:	fe843503          	ld	a0,-24(s0)
}
    80001858:	0005051b          	sext.w	a0,a0
    8000185c:	01813403          	ld	s0,24(sp)
    80001860:	02010113          	addi	sp,sp,32
    80001864:	00008067          	ret

0000000080001868 <_Z4getcv>:

char getc(){
    80001868:	fe010113          	addi	sp,sp,-32
    8000186c:	00813c23          	sd	s0,24(sp)
    80001870:	02010413          	addi	s0,sp,32
    __asm__ volatile("mv a0, %[var]" : : [var] "r"(GETC));
    80001874:	04100793          	li	a5,65
    80001878:	00078513          	mv	a0,a5
    __asm__ volatile("ecall");
    8000187c:	00000073          	ecall
    uint64 volatile ret;
    __asm__ volatile ("mv %0, a0" : "=r" (ret));
    80001880:	00050793          	mv	a5,a0
    80001884:	fef43423          	sd	a5,-24(s0)

    return (char)ret;
    80001888:	fe843503          	ld	a0,-24(s0)
}
    8000188c:	0ff57513          	andi	a0,a0,255
    80001890:	01813403          	ld	s0,24(sp)
    80001894:	02010113          	addi	sp,sp,32
    80001898:	00008067          	ret

000000008000189c <_Z4putcc>:

void putc(char c){
    8000189c:	ff010113          	addi	sp,sp,-16
    800018a0:	00813423          	sd	s0,8(sp)
    800018a4:	01010413          	addi	s0,sp,16
    __asm__ volatile("mv a1, %[var]" : : [var] "r"(c));
    800018a8:	00050593          	mv	a1,a0
    __asm__ volatile("mv a0, %[var]" : : [var] "r"(PUTC));
    800018ac:	04200793          	li	a5,66
    800018b0:	00078513          	mv	a0,a5
    __asm__ volatile("ecall");
    800018b4:	00000073          	ecall

    return;
    800018b8:	00813403          	ld	s0,8(sp)
    800018bc:	01010113          	addi	sp,sp,16
    800018c0:	00008067          	ret

00000000800018c4 <_ZN7_bufferC1Ei>:
#include "../h/_buffer.hpp"


_buffer::_buffer(int _cap) : cap(_cap), head(0), tail(0) {
    800018c4:	fe010113          	addi	sp,sp,-32
    800018c8:	00113c23          	sd	ra,24(sp)
    800018cc:	00813823          	sd	s0,16(sp)
    800018d0:	00913423          	sd	s1,8(sp)
    800018d4:	01213023          	sd	s2,0(sp)
    800018d8:	02010413          	addi	s0,sp,32
    800018dc:	00050493          	mv	s1,a0
    800018e0:	00058913          	mv	s2,a1
    800018e4:	00b52023          	sw	a1,0(a0) # 8000 <_entry-0x7fff8000>
    800018e8:	00052823          	sw	zero,16(a0)
    800018ec:	00052a23          	sw	zero,20(a0)
    buffer = (char*)mem_alloc(sizeof(char) * cap);
    800018f0:	00058513          	mv	a0,a1
    800018f4:	00000097          	auipc	ra,0x0
    800018f8:	cec080e7          	jalr	-788(ra) # 800015e0 <_Z9mem_allocm>
    800018fc:	00a4b423          	sd	a0,8(s1)
    sem_open(&itemAvailable, 0);
    80001900:	00000593          	li	a1,0
    80001904:	02048513          	addi	a0,s1,32
    80001908:	00000097          	auipc	ra,0x0
    8000190c:	e44080e7          	jalr	-444(ra) # 8000174c <_Z8sem_openPP4_semj>
    sem_open(&spaceAvailable, _cap);
    80001910:	00090593          	mv	a1,s2
    80001914:	01848513          	addi	a0,s1,24
    80001918:	00000097          	auipc	ra,0x0
    8000191c:	e34080e7          	jalr	-460(ra) # 8000174c <_Z8sem_openPP4_semj>
    sem_open(&mutexHead, 1);
    80001920:	00100593          	li	a1,1
    80001924:	02848513          	addi	a0,s1,40
    80001928:	00000097          	auipc	ra,0x0
    8000192c:	e24080e7          	jalr	-476(ra) # 8000174c <_Z8sem_openPP4_semj>
    sem_open(&mutexTail, 1);
    80001930:	00100593          	li	a1,1
    80001934:	03048513          	addi	a0,s1,48
    80001938:	00000097          	auipc	ra,0x0
    8000193c:	e14080e7          	jalr	-492(ra) # 8000174c <_Z8sem_openPP4_semj>
}
    80001940:	01813083          	ld	ra,24(sp)
    80001944:	01013403          	ld	s0,16(sp)
    80001948:	00813483          	ld	s1,8(sp)
    8000194c:	00013903          	ld	s2,0(sp)
    80001950:	02010113          	addi	sp,sp,32
    80001954:	00008067          	ret

0000000080001958 <_ZN7_bufferC1Ev>:

_buffer::_buffer() {
    80001958:	fe010113          	addi	sp,sp,-32
    8000195c:	00113c23          	sd	ra,24(sp)
    80001960:	00813823          	sd	s0,16(sp)
    80001964:	00913423          	sd	s1,8(sp)
    80001968:	02010413          	addi	s0,sp,32
    8000196c:	00050493          	mv	s1,a0

    sem_open(&itemAvailable, 0);
    80001970:	00000593          	li	a1,0
    80001974:	02050513          	addi	a0,a0,32
    80001978:	00000097          	auipc	ra,0x0
    8000197c:	dd4080e7          	jalr	-556(ra) # 8000174c <_Z8sem_openPP4_semj>
    sem_open(&spaceAvailable, DEFAULT_BUFFER_SIZE);
    80001980:	40000593          	li	a1,1024
    80001984:	01848513          	addi	a0,s1,24
    80001988:	00000097          	auipc	ra,0x0
    8000198c:	dc4080e7          	jalr	-572(ra) # 8000174c <_Z8sem_openPP4_semj>
    sem_open(&mutexHead, 1);
    80001990:	00100593          	li	a1,1
    80001994:	02848513          	addi	a0,s1,40
    80001998:	00000097          	auipc	ra,0x0
    8000199c:	db4080e7          	jalr	-588(ra) # 8000174c <_Z8sem_openPP4_semj>
    sem_open(&mutexTail, 1);
    800019a0:	00100593          	li	a1,1
    800019a4:	03048513          	addi	a0,s1,48
    800019a8:	00000097          	auipc	ra,0x0
    800019ac:	da4080e7          	jalr	-604(ra) # 8000174c <_Z8sem_openPP4_semj>
}
    800019b0:	01813083          	ld	ra,24(sp)
    800019b4:	01013403          	ld	s0,16(sp)
    800019b8:	00813483          	ld	s1,8(sp)
    800019bc:	02010113          	addi	sp,sp,32
    800019c0:	00008067          	ret

00000000800019c4 <_ZN7_buffer3putEc>:
    sem_close(spaceAvailable);
    sem_close(mutexTail);
    sem_close(mutexHead);
}

void _buffer::put(char val) {
    800019c4:	fe010113          	addi	sp,sp,-32
    800019c8:	00113c23          	sd	ra,24(sp)
    800019cc:	00813823          	sd	s0,16(sp)
    800019d0:	00913423          	sd	s1,8(sp)
    800019d4:	01213023          	sd	s2,0(sp)
    800019d8:	02010413          	addi	s0,sp,32
    800019dc:	00050493          	mv	s1,a0
    800019e0:	00058913          	mv	s2,a1
    sem_wait(spaceAvailable);
    800019e4:	01853503          	ld	a0,24(a0)
    800019e8:	00000097          	auipc	ra,0x0
    800019ec:	dd8080e7          	jalr	-552(ra) # 800017c0 <_Z8sem_waitP4_sem>
    sem_wait(mutexTail);
    800019f0:	0304b503          	ld	a0,48(s1)
    800019f4:	00000097          	auipc	ra,0x0
    800019f8:	dcc080e7          	jalr	-564(ra) # 800017c0 <_Z8sem_waitP4_sem>

    buffer[tail] = val;
    800019fc:	0084b783          	ld	a5,8(s1)
    80001a00:	0144a703          	lw	a4,20(s1)
    80001a04:	00e787b3          	add	a5,a5,a4
    80001a08:	01278023          	sb	s2,0(a5)
    tail = (tail + 1) % cap;
    80001a0c:	0144a783          	lw	a5,20(s1)
    80001a10:	0017879b          	addiw	a5,a5,1
    80001a14:	0004a703          	lw	a4,0(s1)
    80001a18:	02e7e7bb          	remw	a5,a5,a4
    80001a1c:	00f4aa23          	sw	a5,20(s1)

    sem_signal(mutexTail);
    80001a20:	0304b503          	ld	a0,48(s1)
    80001a24:	00000097          	auipc	ra,0x0
    80001a28:	dd4080e7          	jalr	-556(ra) # 800017f8 <_Z10sem_signalP4_sem>
    sem_signal(itemAvailable);
    80001a2c:	0204b503          	ld	a0,32(s1)
    80001a30:	00000097          	auipc	ra,0x0
    80001a34:	dc8080e7          	jalr	-568(ra) # 800017f8 <_Z10sem_signalP4_sem>

}
    80001a38:	01813083          	ld	ra,24(sp)
    80001a3c:	01013403          	ld	s0,16(sp)
    80001a40:	00813483          	ld	s1,8(sp)
    80001a44:	00013903          	ld	s2,0(sp)
    80001a48:	02010113          	addi	sp,sp,32
    80001a4c:	00008067          	ret

0000000080001a50 <_ZN7_buffer3getEv>:

char _buffer::get() {
    80001a50:	fe010113          	addi	sp,sp,-32
    80001a54:	00113c23          	sd	ra,24(sp)
    80001a58:	00813823          	sd	s0,16(sp)
    80001a5c:	00913423          	sd	s1,8(sp)
    80001a60:	01213023          	sd	s2,0(sp)
    80001a64:	02010413          	addi	s0,sp,32
    80001a68:	00050493          	mv	s1,a0
    sem_wait(itemAvailable);
    80001a6c:	02053503          	ld	a0,32(a0)
    80001a70:	00000097          	auipc	ra,0x0
    80001a74:	d50080e7          	jalr	-688(ra) # 800017c0 <_Z8sem_waitP4_sem>
    sem_wait(mutexHead);
    80001a78:	0284b503          	ld	a0,40(s1)
    80001a7c:	00000097          	auipc	ra,0x0
    80001a80:	d44080e7          	jalr	-700(ra) # 800017c0 <_Z8sem_waitP4_sem>

    char ret = buffer[head];
    80001a84:	0084b703          	ld	a4,8(s1)
    80001a88:	0104a783          	lw	a5,16(s1)
    80001a8c:	00f70733          	add	a4,a4,a5
    80001a90:	00074903          	lbu	s2,0(a4)
    head = (head + 1) % cap;
    80001a94:	0017879b          	addiw	a5,a5,1
    80001a98:	0004a703          	lw	a4,0(s1)
    80001a9c:	02e7e7bb          	remw	a5,a5,a4
    80001aa0:	00f4a823          	sw	a5,16(s1)

    sem_signal(mutexHead);
    80001aa4:	0284b503          	ld	a0,40(s1)
    80001aa8:	00000097          	auipc	ra,0x0
    80001aac:	d50080e7          	jalr	-688(ra) # 800017f8 <_Z10sem_signalP4_sem>
    sem_signal(spaceAvailable);
    80001ab0:	0184b503          	ld	a0,24(s1)
    80001ab4:	00000097          	auipc	ra,0x0
    80001ab8:	d44080e7          	jalr	-700(ra) # 800017f8 <_Z10sem_signalP4_sem>

    return ret;
}
    80001abc:	00090513          	mv	a0,s2
    80001ac0:	01813083          	ld	ra,24(sp)
    80001ac4:	01013403          	ld	s0,16(sp)
    80001ac8:	00813483          	ld	s1,8(sp)
    80001acc:	00013903          	ld	s2,0(sp)
    80001ad0:	02010113          	addi	sp,sp,32
    80001ad4:	00008067          	ret

0000000080001ad8 <_ZN7_buffer6getCntEv>:

int _buffer::getCnt() {
    80001ad8:	fe010113          	addi	sp,sp,-32
    80001adc:	00113c23          	sd	ra,24(sp)
    80001ae0:	00813823          	sd	s0,16(sp)
    80001ae4:	00913423          	sd	s1,8(sp)
    80001ae8:	01213023          	sd	s2,0(sp)
    80001aec:	02010413          	addi	s0,sp,32
    80001af0:	00050493          	mv	s1,a0
    int ret;

    sem_wait(mutexHead);
    80001af4:	02853503          	ld	a0,40(a0)
    80001af8:	00000097          	auipc	ra,0x0
    80001afc:	cc8080e7          	jalr	-824(ra) # 800017c0 <_Z8sem_waitP4_sem>
    sem_wait(mutexTail);
    80001b00:	0304b503          	ld	a0,48(s1)
    80001b04:	00000097          	auipc	ra,0x0
    80001b08:	cbc080e7          	jalr	-836(ra) # 800017c0 <_Z8sem_waitP4_sem>

    if (tail >= head) {
    80001b0c:	0144a783          	lw	a5,20(s1)
    80001b10:	0104a903          	lw	s2,16(s1)
    80001b14:	0327ce63          	blt	a5,s2,80001b50 <_ZN7_buffer6getCntEv+0x78>
        ret = tail - head;
    80001b18:	4127893b          	subw	s2,a5,s2
    } else {
        ret = cap - head + tail;
    }

    sem_signal(mutexTail);
    80001b1c:	0304b503          	ld	a0,48(s1)
    80001b20:	00000097          	auipc	ra,0x0
    80001b24:	cd8080e7          	jalr	-808(ra) # 800017f8 <_Z10sem_signalP4_sem>
    sem_signal(mutexHead);
    80001b28:	0284b503          	ld	a0,40(s1)
    80001b2c:	00000097          	auipc	ra,0x0
    80001b30:	ccc080e7          	jalr	-820(ra) # 800017f8 <_Z10sem_signalP4_sem>

    return ret;
}
    80001b34:	00090513          	mv	a0,s2
    80001b38:	01813083          	ld	ra,24(sp)
    80001b3c:	01013403          	ld	s0,16(sp)
    80001b40:	00813483          	ld	s1,8(sp)
    80001b44:	00013903          	ld	s2,0(sp)
    80001b48:	02010113          	addi	sp,sp,32
    80001b4c:	00008067          	ret
        ret = cap - head + tail;
    80001b50:	0004a703          	lw	a4,0(s1)
    80001b54:	4127093b          	subw	s2,a4,s2
    80001b58:	00f9093b          	addw	s2,s2,a5
    80001b5c:	fc1ff06f          	j	80001b1c <_ZN7_buffer6getCntEv+0x44>

0000000080001b60 <_ZN7_bufferD1Ev>:
_buffer::~_buffer() {
    80001b60:	fe010113          	addi	sp,sp,-32
    80001b64:	00113c23          	sd	ra,24(sp)
    80001b68:	00813823          	sd	s0,16(sp)
    80001b6c:	00913423          	sd	s1,8(sp)
    80001b70:	02010413          	addi	s0,sp,32
    80001b74:	00050493          	mv	s1,a0
    while (getCnt() > 0)
    80001b78:	00048513          	mv	a0,s1
    80001b7c:	00000097          	auipc	ra,0x0
    80001b80:	f5c080e7          	jalr	-164(ra) # 80001ad8 <_ZN7_buffer6getCntEv>
    80001b84:	00a05e63          	blez	a0,80001ba0 <_ZN7_bufferD1Ev+0x40>
        head = (head + 1) % cap;
    80001b88:	0104a783          	lw	a5,16(s1)
    80001b8c:	0017879b          	addiw	a5,a5,1
    80001b90:	0004a703          	lw	a4,0(s1)
    80001b94:	02e7e7bb          	remw	a5,a5,a4
    80001b98:	00f4a823          	sw	a5,16(s1)
    while (getCnt() > 0)
    80001b9c:	fddff06f          	j	80001b78 <_ZN7_bufferD1Ev+0x18>
    sem_close(itemAvailable);
    80001ba0:	0204b503          	ld	a0,32(s1)
    80001ba4:	00000097          	auipc	ra,0x0
    80001ba8:	be4080e7          	jalr	-1052(ra) # 80001788 <_Z9sem_closeP4_sem>
    sem_close(spaceAvailable);
    80001bac:	0184b503          	ld	a0,24(s1)
    80001bb0:	00000097          	auipc	ra,0x0
    80001bb4:	bd8080e7          	jalr	-1064(ra) # 80001788 <_Z9sem_closeP4_sem>
    sem_close(mutexTail);
    80001bb8:	0304b503          	ld	a0,48(s1)
    80001bbc:	00000097          	auipc	ra,0x0
    80001bc0:	bcc080e7          	jalr	-1076(ra) # 80001788 <_Z9sem_closeP4_sem>
    sem_close(mutexHead);
    80001bc4:	0284b503          	ld	a0,40(s1)
    80001bc8:	00000097          	auipc	ra,0x0
    80001bcc:	bc0080e7          	jalr	-1088(ra) # 80001788 <_Z9sem_closeP4_sem>
}
    80001bd0:	01813083          	ld	ra,24(sp)
    80001bd4:	01013403          	ld	s0,16(sp)
    80001bd8:	00813483          	ld	s1,8(sp)
    80001bdc:	02010113          	addi	sp,sp,32
    80001be0:	00008067          	ret

0000000080001be4 <_ZN7_buffer4kgetEv>:


char _buffer::kget() {
    80001be4:	fe010113          	addi	sp,sp,-32
    80001be8:	00113c23          	sd	ra,24(sp)
    80001bec:	00813823          	sd	s0,16(sp)
    80001bf0:	00913423          	sd	s1,8(sp)
    80001bf4:	01213023          	sd	s2,0(sp)
    80001bf8:	02010413          	addi	s0,sp,32
    80001bfc:	00050493          	mv	s1,a0

    itemAvailable->wait();
    80001c00:	02053503          	ld	a0,32(a0)
    80001c04:	00001097          	auipc	ra,0x1
    80001c08:	794080e7          	jalr	1940(ra) # 80003398 <_ZN4_sem4waitEv>
    mutexHead->wait();
    80001c0c:	0284b503          	ld	a0,40(s1)
    80001c10:	00001097          	auipc	ra,0x1
    80001c14:	788080e7          	jalr	1928(ra) # 80003398 <_ZN4_sem4waitEv>

    char ret = buffer[head];
    80001c18:	0084b703          	ld	a4,8(s1)
    80001c1c:	0104a783          	lw	a5,16(s1)
    80001c20:	00f70733          	add	a4,a4,a5
    80001c24:	00074903          	lbu	s2,0(a4)
    head = (head + 1) % cap;
    80001c28:	0017879b          	addiw	a5,a5,1
    80001c2c:	0004a703          	lw	a4,0(s1)
    80001c30:	02e7e7bb          	remw	a5,a5,a4
    80001c34:	00f4a823          	sw	a5,16(s1)

    mutexHead->signal();
    80001c38:	0284b503          	ld	a0,40(s1)
    80001c3c:	00002097          	auipc	ra,0x2
    80001c40:	80c080e7          	jalr	-2036(ra) # 80003448 <_ZN4_sem6signalEv>
    spaceAvailable->signal();
    80001c44:	0184b503          	ld	a0,24(s1)
    80001c48:	00002097          	auipc	ra,0x2
    80001c4c:	800080e7          	jalr	-2048(ra) # 80003448 <_ZN4_sem6signalEv>
    return ret;
}
    80001c50:	00090513          	mv	a0,s2
    80001c54:	01813083          	ld	ra,24(sp)
    80001c58:	01013403          	ld	s0,16(sp)
    80001c5c:	00813483          	ld	s1,8(sp)
    80001c60:	00013903          	ld	s2,0(sp)
    80001c64:	02010113          	addi	sp,sp,32
    80001c68:	00008067          	ret

0000000080001c6c <_ZN7_buffer4kputEc>:

void _buffer::kput(char val) {
    80001c6c:	fe010113          	addi	sp,sp,-32
    80001c70:	00113c23          	sd	ra,24(sp)
    80001c74:	00813823          	sd	s0,16(sp)
    80001c78:	00913423          	sd	s1,8(sp)
    80001c7c:	01213023          	sd	s2,0(sp)
    80001c80:	02010413          	addi	s0,sp,32
    80001c84:	00050493          	mv	s1,a0
    80001c88:	00058913          	mv	s2,a1

    spaceAvailable->wait();
    80001c8c:	01853503          	ld	a0,24(a0)
    80001c90:	00001097          	auipc	ra,0x1
    80001c94:	708080e7          	jalr	1800(ra) # 80003398 <_ZN4_sem4waitEv>
    mutexTail->wait();
    80001c98:	0304b503          	ld	a0,48(s1)
    80001c9c:	00001097          	auipc	ra,0x1
    80001ca0:	6fc080e7          	jalr	1788(ra) # 80003398 <_ZN4_sem4waitEv>

    buffer[tail] = val;
    80001ca4:	0084b783          	ld	a5,8(s1)
    80001ca8:	0144a703          	lw	a4,20(s1)
    80001cac:	00e787b3          	add	a5,a5,a4
    80001cb0:	01278023          	sb	s2,0(a5)
    tail = (tail + 1) % cap;
    80001cb4:	0144a783          	lw	a5,20(s1)
    80001cb8:	0017879b          	addiw	a5,a5,1
    80001cbc:	0004a703          	lw	a4,0(s1)
    80001cc0:	02e7e7bb          	remw	a5,a5,a4
    80001cc4:	00f4aa23          	sw	a5,20(s1)

    mutexTail->signal();
    80001cc8:	0304b503          	ld	a0,48(s1)
    80001ccc:	00001097          	auipc	ra,0x1
    80001cd0:	77c080e7          	jalr	1916(ra) # 80003448 <_ZN4_sem6signalEv>
    itemAvailable->signal();
    80001cd4:	0204b503          	ld	a0,32(s1)
    80001cd8:	00001097          	auipc	ra,0x1
    80001cdc:	770080e7          	jalr	1904(ra) # 80003448 <_ZN4_sem6signalEv>
}
    80001ce0:	01813083          	ld	ra,24(sp)
    80001ce4:	01013403          	ld	s0,16(sp)
    80001ce8:	00813483          	ld	s1,8(sp)
    80001cec:	00013903          	ld	s2,0(sp)
    80001cf0:	02010113          	addi	sp,sp,32
    80001cf4:	00008067          	ret

0000000080001cf8 <_Z41__static_initialization_and_destruction_0ii>:
}

void Scheduler::put(TCB *ccb){

    readyCoroutineQueue.addLast(ccb);
    80001cf8:	ff010113          	addi	sp,sp,-16
    80001cfc:	00813423          	sd	s0,8(sp)
    80001d00:	01010413          	addi	s0,sp,16
    80001d04:	00100793          	li	a5,1
    80001d08:	00f50863          	beq	a0,a5,80001d18 <_Z41__static_initialization_and_destruction_0ii+0x20>
    80001d0c:	00813403          	ld	s0,8(sp)
    80001d10:	01010113          	addi	sp,sp,16
    80001d14:	00008067          	ret
    80001d18:	000107b7          	lui	a5,0x10
    80001d1c:	fff78793          	addi	a5,a5,-1 # ffff <_entry-0x7fff0001>
    80001d20:	fef596e3          	bne	a1,a5,80001d0c <_Z41__static_initialization_and_destruction_0ii+0x14>
    };

    Elem *head, *tail, *current;

public:
    List() : head(0), tail(0), current(0) {}
    80001d24:	00007797          	auipc	a5,0x7
    80001d28:	81478793          	addi	a5,a5,-2028 # 80008538 <_ZN9Scheduler19readyCoroutineQueueE>
    80001d2c:	0007b023          	sd	zero,0(a5)
    80001d30:	0007b423          	sd	zero,8(a5)
    80001d34:	0007b823          	sd	zero,16(a5)
    80001d38:	fd5ff06f          	j	80001d0c <_Z41__static_initialization_and_destruction_0ii+0x14>

0000000080001d3c <_ZN9Scheduler3getEv>:
{
    80001d3c:	fe010113          	addi	sp,sp,-32
    80001d40:	00113c23          	sd	ra,24(sp)
    80001d44:	00813823          	sd	s0,16(sp)
    80001d48:	00913423          	sd	s1,8(sp)
    80001d4c:	02010413          	addi	s0,sp,32
        } else
            head = tail = elem;
    }

    T *removeFirst(){
        if (!head)
    80001d50:	00006517          	auipc	a0,0x6
    80001d54:	7e853503          	ld	a0,2024(a0) # 80008538 <_ZN9Scheduler19readyCoroutineQueueE>
    80001d58:	04050263          	beqz	a0,80001d9c <_ZN9Scheduler3getEv+0x60>
            return 0;

        Elem *elem = head;
        head = head->next;
    80001d5c:	00853783          	ld	a5,8(a0)
    80001d60:	00006717          	auipc	a4,0x6
    80001d64:	7cf73c23          	sd	a5,2008(a4) # 80008538 <_ZN9Scheduler19readyCoroutineQueueE>
        if (!head)
    80001d68:	02078463          	beqz	a5,80001d90 <_ZN9Scheduler3getEv+0x54>
            tail = 0;

        T *ret = elem->data;
    80001d6c:	00053483          	ld	s1,0(a0)
        delete elem;
    80001d70:	fffff097          	auipc	ra,0xfffff
    80001d74:	544080e7          	jalr	1348(ra) # 800012b4 <_ZdlPv>
}
    80001d78:	00048513          	mv	a0,s1
    80001d7c:	01813083          	ld	ra,24(sp)
    80001d80:	01013403          	ld	s0,16(sp)
    80001d84:	00813483          	ld	s1,8(sp)
    80001d88:	02010113          	addi	sp,sp,32
    80001d8c:	00008067          	ret
            tail = 0;
    80001d90:	00006797          	auipc	a5,0x6
    80001d94:	7a07b823          	sd	zero,1968(a5) # 80008540 <_ZN9Scheduler19readyCoroutineQueueE+0x8>
    80001d98:	fd5ff06f          	j	80001d6c <_ZN9Scheduler3getEv+0x30>
            return 0;
    80001d9c:	00050493          	mv	s1,a0
    return readyCoroutineQueue.removeFirst();
    80001da0:	fd9ff06f          	j	80001d78 <_ZN9Scheduler3getEv+0x3c>

0000000080001da4 <_ZN9Scheduler3putEP3TCB>:
void Scheduler::put(TCB *ccb){
    80001da4:	fe010113          	addi	sp,sp,-32
    80001da8:	00113c23          	sd	ra,24(sp)
    80001dac:	00813823          	sd	s0,16(sp)
    80001db0:	00913423          	sd	s1,8(sp)
    80001db4:	02010413          	addi	s0,sp,32
    80001db8:	00050493          	mv	s1,a0
        Elem *elem = new Elem(data, 0);
    80001dbc:	01000513          	li	a0,16
    80001dc0:	fffff097          	auipc	ra,0xfffff
    80001dc4:	4a4080e7          	jalr	1188(ra) # 80001264 <_Znwm>
        Elem(T *data, Elem *next) : data(data), next(next) {}
    80001dc8:	00953023          	sd	s1,0(a0)
    80001dcc:	00053423          	sd	zero,8(a0)
        if (tail){
    80001dd0:	00006797          	auipc	a5,0x6
    80001dd4:	7707b783          	ld	a5,1904(a5) # 80008540 <_ZN9Scheduler19readyCoroutineQueueE+0x8>
    80001dd8:	02078263          	beqz	a5,80001dfc <_ZN9Scheduler3putEP3TCB+0x58>
            tail->next = elem;
    80001ddc:	00a7b423          	sd	a0,8(a5)
            tail = elem;
    80001de0:	00006797          	auipc	a5,0x6
    80001de4:	76a7b023          	sd	a0,1888(a5) # 80008540 <_ZN9Scheduler19readyCoroutineQueueE+0x8>
    80001de8:	01813083          	ld	ra,24(sp)
    80001dec:	01013403          	ld	s0,16(sp)
    80001df0:	00813483          	ld	s1,8(sp)
    80001df4:	02010113          	addi	sp,sp,32
    80001df8:	00008067          	ret
            head = tail = elem;
    80001dfc:	00006797          	auipc	a5,0x6
    80001e00:	73c78793          	addi	a5,a5,1852 # 80008538 <_ZN9Scheduler19readyCoroutineQueueE>
    80001e04:	00a7b423          	sd	a0,8(a5)
    80001e08:	00a7b023          	sd	a0,0(a5)
    80001e0c:	fddff06f          	j	80001de8 <_ZN9Scheduler3putEP3TCB+0x44>

0000000080001e10 <_GLOBAL__sub_I__ZN9Scheduler19readyCoroutineQueueE>:
    80001e10:	ff010113          	addi	sp,sp,-16
    80001e14:	00113423          	sd	ra,8(sp)
    80001e18:	00813023          	sd	s0,0(sp)
    80001e1c:	01010413          	addi	s0,sp,16
    80001e20:	000105b7          	lui	a1,0x10
    80001e24:	fff58593          	addi	a1,a1,-1 # ffff <_entry-0x7fff0001>
    80001e28:	00100513          	li	a0,1
    80001e2c:	00000097          	auipc	ra,0x0
    80001e30:	ecc080e7          	jalr	-308(ra) # 80001cf8 <_Z41__static_initialization_and_destruction_0ii>
    80001e34:	00813083          	ld	ra,8(sp)
    80001e38:	00013403          	ld	s0,0(sp)
    80001e3c:	01010113          	addi	sp,sp,16
    80001e40:	00008067          	ret

0000000080001e44 <_ZN5Riscv10popSppSpieEv>:
_buffer* Riscv::inputBuffer = nullptr;
_buffer* Riscv::outputBuffer = nullptr;



void Riscv::popSppSpie() {
    80001e44:	ff010113          	addi	sp,sp,-16
    80001e48:	00813423          	sd	s0,8(sp)
    80001e4c:	01010413          	addi	s0,sp,16
    __asm__ volatile ("csrw sepc, ra");
    80001e50:	14109073          	csrw	sepc,ra
    __asm__ volatile ("sret");
    80001e54:	10200073          	sret
}
    80001e58:	00813403          	ld	s0,8(sp)
    80001e5c:	01010113          	addi	sp,sp,16
    80001e60:	00008067          	ret

0000000080001e64 <_ZN5Riscv4initEv>:

void Riscv::init(){
    80001e64:	fe010113          	addi	sp,sp,-32
    80001e68:	00113c23          	sd	ra,24(sp)
    80001e6c:	00813823          	sd	s0,16(sp)
    80001e70:	00913423          	sd	s1,8(sp)
    80001e74:	01213023          	sd	s2,0(sp)
    80001e78:	02010413          	addi	s0,sp,32
    inputBuffer = new _buffer(1024);
    80001e7c:	03800513          	li	a0,56
    80001e80:	fffff097          	auipc	ra,0xfffff
    80001e84:	3e4080e7          	jalr	996(ra) # 80001264 <_Znwm>
    80001e88:	00050493          	mv	s1,a0
    80001e8c:	40000593          	li	a1,1024
    80001e90:	00000097          	auipc	ra,0x0
    80001e94:	a34080e7          	jalr	-1484(ra) # 800018c4 <_ZN7_bufferC1Ei>
    80001e98:	00006797          	auipc	a5,0x6
    80001e9c:	6a97bc23          	sd	s1,1720(a5) # 80008550 <_ZN5Riscv11inputBufferE>
    outputBuffer = new _buffer(1024);
    80001ea0:	03800513          	li	a0,56
    80001ea4:	fffff097          	auipc	ra,0xfffff
    80001ea8:	3c0080e7          	jalr	960(ra) # 80001264 <_Znwm>
    80001eac:	00050493          	mv	s1,a0
    80001eb0:	40000593          	li	a1,1024
    80001eb4:	00000097          	auipc	ra,0x0
    80001eb8:	a10080e7          	jalr	-1520(ra) # 800018c4 <_ZN7_bufferC1Ei>
    80001ebc:	00006797          	auipc	a5,0x6
    80001ec0:	6897be23          	sd	s1,1692(a5) # 80008558 <_ZN5Riscv12outputBufferE>
}
    80001ec4:	01813083          	ld	ra,24(sp)
    80001ec8:	01013403          	ld	s0,16(sp)
    80001ecc:	00813483          	ld	s1,8(sp)
    80001ed0:	00013903          	ld	s2,0(sp)
    80001ed4:	02010113          	addi	sp,sp,32
    80001ed8:	00008067          	ret
    80001edc:	00050913          	mv	s2,a0
    inputBuffer = new _buffer(1024);
    80001ee0:	00048513          	mv	a0,s1
    80001ee4:	fffff097          	auipc	ra,0xfffff
    80001ee8:	3d0080e7          	jalr	976(ra) # 800012b4 <_ZdlPv>
    80001eec:	00090513          	mv	a0,s2
    80001ef0:	00007097          	auipc	ra,0x7
    80001ef4:	7b8080e7          	jalr	1976(ra) # 800096a8 <_Unwind_Resume>
    80001ef8:	00050913          	mv	s2,a0
    outputBuffer = new _buffer(1024);
    80001efc:	00048513          	mv	a0,s1
    80001f00:	fffff097          	auipc	ra,0xfffff
    80001f04:	3b4080e7          	jalr	948(ra) # 800012b4 <_ZdlPv>
    80001f08:	00090513          	mv	a0,s2
    80001f0c:	00007097          	auipc	ra,0x7
    80001f10:	79c080e7          	jalr	1948(ra) # 800096a8 <_Unwind_Resume>

0000000080001f14 <_ZN5Riscv21supervisorTrapHandlerEv>:

void Riscv::supervisorTrapHandler(){
    80001f14:	f7010113          	addi	sp,sp,-144
    80001f18:	08113423          	sd	ra,136(sp)
    80001f1c:	08813023          	sd	s0,128(sp)
    80001f20:	06913c23          	sd	s1,120(sp)
    80001f24:	07213823          	sd	s2,112(sp)
    80001f28:	07313423          	sd	s3,104(sp)
    80001f2c:	07413023          	sd	s4,96(sp)
    80001f30:	05513c23          	sd	s5,88(sp)
    80001f34:	05613823          	sd	s6,80(sp)
    80001f38:	05713423          	sd	s7,72(sp)
    80001f3c:	05813023          	sd	s8,64(sp)
    80001f40:	03913c23          	sd	s9,56(sp)
    80001f44:	09010413          	addi	s0,sp,144

    uint64 a0, a1, a2, a3, a4, a5, a6, a7;

    __asm__ volatile ("mv %0, a7" : "=r" (a7));
    80001f48:	00088c13          	mv	s8,a7
    __asm__ volatile ("mv %0, a6" : "=r" (a6));
    80001f4c:	00080b93          	mv	s7,a6
    __asm__ volatile ("mv %0, a5" : "=r" (a5));
    80001f50:	00078b13          	mv	s6,a5
    __asm__ volatile ("mv %0, a4" : "=r" (a4));
    80001f54:	00070a93          	mv	s5,a4
    __asm__ volatile ("mv %0, a3" : "=r" (a3));
    80001f58:	00068a13          	mv	s4,a3
    __asm__ volatile ("mv %0, a2" : "=r" (a2));
    80001f5c:	00060993          	mv	s3,a2
    __asm__ volatile ("mv %0, a1" : "=r" (a1));
    80001f60:	00058913          	mv	s2,a1
    __asm__ volatile ("mv %0, a0" : "=r" (a0));
    80001f64:	00050493          	mv	s1,a0
};

inline uint64 Riscv::r_scause()
{
    uint64 volatile scause;
    __asm__ volatile ("csrr %[scause], scause" : [scause] "=r"(scause));
    80001f68:	142027f3          	csrr	a5,scause
    80001f6c:	f8f43423          	sd	a5,-120(s0)
    return scause;
    80001f70:	f8843783          	ld	a5,-120(s0)

    uint64 operation = a0;

    uint64 volatile scause;
    scause = r_scause();
    80001f74:	f8f43c23          	sd	a5,-104(s0)
}

inline uint64 Riscv::r_sepc()
{
    uint64 volatile sepc;
    __asm__ volatile ("csrr %[sepc], sepc" : [sepc] "=r"(sepc));
    80001f78:	141027f3          	csrr	a5,sepc
    80001f7c:	f8f43023          	sd	a5,-128(s0)
    return sepc;
    80001f80:	f8043783          	ld	a5,-128(s0)
    uint64 volatile sepc = r_sepc();
    80001f84:	f8f43823          	sd	a5,-112(s0)
}

inline uint64 Riscv::r_sstatus()
{
    uint64 volatile sstatus;
    __asm__ volatile ("csrr %[sstatus], sstatus" : [sstatus] "=r"(sstatus));
    80001f88:	100027f3          	csrr	a5,sstatus
    80001f8c:	f6f43c23          	sd	a5,-136(s0)
    return sstatus;
    80001f90:	f7843c83          	ld	s9,-136(s0)
    uint64 sstatus = r_sstatus();
    if(scause == ECALL_SYS || scause == ECALL_USER){
    80001f94:	f9843703          	ld	a4,-104(s0)
    80001f98:	00900793          	li	a5,9
    80001f9c:	04f70a63          	beq	a4,a5,80001ff0 <_ZN5Riscv21supervisorTrapHandlerEv+0xdc>
    80001fa0:	f9843703          	ld	a4,-104(s0)
    80001fa4:	00800793          	li	a5,8
    80001fa8:	04f70463          	beq	a4,a5,80001ff0 <_ZN5Riscv21supervisorTrapHandlerEv+0xdc>
            outputBuffer->kput((char)a1);
        }
        w_sstatus(sstatus);
        w_sepc(sepc + 4);
        a0 = ret;
    }else if(scause == TIMER){
    80001fac:	f9843703          	ld	a4,-104(s0)
    80001fb0:	fff00793          	li	a5,-1
    80001fb4:	03f79793          	slli	a5,a5,0x3f
    80001fb8:	00178793          	addi	a5,a5,1
    80001fbc:	24f70a63          	beq	a4,a5,80002210 <_ZN5Riscv21supervisorTrapHandlerEv+0x2fc>
            TCB::dispatch();
            w_sstatus(sstatus);
            w_sepc(sepc);
        }
        mc_sip(SIP_SSIP);
    }else if(scause == HARDWARE){
    80001fc0:	f9843703          	ld	a4,-104(s0)
    80001fc4:	fff00793          	li	a5,-1
    80001fc8:	03f79793          	slli	a5,a5,0x3f
    80001fcc:	00978793          	addi	a5,a5,9
    80001fd0:	0af71c63          	bne	a4,a5,80002088 <_ZN5Riscv21supervisorTrapHandlerEv+0x174>
       int code = plic_claim();
    80001fd4:	00003097          	auipc	ra,0x3
    80001fd8:	a90080e7          	jalr	-1392(ra) # 80004a64 <plic_claim>
        if (code == CONSOLE_IRQ)
    80001fdc:	00a00793          	li	a5,10
    80001fe0:	0af51463          	bne	a0,a5,80002088 <_ZN5Riscv21supervisorTrapHandlerEv+0x174>
            plic_complete(code);
    80001fe4:	00003097          	auipc	ra,0x3
    80001fe8:	ab8080e7          	jalr	-1352(ra) # 80004a9c <plic_complete>
    80001fec:	09c0006f          	j	80002088 <_ZN5Riscv21supervisorTrapHandlerEv+0x174>
        if(operation== MEM_ALLOC){
    80001ff0:	00100793          	li	a5,1
    80001ff4:	06f48663          	beq	s1,a5,80002060 <_ZN5Riscv21supervisorTrapHandlerEv+0x14c>
        }else if(operation == MEM_FREE){
    80001ff8:	00200793          	li	a5,2
    80001ffc:	0ef48063          	beq	s1,a5,800020dc <_ZN5Riscv21supervisorTrapHandlerEv+0x1c8>
        }else if(operation == THREAD_CREATE){
    80002000:	01100793          	li	a5,17
    80002004:	0ef48a63          	beq	s1,a5,800020f8 <_ZN5Riscv21supervisorTrapHandlerEv+0x1e4>
        }else if(operation == THREAD_EXIT){
    80002008:	01200793          	li	a5,18
    8000200c:	10f48663          	beq	s1,a5,80002118 <_ZN5Riscv21supervisorTrapHandlerEv+0x204>
        }else if(operation == THREAD_DISPATCH){
    80002010:	01300793          	li	a5,19
    80002014:	10f48a63          	beq	s1,a5,80002128 <_ZN5Riscv21supervisorTrapHandlerEv+0x214>
        }else if(operation == SEM_OPEN){
    80002018:	02100793          	li	a5,33
    8000201c:	10f48e63          	beq	s1,a5,80002138 <_ZN5Riscv21supervisorTrapHandlerEv+0x224>
        }else if(operation == SEM_CLOSE){
    80002020:	02200793          	li	a5,34
    80002024:	12f48663          	beq	s1,a5,80002150 <_ZN5Riscv21supervisorTrapHandlerEv+0x23c>
        }else if(operation == SEM_WAIT){
    80002028:	02300793          	li	a5,35
    8000202c:	12f48c63          	beq	s1,a5,80002164 <_ZN5Riscv21supervisorTrapHandlerEv+0x250>
        }else if(operation == SEM_SIGNAL){
    80002030:	02400793          	li	a5,36
    80002034:	14f48263          	beq	s1,a5,80002178 <_ZN5Riscv21supervisorTrapHandlerEv+0x264>
        }else if(operation == THREAD_YIELD){
    80002038:	01400793          	li	a5,20
    8000203c:	14f48863          	beq	s1,a5,8000218c <_ZN5Riscv21supervisorTrapHandlerEv+0x278>
        }else if(operation == TIME_SLEEP){
    80002040:	03100793          	li	a5,49
    80002044:	16f48263          	beq	s1,a5,800021a8 <_ZN5Riscv21supervisorTrapHandlerEv+0x294>
        }else if(operation == GETC){
    80002048:	04100793          	li	a5,65
    8000204c:	18f48863          	beq	s1,a5,800021dc <_ZN5Riscv21supervisorTrapHandlerEv+0x2c8>
        }else if(operation == PUTC){
    80002050:	04200793          	li	a5,66
    80002054:	1af48063          	beq	s1,a5,800021f4 <_ZN5Riscv21supervisorTrapHandlerEv+0x2e0>
        uint64 ret = 0;
    80002058:	00000493          	li	s1,0
    8000205c:	01c0006f          	j	80002078 <_ZN5Riscv21supervisorTrapHandlerEv+0x164>
    MemoryAllocator(MemoryAllocator&&) = delete;
    MemoryAllocator& operator=(const MemoryAllocator&) = delete;
    MemoryAllocator& operator=(MemoryAllocator&&) = delete;

    static MemoryAllocator& getInstance();
    static void* getMemory(size_t size) { return getInstance().IGetMemory(size); }
    80002060:	fffff097          	auipc	ra,0xfffff
    80002064:	2fc080e7          	jalr	764(ra) # 8000135c <_ZN15MemoryAllocator11getInstanceEv>
    80002068:	00090593          	mv	a1,s2
    8000206c:	fffff097          	auipc	ra,0xfffff
    80002070:	34c080e7          	jalr	844(ra) # 800013b8 <_ZN15MemoryAllocator10IGetMemoryEm>
    80002074:	00050493          	mv	s1,a0
}

inline void Riscv::w_sstatus(uint64 sstatus)
{
    __asm__ volatile ("csrw sstatus, %[sstatus]" : : [sstatus] "r"(sstatus));
    80002078:	100c9073          	csrw	sstatus,s9
        w_sepc(sepc + 4);
    8000207c:	f9043783          	ld	a5,-112(s0)
    80002080:	00478793          	addi	a5,a5,4
    __asm__ volatile ("csrw sepc, %[sepc]" : : [sepc] "r"(sepc));
    80002084:	14179073          	csrw	sepc,a5
        // print(scause)
        // print(sepc)
        // print(stval)
    }

    __asm__ volatile("mv a7, %0" : : "r"(a7));
    80002088:	000c0893          	mv	a7,s8
    __asm__ volatile("mv a6, %0" : : "r"(a6));
    8000208c:	000b8813          	mv	a6,s7
    __asm__ volatile("mv a5, %0" : : "r"(a5));
    80002090:	000b0793          	mv	a5,s6
    __asm__ volatile("mv a4, %0" : : "r"(a4));
    80002094:	000a8713          	mv	a4,s5
    __asm__ volatile("mv a3, %0" : : "r"(a3));
    80002098:	000a0693          	mv	a3,s4
    __asm__ volatile("mv a2, %0" : : "r"(a2));
    8000209c:	00098613          	mv	a2,s3
    __asm__ volatile("mv a1, %0" : : "r"(a1));
    800020a0:	00090593          	mv	a1,s2
    __asm__ volatile("mv a0, %0" : : "r"(a0));
    800020a4:	00048513          	mv	a0,s1


}
    800020a8:	08813083          	ld	ra,136(sp)
    800020ac:	08013403          	ld	s0,128(sp)
    800020b0:	07813483          	ld	s1,120(sp)
    800020b4:	07013903          	ld	s2,112(sp)
    800020b8:	06813983          	ld	s3,104(sp)
    800020bc:	06013a03          	ld	s4,96(sp)
    800020c0:	05813a83          	ld	s5,88(sp)
    800020c4:	05013b03          	ld	s6,80(sp)
    800020c8:	04813b83          	ld	s7,72(sp)
    800020cc:	04013c03          	ld	s8,64(sp)
    800020d0:	03813c83          	ld	s9,56(sp)
    800020d4:	09010113          	addi	sp,sp,144
    800020d8:	00008067          	ret
    static int freeMemory(void* addr) { return getInstance().IFreeMemory(addr); }
    800020dc:	fffff097          	auipc	ra,0xfffff
    800020e0:	280080e7          	jalr	640(ra) # 8000135c <_ZN15MemoryAllocator11getInstanceEv>
    800020e4:	00090593          	mv	a1,s2
    800020e8:	fffff097          	auipc	ra,0xfffff
    800020ec:	3fc080e7          	jalr	1020(ra) # 800014e4 <_ZN15MemoryAllocator11IFreeMemoryEPv>
            ret = (uint64)MemoryAllocator::freeMemory((void*)a1);
    800020f0:	00050493          	mv	s1,a0
    800020f4:	f85ff06f          	j	80002078 <_ZN5Riscv21supervisorTrapHandlerEv+0x164>
            ret = TCB::createThread((thread_t*)a1, (Body)a2, (void*)a3, (uint64*)a4);
    800020f8:	000a8693          	mv	a3,s5
    800020fc:	000a0613          	mv	a2,s4
    80002100:	00098593          	mv	a1,s3
    80002104:	00090513          	mv	a0,s2
    80002108:	00002097          	auipc	ra,0x2
    8000210c:	9e4080e7          	jalr	-1564(ra) # 80003aec <_ZN3TCB12createThreadEPPS_PFvPvES2_Pm>
    80002110:	00050493          	mv	s1,a0
    80002114:	f65ff06f          	j	80002078 <_ZN5Riscv21supervisorTrapHandlerEv+0x164>
            ret = TCB::stopThread();
    80002118:	00002097          	auipc	ra,0x2
    8000211c:	acc080e7          	jalr	-1332(ra) # 80003be4 <_ZN3TCB10stopThreadEv>
    80002120:	00050493          	mv	s1,a0
    80002124:	f55ff06f          	j	80002078 <_ZN5Riscv21supervisorTrapHandlerEv+0x164>
            TCB::yield();
    80002128:	00002097          	auipc	ra,0x2
    8000212c:	8dc080e7          	jalr	-1828(ra) # 80003a04 <_ZN3TCB5yieldEv>
        uint64 ret = 0;
    80002130:	00000493          	li	s1,0
    80002134:	f45ff06f          	j	80002078 <_ZN5Riscv21supervisorTrapHandlerEv+0x164>
            ret = _sem::createSemaphore((sem_t*)a1, (unsigned)a2);
    80002138:	0009859b          	sext.w	a1,s3
    8000213c:	00090513          	mv	a0,s2
    80002140:	00001097          	auipc	ra,0x1
    80002144:	17c080e7          	jalr	380(ra) # 800032bc <_ZN4_sem15createSemaphoreEPPS_j>
    80002148:	00050493          	mv	s1,a0
    8000214c:	f2dff06f          	j	80002078 <_ZN5Riscv21supervisorTrapHandlerEv+0x164>
            id->close();
    80002150:	00090513          	mv	a0,s2
    80002154:	00001097          	auipc	ra,0x1
    80002158:	334080e7          	jalr	820(ra) # 80003488 <_ZN4_sem5closeEv>
        uint64 ret = 0;
    8000215c:	00000493          	li	s1,0
    80002160:	f19ff06f          	j	80002078 <_ZN5Riscv21supervisorTrapHandlerEv+0x164>
            semaphore->wait();
    80002164:	00090513          	mv	a0,s2
    80002168:	00001097          	auipc	ra,0x1
    8000216c:	230080e7          	jalr	560(ra) # 80003398 <_ZN4_sem4waitEv>
        uint64 ret = 0;
    80002170:	00000493          	li	s1,0
    80002174:	f05ff06f          	j	80002078 <_ZN5Riscv21supervisorTrapHandlerEv+0x164>
            semaphore->signal();
    80002178:	00090513          	mv	a0,s2
    8000217c:	00001097          	auipc	ra,0x1
    80002180:	2cc080e7          	jalr	716(ra) # 80003448 <_ZN4_sem6signalEv>
        uint64 ret = 0;
    80002184:	00000493          	li	s1,0
    80002188:	ef1ff06f          	j	80002078 <_ZN5Riscv21supervisorTrapHandlerEv+0x164>
            TCB::timeSliceCounter = 0;
    8000218c:	00006797          	auipc	a5,0x6
    80002190:	2e47b783          	ld	a5,740(a5) # 80008470 <_GLOBAL_OFFSET_TABLE_+0x28>
    80002194:	0007b023          	sd	zero,0(a5)
            TCB::dispatch();
    80002198:	00002097          	auipc	ra,0x2
    8000219c:	8e8080e7          	jalr	-1816(ra) # 80003a80 <_ZN3TCB8dispatchEv>
        uint64 ret = 0;
    800021a0:	00000493          	li	s1,0
    800021a4:	ed5ff06f          	j	80002078 <_ZN5Riscv21supervisorTrapHandlerEv+0x164>
            SleepList::put(TCB::running, time);
    800021a8:	00006497          	auipc	s1,0x6
    800021ac:	3084b483          	ld	s1,776(s1) # 800084b0 <_GLOBAL_OFFSET_TABLE_+0x68>
    800021b0:	00090593          	mv	a1,s2
    800021b4:	0004b503          	ld	a0,0(s1)
    800021b8:	00001097          	auipc	ra,0x1
    800021bc:	dc4080e7          	jalr	-572(ra) # 80002f7c <_ZN9SleepList3putEP3TCBm>
            TCB::running->setStatus(TCB::SLEEPING);
    800021c0:	0004b783          	ld	a5,0(s1)
public:
    enum threadStatus {FINISHED, RUNNING, BLOCKED, SLEEPING};
    int pid;
    using Body = void (*)(void*);

    void setStatus(threadStatus status) { this->status = status; }
    800021c4:	00300713          	li	a4,3
    800021c8:	02e7ac23          	sw	a4,56(a5)
            TCB::dispatch();
    800021cc:	00002097          	auipc	ra,0x2
    800021d0:	8b4080e7          	jalr	-1868(ra) # 80003a80 <_ZN3TCB8dispatchEv>
        uint64 ret = 0;
    800021d4:	00000493          	li	s1,0
    800021d8:	ea1ff06f          	j	80002078 <_ZN5Riscv21supervisorTrapHandlerEv+0x164>
            ret = (uint64)inputBuffer->kget();
    800021dc:	00006517          	auipc	a0,0x6
    800021e0:	37453503          	ld	a0,884(a0) # 80008550 <_ZN5Riscv11inputBufferE>
    800021e4:	00000097          	auipc	ra,0x0
    800021e8:	a00080e7          	jalr	-1536(ra) # 80001be4 <_ZN7_buffer4kgetEv>
    800021ec:	00050493          	mv	s1,a0
    800021f0:	e89ff06f          	j	80002078 <_ZN5Riscv21supervisorTrapHandlerEv+0x164>
            outputBuffer->kput((char)a1);
    800021f4:	0ff97593          	andi	a1,s2,255
    800021f8:	00006517          	auipc	a0,0x6
    800021fc:	36053503          	ld	a0,864(a0) # 80008558 <_ZN5Riscv12outputBufferE>
    80002200:	00000097          	auipc	ra,0x0
    80002204:	a6c080e7          	jalr	-1428(ra) # 80001c6c <_ZN7_buffer4kputEc>
        uint64 ret = 0;
    80002208:	00000493          	li	s1,0
    8000220c:	e6dff06f          	j	80002078 <_ZN5Riscv21supervisorTrapHandlerEv+0x164>
        SleepList::releaseThreads();
    80002210:	00001097          	auipc	ra,0x1
    80002214:	fcc080e7          	jalr	-52(ra) # 800031dc <_ZN9SleepList14releaseThreadsEv>
        TCB::timeSliceCounter++;
    80002218:	00006717          	auipc	a4,0x6
    8000221c:	25873703          	ld	a4,600(a4) # 80008470 <_GLOBAL_OFFSET_TABLE_+0x28>
    80002220:	00073783          	ld	a5,0(a4)
    80002224:	00178793          	addi	a5,a5,1
    80002228:	00f73023          	sd	a5,0(a4)
        if(TCB::timeSliceCounter >= DEFAULT_TIME_SLICE){
    8000222c:	00100713          	li	a4,1
    80002230:	00f76863          	bltu	a4,a5,80002240 <_ZN5Riscv21supervisorTrapHandlerEv+0x32c>
    __asm__ volatile ("csrc sip, %[mask]" : : [mask] "r"(mask));
    80002234:	00200793          	li	a5,2
    80002238:	1447b073          	csrc	sip,a5
}
    8000223c:	e4dff06f          	j	80002088 <_ZN5Riscv21supervisorTrapHandlerEv+0x174>
            TCB::timeSliceCounter = 0;
    80002240:	00006797          	auipc	a5,0x6
    80002244:	2307b783          	ld	a5,560(a5) # 80008470 <_GLOBAL_OFFSET_TABLE_+0x28>
    80002248:	0007b023          	sd	zero,0(a5)
            TCB::dispatch();
    8000224c:	00002097          	auipc	ra,0x2
    80002250:	834080e7          	jalr	-1996(ra) # 80003a80 <_ZN3TCB8dispatchEv>
    __asm__ volatile ("csrw sstatus, %[sstatus]" : : [sstatus] "r"(sstatus));
    80002254:	100c9073          	csrw	sstatus,s9
            w_sepc(sepc);
    80002258:	f9043783          	ld	a5,-112(s0)
    __asm__ volatile ("csrw sepc, %[sepc]" : : [sepc] "r"(sepc));
    8000225c:	14179073          	csrw	sepc,a5
}
    80002260:	fd5ff06f          	j	80002234 <_ZN5Riscv21supervisorTrapHandlerEv+0x320>

0000000080002264 <_Z16producerKeyboardPv>:
    sem_t wait;
};

volatile int threadEnd = 0;

void producerKeyboard(void *arg) {
    80002264:	fe010113          	addi	sp,sp,-32
    80002268:	00113c23          	sd	ra,24(sp)
    8000226c:	00813823          	sd	s0,16(sp)
    80002270:	00913423          	sd	s1,8(sp)
    80002274:	01213023          	sd	s2,0(sp)
    80002278:	02010413          	addi	s0,sp,32
    8000227c:	00050493          	mv	s1,a0
    struct thread_data *data = (struct thread_data *) arg;

    int key;
    int i = 0;
    80002280:	00000913          	li	s2,0
    80002284:	00c0006f          	j	80002290 <_Z16producerKeyboardPv+0x2c>
    while ((key = getc()) != 0x1b) {
        data->buffer->put(key);
        i++;

        if (i % (10 * data->id) == 0) {
            thread_dispatch();
    80002288:	fffff097          	auipc	ra,0xfffff
    8000228c:	4a0080e7          	jalr	1184(ra) # 80001728 <_Z15thread_dispatchv>
    while ((key = getc()) != 0x1b) {
    80002290:	fffff097          	auipc	ra,0xfffff
    80002294:	5d8080e7          	jalr	1496(ra) # 80001868 <_Z4getcv>
    80002298:	0005059b          	sext.w	a1,a0
    8000229c:	01b00793          	li	a5,27
    800022a0:	02f58a63          	beq	a1,a5,800022d4 <_Z16producerKeyboardPv+0x70>
        data->buffer->put(key);
    800022a4:	0084b503          	ld	a0,8(s1)
    800022a8:	00002097          	auipc	ra,0x2
    800022ac:	cd8080e7          	jalr	-808(ra) # 80003f80 <_ZN6Buffer3putEi>
        i++;
    800022b0:	0019071b          	addiw	a4,s2,1
    800022b4:	0007091b          	sext.w	s2,a4
        if (i % (10 * data->id) == 0) {
    800022b8:	0004a683          	lw	a3,0(s1)
    800022bc:	0026979b          	slliw	a5,a3,0x2
    800022c0:	00d787bb          	addw	a5,a5,a3
    800022c4:	0017979b          	slliw	a5,a5,0x1
    800022c8:	02f767bb          	remw	a5,a4,a5
    800022cc:	fc0792e3          	bnez	a5,80002290 <_Z16producerKeyboardPv+0x2c>
    800022d0:	fb9ff06f          	j	80002288 <_Z16producerKeyboardPv+0x24>
        }
    }

    threadEnd = 1;
    800022d4:	00100793          	li	a5,1
    800022d8:	00006717          	auipc	a4,0x6
    800022dc:	28f72423          	sw	a5,648(a4) # 80008560 <threadEnd>
    data->buffer->put('!');
    800022e0:	02100593          	li	a1,33
    800022e4:	0084b503          	ld	a0,8(s1)
    800022e8:	00002097          	auipc	ra,0x2
    800022ec:	c98080e7          	jalr	-872(ra) # 80003f80 <_ZN6Buffer3putEi>

    sem_signal(data->wait);
    800022f0:	0104b503          	ld	a0,16(s1)
    800022f4:	fffff097          	auipc	ra,0xfffff
    800022f8:	504080e7          	jalr	1284(ra) # 800017f8 <_Z10sem_signalP4_sem>
}
    800022fc:	01813083          	ld	ra,24(sp)
    80002300:	01013403          	ld	s0,16(sp)
    80002304:	00813483          	ld	s1,8(sp)
    80002308:	00013903          	ld	s2,0(sp)
    8000230c:	02010113          	addi	sp,sp,32
    80002310:	00008067          	ret

0000000080002314 <_Z8producerPv>:

void producer(void *arg) {
    80002314:	fe010113          	addi	sp,sp,-32
    80002318:	00113c23          	sd	ra,24(sp)
    8000231c:	00813823          	sd	s0,16(sp)
    80002320:	00913423          	sd	s1,8(sp)
    80002324:	01213023          	sd	s2,0(sp)
    80002328:	02010413          	addi	s0,sp,32
    8000232c:	00050493          	mv	s1,a0
    struct thread_data *data = (struct thread_data *) arg;

    int i = 0;
    80002330:	00000913          	li	s2,0
    80002334:	00c0006f          	j	80002340 <_Z8producerPv+0x2c>
    while (!threadEnd) {
        data->buffer->put(data->id + '0');
        i++;

        if (i % (10 * data->id) == 0) {
            thread_dispatch();
    80002338:	fffff097          	auipc	ra,0xfffff
    8000233c:	3f0080e7          	jalr	1008(ra) # 80001728 <_Z15thread_dispatchv>
    while (!threadEnd) {
    80002340:	00006797          	auipc	a5,0x6
    80002344:	2207a783          	lw	a5,544(a5) # 80008560 <threadEnd>
    80002348:	02079e63          	bnez	a5,80002384 <_Z8producerPv+0x70>
        data->buffer->put(data->id + '0');
    8000234c:	0004a583          	lw	a1,0(s1)
    80002350:	0305859b          	addiw	a1,a1,48
    80002354:	0084b503          	ld	a0,8(s1)
    80002358:	00002097          	auipc	ra,0x2
    8000235c:	c28080e7          	jalr	-984(ra) # 80003f80 <_ZN6Buffer3putEi>
        i++;
    80002360:	0019071b          	addiw	a4,s2,1
    80002364:	0007091b          	sext.w	s2,a4
        if (i % (10 * data->id) == 0) {
    80002368:	0004a683          	lw	a3,0(s1)
    8000236c:	0026979b          	slliw	a5,a3,0x2
    80002370:	00d787bb          	addw	a5,a5,a3
    80002374:	0017979b          	slliw	a5,a5,0x1
    80002378:	02f767bb          	remw	a5,a4,a5
    8000237c:	fc0792e3          	bnez	a5,80002340 <_Z8producerPv+0x2c>
    80002380:	fb9ff06f          	j	80002338 <_Z8producerPv+0x24>
        }
    }

    sem_signal(data->wait);
    80002384:	0104b503          	ld	a0,16(s1)
    80002388:	fffff097          	auipc	ra,0xfffff
    8000238c:	470080e7          	jalr	1136(ra) # 800017f8 <_Z10sem_signalP4_sem>
}
    80002390:	01813083          	ld	ra,24(sp)
    80002394:	01013403          	ld	s0,16(sp)
    80002398:	00813483          	ld	s1,8(sp)
    8000239c:	00013903          	ld	s2,0(sp)
    800023a0:	02010113          	addi	sp,sp,32
    800023a4:	00008067          	ret

00000000800023a8 <_Z8consumerPv>:

void consumer(void *arg) {
    800023a8:	fd010113          	addi	sp,sp,-48
    800023ac:	02113423          	sd	ra,40(sp)
    800023b0:	02813023          	sd	s0,32(sp)
    800023b4:	00913c23          	sd	s1,24(sp)
    800023b8:	01213823          	sd	s2,16(sp)
    800023bc:	01313423          	sd	s3,8(sp)
    800023c0:	03010413          	addi	s0,sp,48
    800023c4:	00050913          	mv	s2,a0
    struct thread_data *data = (struct thread_data *) arg;

    int i = 0;
    800023c8:	00000993          	li	s3,0
    800023cc:	01c0006f          	j	800023e8 <_Z8consumerPv+0x40>
        i++;

        putc(key);

        if (i % (5 * data->id) == 0) {
            thread_dispatch();
    800023d0:	fffff097          	auipc	ra,0xfffff
    800023d4:	358080e7          	jalr	856(ra) # 80001728 <_Z15thread_dispatchv>
    800023d8:	0500006f          	j	80002428 <_Z8consumerPv+0x80>
        }

        if (i % 80 == 0) {
            putc('\n');
    800023dc:	00a00513          	li	a0,10
    800023e0:	fffff097          	auipc	ra,0xfffff
    800023e4:	4bc080e7          	jalr	1212(ra) # 8000189c <_Z4putcc>
    while (!threadEnd) {
    800023e8:	00006797          	auipc	a5,0x6
    800023ec:	1787a783          	lw	a5,376(a5) # 80008560 <threadEnd>
    800023f0:	06079063          	bnez	a5,80002450 <_Z8consumerPv+0xa8>
        int key = data->buffer->get();
    800023f4:	00893503          	ld	a0,8(s2)
    800023f8:	00002097          	auipc	ra,0x2
    800023fc:	c18080e7          	jalr	-1000(ra) # 80004010 <_ZN6Buffer3getEv>
        i++;
    80002400:	0019849b          	addiw	s1,s3,1
    80002404:	0004899b          	sext.w	s3,s1
        putc(key);
    80002408:	0ff57513          	andi	a0,a0,255
    8000240c:	fffff097          	auipc	ra,0xfffff
    80002410:	490080e7          	jalr	1168(ra) # 8000189c <_Z4putcc>
        if (i % (5 * data->id) == 0) {
    80002414:	00092703          	lw	a4,0(s2)
    80002418:	0027179b          	slliw	a5,a4,0x2
    8000241c:	00e787bb          	addw	a5,a5,a4
    80002420:	02f4e7bb          	remw	a5,s1,a5
    80002424:	fa0786e3          	beqz	a5,800023d0 <_Z8consumerPv+0x28>
        if (i % 80 == 0) {
    80002428:	05000793          	li	a5,80
    8000242c:	02f4e4bb          	remw	s1,s1,a5
    80002430:	fa049ce3          	bnez	s1,800023e8 <_Z8consumerPv+0x40>
    80002434:	fa9ff06f          	j	800023dc <_Z8consumerPv+0x34>
        }
    }

    while (data->buffer->getCnt() > 0) {
        int key = data->buffer->get();
    80002438:	00893503          	ld	a0,8(s2)
    8000243c:	00002097          	auipc	ra,0x2
    80002440:	bd4080e7          	jalr	-1068(ra) # 80004010 <_ZN6Buffer3getEv>
        putc(key);
    80002444:	0ff57513          	andi	a0,a0,255
    80002448:	fffff097          	auipc	ra,0xfffff
    8000244c:	454080e7          	jalr	1108(ra) # 8000189c <_Z4putcc>
    while (data->buffer->getCnt() > 0) {
    80002450:	00893503          	ld	a0,8(s2)
    80002454:	00002097          	auipc	ra,0x2
    80002458:	c48080e7          	jalr	-952(ra) # 8000409c <_ZN6Buffer6getCntEv>
    8000245c:	fca04ee3          	bgtz	a0,80002438 <_Z8consumerPv+0x90>
    }

    sem_signal(data->wait);
    80002460:	01093503          	ld	a0,16(s2)
    80002464:	fffff097          	auipc	ra,0xfffff
    80002468:	394080e7          	jalr	916(ra) # 800017f8 <_Z10sem_signalP4_sem>
}
    8000246c:	02813083          	ld	ra,40(sp)
    80002470:	02013403          	ld	s0,32(sp)
    80002474:	01813483          	ld	s1,24(sp)
    80002478:	01013903          	ld	s2,16(sp)
    8000247c:	00813983          	ld	s3,8(sp)
    80002480:	03010113          	addi	sp,sp,48
    80002484:	00008067          	ret

0000000080002488 <_Z11workerBodyAPv>:
    if (n == 0 || n == 1) { return n; }
    if (n % 10 == 0) { thread_dispatch(); }
    return fibonacci(n - 1) + fibonacci(n - 2);
}

void workerBodyA(void* arg) {
    80002488:	fe010113          	addi	sp,sp,-32
    8000248c:	00113c23          	sd	ra,24(sp)
    80002490:	00813823          	sd	s0,16(sp)
    80002494:	00913423          	sd	s1,8(sp)
    80002498:	01213023          	sd	s2,0(sp)
    8000249c:	02010413          	addi	s0,sp,32
    for (uint64 i = 0; i < 10; i++) {
    800024a0:	00000913          	li	s2,0
    800024a4:	0380006f          	j	800024dc <_Z11workerBodyAPv+0x54>
        printString("A: i="); printInt(i); printString("\n");
        for (uint64 j = 0; j < 10000; j++) {
            for (uint64 k = 0; k < 30000; k++) { /* busy wait */ }
            thread_dispatch();
    800024a8:	fffff097          	auipc	ra,0xfffff
    800024ac:	280080e7          	jalr	640(ra) # 80001728 <_Z15thread_dispatchv>
        for (uint64 j = 0; j < 10000; j++) {
    800024b0:	00148493          	addi	s1,s1,1
    800024b4:	000027b7          	lui	a5,0x2
    800024b8:	70f78793          	addi	a5,a5,1807 # 270f <_entry-0x7fffd8f1>
    800024bc:	0097ee63          	bltu	a5,s1,800024d8 <_Z11workerBodyAPv+0x50>
            for (uint64 k = 0; k < 30000; k++) { /* busy wait */ }
    800024c0:	00000713          	li	a4,0
    800024c4:	000077b7          	lui	a5,0x7
    800024c8:	52f78793          	addi	a5,a5,1327 # 752f <_entry-0x7fff8ad1>
    800024cc:	fce7eee3          	bltu	a5,a4,800024a8 <_Z11workerBodyAPv+0x20>
    800024d0:	00170713          	addi	a4,a4,1
    800024d4:	ff1ff06f          	j	800024c4 <_Z11workerBodyAPv+0x3c>
    for (uint64 i = 0; i < 10; i++) {
    800024d8:	00190913          	addi	s2,s2,1
    800024dc:	00900793          	li	a5,9
    800024e0:	0527e063          	bltu	a5,s2,80002520 <_Z11workerBodyAPv+0x98>
        printString("A: i="); printInt(i); printString("\n");
    800024e4:	00005517          	auipc	a0,0x5
    800024e8:	b3c50513          	addi	a0,a0,-1220 # 80007020 <CONSOLE_STATUS+0x10>
    800024ec:	00001097          	auipc	ra,0x1
    800024f0:	74c080e7          	jalr	1868(ra) # 80003c38 <_Z11printStringPKc>
    800024f4:	00000613          	li	a2,0
    800024f8:	00a00593          	li	a1,10
    800024fc:	0009051b          	sext.w	a0,s2
    80002500:	00002097          	auipc	ra,0x2
    80002504:	8d0080e7          	jalr	-1840(ra) # 80003dd0 <_Z8printIntiii>
    80002508:	00005517          	auipc	a0,0x5
    8000250c:	b9050513          	addi	a0,a0,-1136 # 80007098 <CONSOLE_STATUS+0x88>
    80002510:	00001097          	auipc	ra,0x1
    80002514:	728080e7          	jalr	1832(ra) # 80003c38 <_Z11printStringPKc>
        for (uint64 j = 0; j < 10000; j++) {
    80002518:	00000493          	li	s1,0
    8000251c:	f99ff06f          	j	800024b4 <_Z11workerBodyAPv+0x2c>
        }
    }
    printString("A finished!\n");
    80002520:	00005517          	auipc	a0,0x5
    80002524:	b0850513          	addi	a0,a0,-1272 # 80007028 <CONSOLE_STATUS+0x18>
    80002528:	00001097          	auipc	ra,0x1
    8000252c:	710080e7          	jalr	1808(ra) # 80003c38 <_Z11printStringPKc>
    finishedA = true;
    80002530:	00100793          	li	a5,1
    80002534:	00006717          	auipc	a4,0x6
    80002538:	02f70823          	sb	a5,48(a4) # 80008564 <finishedA>
}
    8000253c:	01813083          	ld	ra,24(sp)
    80002540:	01013403          	ld	s0,16(sp)
    80002544:	00813483          	ld	s1,8(sp)
    80002548:	00013903          	ld	s2,0(sp)
    8000254c:	02010113          	addi	sp,sp,32
    80002550:	00008067          	ret

0000000080002554 <_Z11workerBodyBPv>:

void workerBodyB(void* arg) {
    80002554:	fe010113          	addi	sp,sp,-32
    80002558:	00113c23          	sd	ra,24(sp)
    8000255c:	00813823          	sd	s0,16(sp)
    80002560:	00913423          	sd	s1,8(sp)
    80002564:	01213023          	sd	s2,0(sp)
    80002568:	02010413          	addi	s0,sp,32
    for (uint64 i = 0; i < 16; i++) {
    8000256c:	00000913          	li	s2,0
    80002570:	0380006f          	j	800025a8 <_Z11workerBodyBPv+0x54>
        printString("B: i="); printInt(i); printString("\n");
        for (uint64 j = 0; j < 10000; j++) {
            for (uint64 k = 0; k < 30000; k++) { /* busy wait */ }
            thread_dispatch();
    80002574:	fffff097          	auipc	ra,0xfffff
    80002578:	1b4080e7          	jalr	436(ra) # 80001728 <_Z15thread_dispatchv>
        for (uint64 j = 0; j < 10000; j++) {
    8000257c:	00148493          	addi	s1,s1,1
    80002580:	000027b7          	lui	a5,0x2
    80002584:	70f78793          	addi	a5,a5,1807 # 270f <_entry-0x7fffd8f1>
    80002588:	0097ee63          	bltu	a5,s1,800025a4 <_Z11workerBodyBPv+0x50>
            for (uint64 k = 0; k < 30000; k++) { /* busy wait */ }
    8000258c:	00000713          	li	a4,0
    80002590:	000077b7          	lui	a5,0x7
    80002594:	52f78793          	addi	a5,a5,1327 # 752f <_entry-0x7fff8ad1>
    80002598:	fce7eee3          	bltu	a5,a4,80002574 <_Z11workerBodyBPv+0x20>
    8000259c:	00170713          	addi	a4,a4,1
    800025a0:	ff1ff06f          	j	80002590 <_Z11workerBodyBPv+0x3c>
    for (uint64 i = 0; i < 16; i++) {
    800025a4:	00190913          	addi	s2,s2,1
    800025a8:	00f00793          	li	a5,15
    800025ac:	0527e063          	bltu	a5,s2,800025ec <_Z11workerBodyBPv+0x98>
        printString("B: i="); printInt(i); printString("\n");
    800025b0:	00005517          	auipc	a0,0x5
    800025b4:	a8850513          	addi	a0,a0,-1400 # 80007038 <CONSOLE_STATUS+0x28>
    800025b8:	00001097          	auipc	ra,0x1
    800025bc:	680080e7          	jalr	1664(ra) # 80003c38 <_Z11printStringPKc>
    800025c0:	00000613          	li	a2,0
    800025c4:	00a00593          	li	a1,10
    800025c8:	0009051b          	sext.w	a0,s2
    800025cc:	00002097          	auipc	ra,0x2
    800025d0:	804080e7          	jalr	-2044(ra) # 80003dd0 <_Z8printIntiii>
    800025d4:	00005517          	auipc	a0,0x5
    800025d8:	ac450513          	addi	a0,a0,-1340 # 80007098 <CONSOLE_STATUS+0x88>
    800025dc:	00001097          	auipc	ra,0x1
    800025e0:	65c080e7          	jalr	1628(ra) # 80003c38 <_Z11printStringPKc>
        for (uint64 j = 0; j < 10000; j++) {
    800025e4:	00000493          	li	s1,0
    800025e8:	f99ff06f          	j	80002580 <_Z11workerBodyBPv+0x2c>
        }
    }
    printString("B finished!\n");
    800025ec:	00005517          	auipc	a0,0x5
    800025f0:	a5450513          	addi	a0,a0,-1452 # 80007040 <CONSOLE_STATUS+0x30>
    800025f4:	00001097          	auipc	ra,0x1
    800025f8:	644080e7          	jalr	1604(ra) # 80003c38 <_Z11printStringPKc>
    finishedB = true;
    800025fc:	00100793          	li	a5,1
    80002600:	00006717          	auipc	a4,0x6
    80002604:	f6f702a3          	sb	a5,-155(a4) # 80008565 <finishedB>
    thread_dispatch();
    80002608:	fffff097          	auipc	ra,0xfffff
    8000260c:	120080e7          	jalr	288(ra) # 80001728 <_Z15thread_dispatchv>
}
    80002610:	01813083          	ld	ra,24(sp)
    80002614:	01013403          	ld	s0,16(sp)
    80002618:	00813483          	ld	s1,8(sp)
    8000261c:	00013903          	ld	s2,0(sp)
    80002620:	02010113          	addi	sp,sp,32
    80002624:	00008067          	ret

0000000080002628 <_Z9sleepyRunPv>:

#include "../test/printing.hpp"

bool finished[2];

void sleepyRun(void *arg) {
    80002628:	fe010113          	addi	sp,sp,-32
    8000262c:	00113c23          	sd	ra,24(sp)
    80002630:	00813823          	sd	s0,16(sp)
    80002634:	00913423          	sd	s1,8(sp)
    80002638:	01213023          	sd	s2,0(sp)
    8000263c:	02010413          	addi	s0,sp,32
    time_t sleep_time = *((time_t *) arg);
    80002640:	00053903          	ld	s2,0(a0)
    int i = 6;
    80002644:	00600493          	li	s1,6
    while (--i > 0) {
    80002648:	fff4849b          	addiw	s1,s1,-1
    8000264c:	04905463          	blez	s1,80002694 <_Z9sleepyRunPv+0x6c>

        printString("Hello ");
    80002650:	00005517          	auipc	a0,0x5
    80002654:	a0050513          	addi	a0,a0,-1536 # 80007050 <CONSOLE_STATUS+0x40>
    80002658:	00001097          	auipc	ra,0x1
    8000265c:	5e0080e7          	jalr	1504(ra) # 80003c38 <_Z11printStringPKc>
        printInt(sleep_time);
    80002660:	00000613          	li	a2,0
    80002664:	00a00593          	li	a1,10
    80002668:	0009051b          	sext.w	a0,s2
    8000266c:	00001097          	auipc	ra,0x1
    80002670:	764080e7          	jalr	1892(ra) # 80003dd0 <_Z8printIntiii>
        printString(" !\n");
    80002674:	00005517          	auipc	a0,0x5
    80002678:	9e450513          	addi	a0,a0,-1564 # 80007058 <CONSOLE_STATUS+0x48>
    8000267c:	00001097          	auipc	ra,0x1
    80002680:	5bc080e7          	jalr	1468(ra) # 80003c38 <_Z11printStringPKc>
        time_sleep(sleep_time);
    80002684:	00090513          	mv	a0,s2
    80002688:	fffff097          	auipc	ra,0xfffff
    8000268c:	1a8080e7          	jalr	424(ra) # 80001830 <_Z10time_sleepm>
    while (--i > 0) {
    80002690:	fb9ff06f          	j	80002648 <_Z9sleepyRunPv+0x20>
    }
    finished[sleep_time/10-1] = true;
    80002694:	00a00793          	li	a5,10
    80002698:	02f95933          	divu	s2,s2,a5
    8000269c:	fff90913          	addi	s2,s2,-1
    800026a0:	00006797          	auipc	a5,0x6
    800026a4:	ec078793          	addi	a5,a5,-320 # 80008560 <threadEnd>
    800026a8:	01278933          	add	s2,a5,s2
    800026ac:	00100793          	li	a5,1
    800026b0:	00f90423          	sb	a5,8(s2)
}
    800026b4:	01813083          	ld	ra,24(sp)
    800026b8:	01013403          	ld	s0,16(sp)
    800026bc:	00813483          	ld	s1,8(sp)
    800026c0:	00013903          	ld	s2,0(sp)
    800026c4:	02010113          	addi	sp,sp,32
    800026c8:	00008067          	ret

00000000800026cc <_Z22producerConsumer_C_APIv>:

void producerConsumer_C_API() {
    800026cc:	f9010113          	addi	sp,sp,-112
    800026d0:	06113423          	sd	ra,104(sp)
    800026d4:	06813023          	sd	s0,96(sp)
    800026d8:	04913c23          	sd	s1,88(sp)
    800026dc:	05213823          	sd	s2,80(sp)
    800026e0:	05313423          	sd	s3,72(sp)
    800026e4:	05413023          	sd	s4,64(sp)
    800026e8:	03513c23          	sd	s5,56(sp)
    800026ec:	03613823          	sd	s6,48(sp)
    800026f0:	07010413          	addi	s0,sp,112
        sem_wait(waitForAll);
    }

    sem_close(waitForAll);

    delete buffer;
    800026f4:	00010b13          	mv	s6,sp
    printString("Unesite broj proizvodjaca?\n");
    800026f8:	00005517          	auipc	a0,0x5
    800026fc:	96850513          	addi	a0,a0,-1688 # 80007060 <CONSOLE_STATUS+0x50>
    80002700:	00001097          	auipc	ra,0x1
    80002704:	538080e7          	jalr	1336(ra) # 80003c38 <_Z11printStringPKc>
    getString(input, 30);
    80002708:	01e00593          	li	a1,30
    8000270c:	fa040493          	addi	s1,s0,-96
    80002710:	00048513          	mv	a0,s1
    80002714:	00001097          	auipc	ra,0x1
    80002718:	5a0080e7          	jalr	1440(ra) # 80003cb4 <_Z9getStringPci>
    threadNum = stringToInt(input);
    8000271c:	00048513          	mv	a0,s1
    80002720:	00001097          	auipc	ra,0x1
    80002724:	660080e7          	jalr	1632(ra) # 80003d80 <_Z11stringToIntPKc>
    80002728:	00050913          	mv	s2,a0
    printString("Unesite velicinu bafera?\n");
    8000272c:	00005517          	auipc	a0,0x5
    80002730:	95450513          	addi	a0,a0,-1708 # 80007080 <CONSOLE_STATUS+0x70>
    80002734:	00001097          	auipc	ra,0x1
    80002738:	504080e7          	jalr	1284(ra) # 80003c38 <_Z11printStringPKc>
    getString(input, 30);
    8000273c:	01e00593          	li	a1,30
    80002740:	00048513          	mv	a0,s1
    80002744:	00001097          	auipc	ra,0x1
    80002748:	570080e7          	jalr	1392(ra) # 80003cb4 <_Z9getStringPci>
    n = stringToInt(input);
    8000274c:	00048513          	mv	a0,s1
    80002750:	00001097          	auipc	ra,0x1
    80002754:	630080e7          	jalr	1584(ra) # 80003d80 <_Z11stringToIntPKc>
    80002758:	00050493          	mv	s1,a0
    printString("Broj proizvodjaca "); printInt(threadNum);
    8000275c:	00005517          	auipc	a0,0x5
    80002760:	94450513          	addi	a0,a0,-1724 # 800070a0 <CONSOLE_STATUS+0x90>
    80002764:	00001097          	auipc	ra,0x1
    80002768:	4d4080e7          	jalr	1236(ra) # 80003c38 <_Z11printStringPKc>
    8000276c:	00000613          	li	a2,0
    80002770:	00a00593          	li	a1,10
    80002774:	00090513          	mv	a0,s2
    80002778:	00001097          	auipc	ra,0x1
    8000277c:	658080e7          	jalr	1624(ra) # 80003dd0 <_Z8printIntiii>
    printString(" i velicina bafera "); printInt(n);
    80002780:	00005517          	auipc	a0,0x5
    80002784:	93850513          	addi	a0,a0,-1736 # 800070b8 <CONSOLE_STATUS+0xa8>
    80002788:	00001097          	auipc	ra,0x1
    8000278c:	4b0080e7          	jalr	1200(ra) # 80003c38 <_Z11printStringPKc>
    80002790:	00000613          	li	a2,0
    80002794:	00a00593          	li	a1,10
    80002798:	00048513          	mv	a0,s1
    8000279c:	00001097          	auipc	ra,0x1
    800027a0:	634080e7          	jalr	1588(ra) # 80003dd0 <_Z8printIntiii>
    printString(".\n");
    800027a4:	00005517          	auipc	a0,0x5
    800027a8:	92c50513          	addi	a0,a0,-1748 # 800070d0 <CONSOLE_STATUS+0xc0>
    800027ac:	00001097          	auipc	ra,0x1
    800027b0:	48c080e7          	jalr	1164(ra) # 80003c38 <_Z11printStringPKc>
    if(threadNum > n) {
    800027b4:	0324c463          	blt	s1,s2,800027dc <_Z22producerConsumer_C_APIv+0x110>
    } else if (threadNum < 1) {
    800027b8:	03205c63          	blez	s2,800027f0 <_Z22producerConsumer_C_APIv+0x124>
    Buffer *buffer = new Buffer(n);
    800027bc:	03800513          	li	a0,56
    800027c0:	fffff097          	auipc	ra,0xfffff
    800027c4:	aa4080e7          	jalr	-1372(ra) # 80001264 <_Znwm>
    800027c8:	00050a13          	mv	s4,a0
    800027cc:	00048593          	mv	a1,s1
    800027d0:	00001097          	auipc	ra,0x1
    800027d4:	714080e7          	jalr	1812(ra) # 80003ee4 <_ZN6BufferC1Ei>
    800027d8:	0300006f          	j	80002808 <_Z22producerConsumer_C_APIv+0x13c>
        printString("Broj proizvodjaca ne sme biti manji od velicine bafera!\n");
    800027dc:	00005517          	auipc	a0,0x5
    800027e0:	8fc50513          	addi	a0,a0,-1796 # 800070d8 <CONSOLE_STATUS+0xc8>
    800027e4:	00001097          	auipc	ra,0x1
    800027e8:	454080e7          	jalr	1108(ra) # 80003c38 <_Z11printStringPKc>
        return;
    800027ec:	0140006f          	j	80002800 <_Z22producerConsumer_C_APIv+0x134>
        printString("Broj proizvodjaca mora biti veci od nula!\n");
    800027f0:	00005517          	auipc	a0,0x5
    800027f4:	92850513          	addi	a0,a0,-1752 # 80007118 <CONSOLE_STATUS+0x108>
    800027f8:	00001097          	auipc	ra,0x1
    800027fc:	440080e7          	jalr	1088(ra) # 80003c38 <_Z11printStringPKc>
        return;
    80002800:	000b0113          	mv	sp,s6
    80002804:	1500006f          	j	80002954 <_Z22producerConsumer_C_APIv+0x288>
    sem_open(&waitForAll, 0);
    80002808:	00000593          	li	a1,0
    8000280c:	00006517          	auipc	a0,0x6
    80002810:	d6450513          	addi	a0,a0,-668 # 80008570 <waitForAll>
    80002814:	fffff097          	auipc	ra,0xfffff
    80002818:	f38080e7          	jalr	-200(ra) # 8000174c <_Z8sem_openPP4_semj>
    thread_t threads[threadNum];
    8000281c:	00391793          	slli	a5,s2,0x3
    80002820:	00f78793          	addi	a5,a5,15
    80002824:	ff07f793          	andi	a5,a5,-16
    80002828:	40f10133          	sub	sp,sp,a5
    8000282c:	00010a93          	mv	s5,sp
    struct thread_data data[threadNum + 1];
    80002830:	0019071b          	addiw	a4,s2,1
    80002834:	00171793          	slli	a5,a4,0x1
    80002838:	00e787b3          	add	a5,a5,a4
    8000283c:	00379793          	slli	a5,a5,0x3
    80002840:	00f78793          	addi	a5,a5,15
    80002844:	ff07f793          	andi	a5,a5,-16
    80002848:	40f10133          	sub	sp,sp,a5
    8000284c:	00010993          	mv	s3,sp
    data[threadNum].id = threadNum;
    80002850:	00191613          	slli	a2,s2,0x1
    80002854:	012607b3          	add	a5,a2,s2
    80002858:	00379793          	slli	a5,a5,0x3
    8000285c:	00f987b3          	add	a5,s3,a5
    80002860:	0127a023          	sw	s2,0(a5)
    data[threadNum].buffer = buffer;
    80002864:	0147b423          	sd	s4,8(a5)
    data[threadNum].wait = waitForAll;
    80002868:	00006717          	auipc	a4,0x6
    8000286c:	d0873703          	ld	a4,-760(a4) # 80008570 <waitForAll>
    80002870:	00e7b823          	sd	a4,16(a5)
    thread_create(&consumerThread, consumer, data + threadNum);
    80002874:	00078613          	mv	a2,a5
    80002878:	00000597          	auipc	a1,0x0
    8000287c:	b3058593          	addi	a1,a1,-1232 # 800023a8 <_Z8consumerPv>
    80002880:	f9840513          	addi	a0,s0,-104
    80002884:	fffff097          	auipc	ra,0xfffff
    80002888:	df4080e7          	jalr	-524(ra) # 80001678 <_Z13thread_createPP3TCBPFvPvES2_>
    for (int i = 0; i < threadNum; i++) {
    8000288c:	00000493          	li	s1,0
    80002890:	0280006f          	j	800028b8 <_Z22producerConsumer_C_APIv+0x1ec>
        thread_create(threads + i,
    80002894:	00000597          	auipc	a1,0x0
    80002898:	9d058593          	addi	a1,a1,-1584 # 80002264 <_Z16producerKeyboardPv>
                      data + i);
    8000289c:	00179613          	slli	a2,a5,0x1
    800028a0:	00f60633          	add	a2,a2,a5
    800028a4:	00361613          	slli	a2,a2,0x3
        thread_create(threads + i,
    800028a8:	00c98633          	add	a2,s3,a2
    800028ac:	fffff097          	auipc	ra,0xfffff
    800028b0:	dcc080e7          	jalr	-564(ra) # 80001678 <_Z13thread_createPP3TCBPFvPvES2_>
    for (int i = 0; i < threadNum; i++) {
    800028b4:	0014849b          	addiw	s1,s1,1
    800028b8:	0524d263          	bge	s1,s2,800028fc <_Z22producerConsumer_C_APIv+0x230>
        data[i].id = i;
    800028bc:	00149793          	slli	a5,s1,0x1
    800028c0:	009787b3          	add	a5,a5,s1
    800028c4:	00379793          	slli	a5,a5,0x3
    800028c8:	00f987b3          	add	a5,s3,a5
    800028cc:	0097a023          	sw	s1,0(a5)
        data[i].buffer = buffer;
    800028d0:	0147b423          	sd	s4,8(a5)
        data[i].wait = waitForAll;
    800028d4:	00006717          	auipc	a4,0x6
    800028d8:	c9c73703          	ld	a4,-868(a4) # 80008570 <waitForAll>
    800028dc:	00e7b823          	sd	a4,16(a5)
        thread_create(threads + i,
    800028e0:	00048793          	mv	a5,s1
    800028e4:	00349513          	slli	a0,s1,0x3
    800028e8:	00aa8533          	add	a0,s5,a0
    800028ec:	fa9054e3          	blez	s1,80002894 <_Z22producerConsumer_C_APIv+0x1c8>
    800028f0:	00000597          	auipc	a1,0x0
    800028f4:	a2458593          	addi	a1,a1,-1500 # 80002314 <_Z8producerPv>
    800028f8:	fa5ff06f          	j	8000289c <_Z22producerConsumer_C_APIv+0x1d0>
    thread_dispatch();
    800028fc:	fffff097          	auipc	ra,0xfffff
    80002900:	e2c080e7          	jalr	-468(ra) # 80001728 <_Z15thread_dispatchv>
    for (int i = 0; i <= threadNum; i++) {
    80002904:	00000493          	li	s1,0
    80002908:	00994e63          	blt	s2,s1,80002924 <_Z22producerConsumer_C_APIv+0x258>
        sem_wait(waitForAll);
    8000290c:	00006517          	auipc	a0,0x6
    80002910:	c6453503          	ld	a0,-924(a0) # 80008570 <waitForAll>
    80002914:	fffff097          	auipc	ra,0xfffff
    80002918:	eac080e7          	jalr	-340(ra) # 800017c0 <_Z8sem_waitP4_sem>
    for (int i = 0; i <= threadNum; i++) {
    8000291c:	0014849b          	addiw	s1,s1,1
    80002920:	fe9ff06f          	j	80002908 <_Z22producerConsumer_C_APIv+0x23c>
    sem_close(waitForAll);
    80002924:	00006517          	auipc	a0,0x6
    80002928:	c4c53503          	ld	a0,-948(a0) # 80008570 <waitForAll>
    8000292c:	fffff097          	auipc	ra,0xfffff
    80002930:	e5c080e7          	jalr	-420(ra) # 80001788 <_Z9sem_closeP4_sem>
    delete buffer;
    80002934:	000a0e63          	beqz	s4,80002950 <_Z22producerConsumer_C_APIv+0x284>
    80002938:	000a0513          	mv	a0,s4
    8000293c:	00001097          	auipc	ra,0x1
    80002940:	7e8080e7          	jalr	2024(ra) # 80004124 <_ZN6BufferD1Ev>
    80002944:	000a0513          	mv	a0,s4
    80002948:	fffff097          	auipc	ra,0xfffff
    8000294c:	96c080e7          	jalr	-1684(ra) # 800012b4 <_ZdlPv>
    80002950:	000b0113          	mv	sp,s6

}
    80002954:	f9040113          	addi	sp,s0,-112
    80002958:	06813083          	ld	ra,104(sp)
    8000295c:	06013403          	ld	s0,96(sp)
    80002960:	05813483          	ld	s1,88(sp)
    80002964:	05013903          	ld	s2,80(sp)
    80002968:	04813983          	ld	s3,72(sp)
    8000296c:	04013a03          	ld	s4,64(sp)
    80002970:	03813a83          	ld	s5,56(sp)
    80002974:	03013b03          	ld	s6,48(sp)
    80002978:	07010113          	addi	sp,sp,112
    8000297c:	00008067          	ret
    80002980:	00050493          	mv	s1,a0
    Buffer *buffer = new Buffer(n);
    80002984:	000a0513          	mv	a0,s4
    80002988:	fffff097          	auipc	ra,0xfffff
    8000298c:	92c080e7          	jalr	-1748(ra) # 800012b4 <_ZdlPv>
    80002990:	00048513          	mv	a0,s1
    80002994:	00007097          	auipc	ra,0x7
    80002998:	d14080e7          	jalr	-748(ra) # 800096a8 <_Unwind_Resume>

000000008000299c <_Z12testSleepingv>:

void testSleeping() {
    8000299c:	fc010113          	addi	sp,sp,-64
    800029a0:	02113c23          	sd	ra,56(sp)
    800029a4:	02813823          	sd	s0,48(sp)
    800029a8:	02913423          	sd	s1,40(sp)
    800029ac:	04010413          	addi	s0,sp,64
    const int sleepy_thread_count = 2;
    time_t sleep_times[sleepy_thread_count] = {10, 20};
    800029b0:	00a00793          	li	a5,10
    800029b4:	fcf43823          	sd	a5,-48(s0)
    800029b8:	01400793          	li	a5,20
    800029bc:	fcf43c23          	sd	a5,-40(s0)
    thread_t sleepyThread[sleepy_thread_count];

    for (int i = 0; i < sleepy_thread_count; i++) {
    800029c0:	00000493          	li	s1,0
    800029c4:	02c0006f          	j	800029f0 <_Z12testSleepingv+0x54>
        thread_create(&sleepyThread[i], sleepyRun, sleep_times + i);
    800029c8:	00349793          	slli	a5,s1,0x3
    800029cc:	fd040613          	addi	a2,s0,-48
    800029d0:	00f60633          	add	a2,a2,a5
    800029d4:	00000597          	auipc	a1,0x0
    800029d8:	c5458593          	addi	a1,a1,-940 # 80002628 <_Z9sleepyRunPv>
    800029dc:	fc040513          	addi	a0,s0,-64
    800029e0:	00f50533          	add	a0,a0,a5
    800029e4:	fffff097          	auipc	ra,0xfffff
    800029e8:	c94080e7          	jalr	-876(ra) # 80001678 <_Z13thread_createPP3TCBPFvPvES2_>
    for (int i = 0; i < sleepy_thread_count; i++) {
    800029ec:	0014849b          	addiw	s1,s1,1
    800029f0:	00100793          	li	a5,1
    800029f4:	fc97dae3          	bge	a5,s1,800029c8 <_Z12testSleepingv+0x2c>
    }

    while (!(finished[0] && finished[1])) {}
    800029f8:	00006797          	auipc	a5,0x6
    800029fc:	b707c783          	lbu	a5,-1168(a5) # 80008568 <finished>
    80002a00:	fe078ce3          	beqz	a5,800029f8 <_Z12testSleepingv+0x5c>
    80002a04:	00006797          	auipc	a5,0x6
    80002a08:	b657c783          	lbu	a5,-1179(a5) # 80008569 <finished+0x1>
    80002a0c:	fe0786e3          	beqz	a5,800029f8 <_Z12testSleepingv+0x5c>
}
    80002a10:	03813083          	ld	ra,56(sp)
    80002a14:	03013403          	ld	s0,48(sp)
    80002a18:	02813483          	ld	s1,40(sp)
    80002a1c:	04010113          	addi	sp,sp,64
    80002a20:	00008067          	ret

0000000080002a24 <_Z9fibonaccim>:
uint64 fibonacci(uint64 n) {
    80002a24:	fe010113          	addi	sp,sp,-32
    80002a28:	00113c23          	sd	ra,24(sp)
    80002a2c:	00813823          	sd	s0,16(sp)
    80002a30:	00913423          	sd	s1,8(sp)
    80002a34:	01213023          	sd	s2,0(sp)
    80002a38:	02010413          	addi	s0,sp,32
    80002a3c:	00050493          	mv	s1,a0
    if (n == 0 || n == 1) { return n; }
    80002a40:	00100793          	li	a5,1
    80002a44:	02a7f863          	bgeu	a5,a0,80002a74 <_Z9fibonaccim+0x50>
    if (n % 10 == 0) { thread_dispatch(); }
    80002a48:	00a00793          	li	a5,10
    80002a4c:	02f577b3          	remu	a5,a0,a5
    80002a50:	02078e63          	beqz	a5,80002a8c <_Z9fibonaccim+0x68>
    return fibonacci(n - 1) + fibonacci(n - 2);
    80002a54:	fff48513          	addi	a0,s1,-1
    80002a58:	00000097          	auipc	ra,0x0
    80002a5c:	fcc080e7          	jalr	-52(ra) # 80002a24 <_Z9fibonaccim>
    80002a60:	00050913          	mv	s2,a0
    80002a64:	ffe48513          	addi	a0,s1,-2
    80002a68:	00000097          	auipc	ra,0x0
    80002a6c:	fbc080e7          	jalr	-68(ra) # 80002a24 <_Z9fibonaccim>
    80002a70:	00a90533          	add	a0,s2,a0
}
    80002a74:	01813083          	ld	ra,24(sp)
    80002a78:	01013403          	ld	s0,16(sp)
    80002a7c:	00813483          	ld	s1,8(sp)
    80002a80:	00013903          	ld	s2,0(sp)
    80002a84:	02010113          	addi	sp,sp,32
    80002a88:	00008067          	ret
    if (n % 10 == 0) { thread_dispatch(); }
    80002a8c:	fffff097          	auipc	ra,0xfffff
    80002a90:	c9c080e7          	jalr	-868(ra) # 80001728 <_Z15thread_dispatchv>
    80002a94:	fc1ff06f          	j	80002a54 <_Z9fibonaccim+0x30>

0000000080002a98 <_Z11workerBodyCPv>:

void workerBodyC(void* arg) {
    80002a98:	fe010113          	addi	sp,sp,-32
    80002a9c:	00113c23          	sd	ra,24(sp)
    80002aa0:	00813823          	sd	s0,16(sp)
    80002aa4:	00913423          	sd	s1,8(sp)
    80002aa8:	01213023          	sd	s2,0(sp)
    80002aac:	02010413          	addi	s0,sp,32
    uint8 i = 0;
    80002ab0:	00000493          	li	s1,0
    80002ab4:	0400006f          	j	80002af4 <_Z11workerBodyCPv+0x5c>
    for (; i < 3; i++) {
        printString("C: i="); printInt(i); printString("\n");
    80002ab8:	00004517          	auipc	a0,0x4
    80002abc:	69050513          	addi	a0,a0,1680 # 80007148 <CONSOLE_STATUS+0x138>
    80002ac0:	00001097          	auipc	ra,0x1
    80002ac4:	178080e7          	jalr	376(ra) # 80003c38 <_Z11printStringPKc>
    80002ac8:	00000613          	li	a2,0
    80002acc:	00a00593          	li	a1,10
    80002ad0:	00048513          	mv	a0,s1
    80002ad4:	00001097          	auipc	ra,0x1
    80002ad8:	2fc080e7          	jalr	764(ra) # 80003dd0 <_Z8printIntiii>
    80002adc:	00004517          	auipc	a0,0x4
    80002ae0:	5bc50513          	addi	a0,a0,1468 # 80007098 <CONSOLE_STATUS+0x88>
    80002ae4:	00001097          	auipc	ra,0x1
    80002ae8:	154080e7          	jalr	340(ra) # 80003c38 <_Z11printStringPKc>
    for (; i < 3; i++) {
    80002aec:	0014849b          	addiw	s1,s1,1
    80002af0:	0ff4f493          	andi	s1,s1,255
    80002af4:	00200793          	li	a5,2
    80002af8:	fc97f0e3          	bgeu	a5,s1,80002ab8 <_Z11workerBodyCPv+0x20>
    }

    printString("C: dispatch\n");
    80002afc:	00004517          	auipc	a0,0x4
    80002b00:	65450513          	addi	a0,a0,1620 # 80007150 <CONSOLE_STATUS+0x140>
    80002b04:	00001097          	auipc	ra,0x1
    80002b08:	134080e7          	jalr	308(ra) # 80003c38 <_Z11printStringPKc>
    __asm__ ("li t1, 7");
    80002b0c:	00700313          	li	t1,7
    thread_dispatch();
    80002b10:	fffff097          	auipc	ra,0xfffff
    80002b14:	c18080e7          	jalr	-1000(ra) # 80001728 <_Z15thread_dispatchv>

    uint64 t1 = 0;
    __asm__ ("mv %[t1], t1" : [t1] "=r"(t1));
    80002b18:	00030913          	mv	s2,t1

    printString("C: t1="); printInt(t1); printString("\n");
    80002b1c:	00004517          	auipc	a0,0x4
    80002b20:	64450513          	addi	a0,a0,1604 # 80007160 <CONSOLE_STATUS+0x150>
    80002b24:	00001097          	auipc	ra,0x1
    80002b28:	114080e7          	jalr	276(ra) # 80003c38 <_Z11printStringPKc>
    80002b2c:	00000613          	li	a2,0
    80002b30:	00a00593          	li	a1,10
    80002b34:	0009051b          	sext.w	a0,s2
    80002b38:	00001097          	auipc	ra,0x1
    80002b3c:	298080e7          	jalr	664(ra) # 80003dd0 <_Z8printIntiii>
    80002b40:	00004517          	auipc	a0,0x4
    80002b44:	55850513          	addi	a0,a0,1368 # 80007098 <CONSOLE_STATUS+0x88>
    80002b48:	00001097          	auipc	ra,0x1
    80002b4c:	0f0080e7          	jalr	240(ra) # 80003c38 <_Z11printStringPKc>

    uint64 result = fibonacci(12);
    80002b50:	00c00513          	li	a0,12
    80002b54:	00000097          	auipc	ra,0x0
    80002b58:	ed0080e7          	jalr	-304(ra) # 80002a24 <_Z9fibonaccim>
    80002b5c:	00050913          	mv	s2,a0
    printString("C: fibonaci="); printInt(result); printString("\n");
    80002b60:	00004517          	auipc	a0,0x4
    80002b64:	60850513          	addi	a0,a0,1544 # 80007168 <CONSOLE_STATUS+0x158>
    80002b68:	00001097          	auipc	ra,0x1
    80002b6c:	0d0080e7          	jalr	208(ra) # 80003c38 <_Z11printStringPKc>
    80002b70:	00000613          	li	a2,0
    80002b74:	00a00593          	li	a1,10
    80002b78:	0009051b          	sext.w	a0,s2
    80002b7c:	00001097          	auipc	ra,0x1
    80002b80:	254080e7          	jalr	596(ra) # 80003dd0 <_Z8printIntiii>
    80002b84:	00004517          	auipc	a0,0x4
    80002b88:	51450513          	addi	a0,a0,1300 # 80007098 <CONSOLE_STATUS+0x88>
    80002b8c:	00001097          	auipc	ra,0x1
    80002b90:	0ac080e7          	jalr	172(ra) # 80003c38 <_Z11printStringPKc>
    80002b94:	0400006f          	j	80002bd4 <_Z11workerBodyCPv+0x13c>

    for (; i < 6; i++) {
        printString("C: i="); printInt(i); printString("\n");
    80002b98:	00004517          	auipc	a0,0x4
    80002b9c:	5b050513          	addi	a0,a0,1456 # 80007148 <CONSOLE_STATUS+0x138>
    80002ba0:	00001097          	auipc	ra,0x1
    80002ba4:	098080e7          	jalr	152(ra) # 80003c38 <_Z11printStringPKc>
    80002ba8:	00000613          	li	a2,0
    80002bac:	00a00593          	li	a1,10
    80002bb0:	00048513          	mv	a0,s1
    80002bb4:	00001097          	auipc	ra,0x1
    80002bb8:	21c080e7          	jalr	540(ra) # 80003dd0 <_Z8printIntiii>
    80002bbc:	00004517          	auipc	a0,0x4
    80002bc0:	4dc50513          	addi	a0,a0,1244 # 80007098 <CONSOLE_STATUS+0x88>
    80002bc4:	00001097          	auipc	ra,0x1
    80002bc8:	074080e7          	jalr	116(ra) # 80003c38 <_Z11printStringPKc>
    for (; i < 6; i++) {
    80002bcc:	0014849b          	addiw	s1,s1,1
    80002bd0:	0ff4f493          	andi	s1,s1,255
    80002bd4:	00500793          	li	a5,5
    80002bd8:	fc97f0e3          	bgeu	a5,s1,80002b98 <_Z11workerBodyCPv+0x100>
    }

    printString("A finished!\n");
    80002bdc:	00004517          	auipc	a0,0x4
    80002be0:	44c50513          	addi	a0,a0,1100 # 80007028 <CONSOLE_STATUS+0x18>
    80002be4:	00001097          	auipc	ra,0x1
    80002be8:	054080e7          	jalr	84(ra) # 80003c38 <_Z11printStringPKc>
    finishedC = true;
    80002bec:	00100793          	li	a5,1
    80002bf0:	00006717          	auipc	a4,0x6
    80002bf4:	98f70423          	sb	a5,-1656(a4) # 80008578 <finishedC>
    thread_dispatch();
    80002bf8:	fffff097          	auipc	ra,0xfffff
    80002bfc:	b30080e7          	jalr	-1232(ra) # 80001728 <_Z15thread_dispatchv>
}
    80002c00:	01813083          	ld	ra,24(sp)
    80002c04:	01013403          	ld	s0,16(sp)
    80002c08:	00813483          	ld	s1,8(sp)
    80002c0c:	00013903          	ld	s2,0(sp)
    80002c10:	02010113          	addi	sp,sp,32
    80002c14:	00008067          	ret

0000000080002c18 <_Z11workerBodyDPv>:

void workerBodyD(void* arg) {
    80002c18:	fe010113          	addi	sp,sp,-32
    80002c1c:	00113c23          	sd	ra,24(sp)
    80002c20:	00813823          	sd	s0,16(sp)
    80002c24:	00913423          	sd	s1,8(sp)
    80002c28:	01213023          	sd	s2,0(sp)
    80002c2c:	02010413          	addi	s0,sp,32
    uint8 i = 10;
    80002c30:	00a00493          	li	s1,10
    80002c34:	0400006f          	j	80002c74 <_Z11workerBodyDPv+0x5c>
    for (; i < 13; i++) {
        printString("D: i="); printInt(i); printString("\n");
    80002c38:	00004517          	auipc	a0,0x4
    80002c3c:	54050513          	addi	a0,a0,1344 # 80007178 <CONSOLE_STATUS+0x168>
    80002c40:	00001097          	auipc	ra,0x1
    80002c44:	ff8080e7          	jalr	-8(ra) # 80003c38 <_Z11printStringPKc>
    80002c48:	00000613          	li	a2,0
    80002c4c:	00a00593          	li	a1,10
    80002c50:	00048513          	mv	a0,s1
    80002c54:	00001097          	auipc	ra,0x1
    80002c58:	17c080e7          	jalr	380(ra) # 80003dd0 <_Z8printIntiii>
    80002c5c:	00004517          	auipc	a0,0x4
    80002c60:	43c50513          	addi	a0,a0,1084 # 80007098 <CONSOLE_STATUS+0x88>
    80002c64:	00001097          	auipc	ra,0x1
    80002c68:	fd4080e7          	jalr	-44(ra) # 80003c38 <_Z11printStringPKc>
    for (; i < 13; i++) {
    80002c6c:	0014849b          	addiw	s1,s1,1
    80002c70:	0ff4f493          	andi	s1,s1,255
    80002c74:	00c00793          	li	a5,12
    80002c78:	fc97f0e3          	bgeu	a5,s1,80002c38 <_Z11workerBodyDPv+0x20>
    }

    printString("D: dispatch\n");
    80002c7c:	00004517          	auipc	a0,0x4
    80002c80:	50450513          	addi	a0,a0,1284 # 80007180 <CONSOLE_STATUS+0x170>
    80002c84:	00001097          	auipc	ra,0x1
    80002c88:	fb4080e7          	jalr	-76(ra) # 80003c38 <_Z11printStringPKc>
    __asm__ ("li t1, 5");
    80002c8c:	00500313          	li	t1,5
    thread_dispatch();
    80002c90:	fffff097          	auipc	ra,0xfffff
    80002c94:	a98080e7          	jalr	-1384(ra) # 80001728 <_Z15thread_dispatchv>

    uint64 result = fibonacci(16);
    80002c98:	01000513          	li	a0,16
    80002c9c:	00000097          	auipc	ra,0x0
    80002ca0:	d88080e7          	jalr	-632(ra) # 80002a24 <_Z9fibonaccim>
    80002ca4:	00050913          	mv	s2,a0
    printString("D: fibonaci="); printInt(result); printString("\n");
    80002ca8:	00004517          	auipc	a0,0x4
    80002cac:	4e850513          	addi	a0,a0,1256 # 80007190 <CONSOLE_STATUS+0x180>
    80002cb0:	00001097          	auipc	ra,0x1
    80002cb4:	f88080e7          	jalr	-120(ra) # 80003c38 <_Z11printStringPKc>
    80002cb8:	00000613          	li	a2,0
    80002cbc:	00a00593          	li	a1,10
    80002cc0:	0009051b          	sext.w	a0,s2
    80002cc4:	00001097          	auipc	ra,0x1
    80002cc8:	10c080e7          	jalr	268(ra) # 80003dd0 <_Z8printIntiii>
    80002ccc:	00004517          	auipc	a0,0x4
    80002cd0:	3cc50513          	addi	a0,a0,972 # 80007098 <CONSOLE_STATUS+0x88>
    80002cd4:	00001097          	auipc	ra,0x1
    80002cd8:	f64080e7          	jalr	-156(ra) # 80003c38 <_Z11printStringPKc>
    80002cdc:	0400006f          	j	80002d1c <_Z11workerBodyDPv+0x104>

    for (; i < 16; i++) {
        printString("D: i="); printInt(i); printString("\n");
    80002ce0:	00004517          	auipc	a0,0x4
    80002ce4:	49850513          	addi	a0,a0,1176 # 80007178 <CONSOLE_STATUS+0x168>
    80002ce8:	00001097          	auipc	ra,0x1
    80002cec:	f50080e7          	jalr	-176(ra) # 80003c38 <_Z11printStringPKc>
    80002cf0:	00000613          	li	a2,0
    80002cf4:	00a00593          	li	a1,10
    80002cf8:	00048513          	mv	a0,s1
    80002cfc:	00001097          	auipc	ra,0x1
    80002d00:	0d4080e7          	jalr	212(ra) # 80003dd0 <_Z8printIntiii>
    80002d04:	00004517          	auipc	a0,0x4
    80002d08:	39450513          	addi	a0,a0,916 # 80007098 <CONSOLE_STATUS+0x88>
    80002d0c:	00001097          	auipc	ra,0x1
    80002d10:	f2c080e7          	jalr	-212(ra) # 80003c38 <_Z11printStringPKc>
    for (; i < 16; i++) {
    80002d14:	0014849b          	addiw	s1,s1,1
    80002d18:	0ff4f493          	andi	s1,s1,255
    80002d1c:	00f00793          	li	a5,15
    80002d20:	fc97f0e3          	bgeu	a5,s1,80002ce0 <_Z11workerBodyDPv+0xc8>
    }

    printString("D finished!\n");
    80002d24:	00004517          	auipc	a0,0x4
    80002d28:	47c50513          	addi	a0,a0,1148 # 800071a0 <CONSOLE_STATUS+0x190>
    80002d2c:	00001097          	auipc	ra,0x1
    80002d30:	f0c080e7          	jalr	-244(ra) # 80003c38 <_Z11printStringPKc>
    finishedD = true;
    80002d34:	00100793          	li	a5,1
    80002d38:	00006717          	auipc	a4,0x6
    80002d3c:	84f700a3          	sb	a5,-1983(a4) # 80008579 <finishedD>
    thread_dispatch();
    80002d40:	fffff097          	auipc	ra,0xfffff
    80002d44:	9e8080e7          	jalr	-1560(ra) # 80001728 <_Z15thread_dispatchv>
}
    80002d48:	01813083          	ld	ra,24(sp)
    80002d4c:	01013403          	ld	s0,16(sp)
    80002d50:	00813483          	ld	s1,8(sp)
    80002d54:	00013903          	ld	s2,0(sp)
    80002d58:	02010113          	addi	sp,sp,32
    80002d5c:	00008067          	ret

0000000080002d60 <_Z18Threads_C_API_testv>:


void Threads_C_API_test() {
    80002d60:	fd010113          	addi	sp,sp,-48
    80002d64:	02113423          	sd	ra,40(sp)
    80002d68:	02813023          	sd	s0,32(sp)
    80002d6c:	03010413          	addi	s0,sp,48
    thread_t threads[4];
    thread_create(&threads[0], workerBodyA, nullptr);
    80002d70:	00000613          	li	a2,0
    80002d74:	fffff597          	auipc	a1,0xfffff
    80002d78:	71458593          	addi	a1,a1,1812 # 80002488 <_Z11workerBodyAPv>
    80002d7c:	fd040513          	addi	a0,s0,-48
    80002d80:	fffff097          	auipc	ra,0xfffff
    80002d84:	8f8080e7          	jalr	-1800(ra) # 80001678 <_Z13thread_createPP3TCBPFvPvES2_>
    printString("ThreadA created\n");
    80002d88:	00004517          	auipc	a0,0x4
    80002d8c:	42850513          	addi	a0,a0,1064 # 800071b0 <CONSOLE_STATUS+0x1a0>
    80002d90:	00001097          	auipc	ra,0x1
    80002d94:	ea8080e7          	jalr	-344(ra) # 80003c38 <_Z11printStringPKc>

    thread_create(&threads[1], workerBodyB, nullptr);
    80002d98:	00000613          	li	a2,0
    80002d9c:	fffff597          	auipc	a1,0xfffff
    80002da0:	7b858593          	addi	a1,a1,1976 # 80002554 <_Z11workerBodyBPv>
    80002da4:	fd840513          	addi	a0,s0,-40
    80002da8:	fffff097          	auipc	ra,0xfffff
    80002dac:	8d0080e7          	jalr	-1840(ra) # 80001678 <_Z13thread_createPP3TCBPFvPvES2_>
    printString("ThreadB created\n");
    80002db0:	00004517          	auipc	a0,0x4
    80002db4:	41850513          	addi	a0,a0,1048 # 800071c8 <CONSOLE_STATUS+0x1b8>
    80002db8:	00001097          	auipc	ra,0x1
    80002dbc:	e80080e7          	jalr	-384(ra) # 80003c38 <_Z11printStringPKc>

    thread_create(&threads[2], workerBodyC, nullptr);
    80002dc0:	00000613          	li	a2,0
    80002dc4:	00000597          	auipc	a1,0x0
    80002dc8:	cd458593          	addi	a1,a1,-812 # 80002a98 <_Z11workerBodyCPv>
    80002dcc:	fe040513          	addi	a0,s0,-32
    80002dd0:	fffff097          	auipc	ra,0xfffff
    80002dd4:	8a8080e7          	jalr	-1880(ra) # 80001678 <_Z13thread_createPP3TCBPFvPvES2_>
    printString("ThreadC created\n");
    80002dd8:	00004517          	auipc	a0,0x4
    80002ddc:	40850513          	addi	a0,a0,1032 # 800071e0 <CONSOLE_STATUS+0x1d0>
    80002de0:	00001097          	auipc	ra,0x1
    80002de4:	e58080e7          	jalr	-424(ra) # 80003c38 <_Z11printStringPKc>

    thread_create(&threads[3], workerBodyD, nullptr);
    80002de8:	00000613          	li	a2,0
    80002dec:	00000597          	auipc	a1,0x0
    80002df0:	e2c58593          	addi	a1,a1,-468 # 80002c18 <_Z11workerBodyDPv>
    80002df4:	fe840513          	addi	a0,s0,-24
    80002df8:	fffff097          	auipc	ra,0xfffff
    80002dfc:	880080e7          	jalr	-1920(ra) # 80001678 <_Z13thread_createPP3TCBPFvPvES2_>
    printString("ThreadD created\n");
    80002e00:	00004517          	auipc	a0,0x4
    80002e04:	3f850513          	addi	a0,a0,1016 # 800071f8 <CONSOLE_STATUS+0x1e8>
    80002e08:	00001097          	auipc	ra,0x1
    80002e0c:	e30080e7          	jalr	-464(ra) # 80003c38 <_Z11printStringPKc>
    80002e10:	00c0006f          	j	80002e1c <_Z18Threads_C_API_testv+0xbc>

    while (!(finishedA && finishedB && finishedC && finishedD)) {
        thread_dispatch();
    80002e14:	fffff097          	auipc	ra,0xfffff
    80002e18:	914080e7          	jalr	-1772(ra) # 80001728 <_Z15thread_dispatchv>
    while (!(finishedA && finishedB && finishedC && finishedD)) {
    80002e1c:	00005797          	auipc	a5,0x5
    80002e20:	7487c783          	lbu	a5,1864(a5) # 80008564 <finishedA>
    80002e24:	fe0788e3          	beqz	a5,80002e14 <_Z18Threads_C_API_testv+0xb4>
    80002e28:	00005797          	auipc	a5,0x5
    80002e2c:	73d7c783          	lbu	a5,1853(a5) # 80008565 <finishedB>
    80002e30:	fe0782e3          	beqz	a5,80002e14 <_Z18Threads_C_API_testv+0xb4>
    80002e34:	00005797          	auipc	a5,0x5
    80002e38:	7447c783          	lbu	a5,1860(a5) # 80008578 <finishedC>
    80002e3c:	fc078ce3          	beqz	a5,80002e14 <_Z18Threads_C_API_testv+0xb4>
    80002e40:	00005797          	auipc	a5,0x5
    80002e44:	7397c783          	lbu	a5,1849(a5) # 80008579 <finishedD>
    80002e48:	fc0786e3          	beqz	a5,80002e14 <_Z18Threads_C_API_testv+0xb4>
    }

}
    80002e4c:	02813083          	ld	ra,40(sp)
    80002e50:	02013403          	ld	s0,32(sp)
    80002e54:	03010113          	addi	sp,sp,48
    80002e58:	00008067          	ret

0000000080002e5c <main>:


extern void userMain(void*);


int main(){
    80002e5c:	fc010113          	addi	sp,sp,-64
    80002e60:	02113c23          	sd	ra,56(sp)
    80002e64:	02813823          	sd	s0,48(sp)
    80002e68:	04010413          	addi	s0,sp,64

    Riscv::w_stvec((uint64)&Riscv::supervisorTrap);
    80002e6c:	00005797          	auipc	a5,0x5
    80002e70:	5fc7b783          	ld	a5,1532(a5) # 80008468 <_GLOBAL_OFFSET_TABLE_+0x20>
    __asm__ volatile ("csrw stvec, %[stvec]" : : [stvec] "r"(stvec));
    80002e74:	10579073          	csrw	stvec,a5

    Riscv::init();
    80002e78:	fffff097          	auipc	ra,0xfffff
    80002e7c:	fec080e7          	jalr	-20(ra) # 80001e64 <_ZN5Riscv4initEv>

    thread_t empty;
    thread_create(&empty, nullptr, nullptr);
    80002e80:	00000613          	li	a2,0
    80002e84:	00000593          	li	a1,0
    80002e88:	fe840513          	addi	a0,s0,-24
    80002e8c:	ffffe097          	auipc	ra,0xffffe
    80002e90:	7ec080e7          	jalr	2028(ra) # 80001678 <_Z13thread_createPP3TCBPFvPvES2_>
    TCB::running = empty;
    80002e94:	00005797          	auipc	a5,0x5
    80002e98:	61c7b783          	ld	a5,1564(a5) # 800084b0 <_GLOBAL_OFFSET_TABLE_+0x68>
    80002e9c:	fe843703          	ld	a4,-24(s0)
    80002ea0:	00e7b023          	sd	a4,0(a5)

    thread_t out;
    thread_create(&out, TCB::output,nullptr);
    80002ea4:	00000613          	li	a2,0
    80002ea8:	00005597          	auipc	a1,0x5
    80002eac:	5d05b583          	ld	a1,1488(a1) # 80008478 <_GLOBAL_OFFSET_TABLE_+0x30>
    80002eb0:	fe040513          	addi	a0,s0,-32
    80002eb4:	ffffe097          	auipc	ra,0xffffe
    80002eb8:	7c4080e7          	jalr	1988(ra) # 80001678 <_Z13thread_createPP3TCBPFvPvES2_>
    thread_t in;
    thread_create(&in, TCB::input, nullptr);
    80002ebc:	00000613          	li	a2,0
    80002ec0:	00005597          	auipc	a1,0x5
    80002ec4:	5e05b583          	ld	a1,1504(a1) # 800084a0 <_GLOBAL_OFFSET_TABLE_+0x58>
    80002ec8:	fd840513          	addi	a0,s0,-40
    80002ecc:	ffffe097          	auipc	ra,0xffffe
    80002ed0:	7ac080e7          	jalr	1964(ra) # 80001678 <_Z13thread_createPP3TCBPFvPvES2_>

    thread_t main;
    thread_create(&main, userMain, nullptr);
    80002ed4:	00000613          	li	a2,0
    80002ed8:	00005597          	auipc	a1,0x5
    80002edc:	5c05b583          	ld	a1,1472(a1) # 80008498 <_GLOBAL_OFFSET_TABLE_+0x50>
    80002ee0:	fd040513          	addi	a0,s0,-48
    80002ee4:	ffffe097          	auipc	ra,0xffffe
    80002ee8:	794080e7          	jalr	1940(ra) # 80001678 <_Z13thread_createPP3TCBPFvPvES2_>

    thread_t idleThread;
    thread_create(&idleThread, TCB::idle, nullptr);
    80002eec:	00000613          	li	a2,0
    80002ef0:	00005597          	auipc	a1,0x5
    80002ef4:	5a05b583          	ld	a1,1440(a1) # 80008490 <_GLOBAL_OFFSET_TABLE_+0x48>
    80002ef8:	fc840513          	addi	a0,s0,-56
    80002efc:	ffffe097          	auipc	ra,0xffffe
    80002f00:	77c080e7          	jalr	1916(ra) # 80001678 <_Z13thread_createPP3TCBPFvPvES2_>
    __asm__ volatile ("csrs sstatus, %[mask]" : : [mask] "r"(mask));
    80002f04:	00200793          	li	a5,2
    80002f08:	1007a073          	csrs	sstatus,a5



    Riscv::ms_sstatus(Riscv::SSTATUS_SIE);

    while(main->getStatus() != TCB::FINISHED)
    80002f0c:	fd043783          	ld	a5,-48(s0)
    enum threadStatus {FINISHED, RUNNING, BLOCKED, SLEEPING};
    int pid;
    using Body = void (*)(void*);

    void setStatus(threadStatus status) { this->status = status; }
    threadStatus getStatus() const { return status; }
    80002f10:	0387a783          	lw	a5,56(a5)
    80002f14:	00078863          	beqz	a5,80002f24 <main+0xc8>
        TCB::yield();
    80002f18:	00001097          	auipc	ra,0x1
    80002f1c:	aec080e7          	jalr	-1300(ra) # 80003a04 <_ZN3TCB5yieldEv>
    80002f20:	fedff06f          	j	80002f0c <main+0xb0>

    //Threads_C_API_test();
    //testSleeping();
    //producerConsumer_C_API();
    return 0;
    80002f24:	00000513          	li	a0,0
    80002f28:	03813083          	ld	ra,56(sp)
    80002f2c:	03013403          	ld	s0,48(sp)
    80002f30:	04010113          	addi	sp,sp,64
    80002f34:	00008067          	ret

0000000080002f38 <_Z41__static_initialization_and_destruction_0ii>:
        sleepingThreads.removeFirst();
        Scheduler::put(t);
        p = sleepingThreads.peekFirst();
        //TODO oslobodi struct
    }
    80002f38:	ff010113          	addi	sp,sp,-16
    80002f3c:	00813423          	sd	s0,8(sp)
    80002f40:	01010413          	addi	s0,sp,16
    80002f44:	00100793          	li	a5,1
    80002f48:	00f50863          	beq	a0,a5,80002f58 <_Z41__static_initialization_and_destruction_0ii+0x20>
    80002f4c:	00813403          	ld	s0,8(sp)
    80002f50:	01010113          	addi	sp,sp,16
    80002f54:	00008067          	ret
    80002f58:	000107b7          	lui	a5,0x10
    80002f5c:	fff78793          	addi	a5,a5,-1 # ffff <_entry-0x7fff0001>
    80002f60:	fef596e3          	bne	a1,a5,80002f4c <_Z41__static_initialization_and_destruction_0ii+0x14>
    };

    Elem *head, *tail, *current;

public:
    List() : head(0), tail(0), current(0) {}
    80002f64:	00005797          	auipc	a5,0x5
    80002f68:	61c78793          	addi	a5,a5,1564 # 80008580 <_ZN9SleepList15sleepingThreadsE>
    80002f6c:	0007b023          	sd	zero,0(a5)
    80002f70:	0007b423          	sd	zero,8(a5)
    80002f74:	0007b823          	sd	zero,16(a5)
    80002f78:	fd5ff06f          	j	80002f4c <_Z41__static_initialization_and_destruction_0ii+0x14>

0000000080002f7c <_ZN9SleepList3putEP3TCBm>:
void SleepList::put(TCB* thread, time_t sleepTime) {
    80002f7c:	fd010113          	addi	sp,sp,-48
    80002f80:	02113423          	sd	ra,40(sp)
    80002f84:	02813023          	sd	s0,32(sp)
    80002f88:	00913c23          	sd	s1,24(sp)
    80002f8c:	01213823          	sd	s2,16(sp)
    80002f90:	01313423          	sd	s3,8(sp)
    80002f94:	03010413          	addi	s0,sp,48
    80002f98:	00050993          	mv	s3,a0
    80002f9c:	00058493          	mv	s1,a1
    SleepList::Sleep* elem = new SleepList::Sleep(thread); // TODO destruktor
    80002fa0:	01000513          	li	a0,16
    80002fa4:	ffffe097          	auipc	ra,0xffffe
    80002fa8:	2c0080e7          	jalr	704(ra) # 80001264 <_Znwm>
    80002fac:	00050913          	mv	s2,a0
class SleepList{
public:
    struct Sleep{
        time_t difference;
        TCB* thread;
        Sleep(TCB* thread) : thread(thread) {}
    80002fb0:	01353423          	sd	s3,8(a0)
            return 0;
        return tail->data;
    }

    void resetCurrent(){
        current = head;
    80002fb4:	00005717          	auipc	a4,0x5
    80002fb8:	5cc70713          	addi	a4,a4,1484 # 80008580 <_ZN9SleepList15sleepingThreadsE>
    80002fbc:	00073783          	ld	a5,0(a4)
    80002fc0:	00f73823          	sd	a5,16(a4)
            current = current->next;

    }

    T* getCurrent(){
        if(!current)
    80002fc4:	00078463          	beqz	a5,80002fcc <_ZN9SleepList3putEP3TCBm+0x50>
            return 0;
        return current->data;
    80002fc8:	0007b783          	ld	a5,0(a5)
void SleepList::put(TCB* thread, time_t sleepTime) {
    80002fcc:	00000713          	li	a4,0
    80002fd0:	00000693          	li	a3,0
    80002fd4:	0180006f          	j	80002fec <_ZN9SleepList3putEP3TCBm+0x70>
        if(!current)
    80002fd8:	00005797          	auipc	a5,0x5
    80002fdc:	5b87b783          	ld	a5,1464(a5) # 80008590 <_ZN9SleepList15sleepingThreadsE+0x10>
    80002fe0:	00078463          	beqz	a5,80002fe8 <_ZN9SleepList3putEP3TCBm+0x6c>
        return current->data;
    80002fe4:	0007b783          	ld	a5,0(a5)
        position++;
    80002fe8:	0016869b          	addiw	a3,a3,1
    while(p){
    80002fec:	02078663          	beqz	a5,80003018 <_ZN9SleepList3putEP3TCBm+0x9c>
        listTime += p->difference;
    80002ff0:	0007b603          	ld	a2,0(a5)
    80002ff4:	00c70733          	add	a4,a4,a2
        if(sleepTime < listTime)
    80002ff8:	02e4e063          	bltu	s1,a4,80003018 <_ZN9SleepList3putEP3TCBm+0x9c>
        if(current)
    80002ffc:	00005797          	auipc	a5,0x5
    80003000:	5947b783          	ld	a5,1428(a5) # 80008590 <_ZN9SleepList15sleepingThreadsE+0x10>
    80003004:	fc078ae3          	beqz	a5,80002fd8 <_ZN9SleepList3putEP3TCBm+0x5c>
            current = current->next;
    80003008:	0087b783          	ld	a5,8(a5)
    8000300c:	00005617          	auipc	a2,0x5
    80003010:	58f63223          	sd	a5,1412(a2) # 80008590 <_ZN9SleepList15sleepingThreadsE+0x10>
    80003014:	fc5ff06f          	j	80002fd8 <_ZN9SleepList3putEP3TCBm+0x5c>
    if(!position){
    80003018:	06069663          	bnez	a3,80003084 <_ZN9SleepList3putEP3TCBm+0x108>
        elem->difference = sleepTime;
    8000301c:	00993023          	sd	s1,0(s2)
        if(p)
    80003020:	00078863          	beqz	a5,80003030 <_ZN9SleepList3putEP3TCBm+0xb4>
           p->difference = p->difference - sleepTime;
    80003024:	0007b703          	ld	a4,0(a5)
    80003028:	40970733          	sub	a4,a4,s1
    8000302c:	00e7b023          	sd	a4,0(a5)
        Elem *elem = new Elem(data, head);
    80003030:	01000513          	li	a0,16
    80003034:	ffffe097          	auipc	ra,0xffffe
    80003038:	230080e7          	jalr	560(ra) # 80001264 <_Znwm>
    8000303c:	00005797          	auipc	a5,0x5
    80003040:	54478793          	addi	a5,a5,1348 # 80008580 <_ZN9SleepList15sleepingThreadsE>
    80003044:	0007b703          	ld	a4,0(a5)
        Elem(T *data, Elem *next) : data(data), next(next) {}
    80003048:	01253023          	sd	s2,0(a0)
    8000304c:	00e53423          	sd	a4,8(a0)
        head = elem;
    80003050:	00a7b023          	sd	a0,0(a5)
        if (!tail) { tail = head; }
    80003054:	0087b783          	ld	a5,8(a5)
    80003058:	02078063          	beqz	a5,80003078 <_ZN9SleepList3putEP3TCBm+0xfc>
}
    8000305c:	02813083          	ld	ra,40(sp)
    80003060:	02013403          	ld	s0,32(sp)
    80003064:	01813483          	ld	s1,24(sp)
    80003068:	01013903          	ld	s2,16(sp)
    8000306c:	00813983          	ld	s3,8(sp)
    80003070:	03010113          	addi	sp,sp,48
    80003074:	00008067          	ret
    80003078:	00005797          	auipc	a5,0x5
    8000307c:	50a7b823          	sd	a0,1296(a5) # 80008588 <_ZN9SleepList15sleepingThreadsE+0x8>
    80003080:	fddff06f          	j	8000305c <_ZN9SleepList3putEP3TCBm+0xe0>
    }else if(!p){ // add as last
    80003084:	02078c63          	beqz	a5,800030bc <_ZN9SleepList3putEP3TCBm+0x140>
        elem->difference = sleepTime - (listTime - p->difference);
    80003088:	0007b603          	ld	a2,0(a5)
    8000308c:	40e60633          	sub	a2,a2,a4
    80003090:	00960633          	add	a2,a2,s1
    80003094:	00c93023          	sd	a2,0(s2)
        p->difference = listTime - sleepTime;
    80003098:	40970733          	sub	a4,a4,s1
    8000309c:	00e7b023          	sd	a4,0(a5)
    }

    void insertAtPosition(T* elem, int pos){
        if(!pos){
    800030a0:	06068463          	beqz	a3,80003108 <_ZN9SleepList3putEP3TCBm+0x18c>
        current = head;
    800030a4:	00005797          	auipc	a5,0x5
    800030a8:	4dc78793          	addi	a5,a5,1244 # 80008580 <_ZN9SleepList15sleepingThreadsE>
    800030ac:	0007b703          	ld	a4,0(a5)
    800030b0:	00e7b823          	sd	a4,16(a5)
            addFirst(elem);
            return;
        }
        resetCurrent();
        for(int i = 0;i < pos - 1;i++) moveCurrent();
    800030b4:	00000793          	li	a5,0
    800030b8:	08c0006f          	j	80003144 <_ZN9SleepList3putEP3TCBm+0x1c8>
        elem->difference = sleepTime - listTime;
    800030bc:	40e48733          	sub	a4,s1,a4
    800030c0:	00e93023          	sd	a4,0(s2)
        Elem *elem = new Elem(data, 0);
    800030c4:	01000513          	li	a0,16
    800030c8:	ffffe097          	auipc	ra,0xffffe
    800030cc:	19c080e7          	jalr	412(ra) # 80001264 <_Znwm>
        Elem(T *data, Elem *next) : data(data), next(next) {}
    800030d0:	01253023          	sd	s2,0(a0)
    800030d4:	00053423          	sd	zero,8(a0)
        if (tail){
    800030d8:	00005797          	auipc	a5,0x5
    800030dc:	4b07b783          	ld	a5,1200(a5) # 80008588 <_ZN9SleepList15sleepingThreadsE+0x8>
    800030e0:	00078a63          	beqz	a5,800030f4 <_ZN9SleepList3putEP3TCBm+0x178>
            tail->next = elem;
    800030e4:	00a7b423          	sd	a0,8(a5)
            tail = elem;
    800030e8:	00005797          	auipc	a5,0x5
    800030ec:	4aa7b023          	sd	a0,1184(a5) # 80008588 <_ZN9SleepList15sleepingThreadsE+0x8>
    800030f0:	f6dff06f          	j	8000305c <_ZN9SleepList3putEP3TCBm+0xe0>
            head = tail = elem;
    800030f4:	00005797          	auipc	a5,0x5
    800030f8:	48c78793          	addi	a5,a5,1164 # 80008580 <_ZN9SleepList15sleepingThreadsE>
    800030fc:	00a7b423          	sd	a0,8(a5)
    80003100:	00a7b023          	sd	a0,0(a5)
    80003104:	f59ff06f          	j	8000305c <_ZN9SleepList3putEP3TCBm+0xe0>
        Elem *elem = new Elem(data, head);
    80003108:	01000513          	li	a0,16
    8000310c:	ffffe097          	auipc	ra,0xffffe
    80003110:	158080e7          	jalr	344(ra) # 80001264 <_Znwm>
    80003114:	00005797          	auipc	a5,0x5
    80003118:	46c78793          	addi	a5,a5,1132 # 80008580 <_ZN9SleepList15sleepingThreadsE>
    8000311c:	0007b703          	ld	a4,0(a5)
        Elem(T *data, Elem *next) : data(data), next(next) {}
    80003120:	01253023          	sd	s2,0(a0)
    80003124:	00e53423          	sd	a4,8(a0)
        head = elem;
    80003128:	00a7b023          	sd	a0,0(a5)
        if (!tail) { tail = head; }
    8000312c:	0087b783          	ld	a5,8(a5)
    80003130:	f20796e3          	bnez	a5,8000305c <_ZN9SleepList3putEP3TCBm+0xe0>
    80003134:	00005797          	auipc	a5,0x5
    80003138:	44a7ba23          	sd	a0,1108(a5) # 80008588 <_ZN9SleepList15sleepingThreadsE+0x8>
            return;
    8000313c:	f21ff06f          	j	8000305c <_ZN9SleepList3putEP3TCBm+0xe0>
        for(int i = 0;i < pos - 1;i++) moveCurrent();
    80003140:	0017879b          	addiw	a5,a5,1
    80003144:	fff6871b          	addiw	a4,a3,-1
    80003148:	02e7d063          	bge	a5,a4,80003168 <_ZN9SleepList3putEP3TCBm+0x1ec>
        if(current)
    8000314c:	00005717          	auipc	a4,0x5
    80003150:	44473703          	ld	a4,1092(a4) # 80008590 <_ZN9SleepList15sleepingThreadsE+0x10>
    80003154:	fe0706e3          	beqz	a4,80003140 <_ZN9SleepList3putEP3TCBm+0x1c4>
            current = current->next;
    80003158:	00873703          	ld	a4,8(a4)
    8000315c:	00005617          	auipc	a2,0x5
    80003160:	42e63a23          	sd	a4,1076(a2) # 80008590 <_ZN9SleepList15sleepingThreadsE+0x10>
    80003164:	fddff06f          	j	80003140 <_ZN9SleepList3putEP3TCBm+0x1c4>
        current->next = new Elem(elem, current->next);
    80003168:	01000513          	li	a0,16
    8000316c:	ffffe097          	auipc	ra,0xffffe
    80003170:	0f8080e7          	jalr	248(ra) # 80001264 <_Znwm>
    80003174:	00005797          	auipc	a5,0x5
    80003178:	41c7b783          	ld	a5,1052(a5) # 80008590 <_ZN9SleepList15sleepingThreadsE+0x10>
    8000317c:	0087b703          	ld	a4,8(a5)
        Elem(T *data, Elem *next) : data(data), next(next) {}
    80003180:	01253023          	sd	s2,0(a0)
    80003184:	00e53423          	sd	a4,8(a0)
        current->next = new Elem(elem, current->next);
    80003188:	00a7b423          	sd	a0,8(a5)
}
    8000318c:	ed1ff06f          	j	8000305c <_ZN9SleepList3putEP3TCBm+0xe0>

0000000080003190 <_ZN9SleepList9decrementEv>:
int SleepList::decrement() {
    80003190:	ff010113          	addi	sp,sp,-16
    80003194:	00813423          	sd	s0,8(sp)
    80003198:	01010413          	addi	s0,sp,16
        if (!head)
    8000319c:	00005797          	auipc	a5,0x5
    800031a0:	3e47b783          	ld	a5,996(a5) # 80008580 <_ZN9SleepList15sleepingThreadsE>
    800031a4:	02078463          	beqz	a5,800031cc <_ZN9SleepList9decrementEv+0x3c>
        return head->data;
    800031a8:	0007b783          	ld	a5,0(a5)
    if(!p)
    800031ac:	02078463          	beqz	a5,800031d4 <_ZN9SleepList9decrementEv+0x44>
    p->difference--;
    800031b0:	0007b703          	ld	a4,0(a5)
    800031b4:	fff70713          	addi	a4,a4,-1
    800031b8:	00e7b023          	sd	a4,0(a5)
    return 1;
    800031bc:	00100513          	li	a0,1
}
    800031c0:	00813403          	ld	s0,8(sp)
    800031c4:	01010113          	addi	sp,sp,16
    800031c8:	00008067          	ret
        return 0;
    800031cc:	00000513          	li	a0,0
    800031d0:	ff1ff06f          	j	800031c0 <_ZN9SleepList9decrementEv+0x30>
    800031d4:	00000513          	li	a0,0
    800031d8:	fe9ff06f          	j	800031c0 <_ZN9SleepList9decrementEv+0x30>

00000000800031dc <_ZN9SleepList14releaseThreadsEv>:
void SleepList::releaseThreads(){
    800031dc:	fe010113          	addi	sp,sp,-32
    800031e0:	00113c23          	sd	ra,24(sp)
    800031e4:	00813823          	sd	s0,16(sp)
    800031e8:	00913423          	sd	s1,8(sp)
    800031ec:	02010413          	addi	s0,sp,32
    if(!decrement())
    800031f0:	00000097          	auipc	ra,0x0
    800031f4:	fa0080e7          	jalr	-96(ra) # 80003190 <_ZN9SleepList9decrementEv>
    800031f8:	06050e63          	beqz	a0,80003274 <_ZN9SleepList14releaseThreadsEv+0x98>
        if (!head)
    800031fc:	00005797          	auipc	a5,0x5
    80003200:	3847b783          	ld	a5,900(a5) # 80008580 <_ZN9SleepList15sleepingThreadsE>
    80003204:	02078c63          	beqz	a5,8000323c <_ZN9SleepList14releaseThreadsEv+0x60>
        return head->data;
    80003208:	0007b783          	ld	a5,0(a5)
    8000320c:	0300006f          	j	8000323c <_ZN9SleepList14releaseThreadsEv+0x60>
            tail = 0;
    80003210:	00005797          	auipc	a5,0x5
    80003214:	3607bc23          	sd	zero,888(a5) # 80008588 <_ZN9SleepList15sleepingThreadsE+0x8>
        delete elem;
    80003218:	ffffe097          	auipc	ra,0xffffe
    8000321c:	09c080e7          	jalr	156(ra) # 800012b4 <_ZdlPv>
        Scheduler::put(t);
    80003220:	00048513          	mv	a0,s1
    80003224:	fffff097          	auipc	ra,0xfffff
    80003228:	b80080e7          	jalr	-1152(ra) # 80001da4 <_ZN9Scheduler3putEP3TCB>
        if (!head)
    8000322c:	00005797          	auipc	a5,0x5
    80003230:	3547b783          	ld	a5,852(a5) # 80008580 <_ZN9SleepList15sleepingThreadsE>
    80003234:	04078063          	beqz	a5,80003274 <_ZN9SleepList14releaseThreadsEv+0x98>
        return head->data;
    80003238:	0007b783          	ld	a5,0(a5)
    while(p && p->difference == 0){
    8000323c:	02078c63          	beqz	a5,80003274 <_ZN9SleepList14releaseThreadsEv+0x98>
    80003240:	0007b703          	ld	a4,0(a5)
    80003244:	02071863          	bnez	a4,80003274 <_ZN9SleepList14releaseThreadsEv+0x98>
        TCB* t = p->thread;
    80003248:	0087b483          	ld	s1,8(a5)
        t->status = TCB::RUNNING;
    8000324c:	00100793          	li	a5,1
    80003250:	02f4ac23          	sw	a5,56(s1)
        if (!head)
    80003254:	00005517          	auipc	a0,0x5
    80003258:	32c53503          	ld	a0,812(a0) # 80008580 <_ZN9SleepList15sleepingThreadsE>
    8000325c:	fc0502e3          	beqz	a0,80003220 <_ZN9SleepList14releaseThreadsEv+0x44>
        head = head->next;
    80003260:	00853783          	ld	a5,8(a0)
    80003264:	00005717          	auipc	a4,0x5
    80003268:	30f73e23          	sd	a5,796(a4) # 80008580 <_ZN9SleepList15sleepingThreadsE>
        if (!head)
    8000326c:	fa0796e3          	bnez	a5,80003218 <_ZN9SleepList14releaseThreadsEv+0x3c>
    80003270:	fa1ff06f          	j	80003210 <_ZN9SleepList14releaseThreadsEv+0x34>
    80003274:	01813083          	ld	ra,24(sp)
    80003278:	01013403          	ld	s0,16(sp)
    8000327c:	00813483          	ld	s1,8(sp)
    80003280:	02010113          	addi	sp,sp,32
    80003284:	00008067          	ret

0000000080003288 <_GLOBAL__sub_I__ZN9SleepList15sleepingThreadsE>:
    80003288:	ff010113          	addi	sp,sp,-16
    8000328c:	00113423          	sd	ra,8(sp)
    80003290:	00813023          	sd	s0,0(sp)
    80003294:	01010413          	addi	s0,sp,16
    80003298:	000105b7          	lui	a1,0x10
    8000329c:	fff58593          	addi	a1,a1,-1 # ffff <_entry-0x7fff0001>
    800032a0:	00100513          	li	a0,1
    800032a4:	00000097          	auipc	ra,0x0
    800032a8:	c94080e7          	jalr	-876(ra) # 80002f38 <_Z41__static_initialization_and_destruction_0ii>
    800032ac:	00813083          	ld	ra,8(sp)
    800032b0:	00013403          	ld	s0,0(sp)
    800032b4:	01010113          	addi	sp,sp,16
    800032b8:	00008067          	ret

00000000800032bc <_ZN4_sem15createSemaphoreEPPS_j>:
// Created by bogdan on 19.7.22..
//

#include "../h/_sem.hpp"

int _sem::createSemaphore(sem_t *handle, unsigned int i) {
    800032bc:	fe010113          	addi	sp,sp,-32
    800032c0:	00113c23          	sd	ra,24(sp)
    800032c4:	00813823          	sd	s0,16(sp)
    800032c8:	00913423          	sd	s1,8(sp)
    800032cc:	01213023          	sd	s2,0(sp)
    800032d0:	02010413          	addi	s0,sp,32
    800032d4:	00050493          	mv	s1,a0
    800032d8:	00058913          	mv	s2,a1
    *handle = new _sem(i);
    800032dc:	02000513          	li	a0,32
    800032e0:	ffffe097          	auipc	ra,0xffffe
    800032e4:	f84080e7          	jalr	-124(ra) # 80001264 <_Znwm>
    int close();
protected:
    void block();
    void unblock();
private:
    _sem(unsigned val) : value(val){}
    800032e8:	01252023          	sw	s2,0(a0)
    List() : head(0), tail(0), current(0) {}
    800032ec:	00053423          	sd	zero,8(a0)
    800032f0:	00053823          	sd	zero,16(a0)
    800032f4:	00053c23          	sd	zero,24(a0)
    800032f8:	00a4b023          	sd	a0,0(s1)
    return 0;
}
    800032fc:	00000513          	li	a0,0
    80003300:	01813083          	ld	ra,24(sp)
    80003304:	01013403          	ld	s0,16(sp)
    80003308:	00813483          	ld	s1,8(sp)
    8000330c:	00013903          	ld	s2,0(sp)
    80003310:	02010113          	addi	sp,sp,32
    80003314:	00008067          	ret

0000000080003318 <_ZN4_sem5blockEv>:
void _sem::signal() {
    if(++value <= 0)
        unblock();
}

void _sem::block() {
    80003318:	fe010113          	addi	sp,sp,-32
    8000331c:	00113c23          	sd	ra,24(sp)
    80003320:	00813823          	sd	s0,16(sp)
    80003324:	00913423          	sd	s1,8(sp)
    80003328:	01213023          	sd	s2,0(sp)
    8000332c:	02010413          	addi	s0,sp,32
    80003330:	00050493          	mv	s1,a0
    TCB::running->setStatus(TCB::BLOCKED);
    80003334:	00005797          	auipc	a5,0x5
    80003338:	17c7b783          	ld	a5,380(a5) # 800084b0 <_GLOBAL_OFFSET_TABLE_+0x68>
    8000333c:	0007b903          	ld	s2,0(a5)
public:
    enum threadStatus {FINISHED, RUNNING, BLOCKED, SLEEPING};
    int pid;
    using Body = void (*)(void*);

    void setStatus(threadStatus status) { this->status = status; }
    80003340:	00200793          	li	a5,2
    80003344:	02f92c23          	sw	a5,56(s2)
        Elem *elem = new Elem(data, 0);
    80003348:	01000513          	li	a0,16
    8000334c:	ffffe097          	auipc	ra,0xffffe
    80003350:	f18080e7          	jalr	-232(ra) # 80001264 <_Znwm>
        Elem(T *data, Elem *next) : data(data), next(next) {}
    80003354:	01253023          	sd	s2,0(a0)
    80003358:	00053423          	sd	zero,8(a0)
        if (tail){
    8000335c:	0104b783          	ld	a5,16(s1)
    80003360:	02078663          	beqz	a5,8000338c <_ZN4_sem5blockEv+0x74>
            tail->next = elem;
    80003364:	00a7b423          	sd	a0,8(a5)
            tail = elem;
    80003368:	00a4b823          	sd	a0,16(s1)
    blocked.addLast(TCB::running);
    TCB::dispatch();
    8000336c:	00000097          	auipc	ra,0x0
    80003370:	714080e7          	jalr	1812(ra) # 80003a80 <_ZN3TCB8dispatchEv>
}
    80003374:	01813083          	ld	ra,24(sp)
    80003378:	01013403          	ld	s0,16(sp)
    8000337c:	00813483          	ld	s1,8(sp)
    80003380:	00013903          	ld	s2,0(sp)
    80003384:	02010113          	addi	sp,sp,32
    80003388:	00008067          	ret
            head = tail = elem;
    8000338c:	00a4b823          	sd	a0,16(s1)
    80003390:	00a4b423          	sd	a0,8(s1)
    80003394:	fd9ff06f          	j	8000336c <_ZN4_sem5blockEv+0x54>

0000000080003398 <_ZN4_sem4waitEv>:
    if(--value < 0)
    80003398:	00052783          	lw	a5,0(a0)
    8000339c:	fff7879b          	addiw	a5,a5,-1
    800033a0:	00f52023          	sw	a5,0(a0)
    800033a4:	02079713          	slli	a4,a5,0x20
    800033a8:	00074463          	bltz	a4,800033b0 <_ZN4_sem4waitEv+0x18>
    800033ac:	00008067          	ret
void _sem::wait() {
    800033b0:	ff010113          	addi	sp,sp,-16
    800033b4:	00113423          	sd	ra,8(sp)
    800033b8:	00813023          	sd	s0,0(sp)
    800033bc:	01010413          	addi	s0,sp,16
        block();
    800033c0:	00000097          	auipc	ra,0x0
    800033c4:	f58080e7          	jalr	-168(ra) # 80003318 <_ZN4_sem5blockEv>
}
    800033c8:	00813083          	ld	ra,8(sp)
    800033cc:	00013403          	ld	s0,0(sp)
    800033d0:	01010113          	addi	sp,sp,16
    800033d4:	00008067          	ret

00000000800033d8 <_ZN4_sem7unblockEv>:

void _sem::unblock() {
    800033d8:	fe010113          	addi	sp,sp,-32
    800033dc:	00113c23          	sd	ra,24(sp)
    800033e0:	00813823          	sd	s0,16(sp)
    800033e4:	00913423          	sd	s1,8(sp)
    800033e8:	02010413          	addi	s0,sp,32
    800033ec:	00050793          	mv	a5,a0
        if (!head)
    800033f0:	00853503          	ld	a0,8(a0)
    800033f4:	04050663          	beqz	a0,80003440 <_ZN4_sem7unblockEv+0x68>
        head = head->next;
    800033f8:	00853703          	ld	a4,8(a0)
    800033fc:	00e7b423          	sd	a4,8(a5)
        if (!head)
    80003400:	02070c63          	beqz	a4,80003438 <_ZN4_sem7unblockEv+0x60>
        T *ret = elem->data;
    80003404:	00053483          	ld	s1,0(a0)
        delete elem;
    80003408:	ffffe097          	auipc	ra,0xffffe
    8000340c:	eac080e7          	jalr	-340(ra) # 800012b4 <_ZdlPv>
    80003410:	00100793          	li	a5,1
    80003414:	02f4ac23          	sw	a5,56(s1)
    TCB* t = blocked.removeFirst();
    t->setStatus(TCB::RUNNING);
    Scheduler::put(t);
    80003418:	00048513          	mv	a0,s1
    8000341c:	fffff097          	auipc	ra,0xfffff
    80003420:	988080e7          	jalr	-1656(ra) # 80001da4 <_ZN9Scheduler3putEP3TCB>
}
    80003424:	01813083          	ld	ra,24(sp)
    80003428:	01013403          	ld	s0,16(sp)
    8000342c:	00813483          	ld	s1,8(sp)
    80003430:	02010113          	addi	sp,sp,32
    80003434:	00008067          	ret
            tail = 0;
    80003438:	0007b823          	sd	zero,16(a5)
    8000343c:	fc9ff06f          	j	80003404 <_ZN4_sem7unblockEv+0x2c>
            return 0;
    80003440:	00050493          	mv	s1,a0
    80003444:	fcdff06f          	j	80003410 <_ZN4_sem7unblockEv+0x38>

0000000080003448 <_ZN4_sem6signalEv>:
    if(++value <= 0)
    80003448:	00052783          	lw	a5,0(a0)
    8000344c:	0017879b          	addiw	a5,a5,1
    80003450:	0007871b          	sext.w	a4,a5
    80003454:	00f52023          	sw	a5,0(a0)
    80003458:	00e05463          	blez	a4,80003460 <_ZN4_sem6signalEv+0x18>
    8000345c:	00008067          	ret
void _sem::signal() {
    80003460:	ff010113          	addi	sp,sp,-16
    80003464:	00113423          	sd	ra,8(sp)
    80003468:	00813023          	sd	s0,0(sp)
    8000346c:	01010413          	addi	s0,sp,16
        unblock();
    80003470:	00000097          	auipc	ra,0x0
    80003474:	f68080e7          	jalr	-152(ra) # 800033d8 <_ZN4_sem7unblockEv>
}
    80003478:	00813083          	ld	ra,8(sp)
    8000347c:	00013403          	ld	s0,0(sp)
    80003480:	01010113          	addi	sp,sp,16
    80003484:	00008067          	ret

0000000080003488 <_ZN4_sem5closeEv>:

int _sem::close(){
    80003488:	fe010113          	addi	sp,sp,-32
    8000348c:	00113c23          	sd	ra,24(sp)
    80003490:	00813823          	sd	s0,16(sp)
    80003494:	00913423          	sd	s1,8(sp)
    80003498:	01213023          	sd	s2,0(sp)
    8000349c:	02010413          	addi	s0,sp,32
    800034a0:	00050913          	mv	s2,a0
        if (!head)
    800034a4:	00853503          	ld	a0,8(a0)
    800034a8:	02050463          	beqz	a0,800034d0 <_ZN4_sem5closeEv+0x48>
        head = head->next;
    800034ac:	00853783          	ld	a5,8(a0)
    800034b0:	00f93423          	sd	a5,8(s2)
        if (!head)
    800034b4:	00078a63          	beqz	a5,800034c8 <_ZN4_sem5closeEv+0x40>
        T *ret = elem->data;
    800034b8:	00053483          	ld	s1,0(a0)
        delete elem;
    800034bc:	ffffe097          	auipc	ra,0xffffe
    800034c0:	df8080e7          	jalr	-520(ra) # 800012b4 <_ZdlPv>
        return ret;
    800034c4:	0240006f          	j	800034e8 <_ZN4_sem5closeEv+0x60>
            tail = 0;
    800034c8:	00093823          	sd	zero,16(s2)
    800034cc:	fedff06f          	j	800034b8 <_ZN4_sem5closeEv+0x30>
            return 0;
    800034d0:	00050493          	mv	s1,a0
    800034d4:	0140006f          	j	800034e8 <_ZN4_sem5closeEv+0x60>
            tail = 0;
    800034d8:	00093823          	sd	zero,16(s2)
        T *ret = elem->data;
    800034dc:	00053483          	ld	s1,0(a0)
        delete elem;
    800034e0:	ffffe097          	auipc	ra,0xffffe
    800034e4:	dd4080e7          	jalr	-556(ra) # 800012b4 <_ZdlPv>
    TCB* thread;
    for(thread = blocked.removeFirst(); thread;){
    800034e8:	02048863          	beqz	s1,80003518 <_ZN4_sem5closeEv+0x90>
    800034ec:	00100793          	li	a5,1
    800034f0:	02f4ac23          	sw	a5,56(s1)
        thread->setStatus(TCB::RUNNING);
        Scheduler::put(thread);
    800034f4:	00048513          	mv	a0,s1
    800034f8:	fffff097          	auipc	ra,0xfffff
    800034fc:	8ac080e7          	jalr	-1876(ra) # 80001da4 <_ZN9Scheduler3putEP3TCB>
        if (!head)
    80003500:	00893503          	ld	a0,8(s2)
    80003504:	00050a63          	beqz	a0,80003518 <_ZN4_sem5closeEv+0x90>
        head = head->next;
    80003508:	00853783          	ld	a5,8(a0)
    8000350c:	00f93423          	sd	a5,8(s2)
        if (!head)
    80003510:	fc0796e3          	bnez	a5,800034dc <_ZN4_sem5closeEv+0x54>
    80003514:	fc5ff06f          	j	800034d8 <_ZN4_sem5closeEv+0x50>
        thread = blocked.removeFirst();
    }
    return 0;
}
    80003518:	00000513          	li	a0,0
    8000351c:	01813083          	ld	ra,24(sp)
    80003520:	01013403          	ld	s0,16(sp)
    80003524:	00813483          	ld	s1,8(sp)
    80003528:	00013903          	ld	s2,0(sp)
    8000352c:	02010113          	addi	sp,sp,32
    80003530:	00008067          	ret

0000000080003534 <_Z4randv>:
class Riscv;
extern void  producerConsumer_C_API();

#define MAX 400
int number = 2;
int rand(){
    80003534:	9b010113          	addi	sp,sp,-1616
    80003538:	64813423          	sd	s0,1608(sp)
    8000353c:	65010413          	addi	s0,sp,1616
    int r[MAX];
    int i;

    r[0] = 1;
    80003540:	00100793          	li	a5,1
    80003544:	9af42823          	sw	a5,-1616(s0)
    for (i=1; i<31; i++) {
    80003548:	00100713          	li	a4,1
    8000354c:	0200006f          	j	8000356c <_Z4randv+0x38>
        r[i] = (16807LL * r[i-1]) % 2147483647;
        if (r[i] < 0) {
            r[i] += 2147483647;
    80003550:	00271693          	slli	a3,a4,0x2
    80003554:	00d606b3          	add	a3,a2,a3
    80003558:	80000637          	lui	a2,0x80000
    8000355c:	fff64613          	not	a2,a2
    80003560:	00c787bb          	addw	a5,a5,a2
    80003564:	9cf6a023          	sw	a5,-1600(a3)
    for (i=1; i<31; i++) {
    80003568:	0017071b          	addiw	a4,a4,1
    8000356c:	01e00793          	li	a5,30
    80003570:	04e7c663          	blt	a5,a4,800035bc <_Z4randv+0x88>
        r[i] = (16807LL * r[i-1]) % 2147483647;
    80003574:	fff7079b          	addiw	a5,a4,-1
    80003578:	00279793          	slli	a5,a5,0x2
    8000357c:	ff040693          	addi	a3,s0,-16
    80003580:	00f687b3          	add	a5,a3,a5
    80003584:	9c07a783          	lw	a5,-1600(a5)
    80003588:	000046b7          	lui	a3,0x4
    8000358c:	1a768693          	addi	a3,a3,423 # 41a7 <_entry-0x7fffbe59>
    80003590:	02d787b3          	mul	a5,a5,a3
    80003594:	800006b7          	lui	a3,0x80000
    80003598:	fff6c693          	not	a3,a3
    8000359c:	02d7e7b3          	rem	a5,a5,a3
    800035a0:	0007879b          	sext.w	a5,a5
    800035a4:	00271693          	slli	a3,a4,0x2
    800035a8:	ff040613          	addi	a2,s0,-16
    800035ac:	00d606b3          	add	a3,a2,a3
    800035b0:	9cf6a023          	sw	a5,-1600(a3) # ffffffff7ffff9c0 <end+0xfffffffeffff6170>
        if (r[i] < 0) {
    800035b4:	fa07dae3          	bgez	a5,80003568 <_Z4randv+0x34>
    800035b8:	f99ff06f          	j	80003550 <_Z4randv+0x1c>
        }
    }
    for (i=31; i<34; i++) {
    800035bc:	01f00713          	li	a4,31
    800035c0:	02100793          	li	a5,33
    800035c4:	02e7c863          	blt	a5,a4,800035f4 <_Z4randv+0xc0>
        r[i] = r[i-31];
    800035c8:	fe17079b          	addiw	a5,a4,-31
    800035cc:	00279793          	slli	a5,a5,0x2
    800035d0:	ff040693          	addi	a3,s0,-16
    800035d4:	00f687b3          	add	a5,a3,a5
    800035d8:	9c07a683          	lw	a3,-1600(a5)
    800035dc:	00271793          	slli	a5,a4,0x2
    800035e0:	ff040613          	addi	a2,s0,-16
    800035e4:	00f607b3          	add	a5,a2,a5
    800035e8:	9cd7a023          	sw	a3,-1600(a5)
    for (i=31; i<34; i++) {
    800035ec:	0017071b          	addiw	a4,a4,1
    800035f0:	fd1ff06f          	j	800035c0 <_Z4randv+0x8c>
    }
    for (i=34; i<344; i++) {
    800035f4:	02200793          	li	a5,34
    800035f8:	15700713          	li	a4,343
    800035fc:	04f74263          	blt	a4,a5,80003640 <_Z4randv+0x10c>
        r[i] = r[i-31] + r[i-3];
    80003600:	fe17871b          	addiw	a4,a5,-31
    80003604:	00271713          	slli	a4,a4,0x2
    80003608:	ff040693          	addi	a3,s0,-16
    8000360c:	00e68733          	add	a4,a3,a4
    80003610:	9c072683          	lw	a3,-1600(a4)
    80003614:	ffd7871b          	addiw	a4,a5,-3
    80003618:	00271713          	slli	a4,a4,0x2
    8000361c:	ff040613          	addi	a2,s0,-16
    80003620:	00e60733          	add	a4,a2,a4
    80003624:	9c072703          	lw	a4,-1600(a4)
    80003628:	00e686bb          	addw	a3,a3,a4
    8000362c:	00279713          	slli	a4,a5,0x2
    80003630:	00e60733          	add	a4,a2,a4
    80003634:	9cd72023          	sw	a3,-1600(a4)
    for (i=34; i<344; i++) {
    80003638:	0017879b          	addiw	a5,a5,1
    8000363c:	fbdff06f          	j	800035f8 <_Z4randv+0xc4>
    }
    for (i=344; i<MAX; i++) {
    80003640:	15800793          	li	a5,344
    80003644:	18f00713          	li	a4,399
    80003648:	04f74263          	blt	a4,a5,8000368c <_Z4randv+0x158>
        r[i] = r[i-31] + r[i-3];
    8000364c:	fe17871b          	addiw	a4,a5,-31
    80003650:	00271713          	slli	a4,a4,0x2
    80003654:	ff040693          	addi	a3,s0,-16
    80003658:	00e68733          	add	a4,a3,a4
    8000365c:	9c072683          	lw	a3,-1600(a4)
    80003660:	ffd7871b          	addiw	a4,a5,-3
    80003664:	00271713          	slli	a4,a4,0x2
    80003668:	ff040613          	addi	a2,s0,-16
    8000366c:	00e60733          	add	a4,a2,a4
    80003670:	9c072703          	lw	a4,-1600(a4)
    80003674:	00e686bb          	addw	a3,a3,a4
    80003678:	00279713          	slli	a4,a5,0x2
    8000367c:	00e60733          	add	a4,a2,a4
    80003680:	9cd72023          	sw	a3,-1600(a4)
    for (i=344; i<MAX; i++) {
    80003684:	0017879b          	addiw	a5,a5,1
    80003688:	fbdff06f          	j	80003644 <_Z4randv+0x110>
    }

    return r[number++];
    8000368c:	00005717          	auipc	a4,0x5
    80003690:	d9c70713          	addi	a4,a4,-612 # 80008428 <number>
    80003694:	00072783          	lw	a5,0(a4)
    80003698:	0017869b          	addiw	a3,a5,1
    8000369c:	00d72023          	sw	a3,0(a4)
    800036a0:	00279793          	slli	a5,a5,0x2
    800036a4:	ff040713          	addi	a4,s0,-16
    800036a8:	00f707b3          	add	a5,a4,a5
}
    800036ac:	9c07a503          	lw	a0,-1600(a5)
    800036b0:	64813403          	ld	s0,1608(sp)
    800036b4:	65010113          	addi	sp,sp,1616
    800036b8:	00008067          	ret

00000000800036bc <_Z14uzivaUCigaretii>:
sem_t mutexIspisi;
sem_t DuvanIPapir, PapirISibice, SibiceIDuvan;
sem_t izgorelaCigareta;


void uzivaUCigareti(int pusac) {
    800036bc:	fd010113          	addi	sp,sp,-48
    800036c0:	02113423          	sd	ra,40(sp)
    800036c4:	02813023          	sd	s0,32(sp)
    800036c8:	00913c23          	sd	s1,24(sp)
    800036cc:	01213823          	sd	s2,16(sp)
    800036d0:	03010413          	addi	s0,sp,48
    800036d4:	00050493          	mv	s1,a0

    sem_wait(mutexIspisi);
    800036d8:	00005917          	auipc	s2,0x5
    800036dc:	ec090913          	addi	s2,s2,-320 # 80008598 <mutexIspisi>
    800036e0:	00093503          	ld	a0,0(s2)
    800036e4:	ffffe097          	auipc	ra,0xffffe
    800036e8:	0dc080e7          	jalr	220(ra) # 800017c0 <_Z8sem_waitP4_sem>
    char pusaci[] = {'P', 'M', 'L'};
    800036ec:	000057b7          	lui	a5,0x5
    800036f0:	d507879b          	addiw	a5,a5,-688
    800036f4:	fcf41c23          	sh	a5,-40(s0)
    800036f8:	04c00793          	li	a5,76
    800036fc:	fcf40d23          	sb	a5,-38(s0)
    __putc(pusaci[pusac]); printString(" uziva u cigareti.\n");
    80003700:	fe040793          	addi	a5,s0,-32
    80003704:	009784b3          	add	s1,a5,s1
    80003708:	ff84c503          	lbu	a0,-8(s1)
    8000370c:	00003097          	auipc	ra,0x3
    80003710:	de4080e7          	jalr	-540(ra) # 800064f0 <__putc>
    80003714:	00004517          	auipc	a0,0x4
    80003718:	afc50513          	addi	a0,a0,-1284 # 80007210 <CONSOLE_STATUS+0x200>
    8000371c:	00000097          	auipc	ra,0x0
    80003720:	51c080e7          	jalr	1308(ra) # 80003c38 <_Z11printStringPKc>

    sem_signal(mutexIspisi);
    80003724:	00093503          	ld	a0,0(s2)
    80003728:	ffffe097          	auipc	ra,0xffffe
    8000372c:	0d0080e7          	jalr	208(ra) # 800017f8 <_Z10sem_signalP4_sem>

    time_sleep(20);
    80003730:	01400513          	li	a0,20
    80003734:	ffffe097          	auipc	ra,0xffffe
    80003738:	0fc080e7          	jalr	252(ra) # 80001830 <_Z10time_sleepm>

}
    8000373c:	02813083          	ld	ra,40(sp)
    80003740:	02013403          	ld	s0,32(sp)
    80003744:	01813483          	ld	s1,24(sp)
    80003748:	01013903          	ld	s2,16(sp)
    8000374c:	03010113          	addi	sp,sp,48
    80003750:	00008067          	ret

0000000080003754 <_Z9dilerJovaPv>:


void dilerJova(void* param) {
    80003754:	fe010113          	addi	sp,sp,-32
    80003758:	00113c23          	sd	ra,24(sp)
    8000375c:	00813823          	sd	s0,16(sp)
    80003760:	00913423          	sd	s1,8(sp)
    80003764:	02010413          	addi	s0,sp,32
    80003768:	0440006f          	j	800037ac <_Z9dilerJovaPv+0x58>

            case 0: printString("duvan i papir.\n");
                sem_signal(DuvanIPapir);
                break;

            case 1: printString("papir i sibice.\n");
    8000376c:	00004517          	auipc	a0,0x4
    80003770:	adc50513          	addi	a0,a0,-1316 # 80007248 <CONSOLE_STATUS+0x238>
    80003774:	00000097          	auipc	ra,0x0
    80003778:	4c4080e7          	jalr	1220(ra) # 80003c38 <_Z11printStringPKc>
                sem_signal(PapirISibice);
    8000377c:	00005517          	auipc	a0,0x5
    80003780:	e2c53503          	ld	a0,-468(a0) # 800085a8 <PapirISibice>
    80003784:	ffffe097          	auipc	ra,0xffffe
    80003788:	074080e7          	jalr	116(ra) # 800017f8 <_Z10sem_signalP4_sem>
                sem_signal(SibiceIDuvan);
                break;

        }

        sem_signal(mutexIspisi);
    8000378c:	00005497          	auipc	s1,0x5
    80003790:	e0c48493          	addi	s1,s1,-500 # 80008598 <mutexIspisi>
    80003794:	0004b503          	ld	a0,0(s1)
    80003798:	ffffe097          	auipc	ra,0xffffe
    8000379c:	060080e7          	jalr	96(ra) # 800017f8 <_Z10sem_signalP4_sem>
        sem_wait(izgorelaCigareta);
    800037a0:	0204b503          	ld	a0,32(s1)
    800037a4:	ffffe097          	auipc	ra,0xffffe
    800037a8:	01c080e7          	jalr	28(ra) # 800017c0 <_Z8sem_waitP4_sem>
        int r = rand() % 3;
    800037ac:	00000097          	auipc	ra,0x0
    800037b0:	d88080e7          	jalr	-632(ra) # 80003534 <_Z4randv>
    800037b4:	00300493          	li	s1,3
    800037b8:	029564bb          	remw	s1,a0,s1
        sem_wait(mutexIspisi);
    800037bc:	00005517          	auipc	a0,0x5
    800037c0:	ddc53503          	ld	a0,-548(a0) # 80008598 <mutexIspisi>
    800037c4:	ffffe097          	auipc	ra,0xffffe
    800037c8:	ffc080e7          	jalr	-4(ra) # 800017c0 <_Z8sem_waitP4_sem>
        printString("Na stolu su ");
    800037cc:	00004517          	auipc	a0,0x4
    800037d0:	a5c50513          	addi	a0,a0,-1444 # 80007228 <CONSOLE_STATUS+0x218>
    800037d4:	00000097          	auipc	ra,0x0
    800037d8:	464080e7          	jalr	1124(ra) # 80003c38 <_Z11printStringPKc>
        switch(r) { // odabir sta diler trenutno ima
    800037dc:	00100793          	li	a5,1
    800037e0:	f8f486e3          	beq	s1,a5,8000376c <_Z9dilerJovaPv+0x18>
    800037e4:	00200793          	li	a5,2
    800037e8:	02f48663          	beq	s1,a5,80003814 <_Z9dilerJovaPv+0xc0>
    800037ec:	fa0490e3          	bnez	s1,8000378c <_Z9dilerJovaPv+0x38>
            case 0: printString("duvan i papir.\n");
    800037f0:	00004517          	auipc	a0,0x4
    800037f4:	a4850513          	addi	a0,a0,-1464 # 80007238 <CONSOLE_STATUS+0x228>
    800037f8:	00000097          	auipc	ra,0x0
    800037fc:	440080e7          	jalr	1088(ra) # 80003c38 <_Z11printStringPKc>
                sem_signal(DuvanIPapir);
    80003800:	00005517          	auipc	a0,0x5
    80003804:	da053503          	ld	a0,-608(a0) # 800085a0 <DuvanIPapir>
    80003808:	ffffe097          	auipc	ra,0xffffe
    8000380c:	ff0080e7          	jalr	-16(ra) # 800017f8 <_Z10sem_signalP4_sem>
                break;
    80003810:	f7dff06f          	j	8000378c <_Z9dilerJovaPv+0x38>
            case 2: printString("sibice i duvan.\n");
    80003814:	00004517          	auipc	a0,0x4
    80003818:	a4c50513          	addi	a0,a0,-1460 # 80007260 <CONSOLE_STATUS+0x250>
    8000381c:	00000097          	auipc	ra,0x0
    80003820:	41c080e7          	jalr	1052(ra) # 80003c38 <_Z11printStringPKc>
                sem_signal(SibiceIDuvan);
    80003824:	00005517          	auipc	a0,0x5
    80003828:	d8c53503          	ld	a0,-628(a0) # 800085b0 <SibiceIDuvan>
    8000382c:	ffffe097          	auipc	ra,0xffffe
    80003830:	fcc080e7          	jalr	-52(ra) # 800017f8 <_Z10sem_signalP4_sem>
                break;
    80003834:	f59ff06f          	j	8000378c <_Z9dilerJovaPv+0x38>

0000000080003838 <_Z9pusacPeraPv>:

    }

}

void pusacPera(void* param) { // uvek ima sibice
    80003838:	fe010113          	addi	sp,sp,-32
    8000383c:	00113c23          	sd	ra,24(sp)
    80003840:	00813823          	sd	s0,16(sp)
    80003844:	00913423          	sd	s1,8(sp)
    80003848:	02010413          	addi	s0,sp,32

    while(1){

        sem_wait(DuvanIPapir);
    8000384c:	00005497          	auipc	s1,0x5
    80003850:	d4c48493          	addi	s1,s1,-692 # 80008598 <mutexIspisi>
    80003854:	0084b503          	ld	a0,8(s1)
    80003858:	ffffe097          	auipc	ra,0xffffe
    8000385c:	f68080e7          	jalr	-152(ra) # 800017c0 <_Z8sem_waitP4_sem>

        uzivaUCigareti(0);
    80003860:	00000513          	li	a0,0
    80003864:	00000097          	auipc	ra,0x0
    80003868:	e58080e7          	jalr	-424(ra) # 800036bc <_Z14uzivaUCigaretii>

        sem_signal(izgorelaCigareta);
    8000386c:	0204b503          	ld	a0,32(s1)
    80003870:	ffffe097          	auipc	ra,0xffffe
    80003874:	f88080e7          	jalr	-120(ra) # 800017f8 <_Z10sem_signalP4_sem>
    while(1){
    80003878:	fd5ff06f          	j	8000384c <_Z9pusacPeraPv+0x14>

000000008000387c <_Z9pusacMikaPv>:

    }

}

void pusacMika(void* param) { // uvek ima duvan
    8000387c:	fe010113          	addi	sp,sp,-32
    80003880:	00113c23          	sd	ra,24(sp)
    80003884:	00813823          	sd	s0,16(sp)
    80003888:	00913423          	sd	s1,8(sp)
    8000388c:	02010413          	addi	s0,sp,32

    while(1){
        sem_wait(PapirISibice);
    80003890:	00005497          	auipc	s1,0x5
    80003894:	d0848493          	addi	s1,s1,-760 # 80008598 <mutexIspisi>
    80003898:	0104b503          	ld	a0,16(s1)
    8000389c:	ffffe097          	auipc	ra,0xffffe
    800038a0:	f24080e7          	jalr	-220(ra) # 800017c0 <_Z8sem_waitP4_sem>
        uzivaUCigareti(1);
    800038a4:	00100513          	li	a0,1
    800038a8:	00000097          	auipc	ra,0x0
    800038ac:	e14080e7          	jalr	-492(ra) # 800036bc <_Z14uzivaUCigaretii>
        sem_signal(izgorelaCigareta);
    800038b0:	0204b503          	ld	a0,32(s1)
    800038b4:	ffffe097          	auipc	ra,0xffffe
    800038b8:	f44080e7          	jalr	-188(ra) # 800017f8 <_Z10sem_signalP4_sem>
    while(1){
    800038bc:	fd5ff06f          	j	80003890 <_Z9pusacMikaPv+0x14>

00000000800038c0 <_Z9pusacLazaPv>:
    }

}

void pusacLaza(void* param) { // uvek ima papir
    800038c0:	fe010113          	addi	sp,sp,-32
    800038c4:	00113c23          	sd	ra,24(sp)
    800038c8:	00813823          	sd	s0,16(sp)
    800038cc:	00913423          	sd	s1,8(sp)
    800038d0:	02010413          	addi	s0,sp,32

    while(1){
        sem_signal(SibiceIDuvan);
    800038d4:	00005497          	auipc	s1,0x5
    800038d8:	cc448493          	addi	s1,s1,-828 # 80008598 <mutexIspisi>
    800038dc:	0184b503          	ld	a0,24(s1)
    800038e0:	ffffe097          	auipc	ra,0xffffe
    800038e4:	f18080e7          	jalr	-232(ra) # 800017f8 <_Z10sem_signalP4_sem>
        uzivaUCigareti(2);
    800038e8:	00200513          	li	a0,2
    800038ec:	00000097          	auipc	ra,0x0
    800038f0:	dd0080e7          	jalr	-560(ra) # 800036bc <_Z14uzivaUCigaretii>
        sem_signal(izgorelaCigareta);
    800038f4:	0204b503          	ld	a0,32(s1)
    800038f8:	ffffe097          	auipc	ra,0xffffe
    800038fc:	f00080e7          	jalr	-256(ra) # 800017f8 <_Z10sem_signalP4_sem>
    while(1){
    80003900:	fd5ff06f          	j	800038d4 <_Z9pusacLazaPv+0x14>

0000000080003904 <_Z8userMainPv>:
}

extern void Threads_C_API_test();

extern void testSleeping();
void userMain(void* ){
    80003904:	ff010113          	addi	sp,sp,-16
    80003908:	00113423          	sd	ra,8(sp)
    8000390c:	00813023          	sd	s0,0(sp)
    80003910:	01010413          	addi	s0,sp,16
    thread_create(&laza, pusacLaza, nullptr);*/

    //producerConsumer_C_API();

   // testSleeping();
   Threads_C_API_test();
    80003914:	fffff097          	auipc	ra,0xfffff
    80003918:	44c080e7          	jalr	1100(ra) # 80002d60 <_Z18Threads_C_API_testv>
    8000391c:	00813083          	ld	ra,8(sp)
    80003920:	00013403          	ld	s0,0(sp)
    80003924:	01010113          	addi	sp,sp,16
    80003928:	00008067          	ret

000000008000392c <_ZN3TCB5inputEPv>:
#include "../h/riscv.hpp"
#include "../h/scheduler.hpp"
#include "../lib/mem.h"
// TODO brisanje steka

void TCB::input(void* arg){
    8000392c:	fe010113          	addi	sp,sp,-32
    80003930:	00113c23          	sd	ra,24(sp)
    80003934:	00813823          	sd	s0,16(sp)
    80003938:	00913423          	sd	s1,8(sp)
    8000393c:	02010413          	addi	s0,sp,32
    80003940:	00c0006f          	j	8000394c <_ZN3TCB5inputEPv+0x20>
        while (status & CONSOLE_RX_STATUS_BIT) {
            c = (*(char*) CONSOLE_RX_DATA);
            Riscv::inputBuffer->put(c);
            status = *((char*)CONSOLE_STATUS);
        }
        thread_dispatch();
    80003944:	ffffe097          	auipc	ra,0xffffe
    80003948:	de4080e7          	jalr	-540(ra) # 80001728 <_Z15thread_dispatchv>
    __asm__ volatile ("csrc sstatus, %[mask]" : : [mask] "r"(mask));
    8000394c:	00200793          	li	a5,2
    80003950:	1007b073          	csrc	sstatus,a5
        char status = *((char *)CONSOLE_STATUS);
    80003954:	00005797          	auipc	a5,0x5
    80003958:	b047b783          	ld	a5,-1276(a5) # 80008458 <_GLOBAL_OFFSET_TABLE_+0x10>
    8000395c:	0007b483          	ld	s1,0(a5)
    80003960:	0004c783          	lbu	a5,0(s1)
        while (status & CONSOLE_RX_STATUS_BIT) {
    80003964:	0017f793          	andi	a5,a5,1
    80003968:	fc078ee3          	beqz	a5,80003944 <_ZN3TCB5inputEPv+0x18>
            c = (*(char*) CONSOLE_RX_DATA);
    8000396c:	00005797          	auipc	a5,0x5
    80003970:	ae47b783          	ld	a5,-1308(a5) # 80008450 <_GLOBAL_OFFSET_TABLE_+0x8>
    80003974:	0007b783          	ld	a5,0(a5)
            Riscv::inputBuffer->put(c);
    80003978:	0007c583          	lbu	a1,0(a5)
    8000397c:	00005797          	auipc	a5,0x5
    80003980:	b447b783          	ld	a5,-1212(a5) # 800084c0 <_GLOBAL_OFFSET_TABLE_+0x78>
    80003984:	0007b503          	ld	a0,0(a5)
    80003988:	ffffe097          	auipc	ra,0xffffe
    8000398c:	03c080e7          	jalr	60(ra) # 800019c4 <_ZN7_buffer3putEc>
            status = *((char*)CONSOLE_STATUS);
    80003990:	0004c783          	lbu	a5,0(s1)
        while (status & CONSOLE_RX_STATUS_BIT) {
    80003994:	fd1ff06f          	j	80003964 <_ZN3TCB5inputEPv+0x38>

0000000080003998 <_ZN3TCB6outputEPv>:
    }
}

void TCB::output(void* arg) {
    80003998:	fe010113          	addi	sp,sp,-32
    8000399c:	00113c23          	sd	ra,24(sp)
    800039a0:	00813823          	sd	s0,16(sp)
    800039a4:	00913423          	sd	s1,8(sp)
    800039a8:	02010413          	addi	s0,sp,32
    800039ac:	00c0006f          	j	800039b8 <_ZN3TCB6outputEPv+0x20>
        while (status & CONSOLE_TX_STATUS_BIT) {
            c = Riscv::outputBuffer->get();
            (*(char*) CONSOLE_TX_DATA) = c;
            status = *((char*)CONSOLE_STATUS);
        }
        thread_dispatch();
    800039b0:	ffffe097          	auipc	ra,0xffffe
    800039b4:	d78080e7          	jalr	-648(ra) # 80001728 <_Z15thread_dispatchv>
    800039b8:	00200793          	li	a5,2
    800039bc:	1007b073          	csrc	sstatus,a5
        char status = *((char *) CONSOLE_STATUS);
    800039c0:	00005797          	auipc	a5,0x5
    800039c4:	a987b783          	ld	a5,-1384(a5) # 80008458 <_GLOBAL_OFFSET_TABLE_+0x10>
    800039c8:	0007b483          	ld	s1,0(a5)
    800039cc:	0004c783          	lbu	a5,0(s1)
        while (status & CONSOLE_TX_STATUS_BIT) {
    800039d0:	0207f793          	andi	a5,a5,32
    800039d4:	fc078ee3          	beqz	a5,800039b0 <_ZN3TCB6outputEPv+0x18>
            c = Riscv::outputBuffer->get();
    800039d8:	00005797          	auipc	a5,0x5
    800039dc:	ad07b783          	ld	a5,-1328(a5) # 800084a8 <_GLOBAL_OFFSET_TABLE_+0x60>
    800039e0:	0007b503          	ld	a0,0(a5)
    800039e4:	ffffe097          	auipc	ra,0xffffe
    800039e8:	06c080e7          	jalr	108(ra) # 80001a50 <_ZN7_buffer3getEv>
            (*(char*) CONSOLE_TX_DATA) = c;
    800039ec:	00005797          	auipc	a5,0x5
    800039f0:	a947b783          	ld	a5,-1388(a5) # 80008480 <_GLOBAL_OFFSET_TABLE_+0x38>
    800039f4:	0007b783          	ld	a5,0(a5)
    800039f8:	00a78023          	sb	a0,0(a5)
            status = *((char*)CONSOLE_STATUS);
    800039fc:	0004c783          	lbu	a5,0(s1)
        while (status & CONSOLE_TX_STATUS_BIT) {
    80003a00:	fd1ff06f          	j	800039d0 <_ZN3TCB6outputEPv+0x38>

0000000080003a04 <_ZN3TCB5yieldEv>:
    }
}
void TCB::yield() {
    80003a04:	ff010113          	addi	sp,sp,-16
    80003a08:	00813423          	sd	s0,8(sp)
    80003a0c:	01010413          	addi	s0,sp,16
    __asm__ volatile("mv a0, %[var]" : : [var] "r"(THREAD_YIELD));
    80003a10:	01400793          	li	a5,20
    80003a14:	00078513          	mv	a0,a5
    __asm__ volatile("ecall");
    80003a18:	00000073          	ecall
}
    80003a1c:	00813403          	ld	s0,8(sp)
    80003a20:	01010113          	addi	sp,sp,16
    80003a24:	00008067          	ret

0000000080003a28 <_ZN3TCB13threadWrapperEv>:
    //Riscv::popSppSpie();
     while(true){
         thread_dispatch();
     }
}
void TCB::threadWrapper(){
    80003a28:	fe010113          	addi	sp,sp,-32
    80003a2c:	00113c23          	sd	ra,24(sp)
    80003a30:	00813823          	sd	s0,16(sp)
    80003a34:	00913423          	sd	s1,8(sp)
    80003a38:	02010413          	addi	s0,sp,32
    Riscv::popSppSpie();
    80003a3c:	ffffe097          	auipc	ra,0xffffe
    80003a40:	408080e7          	jalr	1032(ra) # 80001e44 <_ZN5Riscv10popSppSpieEv>
    running->body(running->args);
    80003a44:	00005497          	auipc	s1,0x5
    80003a48:	b7c48493          	addi	s1,s1,-1156 # 800085c0 <_ZN3TCB7runningE>
    80003a4c:	0004b783          	ld	a5,0(s1)
    80003a50:	0087b703          	ld	a4,8(a5)
    80003a54:	0107b503          	ld	a0,16(a5)
    80003a58:	000700e7          	jalr	a4
    running->setStatus(FINISHED);
    80003a5c:	0004b783          	ld	a5,0(s1)
    void setStatus(threadStatus status) { this->status = status; }
    80003a60:	0207ac23          	sw	zero,56(a5)
    TCB::yield();
    80003a64:	00000097          	auipc	ra,0x0
    80003a68:	fa0080e7          	jalr	-96(ra) # 80003a04 <_ZN3TCB5yieldEv>
}
    80003a6c:	01813083          	ld	ra,24(sp)
    80003a70:	01013403          	ld	s0,16(sp)
    80003a74:	00813483          	ld	s1,8(sp)
    80003a78:	02010113          	addi	sp,sp,32
    80003a7c:	00008067          	ret

0000000080003a80 <_ZN3TCB8dispatchEv>:
void TCB::dispatch(){
    80003a80:	fe010113          	addi	sp,sp,-32
    80003a84:	00113c23          	sd	ra,24(sp)
    80003a88:	00813823          	sd	s0,16(sp)
    80003a8c:	00913423          	sd	s1,8(sp)
    80003a90:	02010413          	addi	s0,sp,32
    TCB* old = running;
    80003a94:	00005497          	auipc	s1,0x5
    80003a98:	b2c4b483          	ld	s1,-1236(s1) # 800085c0 <_ZN3TCB7runningE>
    threadStatus getStatus() const { return status; }
    80003a9c:	0384a703          	lw	a4,56(s1)
    if(old->getStatus() == RUNNING)
    80003aa0:	00100793          	li	a5,1
    80003aa4:	02f70c63          	beq	a4,a5,80003adc <_ZN3TCB8dispatchEv+0x5c>
    running = Scheduler::get();
    80003aa8:	ffffe097          	auipc	ra,0xffffe
    80003aac:	294080e7          	jalr	660(ra) # 80001d3c <_ZN9Scheduler3getEv>
    80003ab0:	00005797          	auipc	a5,0x5
    80003ab4:	b0a7b823          	sd	a0,-1264(a5) # 800085c0 <_ZN3TCB7runningE>
    TCB::contextSwitch(&old->context, &running->context);
    80003ab8:	02050593          	addi	a1,a0,32
    80003abc:	02048513          	addi	a0,s1,32
    80003ac0:	ffffd097          	auipc	ra,0xffffd
    80003ac4:	770080e7          	jalr	1904(ra) # 80001230 <_ZN3TCB13contextSwitchEPNS_7ContextES1_>
}
    80003ac8:	01813083          	ld	ra,24(sp)
    80003acc:	01013403          	ld	s0,16(sp)
    80003ad0:	00813483          	ld	s1,8(sp)
    80003ad4:	02010113          	addi	sp,sp,32
    80003ad8:	00008067          	ret
        Scheduler::put(old);
    80003adc:	00048513          	mv	a0,s1
    80003ae0:	ffffe097          	auipc	ra,0xffffe
    80003ae4:	2c4080e7          	jalr	708(ra) # 80001da4 <_ZN9Scheduler3putEP3TCB>
    80003ae8:	fc1ff06f          	j	80003aa8 <_ZN3TCB8dispatchEv+0x28>

0000000080003aec <_ZN3TCB12createThreadEPPS_PFvPvES2_Pm>:
int TCB::createThread(thread_t* handle, Body body, void* args, uint64* stack) {
    80003aec:	fc010113          	addi	sp,sp,-64
    80003af0:	02113c23          	sd	ra,56(sp)
    80003af4:	02813823          	sd	s0,48(sp)
    80003af8:	02913423          	sd	s1,40(sp)
    80003afc:	03213023          	sd	s2,32(sp)
    80003b00:	01313c23          	sd	s3,24(sp)
    80003b04:	01413823          	sd	s4,16(sp)
    80003b08:	01513423          	sd	s5,8(sp)
    80003b0c:	04010413          	addi	s0,sp,64
    80003b10:	00050a13          	mv	s4,a0
    80003b14:	00058993          	mv	s3,a1
    80003b18:	00060a93          	mv	s5,a2
    80003b1c:	00068913          	mv	s2,a3
    TCB* thread  = new TCB(body, args, stack);
    80003b20:	04000513          	li	a0,64
    80003b24:	ffffd097          	auipc	ra,0xffffd
    80003b28:	740080e7          	jalr	1856(ra) # 80001264 <_Znwm>
    80003b2c:	00050493          	mv	s1,a0
        body(body),
        args(args),
        stack(stack),
        context({(uint64)&threadWrapper, stack != nullptr ? (uint64)&stack[DEFAULT_STACK_SIZE] : 0}),
        timeSlice(DEFAULT_TIME_SLICE),
        status(RUNNING){
    80003b30:	01353423          	sd	s3,8(a0)
    80003b34:	01553823          	sd	s5,16(a0)
    80003b38:	01253c23          	sd	s2,24(a0)
    80003b3c:	00000797          	auipc	a5,0x0
    80003b40:	eec78793          	addi	a5,a5,-276 # 80003a28 <_ZN3TCB13threadWrapperEv>
    80003b44:	02f53023          	sd	a5,32(a0)
        context({(uint64)&threadWrapper, stack != nullptr ? (uint64)&stack[DEFAULT_STACK_SIZE] : 0}),
    80003b48:	04090663          	beqz	s2,80003b94 <_ZN3TCB12createThreadEPPS_PFvPvES2_Pm+0xa8>
    80003b4c:	000086b7          	lui	a3,0x8
    80003b50:	00d90933          	add	s2,s2,a3
        status(RUNNING){
    80003b54:	0324b423          	sd	s2,40(s1)
    80003b58:	00200793          	li	a5,2
    80003b5c:	02f4b823          	sd	a5,48(s1)
    80003b60:	00100793          	li	a5,1
    80003b64:	02f4ac23          	sw	a5,56(s1)

          pid = ++counter;
    80003b68:	00005717          	auipc	a4,0x5
    80003b6c:	a5870713          	addi	a4,a4,-1448 # 800085c0 <_ZN3TCB7runningE>
    80003b70:	00872783          	lw	a5,8(a4)
    80003b74:	0017879b          	addiw	a5,a5,1
    80003b78:	00f72423          	sw	a5,8(a4)
    80003b7c:	00f4a023          	sw	a5,0(s1)
          if (body != nullptr) {
    80003b80:	02098c63          	beqz	s3,80003bb8 <_ZN3TCB12createThreadEPPS_PFvPvES2_Pm+0xcc>
              Scheduler::put(this);
    80003b84:	00048513          	mv	a0,s1
    80003b88:	ffffe097          	auipc	ra,0xffffe
    80003b8c:	21c080e7          	jalr	540(ra) # 80001da4 <_ZN9Scheduler3putEP3TCB>
    80003b90:	0280006f          	j	80003bb8 <_ZN3TCB12createThreadEPPS_PFvPvES2_Pm+0xcc>
        context({(uint64)&threadWrapper, stack != nullptr ? (uint64)&stack[DEFAULT_STACK_SIZE] : 0}),
    80003b94:	00000913          	li	s2,0
    80003b98:	fbdff06f          	j	80003b54 <_ZN3TCB12createThreadEPPS_PFvPvES2_Pm+0x68>
    80003b9c:	00050913          	mv	s2,a0
    80003ba0:	00048513          	mv	a0,s1
    80003ba4:	ffffd097          	auipc	ra,0xffffd
    80003ba8:	710080e7          	jalr	1808(ra) # 800012b4 <_ZdlPv>
    80003bac:	00090513          	mv	a0,s2
    80003bb0:	00006097          	auipc	ra,0x6
    80003bb4:	af8080e7          	jalr	-1288(ra) # 800096a8 <_Unwind_Resume>
    *handle = thread;
    80003bb8:	009a3023          	sd	s1,0(s4)
}
    80003bbc:	00000513          	li	a0,0
    80003bc0:	03813083          	ld	ra,56(sp)
    80003bc4:	03013403          	ld	s0,48(sp)
    80003bc8:	02813483          	ld	s1,40(sp)
    80003bcc:	02013903          	ld	s2,32(sp)
    80003bd0:	01813983          	ld	s3,24(sp)
    80003bd4:	01013a03          	ld	s4,16(sp)
    80003bd8:	00813a83          	ld	s5,8(sp)
    80003bdc:	04010113          	addi	sp,sp,64
    80003be0:	00008067          	ret

0000000080003be4 <_ZN3TCB10stopThreadEv>:
int TCB::stopThread() {
    80003be4:	ff010113          	addi	sp,sp,-16
    80003be8:	00113423          	sd	ra,8(sp)
    80003bec:	00813023          	sd	s0,0(sp)
    80003bf0:	01010413          	addi	s0,sp,16
    running->setStatus(FINISHED);
    80003bf4:	00005797          	auipc	a5,0x5
    80003bf8:	9cc7b783          	ld	a5,-1588(a5) # 800085c0 <_ZN3TCB7runningE>
    void setStatus(threadStatus status) { this->status = status; }
    80003bfc:	0207ac23          	sw	zero,56(a5)
    TCB::dispatch();
    80003c00:	00000097          	auipc	ra,0x0
    80003c04:	e80080e7          	jalr	-384(ra) # 80003a80 <_ZN3TCB8dispatchEv>
}
    80003c08:	00000513          	li	a0,0
    80003c0c:	00813083          	ld	ra,8(sp)
    80003c10:	00013403          	ld	s0,0(sp)
    80003c14:	01010113          	addi	sp,sp,16
    80003c18:	00008067          	ret

0000000080003c1c <_ZN3TCB4idleEPv>:
void TCB::idle(void* arg){
    80003c1c:	ff010113          	addi	sp,sp,-16
    80003c20:	00113423          	sd	ra,8(sp)
    80003c24:	00813023          	sd	s0,0(sp)
    80003c28:	01010413          	addi	s0,sp,16
         thread_dispatch();
    80003c2c:	ffffe097          	auipc	ra,0xffffe
    80003c30:	afc080e7          	jalr	-1284(ra) # 80001728 <_Z15thread_dispatchv>
     while(true){
    80003c34:	ff9ff06f          	j	80003c2c <_ZN3TCB4idleEPv+0x10>

0000000080003c38 <_Z11printStringPKc>:

#define LOCK() while(copy_and_swap(lockPrint, 0, 1))
#define UNLOCK() while(copy_and_swap(lockPrint, 1, 0))

void printString(char const *string)
{
    80003c38:	fe010113          	addi	sp,sp,-32
    80003c3c:	00113c23          	sd	ra,24(sp)
    80003c40:	00813823          	sd	s0,16(sp)
    80003c44:	00913423          	sd	s1,8(sp)
    80003c48:	02010413          	addi	s0,sp,32
    80003c4c:	00050493          	mv	s1,a0
    LOCK();
    80003c50:	00100613          	li	a2,1
    80003c54:	00000593          	li	a1,0
    80003c58:	00005517          	auipc	a0,0x5
    80003c5c:	98050513          	addi	a0,a0,-1664 # 800085d8 <lockPrint>
    80003c60:	ffffd097          	auipc	ra,0xffffd
    80003c64:	5e4080e7          	jalr	1508(ra) # 80001244 <copy_and_swap>
    80003c68:	fe0514e3          	bnez	a0,80003c50 <_Z11printStringPKc+0x18>
    while (*string != '\0')
    80003c6c:	0004c503          	lbu	a0,0(s1)
    80003c70:	00050a63          	beqz	a0,80003c84 <_Z11printStringPKc+0x4c>
    {
        putc(*string);
    80003c74:	ffffe097          	auipc	ra,0xffffe
    80003c78:	c28080e7          	jalr	-984(ra) # 8000189c <_Z4putcc>
        string++;
    80003c7c:	00148493          	addi	s1,s1,1
    while (*string != '\0')
    80003c80:	fedff06f          	j	80003c6c <_Z11printStringPKc+0x34>
    }
    UNLOCK();
    80003c84:	00000613          	li	a2,0
    80003c88:	00100593          	li	a1,1
    80003c8c:	00005517          	auipc	a0,0x5
    80003c90:	94c50513          	addi	a0,a0,-1716 # 800085d8 <lockPrint>
    80003c94:	ffffd097          	auipc	ra,0xffffd
    80003c98:	5b0080e7          	jalr	1456(ra) # 80001244 <copy_and_swap>
    80003c9c:	fe0514e3          	bnez	a0,80003c84 <_Z11printStringPKc+0x4c>
}
    80003ca0:	01813083          	ld	ra,24(sp)
    80003ca4:	01013403          	ld	s0,16(sp)
    80003ca8:	00813483          	ld	s1,8(sp)
    80003cac:	02010113          	addi	sp,sp,32
    80003cb0:	00008067          	ret

0000000080003cb4 <_Z9getStringPci>:

char* getString(char *buf, int max) {
    80003cb4:	fd010113          	addi	sp,sp,-48
    80003cb8:	02113423          	sd	ra,40(sp)
    80003cbc:	02813023          	sd	s0,32(sp)
    80003cc0:	00913c23          	sd	s1,24(sp)
    80003cc4:	01213823          	sd	s2,16(sp)
    80003cc8:	01313423          	sd	s3,8(sp)
    80003ccc:	01413023          	sd	s4,0(sp)
    80003cd0:	03010413          	addi	s0,sp,48
    80003cd4:	00050993          	mv	s3,a0
    80003cd8:	00058a13          	mv	s4,a1
    LOCK();
    80003cdc:	00100613          	li	a2,1
    80003ce0:	00000593          	li	a1,0
    80003ce4:	00005517          	auipc	a0,0x5
    80003ce8:	8f450513          	addi	a0,a0,-1804 # 800085d8 <lockPrint>
    80003cec:	ffffd097          	auipc	ra,0xffffd
    80003cf0:	558080e7          	jalr	1368(ra) # 80001244 <copy_and_swap>
    80003cf4:	fe0514e3          	bnez	a0,80003cdc <_Z9getStringPci+0x28>
    int i, cc;
    char c;

    for(i=0; i+1 < max; ){
    80003cf8:	00000913          	li	s2,0
    80003cfc:	00090493          	mv	s1,s2
    80003d00:	0019091b          	addiw	s2,s2,1
    80003d04:	03495a63          	bge	s2,s4,80003d38 <_Z9getStringPci+0x84>
        cc = getc();
    80003d08:	ffffe097          	auipc	ra,0xffffe
    80003d0c:	b60080e7          	jalr	-1184(ra) # 80001868 <_Z4getcv>
        if(cc < 1)
    80003d10:	02050463          	beqz	a0,80003d38 <_Z9getStringPci+0x84>
            break;
        c = cc;
        buf[i++] = c;
    80003d14:	009984b3          	add	s1,s3,s1
    80003d18:	00a48023          	sb	a0,0(s1)
        if(c == '\n' || c == '\r')
    80003d1c:	00a00793          	li	a5,10
    80003d20:	00f50a63          	beq	a0,a5,80003d34 <_Z9getStringPci+0x80>
    80003d24:	00d00793          	li	a5,13
    80003d28:	fcf51ae3          	bne	a0,a5,80003cfc <_Z9getStringPci+0x48>
        buf[i++] = c;
    80003d2c:	00090493          	mv	s1,s2
    80003d30:	0080006f          	j	80003d38 <_Z9getStringPci+0x84>
    80003d34:	00090493          	mv	s1,s2
            break;
    }
    buf[i] = '\0';
    80003d38:	009984b3          	add	s1,s3,s1
    80003d3c:	00048023          	sb	zero,0(s1)

    UNLOCK();
    80003d40:	00000613          	li	a2,0
    80003d44:	00100593          	li	a1,1
    80003d48:	00005517          	auipc	a0,0x5
    80003d4c:	89050513          	addi	a0,a0,-1904 # 800085d8 <lockPrint>
    80003d50:	ffffd097          	auipc	ra,0xffffd
    80003d54:	4f4080e7          	jalr	1268(ra) # 80001244 <copy_and_swap>
    80003d58:	fe0514e3          	bnez	a0,80003d40 <_Z9getStringPci+0x8c>
    return buf;
}
    80003d5c:	00098513          	mv	a0,s3
    80003d60:	02813083          	ld	ra,40(sp)
    80003d64:	02013403          	ld	s0,32(sp)
    80003d68:	01813483          	ld	s1,24(sp)
    80003d6c:	01013903          	ld	s2,16(sp)
    80003d70:	00813983          	ld	s3,8(sp)
    80003d74:	00013a03          	ld	s4,0(sp)
    80003d78:	03010113          	addi	sp,sp,48
    80003d7c:	00008067          	ret

0000000080003d80 <_Z11stringToIntPKc>:

int stringToInt(const char *s) {
    80003d80:	ff010113          	addi	sp,sp,-16
    80003d84:	00813423          	sd	s0,8(sp)
    80003d88:	01010413          	addi	s0,sp,16
    80003d8c:	00050693          	mv	a3,a0
    int n;

    n = 0;
    80003d90:	00000513          	li	a0,0
    while ('0' <= *s && *s <= '9')
    80003d94:	0006c603          	lbu	a2,0(a3) # 8000 <_entry-0x7fff8000>
    80003d98:	fd06071b          	addiw	a4,a2,-48
    80003d9c:	0ff77713          	andi	a4,a4,255
    80003da0:	00900793          	li	a5,9
    80003da4:	02e7e063          	bltu	a5,a4,80003dc4 <_Z11stringToIntPKc+0x44>
        n = n * 10 + *s++ - '0';
    80003da8:	0025179b          	slliw	a5,a0,0x2
    80003dac:	00a787bb          	addw	a5,a5,a0
    80003db0:	0017979b          	slliw	a5,a5,0x1
    80003db4:	00168693          	addi	a3,a3,1
    80003db8:	00c787bb          	addw	a5,a5,a2
    80003dbc:	fd07851b          	addiw	a0,a5,-48
    while ('0' <= *s && *s <= '9')
    80003dc0:	fd5ff06f          	j	80003d94 <_Z11stringToIntPKc+0x14>
    return n;
}
    80003dc4:	00813403          	ld	s0,8(sp)
    80003dc8:	01010113          	addi	sp,sp,16
    80003dcc:	00008067          	ret

0000000080003dd0 <_Z8printIntiii>:

char digits[] = "0123456789ABCDEF";

void printInt(int xx, int base, int sgn)
{
    80003dd0:	fc010113          	addi	sp,sp,-64
    80003dd4:	02113c23          	sd	ra,56(sp)
    80003dd8:	02813823          	sd	s0,48(sp)
    80003ddc:	02913423          	sd	s1,40(sp)
    80003de0:	03213023          	sd	s2,32(sp)
    80003de4:	01313c23          	sd	s3,24(sp)
    80003de8:	04010413          	addi	s0,sp,64
    80003dec:	00050493          	mv	s1,a0
    80003df0:	00058913          	mv	s2,a1
    80003df4:	00060993          	mv	s3,a2
    LOCK();
    80003df8:	00100613          	li	a2,1
    80003dfc:	00000593          	li	a1,0
    80003e00:	00004517          	auipc	a0,0x4
    80003e04:	7d850513          	addi	a0,a0,2008 # 800085d8 <lockPrint>
    80003e08:	ffffd097          	auipc	ra,0xffffd
    80003e0c:	43c080e7          	jalr	1084(ra) # 80001244 <copy_and_swap>
    80003e10:	fe0514e3          	bnez	a0,80003df8 <_Z8printIntiii+0x28>
    char buf[16];
    int i, neg;
    uint x;

    neg = 0;
    if(sgn && xx < 0){
    80003e14:	00098463          	beqz	s3,80003e1c <_Z8printIntiii+0x4c>
    80003e18:	0804c463          	bltz	s1,80003ea0 <_Z8printIntiii+0xd0>
        neg = 1;
        x = -xx;
    } else {
        x = xx;
    80003e1c:	0004851b          	sext.w	a0,s1
    neg = 0;
    80003e20:	00000593          	li	a1,0
    }

    i = 0;
    80003e24:	00000493          	li	s1,0
    do{
        buf[i++] = digits[x % base];
    80003e28:	0009079b          	sext.w	a5,s2
    80003e2c:	0325773b          	remuw	a4,a0,s2
    80003e30:	00048613          	mv	a2,s1
    80003e34:	0014849b          	addiw	s1,s1,1
    80003e38:	02071693          	slli	a3,a4,0x20
    80003e3c:	0206d693          	srli	a3,a3,0x20
    80003e40:	00004717          	auipc	a4,0x4
    80003e44:	5f070713          	addi	a4,a4,1520 # 80008430 <digits>
    80003e48:	00d70733          	add	a4,a4,a3
    80003e4c:	00074683          	lbu	a3,0(a4)
    80003e50:	fd040713          	addi	a4,s0,-48
    80003e54:	00c70733          	add	a4,a4,a2
    80003e58:	fed70823          	sb	a3,-16(a4)
    }while((x /= base) != 0);
    80003e5c:	0005071b          	sext.w	a4,a0
    80003e60:	0325553b          	divuw	a0,a0,s2
    80003e64:	fcf772e3          	bgeu	a4,a5,80003e28 <_Z8printIntiii+0x58>
    if(neg)
    80003e68:	00058c63          	beqz	a1,80003e80 <_Z8printIntiii+0xb0>
        buf[i++] = '-';
    80003e6c:	fd040793          	addi	a5,s0,-48
    80003e70:	009784b3          	add	s1,a5,s1
    80003e74:	02d00793          	li	a5,45
    80003e78:	fef48823          	sb	a5,-16(s1)
    80003e7c:	0026049b          	addiw	s1,a2,2

    while(--i >= 0)
    80003e80:	fff4849b          	addiw	s1,s1,-1
    80003e84:	0204c463          	bltz	s1,80003eac <_Z8printIntiii+0xdc>
        putc(buf[i]);
    80003e88:	fd040793          	addi	a5,s0,-48
    80003e8c:	009787b3          	add	a5,a5,s1
    80003e90:	ff07c503          	lbu	a0,-16(a5)
    80003e94:	ffffe097          	auipc	ra,0xffffe
    80003e98:	a08080e7          	jalr	-1528(ra) # 8000189c <_Z4putcc>
    80003e9c:	fe5ff06f          	j	80003e80 <_Z8printIntiii+0xb0>
        x = -xx;
    80003ea0:	4090053b          	negw	a0,s1
        neg = 1;
    80003ea4:	00100593          	li	a1,1
        x = -xx;
    80003ea8:	f7dff06f          	j	80003e24 <_Z8printIntiii+0x54>

    UNLOCK();
    80003eac:	00000613          	li	a2,0
    80003eb0:	00100593          	li	a1,1
    80003eb4:	00004517          	auipc	a0,0x4
    80003eb8:	72450513          	addi	a0,a0,1828 # 800085d8 <lockPrint>
    80003ebc:	ffffd097          	auipc	ra,0xffffd
    80003ec0:	388080e7          	jalr	904(ra) # 80001244 <copy_and_swap>
    80003ec4:	fe0514e3          	bnez	a0,80003eac <_Z8printIntiii+0xdc>
    80003ec8:	03813083          	ld	ra,56(sp)
    80003ecc:	03013403          	ld	s0,48(sp)
    80003ed0:	02813483          	ld	s1,40(sp)
    80003ed4:	02013903          	ld	s2,32(sp)
    80003ed8:	01813983          	ld	s3,24(sp)
    80003edc:	04010113          	addi	sp,sp,64
    80003ee0:	00008067          	ret

0000000080003ee4 <_ZN6BufferC1Ei>:
#include "buffer.hpp"

Buffer::Buffer(int _cap) : cap(_cap + 1), head(0), tail(0) {
    80003ee4:	fe010113          	addi	sp,sp,-32
    80003ee8:	00113c23          	sd	ra,24(sp)
    80003eec:	00813823          	sd	s0,16(sp)
    80003ef0:	00913423          	sd	s1,8(sp)
    80003ef4:	01213023          	sd	s2,0(sp)
    80003ef8:	02010413          	addi	s0,sp,32
    80003efc:	00050493          	mv	s1,a0
    80003f00:	00058913          	mv	s2,a1
    80003f04:	0015879b          	addiw	a5,a1,1
    80003f08:	0007851b          	sext.w	a0,a5
    80003f0c:	00f4a023          	sw	a5,0(s1)
    80003f10:	0004a823          	sw	zero,16(s1)
    80003f14:	0004aa23          	sw	zero,20(s1)
    buffer = (int *)mem_alloc(sizeof(int) * cap);
    80003f18:	00251513          	slli	a0,a0,0x2
    80003f1c:	ffffd097          	auipc	ra,0xffffd
    80003f20:	6c4080e7          	jalr	1732(ra) # 800015e0 <_Z9mem_allocm>
    80003f24:	00a4b423          	sd	a0,8(s1)
    sem_open(&itemAvailable, 0);
    80003f28:	00000593          	li	a1,0
    80003f2c:	02048513          	addi	a0,s1,32
    80003f30:	ffffe097          	auipc	ra,0xffffe
    80003f34:	81c080e7          	jalr	-2020(ra) # 8000174c <_Z8sem_openPP4_semj>
    sem_open(&spaceAvailable, _cap);
    80003f38:	00090593          	mv	a1,s2
    80003f3c:	01848513          	addi	a0,s1,24
    80003f40:	ffffe097          	auipc	ra,0xffffe
    80003f44:	80c080e7          	jalr	-2036(ra) # 8000174c <_Z8sem_openPP4_semj>
    sem_open(&mutexHead, 1);
    80003f48:	00100593          	li	a1,1
    80003f4c:	02848513          	addi	a0,s1,40
    80003f50:	ffffd097          	auipc	ra,0xffffd
    80003f54:	7fc080e7          	jalr	2044(ra) # 8000174c <_Z8sem_openPP4_semj>
    sem_open(&mutexTail, 1);
    80003f58:	00100593          	li	a1,1
    80003f5c:	03048513          	addi	a0,s1,48
    80003f60:	ffffd097          	auipc	ra,0xffffd
    80003f64:	7ec080e7          	jalr	2028(ra) # 8000174c <_Z8sem_openPP4_semj>
}
    80003f68:	01813083          	ld	ra,24(sp)
    80003f6c:	01013403          	ld	s0,16(sp)
    80003f70:	00813483          	ld	s1,8(sp)
    80003f74:	00013903          	ld	s2,0(sp)
    80003f78:	02010113          	addi	sp,sp,32
    80003f7c:	00008067          	ret

0000000080003f80 <_ZN6Buffer3putEi>:
    sem_close(spaceAvailable);
    sem_close(mutexTail);
    sem_close(mutexHead);
}

void Buffer::put(int val) {
    80003f80:	fe010113          	addi	sp,sp,-32
    80003f84:	00113c23          	sd	ra,24(sp)
    80003f88:	00813823          	sd	s0,16(sp)
    80003f8c:	00913423          	sd	s1,8(sp)
    80003f90:	01213023          	sd	s2,0(sp)
    80003f94:	02010413          	addi	s0,sp,32
    80003f98:	00050493          	mv	s1,a0
    80003f9c:	00058913          	mv	s2,a1
    sem_wait(spaceAvailable);
    80003fa0:	01853503          	ld	a0,24(a0)
    80003fa4:	ffffe097          	auipc	ra,0xffffe
    80003fa8:	81c080e7          	jalr	-2020(ra) # 800017c0 <_Z8sem_waitP4_sem>

    sem_wait(mutexTail);
    80003fac:	0304b503          	ld	a0,48(s1)
    80003fb0:	ffffe097          	auipc	ra,0xffffe
    80003fb4:	810080e7          	jalr	-2032(ra) # 800017c0 <_Z8sem_waitP4_sem>
    buffer[tail] = val;
    80003fb8:	0084b783          	ld	a5,8(s1)
    80003fbc:	0144a703          	lw	a4,20(s1)
    80003fc0:	00271713          	slli	a4,a4,0x2
    80003fc4:	00e787b3          	add	a5,a5,a4
    80003fc8:	0127a023          	sw	s2,0(a5)
    tail = (tail + 1) % cap;
    80003fcc:	0144a783          	lw	a5,20(s1)
    80003fd0:	0017879b          	addiw	a5,a5,1
    80003fd4:	0004a703          	lw	a4,0(s1)
    80003fd8:	02e7e7bb          	remw	a5,a5,a4
    80003fdc:	00f4aa23          	sw	a5,20(s1)
    sem_signal(mutexTail);
    80003fe0:	0304b503          	ld	a0,48(s1)
    80003fe4:	ffffe097          	auipc	ra,0xffffe
    80003fe8:	814080e7          	jalr	-2028(ra) # 800017f8 <_Z10sem_signalP4_sem>

    sem_signal(itemAvailable);
    80003fec:	0204b503          	ld	a0,32(s1)
    80003ff0:	ffffe097          	auipc	ra,0xffffe
    80003ff4:	808080e7          	jalr	-2040(ra) # 800017f8 <_Z10sem_signalP4_sem>

}
    80003ff8:	01813083          	ld	ra,24(sp)
    80003ffc:	01013403          	ld	s0,16(sp)
    80004000:	00813483          	ld	s1,8(sp)
    80004004:	00013903          	ld	s2,0(sp)
    80004008:	02010113          	addi	sp,sp,32
    8000400c:	00008067          	ret

0000000080004010 <_ZN6Buffer3getEv>:

int Buffer::get() {
    80004010:	fe010113          	addi	sp,sp,-32
    80004014:	00113c23          	sd	ra,24(sp)
    80004018:	00813823          	sd	s0,16(sp)
    8000401c:	00913423          	sd	s1,8(sp)
    80004020:	01213023          	sd	s2,0(sp)
    80004024:	02010413          	addi	s0,sp,32
    80004028:	00050493          	mv	s1,a0
    sem_wait(itemAvailable);
    8000402c:	02053503          	ld	a0,32(a0)
    80004030:	ffffd097          	auipc	ra,0xffffd
    80004034:	790080e7          	jalr	1936(ra) # 800017c0 <_Z8sem_waitP4_sem>

    sem_wait(mutexHead);
    80004038:	0284b503          	ld	a0,40(s1)
    8000403c:	ffffd097          	auipc	ra,0xffffd
    80004040:	784080e7          	jalr	1924(ra) # 800017c0 <_Z8sem_waitP4_sem>

    int ret = buffer[head];
    80004044:	0084b703          	ld	a4,8(s1)
    80004048:	0104a783          	lw	a5,16(s1)
    8000404c:	00279693          	slli	a3,a5,0x2
    80004050:	00d70733          	add	a4,a4,a3
    80004054:	00072903          	lw	s2,0(a4)
    head = (head + 1) % cap;
    80004058:	0017879b          	addiw	a5,a5,1
    8000405c:	0004a703          	lw	a4,0(s1)
    80004060:	02e7e7bb          	remw	a5,a5,a4
    80004064:	00f4a823          	sw	a5,16(s1)
    sem_signal(mutexHead);
    80004068:	0284b503          	ld	a0,40(s1)
    8000406c:	ffffd097          	auipc	ra,0xffffd
    80004070:	78c080e7          	jalr	1932(ra) # 800017f8 <_Z10sem_signalP4_sem>

    sem_signal(spaceAvailable);
    80004074:	0184b503          	ld	a0,24(s1)
    80004078:	ffffd097          	auipc	ra,0xffffd
    8000407c:	780080e7          	jalr	1920(ra) # 800017f8 <_Z10sem_signalP4_sem>

    return ret;
}
    80004080:	00090513          	mv	a0,s2
    80004084:	01813083          	ld	ra,24(sp)
    80004088:	01013403          	ld	s0,16(sp)
    8000408c:	00813483          	ld	s1,8(sp)
    80004090:	00013903          	ld	s2,0(sp)
    80004094:	02010113          	addi	sp,sp,32
    80004098:	00008067          	ret

000000008000409c <_ZN6Buffer6getCntEv>:

int Buffer::getCnt() {
    8000409c:	fe010113          	addi	sp,sp,-32
    800040a0:	00113c23          	sd	ra,24(sp)
    800040a4:	00813823          	sd	s0,16(sp)
    800040a8:	00913423          	sd	s1,8(sp)
    800040ac:	01213023          	sd	s2,0(sp)
    800040b0:	02010413          	addi	s0,sp,32
    800040b4:	00050493          	mv	s1,a0
    int ret;

    sem_wait(mutexHead);
    800040b8:	02853503          	ld	a0,40(a0)
    800040bc:	ffffd097          	auipc	ra,0xffffd
    800040c0:	704080e7          	jalr	1796(ra) # 800017c0 <_Z8sem_waitP4_sem>
    sem_wait(mutexTail);
    800040c4:	0304b503          	ld	a0,48(s1)
    800040c8:	ffffd097          	auipc	ra,0xffffd
    800040cc:	6f8080e7          	jalr	1784(ra) # 800017c0 <_Z8sem_waitP4_sem>

    if (tail >= head) {
    800040d0:	0144a783          	lw	a5,20(s1)
    800040d4:	0104a903          	lw	s2,16(s1)
    800040d8:	0327ce63          	blt	a5,s2,80004114 <_ZN6Buffer6getCntEv+0x78>
        ret = tail - head;
    800040dc:	4127893b          	subw	s2,a5,s2
    } else {
        ret = cap - head + tail;
    }

    sem_signal(mutexTail);
    800040e0:	0304b503          	ld	a0,48(s1)
    800040e4:	ffffd097          	auipc	ra,0xffffd
    800040e8:	714080e7          	jalr	1812(ra) # 800017f8 <_Z10sem_signalP4_sem>
    sem_signal(mutexHead);
    800040ec:	0284b503          	ld	a0,40(s1)
    800040f0:	ffffd097          	auipc	ra,0xffffd
    800040f4:	708080e7          	jalr	1800(ra) # 800017f8 <_Z10sem_signalP4_sem>

    return ret;
}
    800040f8:	00090513          	mv	a0,s2
    800040fc:	01813083          	ld	ra,24(sp)
    80004100:	01013403          	ld	s0,16(sp)
    80004104:	00813483          	ld	s1,8(sp)
    80004108:	00013903          	ld	s2,0(sp)
    8000410c:	02010113          	addi	sp,sp,32
    80004110:	00008067          	ret
        ret = cap - head + tail;
    80004114:	0004a703          	lw	a4,0(s1)
    80004118:	4127093b          	subw	s2,a4,s2
    8000411c:	00f9093b          	addw	s2,s2,a5
    80004120:	fc1ff06f          	j	800040e0 <_ZN6Buffer6getCntEv+0x44>

0000000080004124 <_ZN6BufferD1Ev>:
Buffer::~Buffer() {
    80004124:	fe010113          	addi	sp,sp,-32
    80004128:	00113c23          	sd	ra,24(sp)
    8000412c:	00813823          	sd	s0,16(sp)
    80004130:	00913423          	sd	s1,8(sp)
    80004134:	02010413          	addi	s0,sp,32
    80004138:	00050493          	mv	s1,a0
    putc('\n');
    8000413c:	00a00513          	li	a0,10
    80004140:	ffffd097          	auipc	ra,0xffffd
    80004144:	75c080e7          	jalr	1884(ra) # 8000189c <_Z4putcc>
    printString("Buffer deleted!\n");
    80004148:	00003517          	auipc	a0,0x3
    8000414c:	13050513          	addi	a0,a0,304 # 80007278 <CONSOLE_STATUS+0x268>
    80004150:	00000097          	auipc	ra,0x0
    80004154:	ae8080e7          	jalr	-1304(ra) # 80003c38 <_Z11printStringPKc>
    while (getCnt() > 0) {
    80004158:	00048513          	mv	a0,s1
    8000415c:	00000097          	auipc	ra,0x0
    80004160:	f40080e7          	jalr	-192(ra) # 8000409c <_ZN6Buffer6getCntEv>
    80004164:	02a05c63          	blez	a0,8000419c <_ZN6BufferD1Ev+0x78>
        char ch = buffer[head];
    80004168:	0084b783          	ld	a5,8(s1)
    8000416c:	0104a703          	lw	a4,16(s1)
    80004170:	00271713          	slli	a4,a4,0x2
    80004174:	00e787b3          	add	a5,a5,a4
        putc(ch);
    80004178:	0007c503          	lbu	a0,0(a5)
    8000417c:	ffffd097          	auipc	ra,0xffffd
    80004180:	720080e7          	jalr	1824(ra) # 8000189c <_Z4putcc>
        head = (head + 1) % cap;
    80004184:	0104a783          	lw	a5,16(s1)
    80004188:	0017879b          	addiw	a5,a5,1
    8000418c:	0004a703          	lw	a4,0(s1)
    80004190:	02e7e7bb          	remw	a5,a5,a4
    80004194:	00f4a823          	sw	a5,16(s1)
    while (getCnt() > 0) {
    80004198:	fc1ff06f          	j	80004158 <_ZN6BufferD1Ev+0x34>
    putc('!');
    8000419c:	02100513          	li	a0,33
    800041a0:	ffffd097          	auipc	ra,0xffffd
    800041a4:	6fc080e7          	jalr	1788(ra) # 8000189c <_Z4putcc>
    putc('\n');
    800041a8:	00a00513          	li	a0,10
    800041ac:	ffffd097          	auipc	ra,0xffffd
    800041b0:	6f0080e7          	jalr	1776(ra) # 8000189c <_Z4putcc>
    mem_free(buffer);
    800041b4:	0084b503          	ld	a0,8(s1)
    800041b8:	ffffd097          	auipc	ra,0xffffd
    800041bc:	47c080e7          	jalr	1148(ra) # 80001634 <_Z8mem_freePv>
    sem_close(itemAvailable);
    800041c0:	0204b503          	ld	a0,32(s1)
    800041c4:	ffffd097          	auipc	ra,0xffffd
    800041c8:	5c4080e7          	jalr	1476(ra) # 80001788 <_Z9sem_closeP4_sem>
    sem_close(spaceAvailable);
    800041cc:	0184b503          	ld	a0,24(s1)
    800041d0:	ffffd097          	auipc	ra,0xffffd
    800041d4:	5b8080e7          	jalr	1464(ra) # 80001788 <_Z9sem_closeP4_sem>
    sem_close(mutexTail);
    800041d8:	0304b503          	ld	a0,48(s1)
    800041dc:	ffffd097          	auipc	ra,0xffffd
    800041e0:	5ac080e7          	jalr	1452(ra) # 80001788 <_Z9sem_closeP4_sem>
    sem_close(mutexHead);
    800041e4:	0284b503          	ld	a0,40(s1)
    800041e8:	ffffd097          	auipc	ra,0xffffd
    800041ec:	5a0080e7          	jalr	1440(ra) # 80001788 <_Z9sem_closeP4_sem>
}
    800041f0:	01813083          	ld	ra,24(sp)
    800041f4:	01013403          	ld	s0,16(sp)
    800041f8:	00813483          	ld	s1,8(sp)
    800041fc:	02010113          	addi	sp,sp,32
    80004200:	00008067          	ret

0000000080004204 <start>:
    80004204:	ff010113          	addi	sp,sp,-16
    80004208:	00813423          	sd	s0,8(sp)
    8000420c:	01010413          	addi	s0,sp,16
    80004210:	300027f3          	csrr	a5,mstatus
    80004214:	ffffe737          	lui	a4,0xffffe
    80004218:	7ff70713          	addi	a4,a4,2047 # ffffffffffffe7ff <end+0xffffffff7fff4faf>
    8000421c:	00e7f7b3          	and	a5,a5,a4
    80004220:	00001737          	lui	a4,0x1
    80004224:	80070713          	addi	a4,a4,-2048 # 800 <_entry-0x7ffff800>
    80004228:	00e7e7b3          	or	a5,a5,a4
    8000422c:	30079073          	csrw	mstatus,a5
    80004230:	00000797          	auipc	a5,0x0
    80004234:	16078793          	addi	a5,a5,352 # 80004390 <system_main>
    80004238:	34179073          	csrw	mepc,a5
    8000423c:	00000793          	li	a5,0
    80004240:	18079073          	csrw	satp,a5
    80004244:	000107b7          	lui	a5,0x10
    80004248:	fff78793          	addi	a5,a5,-1 # ffff <_entry-0x7fff0001>
    8000424c:	30279073          	csrw	medeleg,a5
    80004250:	30379073          	csrw	mideleg,a5
    80004254:	104027f3          	csrr	a5,sie
    80004258:	2227e793          	ori	a5,a5,546
    8000425c:	10479073          	csrw	sie,a5
    80004260:	fff00793          	li	a5,-1
    80004264:	00a7d793          	srli	a5,a5,0xa
    80004268:	3b079073          	csrw	pmpaddr0,a5
    8000426c:	00f00793          	li	a5,15
    80004270:	3a079073          	csrw	pmpcfg0,a5
    80004274:	f14027f3          	csrr	a5,mhartid
    80004278:	0200c737          	lui	a4,0x200c
    8000427c:	ff873583          	ld	a1,-8(a4) # 200bff8 <_entry-0x7dff4008>
    80004280:	0007869b          	sext.w	a3,a5
    80004284:	00269713          	slli	a4,a3,0x2
    80004288:	000f4637          	lui	a2,0xf4
    8000428c:	24060613          	addi	a2,a2,576 # f4240 <_entry-0x7ff0bdc0>
    80004290:	00d70733          	add	a4,a4,a3
    80004294:	0037979b          	slliw	a5,a5,0x3
    80004298:	020046b7          	lui	a3,0x2004
    8000429c:	00d787b3          	add	a5,a5,a3
    800042a0:	00c585b3          	add	a1,a1,a2
    800042a4:	00371693          	slli	a3,a4,0x3
    800042a8:	00004717          	auipc	a4,0x4
    800042ac:	33870713          	addi	a4,a4,824 # 800085e0 <timer_scratch>
    800042b0:	00b7b023          	sd	a1,0(a5)
    800042b4:	00d70733          	add	a4,a4,a3
    800042b8:	00f73c23          	sd	a5,24(a4)
    800042bc:	02c73023          	sd	a2,32(a4)
    800042c0:	34071073          	csrw	mscratch,a4
    800042c4:	00000797          	auipc	a5,0x0
    800042c8:	6ec78793          	addi	a5,a5,1772 # 800049b0 <timervec>
    800042cc:	30579073          	csrw	mtvec,a5
    800042d0:	300027f3          	csrr	a5,mstatus
    800042d4:	0087e793          	ori	a5,a5,8
    800042d8:	30079073          	csrw	mstatus,a5
    800042dc:	304027f3          	csrr	a5,mie
    800042e0:	0807e793          	ori	a5,a5,128
    800042e4:	30479073          	csrw	mie,a5
    800042e8:	f14027f3          	csrr	a5,mhartid
    800042ec:	0007879b          	sext.w	a5,a5
    800042f0:	00078213          	mv	tp,a5
    800042f4:	30200073          	mret
    800042f8:	00813403          	ld	s0,8(sp)
    800042fc:	01010113          	addi	sp,sp,16
    80004300:	00008067          	ret

0000000080004304 <timerinit>:
    80004304:	ff010113          	addi	sp,sp,-16
    80004308:	00813423          	sd	s0,8(sp)
    8000430c:	01010413          	addi	s0,sp,16
    80004310:	f14027f3          	csrr	a5,mhartid
    80004314:	0200c737          	lui	a4,0x200c
    80004318:	ff873583          	ld	a1,-8(a4) # 200bff8 <_entry-0x7dff4008>
    8000431c:	0007869b          	sext.w	a3,a5
    80004320:	00269713          	slli	a4,a3,0x2
    80004324:	000f4637          	lui	a2,0xf4
    80004328:	24060613          	addi	a2,a2,576 # f4240 <_entry-0x7ff0bdc0>
    8000432c:	00d70733          	add	a4,a4,a3
    80004330:	0037979b          	slliw	a5,a5,0x3
    80004334:	020046b7          	lui	a3,0x2004
    80004338:	00d787b3          	add	a5,a5,a3
    8000433c:	00c585b3          	add	a1,a1,a2
    80004340:	00371693          	slli	a3,a4,0x3
    80004344:	00004717          	auipc	a4,0x4
    80004348:	29c70713          	addi	a4,a4,668 # 800085e0 <timer_scratch>
    8000434c:	00b7b023          	sd	a1,0(a5)
    80004350:	00d70733          	add	a4,a4,a3
    80004354:	00f73c23          	sd	a5,24(a4)
    80004358:	02c73023          	sd	a2,32(a4)
    8000435c:	34071073          	csrw	mscratch,a4
    80004360:	00000797          	auipc	a5,0x0
    80004364:	65078793          	addi	a5,a5,1616 # 800049b0 <timervec>
    80004368:	30579073          	csrw	mtvec,a5
    8000436c:	300027f3          	csrr	a5,mstatus
    80004370:	0087e793          	ori	a5,a5,8
    80004374:	30079073          	csrw	mstatus,a5
    80004378:	304027f3          	csrr	a5,mie
    8000437c:	0807e793          	ori	a5,a5,128
    80004380:	30479073          	csrw	mie,a5
    80004384:	00813403          	ld	s0,8(sp)
    80004388:	01010113          	addi	sp,sp,16
    8000438c:	00008067          	ret

0000000080004390 <system_main>:
    80004390:	fe010113          	addi	sp,sp,-32
    80004394:	00813823          	sd	s0,16(sp)
    80004398:	00913423          	sd	s1,8(sp)
    8000439c:	00113c23          	sd	ra,24(sp)
    800043a0:	02010413          	addi	s0,sp,32
    800043a4:	00000097          	auipc	ra,0x0
    800043a8:	0c4080e7          	jalr	196(ra) # 80004468 <cpuid>
    800043ac:	00004497          	auipc	s1,0x4
    800043b0:	14448493          	addi	s1,s1,324 # 800084f0 <started>
    800043b4:	02050263          	beqz	a0,800043d8 <system_main+0x48>
    800043b8:	0004a783          	lw	a5,0(s1)
    800043bc:	0007879b          	sext.w	a5,a5
    800043c0:	fe078ce3          	beqz	a5,800043b8 <system_main+0x28>
    800043c4:	0ff0000f          	fence
    800043c8:	00003517          	auipc	a0,0x3
    800043cc:	ef850513          	addi	a0,a0,-264 # 800072c0 <CONSOLE_STATUS+0x2b0>
    800043d0:	00001097          	auipc	ra,0x1
    800043d4:	a7c080e7          	jalr	-1412(ra) # 80004e4c <panic>
    800043d8:	00001097          	auipc	ra,0x1
    800043dc:	9d0080e7          	jalr	-1584(ra) # 80004da8 <consoleinit>
    800043e0:	00001097          	auipc	ra,0x1
    800043e4:	15c080e7          	jalr	348(ra) # 8000553c <printfinit>
    800043e8:	00003517          	auipc	a0,0x3
    800043ec:	cb050513          	addi	a0,a0,-848 # 80007098 <CONSOLE_STATUS+0x88>
    800043f0:	00001097          	auipc	ra,0x1
    800043f4:	ab8080e7          	jalr	-1352(ra) # 80004ea8 <__printf>
    800043f8:	00003517          	auipc	a0,0x3
    800043fc:	e9850513          	addi	a0,a0,-360 # 80007290 <CONSOLE_STATUS+0x280>
    80004400:	00001097          	auipc	ra,0x1
    80004404:	aa8080e7          	jalr	-1368(ra) # 80004ea8 <__printf>
    80004408:	00003517          	auipc	a0,0x3
    8000440c:	c9050513          	addi	a0,a0,-880 # 80007098 <CONSOLE_STATUS+0x88>
    80004410:	00001097          	auipc	ra,0x1
    80004414:	a98080e7          	jalr	-1384(ra) # 80004ea8 <__printf>
    80004418:	00001097          	auipc	ra,0x1
    8000441c:	4b0080e7          	jalr	1200(ra) # 800058c8 <kinit>
    80004420:	00000097          	auipc	ra,0x0
    80004424:	148080e7          	jalr	328(ra) # 80004568 <trapinit>
    80004428:	00000097          	auipc	ra,0x0
    8000442c:	16c080e7          	jalr	364(ra) # 80004594 <trapinithart>
    80004430:	00000097          	auipc	ra,0x0
    80004434:	5c0080e7          	jalr	1472(ra) # 800049f0 <plicinit>
    80004438:	00000097          	auipc	ra,0x0
    8000443c:	5e0080e7          	jalr	1504(ra) # 80004a18 <plicinithart>
    80004440:	00000097          	auipc	ra,0x0
    80004444:	078080e7          	jalr	120(ra) # 800044b8 <userinit>
    80004448:	0ff0000f          	fence
    8000444c:	00100793          	li	a5,1
    80004450:	00003517          	auipc	a0,0x3
    80004454:	e5850513          	addi	a0,a0,-424 # 800072a8 <CONSOLE_STATUS+0x298>
    80004458:	00f4a023          	sw	a5,0(s1)
    8000445c:	00001097          	auipc	ra,0x1
    80004460:	a4c080e7          	jalr	-1460(ra) # 80004ea8 <__printf>
    80004464:	0000006f          	j	80004464 <system_main+0xd4>

0000000080004468 <cpuid>:
    80004468:	ff010113          	addi	sp,sp,-16
    8000446c:	00813423          	sd	s0,8(sp)
    80004470:	01010413          	addi	s0,sp,16
    80004474:	00020513          	mv	a0,tp
    80004478:	00813403          	ld	s0,8(sp)
    8000447c:	0005051b          	sext.w	a0,a0
    80004480:	01010113          	addi	sp,sp,16
    80004484:	00008067          	ret

0000000080004488 <mycpu>:
    80004488:	ff010113          	addi	sp,sp,-16
    8000448c:	00813423          	sd	s0,8(sp)
    80004490:	01010413          	addi	s0,sp,16
    80004494:	00020793          	mv	a5,tp
    80004498:	00813403          	ld	s0,8(sp)
    8000449c:	0007879b          	sext.w	a5,a5
    800044a0:	00779793          	slli	a5,a5,0x7
    800044a4:	00005517          	auipc	a0,0x5
    800044a8:	16c50513          	addi	a0,a0,364 # 80009610 <cpus>
    800044ac:	00f50533          	add	a0,a0,a5
    800044b0:	01010113          	addi	sp,sp,16
    800044b4:	00008067          	ret

00000000800044b8 <userinit>:
    800044b8:	ff010113          	addi	sp,sp,-16
    800044bc:	00813423          	sd	s0,8(sp)
    800044c0:	01010413          	addi	s0,sp,16
    800044c4:	00813403          	ld	s0,8(sp)
    800044c8:	01010113          	addi	sp,sp,16
    800044cc:	fffff317          	auipc	t1,0xfffff
    800044d0:	99030067          	jr	-1648(t1) # 80002e5c <main>

00000000800044d4 <either_copyout>:
    800044d4:	ff010113          	addi	sp,sp,-16
    800044d8:	00813023          	sd	s0,0(sp)
    800044dc:	00113423          	sd	ra,8(sp)
    800044e0:	01010413          	addi	s0,sp,16
    800044e4:	02051663          	bnez	a0,80004510 <either_copyout+0x3c>
    800044e8:	00058513          	mv	a0,a1
    800044ec:	00060593          	mv	a1,a2
    800044f0:	0006861b          	sext.w	a2,a3
    800044f4:	00002097          	auipc	ra,0x2
    800044f8:	c60080e7          	jalr	-928(ra) # 80006154 <__memmove>
    800044fc:	00813083          	ld	ra,8(sp)
    80004500:	00013403          	ld	s0,0(sp)
    80004504:	00000513          	li	a0,0
    80004508:	01010113          	addi	sp,sp,16
    8000450c:	00008067          	ret
    80004510:	00003517          	auipc	a0,0x3
    80004514:	dd850513          	addi	a0,a0,-552 # 800072e8 <CONSOLE_STATUS+0x2d8>
    80004518:	00001097          	auipc	ra,0x1
    8000451c:	934080e7          	jalr	-1740(ra) # 80004e4c <panic>

0000000080004520 <either_copyin>:
    80004520:	ff010113          	addi	sp,sp,-16
    80004524:	00813023          	sd	s0,0(sp)
    80004528:	00113423          	sd	ra,8(sp)
    8000452c:	01010413          	addi	s0,sp,16
    80004530:	02059463          	bnez	a1,80004558 <either_copyin+0x38>
    80004534:	00060593          	mv	a1,a2
    80004538:	0006861b          	sext.w	a2,a3
    8000453c:	00002097          	auipc	ra,0x2
    80004540:	c18080e7          	jalr	-1000(ra) # 80006154 <__memmove>
    80004544:	00813083          	ld	ra,8(sp)
    80004548:	00013403          	ld	s0,0(sp)
    8000454c:	00000513          	li	a0,0
    80004550:	01010113          	addi	sp,sp,16
    80004554:	00008067          	ret
    80004558:	00003517          	auipc	a0,0x3
    8000455c:	db850513          	addi	a0,a0,-584 # 80007310 <CONSOLE_STATUS+0x300>
    80004560:	00001097          	auipc	ra,0x1
    80004564:	8ec080e7          	jalr	-1812(ra) # 80004e4c <panic>

0000000080004568 <trapinit>:
    80004568:	ff010113          	addi	sp,sp,-16
    8000456c:	00813423          	sd	s0,8(sp)
    80004570:	01010413          	addi	s0,sp,16
    80004574:	00813403          	ld	s0,8(sp)
    80004578:	00003597          	auipc	a1,0x3
    8000457c:	dc058593          	addi	a1,a1,-576 # 80007338 <CONSOLE_STATUS+0x328>
    80004580:	00005517          	auipc	a0,0x5
    80004584:	11050513          	addi	a0,a0,272 # 80009690 <tickslock>
    80004588:	01010113          	addi	sp,sp,16
    8000458c:	00001317          	auipc	t1,0x1
    80004590:	5cc30067          	jr	1484(t1) # 80005b58 <initlock>

0000000080004594 <trapinithart>:
    80004594:	ff010113          	addi	sp,sp,-16
    80004598:	00813423          	sd	s0,8(sp)
    8000459c:	01010413          	addi	s0,sp,16
    800045a0:	00000797          	auipc	a5,0x0
    800045a4:	30078793          	addi	a5,a5,768 # 800048a0 <kernelvec>
    800045a8:	10579073          	csrw	stvec,a5
    800045ac:	00813403          	ld	s0,8(sp)
    800045b0:	01010113          	addi	sp,sp,16
    800045b4:	00008067          	ret

00000000800045b8 <usertrap>:
    800045b8:	ff010113          	addi	sp,sp,-16
    800045bc:	00813423          	sd	s0,8(sp)
    800045c0:	01010413          	addi	s0,sp,16
    800045c4:	00813403          	ld	s0,8(sp)
    800045c8:	01010113          	addi	sp,sp,16
    800045cc:	00008067          	ret

00000000800045d0 <usertrapret>:
    800045d0:	ff010113          	addi	sp,sp,-16
    800045d4:	00813423          	sd	s0,8(sp)
    800045d8:	01010413          	addi	s0,sp,16
    800045dc:	00813403          	ld	s0,8(sp)
    800045e0:	01010113          	addi	sp,sp,16
    800045e4:	00008067          	ret

00000000800045e8 <kerneltrap>:
    800045e8:	fe010113          	addi	sp,sp,-32
    800045ec:	00813823          	sd	s0,16(sp)
    800045f0:	00113c23          	sd	ra,24(sp)
    800045f4:	00913423          	sd	s1,8(sp)
    800045f8:	02010413          	addi	s0,sp,32
    800045fc:	142025f3          	csrr	a1,scause
    80004600:	100027f3          	csrr	a5,sstatus
    80004604:	0027f793          	andi	a5,a5,2
    80004608:	10079c63          	bnez	a5,80004720 <kerneltrap+0x138>
    8000460c:	142027f3          	csrr	a5,scause
    80004610:	0207ce63          	bltz	a5,8000464c <kerneltrap+0x64>
    80004614:	00003517          	auipc	a0,0x3
    80004618:	d6c50513          	addi	a0,a0,-660 # 80007380 <CONSOLE_STATUS+0x370>
    8000461c:	00001097          	auipc	ra,0x1
    80004620:	88c080e7          	jalr	-1908(ra) # 80004ea8 <__printf>
    80004624:	141025f3          	csrr	a1,sepc
    80004628:	14302673          	csrr	a2,stval
    8000462c:	00003517          	auipc	a0,0x3
    80004630:	d6450513          	addi	a0,a0,-668 # 80007390 <CONSOLE_STATUS+0x380>
    80004634:	00001097          	auipc	ra,0x1
    80004638:	874080e7          	jalr	-1932(ra) # 80004ea8 <__printf>
    8000463c:	00003517          	auipc	a0,0x3
    80004640:	d6c50513          	addi	a0,a0,-660 # 800073a8 <CONSOLE_STATUS+0x398>
    80004644:	00001097          	auipc	ra,0x1
    80004648:	808080e7          	jalr	-2040(ra) # 80004e4c <panic>
    8000464c:	0ff7f713          	andi	a4,a5,255
    80004650:	00900693          	li	a3,9
    80004654:	04d70063          	beq	a4,a3,80004694 <kerneltrap+0xac>
    80004658:	fff00713          	li	a4,-1
    8000465c:	03f71713          	slli	a4,a4,0x3f
    80004660:	00170713          	addi	a4,a4,1
    80004664:	fae798e3          	bne	a5,a4,80004614 <kerneltrap+0x2c>
    80004668:	00000097          	auipc	ra,0x0
    8000466c:	e00080e7          	jalr	-512(ra) # 80004468 <cpuid>
    80004670:	06050663          	beqz	a0,800046dc <kerneltrap+0xf4>
    80004674:	144027f3          	csrr	a5,sip
    80004678:	ffd7f793          	andi	a5,a5,-3
    8000467c:	14479073          	csrw	sip,a5
    80004680:	01813083          	ld	ra,24(sp)
    80004684:	01013403          	ld	s0,16(sp)
    80004688:	00813483          	ld	s1,8(sp)
    8000468c:	02010113          	addi	sp,sp,32
    80004690:	00008067          	ret
    80004694:	00000097          	auipc	ra,0x0
    80004698:	3d0080e7          	jalr	976(ra) # 80004a64 <plic_claim>
    8000469c:	00a00793          	li	a5,10
    800046a0:	00050493          	mv	s1,a0
    800046a4:	06f50863          	beq	a0,a5,80004714 <kerneltrap+0x12c>
    800046a8:	fc050ce3          	beqz	a0,80004680 <kerneltrap+0x98>
    800046ac:	00050593          	mv	a1,a0
    800046b0:	00003517          	auipc	a0,0x3
    800046b4:	cb050513          	addi	a0,a0,-848 # 80007360 <CONSOLE_STATUS+0x350>
    800046b8:	00000097          	auipc	ra,0x0
    800046bc:	7f0080e7          	jalr	2032(ra) # 80004ea8 <__printf>
    800046c0:	01013403          	ld	s0,16(sp)
    800046c4:	01813083          	ld	ra,24(sp)
    800046c8:	00048513          	mv	a0,s1
    800046cc:	00813483          	ld	s1,8(sp)
    800046d0:	02010113          	addi	sp,sp,32
    800046d4:	00000317          	auipc	t1,0x0
    800046d8:	3c830067          	jr	968(t1) # 80004a9c <plic_complete>
    800046dc:	00005517          	auipc	a0,0x5
    800046e0:	fb450513          	addi	a0,a0,-76 # 80009690 <tickslock>
    800046e4:	00001097          	auipc	ra,0x1
    800046e8:	498080e7          	jalr	1176(ra) # 80005b7c <acquire>
    800046ec:	00004717          	auipc	a4,0x4
    800046f0:	e0870713          	addi	a4,a4,-504 # 800084f4 <ticks>
    800046f4:	00072783          	lw	a5,0(a4)
    800046f8:	00005517          	auipc	a0,0x5
    800046fc:	f9850513          	addi	a0,a0,-104 # 80009690 <tickslock>
    80004700:	0017879b          	addiw	a5,a5,1
    80004704:	00f72023          	sw	a5,0(a4)
    80004708:	00001097          	auipc	ra,0x1
    8000470c:	540080e7          	jalr	1344(ra) # 80005c48 <release>
    80004710:	f65ff06f          	j	80004674 <kerneltrap+0x8c>
    80004714:	00001097          	auipc	ra,0x1
    80004718:	09c080e7          	jalr	156(ra) # 800057b0 <uartintr>
    8000471c:	fa5ff06f          	j	800046c0 <kerneltrap+0xd8>
    80004720:	00003517          	auipc	a0,0x3
    80004724:	c2050513          	addi	a0,a0,-992 # 80007340 <CONSOLE_STATUS+0x330>
    80004728:	00000097          	auipc	ra,0x0
    8000472c:	724080e7          	jalr	1828(ra) # 80004e4c <panic>

0000000080004730 <clockintr>:
    80004730:	fe010113          	addi	sp,sp,-32
    80004734:	00813823          	sd	s0,16(sp)
    80004738:	00913423          	sd	s1,8(sp)
    8000473c:	00113c23          	sd	ra,24(sp)
    80004740:	02010413          	addi	s0,sp,32
    80004744:	00005497          	auipc	s1,0x5
    80004748:	f4c48493          	addi	s1,s1,-180 # 80009690 <tickslock>
    8000474c:	00048513          	mv	a0,s1
    80004750:	00001097          	auipc	ra,0x1
    80004754:	42c080e7          	jalr	1068(ra) # 80005b7c <acquire>
    80004758:	00004717          	auipc	a4,0x4
    8000475c:	d9c70713          	addi	a4,a4,-612 # 800084f4 <ticks>
    80004760:	00072783          	lw	a5,0(a4)
    80004764:	01013403          	ld	s0,16(sp)
    80004768:	01813083          	ld	ra,24(sp)
    8000476c:	00048513          	mv	a0,s1
    80004770:	0017879b          	addiw	a5,a5,1
    80004774:	00813483          	ld	s1,8(sp)
    80004778:	00f72023          	sw	a5,0(a4)
    8000477c:	02010113          	addi	sp,sp,32
    80004780:	00001317          	auipc	t1,0x1
    80004784:	4c830067          	jr	1224(t1) # 80005c48 <release>

0000000080004788 <devintr>:
    80004788:	142027f3          	csrr	a5,scause
    8000478c:	00000513          	li	a0,0
    80004790:	0007c463          	bltz	a5,80004798 <devintr+0x10>
    80004794:	00008067          	ret
    80004798:	fe010113          	addi	sp,sp,-32
    8000479c:	00813823          	sd	s0,16(sp)
    800047a0:	00113c23          	sd	ra,24(sp)
    800047a4:	00913423          	sd	s1,8(sp)
    800047a8:	02010413          	addi	s0,sp,32
    800047ac:	0ff7f713          	andi	a4,a5,255
    800047b0:	00900693          	li	a3,9
    800047b4:	04d70c63          	beq	a4,a3,8000480c <devintr+0x84>
    800047b8:	fff00713          	li	a4,-1
    800047bc:	03f71713          	slli	a4,a4,0x3f
    800047c0:	00170713          	addi	a4,a4,1
    800047c4:	00e78c63          	beq	a5,a4,800047dc <devintr+0x54>
    800047c8:	01813083          	ld	ra,24(sp)
    800047cc:	01013403          	ld	s0,16(sp)
    800047d0:	00813483          	ld	s1,8(sp)
    800047d4:	02010113          	addi	sp,sp,32
    800047d8:	00008067          	ret
    800047dc:	00000097          	auipc	ra,0x0
    800047e0:	c8c080e7          	jalr	-884(ra) # 80004468 <cpuid>
    800047e4:	06050663          	beqz	a0,80004850 <devintr+0xc8>
    800047e8:	144027f3          	csrr	a5,sip
    800047ec:	ffd7f793          	andi	a5,a5,-3
    800047f0:	14479073          	csrw	sip,a5
    800047f4:	01813083          	ld	ra,24(sp)
    800047f8:	01013403          	ld	s0,16(sp)
    800047fc:	00813483          	ld	s1,8(sp)
    80004800:	00200513          	li	a0,2
    80004804:	02010113          	addi	sp,sp,32
    80004808:	00008067          	ret
    8000480c:	00000097          	auipc	ra,0x0
    80004810:	258080e7          	jalr	600(ra) # 80004a64 <plic_claim>
    80004814:	00a00793          	li	a5,10
    80004818:	00050493          	mv	s1,a0
    8000481c:	06f50663          	beq	a0,a5,80004888 <devintr+0x100>
    80004820:	00100513          	li	a0,1
    80004824:	fa0482e3          	beqz	s1,800047c8 <devintr+0x40>
    80004828:	00048593          	mv	a1,s1
    8000482c:	00003517          	auipc	a0,0x3
    80004830:	b3450513          	addi	a0,a0,-1228 # 80007360 <CONSOLE_STATUS+0x350>
    80004834:	00000097          	auipc	ra,0x0
    80004838:	674080e7          	jalr	1652(ra) # 80004ea8 <__printf>
    8000483c:	00048513          	mv	a0,s1
    80004840:	00000097          	auipc	ra,0x0
    80004844:	25c080e7          	jalr	604(ra) # 80004a9c <plic_complete>
    80004848:	00100513          	li	a0,1
    8000484c:	f7dff06f          	j	800047c8 <devintr+0x40>
    80004850:	00005517          	auipc	a0,0x5
    80004854:	e4050513          	addi	a0,a0,-448 # 80009690 <tickslock>
    80004858:	00001097          	auipc	ra,0x1
    8000485c:	324080e7          	jalr	804(ra) # 80005b7c <acquire>
    80004860:	00004717          	auipc	a4,0x4
    80004864:	c9470713          	addi	a4,a4,-876 # 800084f4 <ticks>
    80004868:	00072783          	lw	a5,0(a4)
    8000486c:	00005517          	auipc	a0,0x5
    80004870:	e2450513          	addi	a0,a0,-476 # 80009690 <tickslock>
    80004874:	0017879b          	addiw	a5,a5,1
    80004878:	00f72023          	sw	a5,0(a4)
    8000487c:	00001097          	auipc	ra,0x1
    80004880:	3cc080e7          	jalr	972(ra) # 80005c48 <release>
    80004884:	f65ff06f          	j	800047e8 <devintr+0x60>
    80004888:	00001097          	auipc	ra,0x1
    8000488c:	f28080e7          	jalr	-216(ra) # 800057b0 <uartintr>
    80004890:	fadff06f          	j	8000483c <devintr+0xb4>
	...

00000000800048a0 <kernelvec>:
    800048a0:	f0010113          	addi	sp,sp,-256
    800048a4:	00113023          	sd	ra,0(sp)
    800048a8:	00213423          	sd	sp,8(sp)
    800048ac:	00313823          	sd	gp,16(sp)
    800048b0:	00413c23          	sd	tp,24(sp)
    800048b4:	02513023          	sd	t0,32(sp)
    800048b8:	02613423          	sd	t1,40(sp)
    800048bc:	02713823          	sd	t2,48(sp)
    800048c0:	02813c23          	sd	s0,56(sp)
    800048c4:	04913023          	sd	s1,64(sp)
    800048c8:	04a13423          	sd	a0,72(sp)
    800048cc:	04b13823          	sd	a1,80(sp)
    800048d0:	04c13c23          	sd	a2,88(sp)
    800048d4:	06d13023          	sd	a3,96(sp)
    800048d8:	06e13423          	sd	a4,104(sp)
    800048dc:	06f13823          	sd	a5,112(sp)
    800048e0:	07013c23          	sd	a6,120(sp)
    800048e4:	09113023          	sd	a7,128(sp)
    800048e8:	09213423          	sd	s2,136(sp)
    800048ec:	09313823          	sd	s3,144(sp)
    800048f0:	09413c23          	sd	s4,152(sp)
    800048f4:	0b513023          	sd	s5,160(sp)
    800048f8:	0b613423          	sd	s6,168(sp)
    800048fc:	0b713823          	sd	s7,176(sp)
    80004900:	0b813c23          	sd	s8,184(sp)
    80004904:	0d913023          	sd	s9,192(sp)
    80004908:	0da13423          	sd	s10,200(sp)
    8000490c:	0db13823          	sd	s11,208(sp)
    80004910:	0dc13c23          	sd	t3,216(sp)
    80004914:	0fd13023          	sd	t4,224(sp)
    80004918:	0fe13423          	sd	t5,232(sp)
    8000491c:	0ff13823          	sd	t6,240(sp)
    80004920:	cc9ff0ef          	jal	ra,800045e8 <kerneltrap>
    80004924:	00013083          	ld	ra,0(sp)
    80004928:	00813103          	ld	sp,8(sp)
    8000492c:	01013183          	ld	gp,16(sp)
    80004930:	02013283          	ld	t0,32(sp)
    80004934:	02813303          	ld	t1,40(sp)
    80004938:	03013383          	ld	t2,48(sp)
    8000493c:	03813403          	ld	s0,56(sp)
    80004940:	04013483          	ld	s1,64(sp)
    80004944:	04813503          	ld	a0,72(sp)
    80004948:	05013583          	ld	a1,80(sp)
    8000494c:	05813603          	ld	a2,88(sp)
    80004950:	06013683          	ld	a3,96(sp)
    80004954:	06813703          	ld	a4,104(sp)
    80004958:	07013783          	ld	a5,112(sp)
    8000495c:	07813803          	ld	a6,120(sp)
    80004960:	08013883          	ld	a7,128(sp)
    80004964:	08813903          	ld	s2,136(sp)
    80004968:	09013983          	ld	s3,144(sp)
    8000496c:	09813a03          	ld	s4,152(sp)
    80004970:	0a013a83          	ld	s5,160(sp)
    80004974:	0a813b03          	ld	s6,168(sp)
    80004978:	0b013b83          	ld	s7,176(sp)
    8000497c:	0b813c03          	ld	s8,184(sp)
    80004980:	0c013c83          	ld	s9,192(sp)
    80004984:	0c813d03          	ld	s10,200(sp)
    80004988:	0d013d83          	ld	s11,208(sp)
    8000498c:	0d813e03          	ld	t3,216(sp)
    80004990:	0e013e83          	ld	t4,224(sp)
    80004994:	0e813f03          	ld	t5,232(sp)
    80004998:	0f013f83          	ld	t6,240(sp)
    8000499c:	10010113          	addi	sp,sp,256
    800049a0:	10200073          	sret
    800049a4:	00000013          	nop
    800049a8:	00000013          	nop
    800049ac:	00000013          	nop

00000000800049b0 <timervec>:
    800049b0:	34051573          	csrrw	a0,mscratch,a0
    800049b4:	00b53023          	sd	a1,0(a0)
    800049b8:	00c53423          	sd	a2,8(a0)
    800049bc:	00d53823          	sd	a3,16(a0)
    800049c0:	01853583          	ld	a1,24(a0)
    800049c4:	02053603          	ld	a2,32(a0)
    800049c8:	0005b683          	ld	a3,0(a1)
    800049cc:	00c686b3          	add	a3,a3,a2
    800049d0:	00d5b023          	sd	a3,0(a1)
    800049d4:	00200593          	li	a1,2
    800049d8:	14459073          	csrw	sip,a1
    800049dc:	01053683          	ld	a3,16(a0)
    800049e0:	00853603          	ld	a2,8(a0)
    800049e4:	00053583          	ld	a1,0(a0)
    800049e8:	34051573          	csrrw	a0,mscratch,a0
    800049ec:	30200073          	mret

00000000800049f0 <plicinit>:
    800049f0:	ff010113          	addi	sp,sp,-16
    800049f4:	00813423          	sd	s0,8(sp)
    800049f8:	01010413          	addi	s0,sp,16
    800049fc:	00813403          	ld	s0,8(sp)
    80004a00:	0c0007b7          	lui	a5,0xc000
    80004a04:	00100713          	li	a4,1
    80004a08:	02e7a423          	sw	a4,40(a5) # c000028 <_entry-0x73ffffd8>
    80004a0c:	00e7a223          	sw	a4,4(a5)
    80004a10:	01010113          	addi	sp,sp,16
    80004a14:	00008067          	ret

0000000080004a18 <plicinithart>:
    80004a18:	ff010113          	addi	sp,sp,-16
    80004a1c:	00813023          	sd	s0,0(sp)
    80004a20:	00113423          	sd	ra,8(sp)
    80004a24:	01010413          	addi	s0,sp,16
    80004a28:	00000097          	auipc	ra,0x0
    80004a2c:	a40080e7          	jalr	-1472(ra) # 80004468 <cpuid>
    80004a30:	0085171b          	slliw	a4,a0,0x8
    80004a34:	0c0027b7          	lui	a5,0xc002
    80004a38:	00e787b3          	add	a5,a5,a4
    80004a3c:	40200713          	li	a4,1026
    80004a40:	08e7a023          	sw	a4,128(a5) # c002080 <_entry-0x73ffdf80>
    80004a44:	00813083          	ld	ra,8(sp)
    80004a48:	00013403          	ld	s0,0(sp)
    80004a4c:	00d5151b          	slliw	a0,a0,0xd
    80004a50:	0c2017b7          	lui	a5,0xc201
    80004a54:	00a78533          	add	a0,a5,a0
    80004a58:	00052023          	sw	zero,0(a0)
    80004a5c:	01010113          	addi	sp,sp,16
    80004a60:	00008067          	ret

0000000080004a64 <plic_claim>:
    80004a64:	ff010113          	addi	sp,sp,-16
    80004a68:	00813023          	sd	s0,0(sp)
    80004a6c:	00113423          	sd	ra,8(sp)
    80004a70:	01010413          	addi	s0,sp,16
    80004a74:	00000097          	auipc	ra,0x0
    80004a78:	9f4080e7          	jalr	-1548(ra) # 80004468 <cpuid>
    80004a7c:	00813083          	ld	ra,8(sp)
    80004a80:	00013403          	ld	s0,0(sp)
    80004a84:	00d5151b          	slliw	a0,a0,0xd
    80004a88:	0c2017b7          	lui	a5,0xc201
    80004a8c:	00a78533          	add	a0,a5,a0
    80004a90:	00452503          	lw	a0,4(a0)
    80004a94:	01010113          	addi	sp,sp,16
    80004a98:	00008067          	ret

0000000080004a9c <plic_complete>:
    80004a9c:	fe010113          	addi	sp,sp,-32
    80004aa0:	00813823          	sd	s0,16(sp)
    80004aa4:	00913423          	sd	s1,8(sp)
    80004aa8:	00113c23          	sd	ra,24(sp)
    80004aac:	02010413          	addi	s0,sp,32
    80004ab0:	00050493          	mv	s1,a0
    80004ab4:	00000097          	auipc	ra,0x0
    80004ab8:	9b4080e7          	jalr	-1612(ra) # 80004468 <cpuid>
    80004abc:	01813083          	ld	ra,24(sp)
    80004ac0:	01013403          	ld	s0,16(sp)
    80004ac4:	00d5179b          	slliw	a5,a0,0xd
    80004ac8:	0c201737          	lui	a4,0xc201
    80004acc:	00f707b3          	add	a5,a4,a5
    80004ad0:	0097a223          	sw	s1,4(a5) # c201004 <_entry-0x73dfeffc>
    80004ad4:	00813483          	ld	s1,8(sp)
    80004ad8:	02010113          	addi	sp,sp,32
    80004adc:	00008067          	ret

0000000080004ae0 <consolewrite>:
    80004ae0:	fb010113          	addi	sp,sp,-80
    80004ae4:	04813023          	sd	s0,64(sp)
    80004ae8:	04113423          	sd	ra,72(sp)
    80004aec:	02913c23          	sd	s1,56(sp)
    80004af0:	03213823          	sd	s2,48(sp)
    80004af4:	03313423          	sd	s3,40(sp)
    80004af8:	03413023          	sd	s4,32(sp)
    80004afc:	01513c23          	sd	s5,24(sp)
    80004b00:	05010413          	addi	s0,sp,80
    80004b04:	06c05c63          	blez	a2,80004b7c <consolewrite+0x9c>
    80004b08:	00060993          	mv	s3,a2
    80004b0c:	00050a13          	mv	s4,a0
    80004b10:	00058493          	mv	s1,a1
    80004b14:	00000913          	li	s2,0
    80004b18:	fff00a93          	li	s5,-1
    80004b1c:	01c0006f          	j	80004b38 <consolewrite+0x58>
    80004b20:	fbf44503          	lbu	a0,-65(s0)
    80004b24:	0019091b          	addiw	s2,s2,1
    80004b28:	00148493          	addi	s1,s1,1
    80004b2c:	00001097          	auipc	ra,0x1
    80004b30:	a9c080e7          	jalr	-1380(ra) # 800055c8 <uartputc>
    80004b34:	03298063          	beq	s3,s2,80004b54 <consolewrite+0x74>
    80004b38:	00048613          	mv	a2,s1
    80004b3c:	00100693          	li	a3,1
    80004b40:	000a0593          	mv	a1,s4
    80004b44:	fbf40513          	addi	a0,s0,-65
    80004b48:	00000097          	auipc	ra,0x0
    80004b4c:	9d8080e7          	jalr	-1576(ra) # 80004520 <either_copyin>
    80004b50:	fd5518e3          	bne	a0,s5,80004b20 <consolewrite+0x40>
    80004b54:	04813083          	ld	ra,72(sp)
    80004b58:	04013403          	ld	s0,64(sp)
    80004b5c:	03813483          	ld	s1,56(sp)
    80004b60:	02813983          	ld	s3,40(sp)
    80004b64:	02013a03          	ld	s4,32(sp)
    80004b68:	01813a83          	ld	s5,24(sp)
    80004b6c:	00090513          	mv	a0,s2
    80004b70:	03013903          	ld	s2,48(sp)
    80004b74:	05010113          	addi	sp,sp,80
    80004b78:	00008067          	ret
    80004b7c:	00000913          	li	s2,0
    80004b80:	fd5ff06f          	j	80004b54 <consolewrite+0x74>

0000000080004b84 <consoleread>:
    80004b84:	f9010113          	addi	sp,sp,-112
    80004b88:	06813023          	sd	s0,96(sp)
    80004b8c:	04913c23          	sd	s1,88(sp)
    80004b90:	05213823          	sd	s2,80(sp)
    80004b94:	05313423          	sd	s3,72(sp)
    80004b98:	05413023          	sd	s4,64(sp)
    80004b9c:	03513c23          	sd	s5,56(sp)
    80004ba0:	03613823          	sd	s6,48(sp)
    80004ba4:	03713423          	sd	s7,40(sp)
    80004ba8:	03813023          	sd	s8,32(sp)
    80004bac:	06113423          	sd	ra,104(sp)
    80004bb0:	01913c23          	sd	s9,24(sp)
    80004bb4:	07010413          	addi	s0,sp,112
    80004bb8:	00060b93          	mv	s7,a2
    80004bbc:	00050913          	mv	s2,a0
    80004bc0:	00058c13          	mv	s8,a1
    80004bc4:	00060b1b          	sext.w	s6,a2
    80004bc8:	00005497          	auipc	s1,0x5
    80004bcc:	af048493          	addi	s1,s1,-1296 # 800096b8 <cons>
    80004bd0:	00400993          	li	s3,4
    80004bd4:	fff00a13          	li	s4,-1
    80004bd8:	00a00a93          	li	s5,10
    80004bdc:	05705e63          	blez	s7,80004c38 <consoleread+0xb4>
    80004be0:	09c4a703          	lw	a4,156(s1)
    80004be4:	0984a783          	lw	a5,152(s1)
    80004be8:	0007071b          	sext.w	a4,a4
    80004bec:	08e78463          	beq	a5,a4,80004c74 <consoleread+0xf0>
    80004bf0:	07f7f713          	andi	a4,a5,127
    80004bf4:	00e48733          	add	a4,s1,a4
    80004bf8:	01874703          	lbu	a4,24(a4) # c201018 <_entry-0x73dfefe8>
    80004bfc:	0017869b          	addiw	a3,a5,1
    80004c00:	08d4ac23          	sw	a3,152(s1)
    80004c04:	00070c9b          	sext.w	s9,a4
    80004c08:	0b370663          	beq	a4,s3,80004cb4 <consoleread+0x130>
    80004c0c:	00100693          	li	a3,1
    80004c10:	f9f40613          	addi	a2,s0,-97
    80004c14:	000c0593          	mv	a1,s8
    80004c18:	00090513          	mv	a0,s2
    80004c1c:	f8e40fa3          	sb	a4,-97(s0)
    80004c20:	00000097          	auipc	ra,0x0
    80004c24:	8b4080e7          	jalr	-1868(ra) # 800044d4 <either_copyout>
    80004c28:	01450863          	beq	a0,s4,80004c38 <consoleread+0xb4>
    80004c2c:	001c0c13          	addi	s8,s8,1
    80004c30:	fffb8b9b          	addiw	s7,s7,-1
    80004c34:	fb5c94e3          	bne	s9,s5,80004bdc <consoleread+0x58>
    80004c38:	000b851b          	sext.w	a0,s7
    80004c3c:	06813083          	ld	ra,104(sp)
    80004c40:	06013403          	ld	s0,96(sp)
    80004c44:	05813483          	ld	s1,88(sp)
    80004c48:	05013903          	ld	s2,80(sp)
    80004c4c:	04813983          	ld	s3,72(sp)
    80004c50:	04013a03          	ld	s4,64(sp)
    80004c54:	03813a83          	ld	s5,56(sp)
    80004c58:	02813b83          	ld	s7,40(sp)
    80004c5c:	02013c03          	ld	s8,32(sp)
    80004c60:	01813c83          	ld	s9,24(sp)
    80004c64:	40ab053b          	subw	a0,s6,a0
    80004c68:	03013b03          	ld	s6,48(sp)
    80004c6c:	07010113          	addi	sp,sp,112
    80004c70:	00008067          	ret
    80004c74:	00001097          	auipc	ra,0x1
    80004c78:	1d8080e7          	jalr	472(ra) # 80005e4c <push_on>
    80004c7c:	0984a703          	lw	a4,152(s1)
    80004c80:	09c4a783          	lw	a5,156(s1)
    80004c84:	0007879b          	sext.w	a5,a5
    80004c88:	fef70ce3          	beq	a4,a5,80004c80 <consoleread+0xfc>
    80004c8c:	00001097          	auipc	ra,0x1
    80004c90:	234080e7          	jalr	564(ra) # 80005ec0 <pop_on>
    80004c94:	0984a783          	lw	a5,152(s1)
    80004c98:	07f7f713          	andi	a4,a5,127
    80004c9c:	00e48733          	add	a4,s1,a4
    80004ca0:	01874703          	lbu	a4,24(a4)
    80004ca4:	0017869b          	addiw	a3,a5,1
    80004ca8:	08d4ac23          	sw	a3,152(s1)
    80004cac:	00070c9b          	sext.w	s9,a4
    80004cb0:	f5371ee3          	bne	a4,s3,80004c0c <consoleread+0x88>
    80004cb4:	000b851b          	sext.w	a0,s7
    80004cb8:	f96bf2e3          	bgeu	s7,s6,80004c3c <consoleread+0xb8>
    80004cbc:	08f4ac23          	sw	a5,152(s1)
    80004cc0:	f7dff06f          	j	80004c3c <consoleread+0xb8>

0000000080004cc4 <consputc>:
    80004cc4:	10000793          	li	a5,256
    80004cc8:	00f50663          	beq	a0,a5,80004cd4 <consputc+0x10>
    80004ccc:	00001317          	auipc	t1,0x1
    80004cd0:	9f430067          	jr	-1548(t1) # 800056c0 <uartputc_sync>
    80004cd4:	ff010113          	addi	sp,sp,-16
    80004cd8:	00113423          	sd	ra,8(sp)
    80004cdc:	00813023          	sd	s0,0(sp)
    80004ce0:	01010413          	addi	s0,sp,16
    80004ce4:	00800513          	li	a0,8
    80004ce8:	00001097          	auipc	ra,0x1
    80004cec:	9d8080e7          	jalr	-1576(ra) # 800056c0 <uartputc_sync>
    80004cf0:	02000513          	li	a0,32
    80004cf4:	00001097          	auipc	ra,0x1
    80004cf8:	9cc080e7          	jalr	-1588(ra) # 800056c0 <uartputc_sync>
    80004cfc:	00013403          	ld	s0,0(sp)
    80004d00:	00813083          	ld	ra,8(sp)
    80004d04:	00800513          	li	a0,8
    80004d08:	01010113          	addi	sp,sp,16
    80004d0c:	00001317          	auipc	t1,0x1
    80004d10:	9b430067          	jr	-1612(t1) # 800056c0 <uartputc_sync>

0000000080004d14 <consoleintr>:
    80004d14:	fe010113          	addi	sp,sp,-32
    80004d18:	00813823          	sd	s0,16(sp)
    80004d1c:	00913423          	sd	s1,8(sp)
    80004d20:	01213023          	sd	s2,0(sp)
    80004d24:	00113c23          	sd	ra,24(sp)
    80004d28:	02010413          	addi	s0,sp,32
    80004d2c:	00005917          	auipc	s2,0x5
    80004d30:	98c90913          	addi	s2,s2,-1652 # 800096b8 <cons>
    80004d34:	00050493          	mv	s1,a0
    80004d38:	00090513          	mv	a0,s2
    80004d3c:	00001097          	auipc	ra,0x1
    80004d40:	e40080e7          	jalr	-448(ra) # 80005b7c <acquire>
    80004d44:	02048c63          	beqz	s1,80004d7c <consoleintr+0x68>
    80004d48:	0a092783          	lw	a5,160(s2)
    80004d4c:	09892703          	lw	a4,152(s2)
    80004d50:	07f00693          	li	a3,127
    80004d54:	40e7873b          	subw	a4,a5,a4
    80004d58:	02e6e263          	bltu	a3,a4,80004d7c <consoleintr+0x68>
    80004d5c:	00d00713          	li	a4,13
    80004d60:	04e48063          	beq	s1,a4,80004da0 <consoleintr+0x8c>
    80004d64:	07f7f713          	andi	a4,a5,127
    80004d68:	00e90733          	add	a4,s2,a4
    80004d6c:	0017879b          	addiw	a5,a5,1
    80004d70:	0af92023          	sw	a5,160(s2)
    80004d74:	00970c23          	sb	s1,24(a4)
    80004d78:	08f92e23          	sw	a5,156(s2)
    80004d7c:	01013403          	ld	s0,16(sp)
    80004d80:	01813083          	ld	ra,24(sp)
    80004d84:	00813483          	ld	s1,8(sp)
    80004d88:	00013903          	ld	s2,0(sp)
    80004d8c:	00005517          	auipc	a0,0x5
    80004d90:	92c50513          	addi	a0,a0,-1748 # 800096b8 <cons>
    80004d94:	02010113          	addi	sp,sp,32
    80004d98:	00001317          	auipc	t1,0x1
    80004d9c:	eb030067          	jr	-336(t1) # 80005c48 <release>
    80004da0:	00a00493          	li	s1,10
    80004da4:	fc1ff06f          	j	80004d64 <consoleintr+0x50>

0000000080004da8 <consoleinit>:
    80004da8:	fe010113          	addi	sp,sp,-32
    80004dac:	00113c23          	sd	ra,24(sp)
    80004db0:	00813823          	sd	s0,16(sp)
    80004db4:	00913423          	sd	s1,8(sp)
    80004db8:	02010413          	addi	s0,sp,32
    80004dbc:	00005497          	auipc	s1,0x5
    80004dc0:	8fc48493          	addi	s1,s1,-1796 # 800096b8 <cons>
    80004dc4:	00048513          	mv	a0,s1
    80004dc8:	00002597          	auipc	a1,0x2
    80004dcc:	5f058593          	addi	a1,a1,1520 # 800073b8 <CONSOLE_STATUS+0x3a8>
    80004dd0:	00001097          	auipc	ra,0x1
    80004dd4:	d88080e7          	jalr	-632(ra) # 80005b58 <initlock>
    80004dd8:	00000097          	auipc	ra,0x0
    80004ddc:	7ac080e7          	jalr	1964(ra) # 80005584 <uartinit>
    80004de0:	01813083          	ld	ra,24(sp)
    80004de4:	01013403          	ld	s0,16(sp)
    80004de8:	00000797          	auipc	a5,0x0
    80004dec:	d9c78793          	addi	a5,a5,-612 # 80004b84 <consoleread>
    80004df0:	0af4bc23          	sd	a5,184(s1)
    80004df4:	00000797          	auipc	a5,0x0
    80004df8:	cec78793          	addi	a5,a5,-788 # 80004ae0 <consolewrite>
    80004dfc:	0cf4b023          	sd	a5,192(s1)
    80004e00:	00813483          	ld	s1,8(sp)
    80004e04:	02010113          	addi	sp,sp,32
    80004e08:	00008067          	ret

0000000080004e0c <console_read>:
    80004e0c:	ff010113          	addi	sp,sp,-16
    80004e10:	00813423          	sd	s0,8(sp)
    80004e14:	01010413          	addi	s0,sp,16
    80004e18:	00813403          	ld	s0,8(sp)
    80004e1c:	00005317          	auipc	t1,0x5
    80004e20:	95433303          	ld	t1,-1708(t1) # 80009770 <devsw+0x10>
    80004e24:	01010113          	addi	sp,sp,16
    80004e28:	00030067          	jr	t1

0000000080004e2c <console_write>:
    80004e2c:	ff010113          	addi	sp,sp,-16
    80004e30:	00813423          	sd	s0,8(sp)
    80004e34:	01010413          	addi	s0,sp,16
    80004e38:	00813403          	ld	s0,8(sp)
    80004e3c:	00005317          	auipc	t1,0x5
    80004e40:	93c33303          	ld	t1,-1732(t1) # 80009778 <devsw+0x18>
    80004e44:	01010113          	addi	sp,sp,16
    80004e48:	00030067          	jr	t1

0000000080004e4c <panic>:
    80004e4c:	fe010113          	addi	sp,sp,-32
    80004e50:	00113c23          	sd	ra,24(sp)
    80004e54:	00813823          	sd	s0,16(sp)
    80004e58:	00913423          	sd	s1,8(sp)
    80004e5c:	02010413          	addi	s0,sp,32
    80004e60:	00050493          	mv	s1,a0
    80004e64:	00002517          	auipc	a0,0x2
    80004e68:	55c50513          	addi	a0,a0,1372 # 800073c0 <CONSOLE_STATUS+0x3b0>
    80004e6c:	00005797          	auipc	a5,0x5
    80004e70:	9a07a623          	sw	zero,-1620(a5) # 80009818 <pr+0x18>
    80004e74:	00000097          	auipc	ra,0x0
    80004e78:	034080e7          	jalr	52(ra) # 80004ea8 <__printf>
    80004e7c:	00048513          	mv	a0,s1
    80004e80:	00000097          	auipc	ra,0x0
    80004e84:	028080e7          	jalr	40(ra) # 80004ea8 <__printf>
    80004e88:	00002517          	auipc	a0,0x2
    80004e8c:	21050513          	addi	a0,a0,528 # 80007098 <CONSOLE_STATUS+0x88>
    80004e90:	00000097          	auipc	ra,0x0
    80004e94:	018080e7          	jalr	24(ra) # 80004ea8 <__printf>
    80004e98:	00100793          	li	a5,1
    80004e9c:	00003717          	auipc	a4,0x3
    80004ea0:	64f72e23          	sw	a5,1628(a4) # 800084f8 <panicked>
    80004ea4:	0000006f          	j	80004ea4 <panic+0x58>

0000000080004ea8 <__printf>:
    80004ea8:	f3010113          	addi	sp,sp,-208
    80004eac:	08813023          	sd	s0,128(sp)
    80004eb0:	07313423          	sd	s3,104(sp)
    80004eb4:	09010413          	addi	s0,sp,144
    80004eb8:	05813023          	sd	s8,64(sp)
    80004ebc:	08113423          	sd	ra,136(sp)
    80004ec0:	06913c23          	sd	s1,120(sp)
    80004ec4:	07213823          	sd	s2,112(sp)
    80004ec8:	07413023          	sd	s4,96(sp)
    80004ecc:	05513c23          	sd	s5,88(sp)
    80004ed0:	05613823          	sd	s6,80(sp)
    80004ed4:	05713423          	sd	s7,72(sp)
    80004ed8:	03913c23          	sd	s9,56(sp)
    80004edc:	03a13823          	sd	s10,48(sp)
    80004ee0:	03b13423          	sd	s11,40(sp)
    80004ee4:	00005317          	auipc	t1,0x5
    80004ee8:	91c30313          	addi	t1,t1,-1764 # 80009800 <pr>
    80004eec:	01832c03          	lw	s8,24(t1)
    80004ef0:	00b43423          	sd	a1,8(s0)
    80004ef4:	00c43823          	sd	a2,16(s0)
    80004ef8:	00d43c23          	sd	a3,24(s0)
    80004efc:	02e43023          	sd	a4,32(s0)
    80004f00:	02f43423          	sd	a5,40(s0)
    80004f04:	03043823          	sd	a6,48(s0)
    80004f08:	03143c23          	sd	a7,56(s0)
    80004f0c:	00050993          	mv	s3,a0
    80004f10:	4a0c1663          	bnez	s8,800053bc <__printf+0x514>
    80004f14:	60098c63          	beqz	s3,8000552c <__printf+0x684>
    80004f18:	0009c503          	lbu	a0,0(s3)
    80004f1c:	00840793          	addi	a5,s0,8
    80004f20:	f6f43c23          	sd	a5,-136(s0)
    80004f24:	00000493          	li	s1,0
    80004f28:	22050063          	beqz	a0,80005148 <__printf+0x2a0>
    80004f2c:	00002a37          	lui	s4,0x2
    80004f30:	00018ab7          	lui	s5,0x18
    80004f34:	000f4b37          	lui	s6,0xf4
    80004f38:	00989bb7          	lui	s7,0x989
    80004f3c:	70fa0a13          	addi	s4,s4,1807 # 270f <_entry-0x7fffd8f1>
    80004f40:	69fa8a93          	addi	s5,s5,1695 # 1869f <_entry-0x7ffe7961>
    80004f44:	23fb0b13          	addi	s6,s6,575 # f423f <_entry-0x7ff0bdc1>
    80004f48:	67fb8b93          	addi	s7,s7,1663 # 98967f <_entry-0x7f676981>
    80004f4c:	00148c9b          	addiw	s9,s1,1
    80004f50:	02500793          	li	a5,37
    80004f54:	01998933          	add	s2,s3,s9
    80004f58:	38f51263          	bne	a0,a5,800052dc <__printf+0x434>
    80004f5c:	00094783          	lbu	a5,0(s2)
    80004f60:	00078c9b          	sext.w	s9,a5
    80004f64:	1e078263          	beqz	a5,80005148 <__printf+0x2a0>
    80004f68:	0024849b          	addiw	s1,s1,2
    80004f6c:	07000713          	li	a4,112
    80004f70:	00998933          	add	s2,s3,s1
    80004f74:	38e78a63          	beq	a5,a4,80005308 <__printf+0x460>
    80004f78:	20f76863          	bltu	a4,a5,80005188 <__printf+0x2e0>
    80004f7c:	42a78863          	beq	a5,a0,800053ac <__printf+0x504>
    80004f80:	06400713          	li	a4,100
    80004f84:	40e79663          	bne	a5,a4,80005390 <__printf+0x4e8>
    80004f88:	f7843783          	ld	a5,-136(s0)
    80004f8c:	0007a603          	lw	a2,0(a5)
    80004f90:	00878793          	addi	a5,a5,8
    80004f94:	f6f43c23          	sd	a5,-136(s0)
    80004f98:	42064a63          	bltz	a2,800053cc <__printf+0x524>
    80004f9c:	00a00713          	li	a4,10
    80004fa0:	02e677bb          	remuw	a5,a2,a4
    80004fa4:	00002d97          	auipc	s11,0x2
    80004fa8:	444d8d93          	addi	s11,s11,1092 # 800073e8 <digits>
    80004fac:	00900593          	li	a1,9
    80004fb0:	0006051b          	sext.w	a0,a2
    80004fb4:	00000c93          	li	s9,0
    80004fb8:	02079793          	slli	a5,a5,0x20
    80004fbc:	0207d793          	srli	a5,a5,0x20
    80004fc0:	00fd87b3          	add	a5,s11,a5
    80004fc4:	0007c783          	lbu	a5,0(a5)
    80004fc8:	02e656bb          	divuw	a3,a2,a4
    80004fcc:	f8f40023          	sb	a5,-128(s0)
    80004fd0:	14c5d863          	bge	a1,a2,80005120 <__printf+0x278>
    80004fd4:	06300593          	li	a1,99
    80004fd8:	00100c93          	li	s9,1
    80004fdc:	02e6f7bb          	remuw	a5,a3,a4
    80004fe0:	02079793          	slli	a5,a5,0x20
    80004fe4:	0207d793          	srli	a5,a5,0x20
    80004fe8:	00fd87b3          	add	a5,s11,a5
    80004fec:	0007c783          	lbu	a5,0(a5)
    80004ff0:	02e6d73b          	divuw	a4,a3,a4
    80004ff4:	f8f400a3          	sb	a5,-127(s0)
    80004ff8:	12a5f463          	bgeu	a1,a0,80005120 <__printf+0x278>
    80004ffc:	00a00693          	li	a3,10
    80005000:	00900593          	li	a1,9
    80005004:	02d777bb          	remuw	a5,a4,a3
    80005008:	02079793          	slli	a5,a5,0x20
    8000500c:	0207d793          	srli	a5,a5,0x20
    80005010:	00fd87b3          	add	a5,s11,a5
    80005014:	0007c503          	lbu	a0,0(a5)
    80005018:	02d757bb          	divuw	a5,a4,a3
    8000501c:	f8a40123          	sb	a0,-126(s0)
    80005020:	48e5f263          	bgeu	a1,a4,800054a4 <__printf+0x5fc>
    80005024:	06300513          	li	a0,99
    80005028:	02d7f5bb          	remuw	a1,a5,a3
    8000502c:	02059593          	slli	a1,a1,0x20
    80005030:	0205d593          	srli	a1,a1,0x20
    80005034:	00bd85b3          	add	a1,s11,a1
    80005038:	0005c583          	lbu	a1,0(a1)
    8000503c:	02d7d7bb          	divuw	a5,a5,a3
    80005040:	f8b401a3          	sb	a1,-125(s0)
    80005044:	48e57263          	bgeu	a0,a4,800054c8 <__printf+0x620>
    80005048:	3e700513          	li	a0,999
    8000504c:	02d7f5bb          	remuw	a1,a5,a3
    80005050:	02059593          	slli	a1,a1,0x20
    80005054:	0205d593          	srli	a1,a1,0x20
    80005058:	00bd85b3          	add	a1,s11,a1
    8000505c:	0005c583          	lbu	a1,0(a1)
    80005060:	02d7d7bb          	divuw	a5,a5,a3
    80005064:	f8b40223          	sb	a1,-124(s0)
    80005068:	46e57663          	bgeu	a0,a4,800054d4 <__printf+0x62c>
    8000506c:	02d7f5bb          	remuw	a1,a5,a3
    80005070:	02059593          	slli	a1,a1,0x20
    80005074:	0205d593          	srli	a1,a1,0x20
    80005078:	00bd85b3          	add	a1,s11,a1
    8000507c:	0005c583          	lbu	a1,0(a1)
    80005080:	02d7d7bb          	divuw	a5,a5,a3
    80005084:	f8b402a3          	sb	a1,-123(s0)
    80005088:	46ea7863          	bgeu	s4,a4,800054f8 <__printf+0x650>
    8000508c:	02d7f5bb          	remuw	a1,a5,a3
    80005090:	02059593          	slli	a1,a1,0x20
    80005094:	0205d593          	srli	a1,a1,0x20
    80005098:	00bd85b3          	add	a1,s11,a1
    8000509c:	0005c583          	lbu	a1,0(a1)
    800050a0:	02d7d7bb          	divuw	a5,a5,a3
    800050a4:	f8b40323          	sb	a1,-122(s0)
    800050a8:	3eeaf863          	bgeu	s5,a4,80005498 <__printf+0x5f0>
    800050ac:	02d7f5bb          	remuw	a1,a5,a3
    800050b0:	02059593          	slli	a1,a1,0x20
    800050b4:	0205d593          	srli	a1,a1,0x20
    800050b8:	00bd85b3          	add	a1,s11,a1
    800050bc:	0005c583          	lbu	a1,0(a1)
    800050c0:	02d7d7bb          	divuw	a5,a5,a3
    800050c4:	f8b403a3          	sb	a1,-121(s0)
    800050c8:	42eb7e63          	bgeu	s6,a4,80005504 <__printf+0x65c>
    800050cc:	02d7f5bb          	remuw	a1,a5,a3
    800050d0:	02059593          	slli	a1,a1,0x20
    800050d4:	0205d593          	srli	a1,a1,0x20
    800050d8:	00bd85b3          	add	a1,s11,a1
    800050dc:	0005c583          	lbu	a1,0(a1)
    800050e0:	02d7d7bb          	divuw	a5,a5,a3
    800050e4:	f8b40423          	sb	a1,-120(s0)
    800050e8:	42ebfc63          	bgeu	s7,a4,80005520 <__printf+0x678>
    800050ec:	02079793          	slli	a5,a5,0x20
    800050f0:	0207d793          	srli	a5,a5,0x20
    800050f4:	00fd8db3          	add	s11,s11,a5
    800050f8:	000dc703          	lbu	a4,0(s11)
    800050fc:	00a00793          	li	a5,10
    80005100:	00900c93          	li	s9,9
    80005104:	f8e404a3          	sb	a4,-119(s0)
    80005108:	00065c63          	bgez	a2,80005120 <__printf+0x278>
    8000510c:	f9040713          	addi	a4,s0,-112
    80005110:	00f70733          	add	a4,a4,a5
    80005114:	02d00693          	li	a3,45
    80005118:	fed70823          	sb	a3,-16(a4)
    8000511c:	00078c93          	mv	s9,a5
    80005120:	f8040793          	addi	a5,s0,-128
    80005124:	01978cb3          	add	s9,a5,s9
    80005128:	f7f40d13          	addi	s10,s0,-129
    8000512c:	000cc503          	lbu	a0,0(s9)
    80005130:	fffc8c93          	addi	s9,s9,-1
    80005134:	00000097          	auipc	ra,0x0
    80005138:	b90080e7          	jalr	-1136(ra) # 80004cc4 <consputc>
    8000513c:	ffac98e3          	bne	s9,s10,8000512c <__printf+0x284>
    80005140:	00094503          	lbu	a0,0(s2)
    80005144:	e00514e3          	bnez	a0,80004f4c <__printf+0xa4>
    80005148:	1a0c1663          	bnez	s8,800052f4 <__printf+0x44c>
    8000514c:	08813083          	ld	ra,136(sp)
    80005150:	08013403          	ld	s0,128(sp)
    80005154:	07813483          	ld	s1,120(sp)
    80005158:	07013903          	ld	s2,112(sp)
    8000515c:	06813983          	ld	s3,104(sp)
    80005160:	06013a03          	ld	s4,96(sp)
    80005164:	05813a83          	ld	s5,88(sp)
    80005168:	05013b03          	ld	s6,80(sp)
    8000516c:	04813b83          	ld	s7,72(sp)
    80005170:	04013c03          	ld	s8,64(sp)
    80005174:	03813c83          	ld	s9,56(sp)
    80005178:	03013d03          	ld	s10,48(sp)
    8000517c:	02813d83          	ld	s11,40(sp)
    80005180:	0d010113          	addi	sp,sp,208
    80005184:	00008067          	ret
    80005188:	07300713          	li	a4,115
    8000518c:	1ce78a63          	beq	a5,a4,80005360 <__printf+0x4b8>
    80005190:	07800713          	li	a4,120
    80005194:	1ee79e63          	bne	a5,a4,80005390 <__printf+0x4e8>
    80005198:	f7843783          	ld	a5,-136(s0)
    8000519c:	0007a703          	lw	a4,0(a5)
    800051a0:	00878793          	addi	a5,a5,8
    800051a4:	f6f43c23          	sd	a5,-136(s0)
    800051a8:	28074263          	bltz	a4,8000542c <__printf+0x584>
    800051ac:	00002d97          	auipc	s11,0x2
    800051b0:	23cd8d93          	addi	s11,s11,572 # 800073e8 <digits>
    800051b4:	00f77793          	andi	a5,a4,15
    800051b8:	00fd87b3          	add	a5,s11,a5
    800051bc:	0007c683          	lbu	a3,0(a5)
    800051c0:	00f00613          	li	a2,15
    800051c4:	0007079b          	sext.w	a5,a4
    800051c8:	f8d40023          	sb	a3,-128(s0)
    800051cc:	0047559b          	srliw	a1,a4,0x4
    800051d0:	0047569b          	srliw	a3,a4,0x4
    800051d4:	00000c93          	li	s9,0
    800051d8:	0ee65063          	bge	a2,a4,800052b8 <__printf+0x410>
    800051dc:	00f6f693          	andi	a3,a3,15
    800051e0:	00dd86b3          	add	a3,s11,a3
    800051e4:	0006c683          	lbu	a3,0(a3) # 2004000 <_entry-0x7dffc000>
    800051e8:	0087d79b          	srliw	a5,a5,0x8
    800051ec:	00100c93          	li	s9,1
    800051f0:	f8d400a3          	sb	a3,-127(s0)
    800051f4:	0cb67263          	bgeu	a2,a1,800052b8 <__printf+0x410>
    800051f8:	00f7f693          	andi	a3,a5,15
    800051fc:	00dd86b3          	add	a3,s11,a3
    80005200:	0006c583          	lbu	a1,0(a3)
    80005204:	00f00613          	li	a2,15
    80005208:	0047d69b          	srliw	a3,a5,0x4
    8000520c:	f8b40123          	sb	a1,-126(s0)
    80005210:	0047d593          	srli	a1,a5,0x4
    80005214:	28f67e63          	bgeu	a2,a5,800054b0 <__printf+0x608>
    80005218:	00f6f693          	andi	a3,a3,15
    8000521c:	00dd86b3          	add	a3,s11,a3
    80005220:	0006c503          	lbu	a0,0(a3)
    80005224:	0087d813          	srli	a6,a5,0x8
    80005228:	0087d69b          	srliw	a3,a5,0x8
    8000522c:	f8a401a3          	sb	a0,-125(s0)
    80005230:	28b67663          	bgeu	a2,a1,800054bc <__printf+0x614>
    80005234:	00f6f693          	andi	a3,a3,15
    80005238:	00dd86b3          	add	a3,s11,a3
    8000523c:	0006c583          	lbu	a1,0(a3)
    80005240:	00c7d513          	srli	a0,a5,0xc
    80005244:	00c7d69b          	srliw	a3,a5,0xc
    80005248:	f8b40223          	sb	a1,-124(s0)
    8000524c:	29067a63          	bgeu	a2,a6,800054e0 <__printf+0x638>
    80005250:	00f6f693          	andi	a3,a3,15
    80005254:	00dd86b3          	add	a3,s11,a3
    80005258:	0006c583          	lbu	a1,0(a3)
    8000525c:	0107d813          	srli	a6,a5,0x10
    80005260:	0107d69b          	srliw	a3,a5,0x10
    80005264:	f8b402a3          	sb	a1,-123(s0)
    80005268:	28a67263          	bgeu	a2,a0,800054ec <__printf+0x644>
    8000526c:	00f6f693          	andi	a3,a3,15
    80005270:	00dd86b3          	add	a3,s11,a3
    80005274:	0006c683          	lbu	a3,0(a3)
    80005278:	0147d79b          	srliw	a5,a5,0x14
    8000527c:	f8d40323          	sb	a3,-122(s0)
    80005280:	21067663          	bgeu	a2,a6,8000548c <__printf+0x5e4>
    80005284:	02079793          	slli	a5,a5,0x20
    80005288:	0207d793          	srli	a5,a5,0x20
    8000528c:	00fd8db3          	add	s11,s11,a5
    80005290:	000dc683          	lbu	a3,0(s11)
    80005294:	00800793          	li	a5,8
    80005298:	00700c93          	li	s9,7
    8000529c:	f8d403a3          	sb	a3,-121(s0)
    800052a0:	00075c63          	bgez	a4,800052b8 <__printf+0x410>
    800052a4:	f9040713          	addi	a4,s0,-112
    800052a8:	00f70733          	add	a4,a4,a5
    800052ac:	02d00693          	li	a3,45
    800052b0:	fed70823          	sb	a3,-16(a4)
    800052b4:	00078c93          	mv	s9,a5
    800052b8:	f8040793          	addi	a5,s0,-128
    800052bc:	01978cb3          	add	s9,a5,s9
    800052c0:	f7f40d13          	addi	s10,s0,-129
    800052c4:	000cc503          	lbu	a0,0(s9)
    800052c8:	fffc8c93          	addi	s9,s9,-1
    800052cc:	00000097          	auipc	ra,0x0
    800052d0:	9f8080e7          	jalr	-1544(ra) # 80004cc4 <consputc>
    800052d4:	ff9d18e3          	bne	s10,s9,800052c4 <__printf+0x41c>
    800052d8:	0100006f          	j	800052e8 <__printf+0x440>
    800052dc:	00000097          	auipc	ra,0x0
    800052e0:	9e8080e7          	jalr	-1560(ra) # 80004cc4 <consputc>
    800052e4:	000c8493          	mv	s1,s9
    800052e8:	00094503          	lbu	a0,0(s2)
    800052ec:	c60510e3          	bnez	a0,80004f4c <__printf+0xa4>
    800052f0:	e40c0ee3          	beqz	s8,8000514c <__printf+0x2a4>
    800052f4:	00004517          	auipc	a0,0x4
    800052f8:	50c50513          	addi	a0,a0,1292 # 80009800 <pr>
    800052fc:	00001097          	auipc	ra,0x1
    80005300:	94c080e7          	jalr	-1716(ra) # 80005c48 <release>
    80005304:	e49ff06f          	j	8000514c <__printf+0x2a4>
    80005308:	f7843783          	ld	a5,-136(s0)
    8000530c:	03000513          	li	a0,48
    80005310:	01000d13          	li	s10,16
    80005314:	00878713          	addi	a4,a5,8
    80005318:	0007bc83          	ld	s9,0(a5)
    8000531c:	f6e43c23          	sd	a4,-136(s0)
    80005320:	00000097          	auipc	ra,0x0
    80005324:	9a4080e7          	jalr	-1628(ra) # 80004cc4 <consputc>
    80005328:	07800513          	li	a0,120
    8000532c:	00000097          	auipc	ra,0x0
    80005330:	998080e7          	jalr	-1640(ra) # 80004cc4 <consputc>
    80005334:	00002d97          	auipc	s11,0x2
    80005338:	0b4d8d93          	addi	s11,s11,180 # 800073e8 <digits>
    8000533c:	03ccd793          	srli	a5,s9,0x3c
    80005340:	00fd87b3          	add	a5,s11,a5
    80005344:	0007c503          	lbu	a0,0(a5)
    80005348:	fffd0d1b          	addiw	s10,s10,-1
    8000534c:	004c9c93          	slli	s9,s9,0x4
    80005350:	00000097          	auipc	ra,0x0
    80005354:	974080e7          	jalr	-1676(ra) # 80004cc4 <consputc>
    80005358:	fe0d12e3          	bnez	s10,8000533c <__printf+0x494>
    8000535c:	f8dff06f          	j	800052e8 <__printf+0x440>
    80005360:	f7843783          	ld	a5,-136(s0)
    80005364:	0007bc83          	ld	s9,0(a5)
    80005368:	00878793          	addi	a5,a5,8
    8000536c:	f6f43c23          	sd	a5,-136(s0)
    80005370:	000c9a63          	bnez	s9,80005384 <__printf+0x4dc>
    80005374:	1080006f          	j	8000547c <__printf+0x5d4>
    80005378:	001c8c93          	addi	s9,s9,1
    8000537c:	00000097          	auipc	ra,0x0
    80005380:	948080e7          	jalr	-1720(ra) # 80004cc4 <consputc>
    80005384:	000cc503          	lbu	a0,0(s9)
    80005388:	fe0518e3          	bnez	a0,80005378 <__printf+0x4d0>
    8000538c:	f5dff06f          	j	800052e8 <__printf+0x440>
    80005390:	02500513          	li	a0,37
    80005394:	00000097          	auipc	ra,0x0
    80005398:	930080e7          	jalr	-1744(ra) # 80004cc4 <consputc>
    8000539c:	000c8513          	mv	a0,s9
    800053a0:	00000097          	auipc	ra,0x0
    800053a4:	924080e7          	jalr	-1756(ra) # 80004cc4 <consputc>
    800053a8:	f41ff06f          	j	800052e8 <__printf+0x440>
    800053ac:	02500513          	li	a0,37
    800053b0:	00000097          	auipc	ra,0x0
    800053b4:	914080e7          	jalr	-1772(ra) # 80004cc4 <consputc>
    800053b8:	f31ff06f          	j	800052e8 <__printf+0x440>
    800053bc:	00030513          	mv	a0,t1
    800053c0:	00000097          	auipc	ra,0x0
    800053c4:	7bc080e7          	jalr	1980(ra) # 80005b7c <acquire>
    800053c8:	b4dff06f          	j	80004f14 <__printf+0x6c>
    800053cc:	40c0053b          	negw	a0,a2
    800053d0:	00a00713          	li	a4,10
    800053d4:	02e576bb          	remuw	a3,a0,a4
    800053d8:	00002d97          	auipc	s11,0x2
    800053dc:	010d8d93          	addi	s11,s11,16 # 800073e8 <digits>
    800053e0:	ff700593          	li	a1,-9
    800053e4:	02069693          	slli	a3,a3,0x20
    800053e8:	0206d693          	srli	a3,a3,0x20
    800053ec:	00dd86b3          	add	a3,s11,a3
    800053f0:	0006c683          	lbu	a3,0(a3)
    800053f4:	02e557bb          	divuw	a5,a0,a4
    800053f8:	f8d40023          	sb	a3,-128(s0)
    800053fc:	10b65e63          	bge	a2,a1,80005518 <__printf+0x670>
    80005400:	06300593          	li	a1,99
    80005404:	02e7f6bb          	remuw	a3,a5,a4
    80005408:	02069693          	slli	a3,a3,0x20
    8000540c:	0206d693          	srli	a3,a3,0x20
    80005410:	00dd86b3          	add	a3,s11,a3
    80005414:	0006c683          	lbu	a3,0(a3)
    80005418:	02e7d73b          	divuw	a4,a5,a4
    8000541c:	00200793          	li	a5,2
    80005420:	f8d400a3          	sb	a3,-127(s0)
    80005424:	bca5ece3          	bltu	a1,a0,80004ffc <__printf+0x154>
    80005428:	ce5ff06f          	j	8000510c <__printf+0x264>
    8000542c:	40e007bb          	negw	a5,a4
    80005430:	00002d97          	auipc	s11,0x2
    80005434:	fb8d8d93          	addi	s11,s11,-72 # 800073e8 <digits>
    80005438:	00f7f693          	andi	a3,a5,15
    8000543c:	00dd86b3          	add	a3,s11,a3
    80005440:	0006c583          	lbu	a1,0(a3)
    80005444:	ff100613          	li	a2,-15
    80005448:	0047d69b          	srliw	a3,a5,0x4
    8000544c:	f8b40023          	sb	a1,-128(s0)
    80005450:	0047d59b          	srliw	a1,a5,0x4
    80005454:	0ac75e63          	bge	a4,a2,80005510 <__printf+0x668>
    80005458:	00f6f693          	andi	a3,a3,15
    8000545c:	00dd86b3          	add	a3,s11,a3
    80005460:	0006c603          	lbu	a2,0(a3)
    80005464:	00f00693          	li	a3,15
    80005468:	0087d79b          	srliw	a5,a5,0x8
    8000546c:	f8c400a3          	sb	a2,-127(s0)
    80005470:	d8b6e4e3          	bltu	a3,a1,800051f8 <__printf+0x350>
    80005474:	00200793          	li	a5,2
    80005478:	e2dff06f          	j	800052a4 <__printf+0x3fc>
    8000547c:	00002c97          	auipc	s9,0x2
    80005480:	f4cc8c93          	addi	s9,s9,-180 # 800073c8 <CONSOLE_STATUS+0x3b8>
    80005484:	02800513          	li	a0,40
    80005488:	ef1ff06f          	j	80005378 <__printf+0x4d0>
    8000548c:	00700793          	li	a5,7
    80005490:	00600c93          	li	s9,6
    80005494:	e0dff06f          	j	800052a0 <__printf+0x3f8>
    80005498:	00700793          	li	a5,7
    8000549c:	00600c93          	li	s9,6
    800054a0:	c69ff06f          	j	80005108 <__printf+0x260>
    800054a4:	00300793          	li	a5,3
    800054a8:	00200c93          	li	s9,2
    800054ac:	c5dff06f          	j	80005108 <__printf+0x260>
    800054b0:	00300793          	li	a5,3
    800054b4:	00200c93          	li	s9,2
    800054b8:	de9ff06f          	j	800052a0 <__printf+0x3f8>
    800054bc:	00400793          	li	a5,4
    800054c0:	00300c93          	li	s9,3
    800054c4:	dddff06f          	j	800052a0 <__printf+0x3f8>
    800054c8:	00400793          	li	a5,4
    800054cc:	00300c93          	li	s9,3
    800054d0:	c39ff06f          	j	80005108 <__printf+0x260>
    800054d4:	00500793          	li	a5,5
    800054d8:	00400c93          	li	s9,4
    800054dc:	c2dff06f          	j	80005108 <__printf+0x260>
    800054e0:	00500793          	li	a5,5
    800054e4:	00400c93          	li	s9,4
    800054e8:	db9ff06f          	j	800052a0 <__printf+0x3f8>
    800054ec:	00600793          	li	a5,6
    800054f0:	00500c93          	li	s9,5
    800054f4:	dadff06f          	j	800052a0 <__printf+0x3f8>
    800054f8:	00600793          	li	a5,6
    800054fc:	00500c93          	li	s9,5
    80005500:	c09ff06f          	j	80005108 <__printf+0x260>
    80005504:	00800793          	li	a5,8
    80005508:	00700c93          	li	s9,7
    8000550c:	bfdff06f          	j	80005108 <__printf+0x260>
    80005510:	00100793          	li	a5,1
    80005514:	d91ff06f          	j	800052a4 <__printf+0x3fc>
    80005518:	00100793          	li	a5,1
    8000551c:	bf1ff06f          	j	8000510c <__printf+0x264>
    80005520:	00900793          	li	a5,9
    80005524:	00800c93          	li	s9,8
    80005528:	be1ff06f          	j	80005108 <__printf+0x260>
    8000552c:	00002517          	auipc	a0,0x2
    80005530:	ea450513          	addi	a0,a0,-348 # 800073d0 <CONSOLE_STATUS+0x3c0>
    80005534:	00000097          	auipc	ra,0x0
    80005538:	918080e7          	jalr	-1768(ra) # 80004e4c <panic>

000000008000553c <printfinit>:
    8000553c:	fe010113          	addi	sp,sp,-32
    80005540:	00813823          	sd	s0,16(sp)
    80005544:	00913423          	sd	s1,8(sp)
    80005548:	00113c23          	sd	ra,24(sp)
    8000554c:	02010413          	addi	s0,sp,32
    80005550:	00004497          	auipc	s1,0x4
    80005554:	2b048493          	addi	s1,s1,688 # 80009800 <pr>
    80005558:	00048513          	mv	a0,s1
    8000555c:	00002597          	auipc	a1,0x2
    80005560:	e8458593          	addi	a1,a1,-380 # 800073e0 <CONSOLE_STATUS+0x3d0>
    80005564:	00000097          	auipc	ra,0x0
    80005568:	5f4080e7          	jalr	1524(ra) # 80005b58 <initlock>
    8000556c:	01813083          	ld	ra,24(sp)
    80005570:	01013403          	ld	s0,16(sp)
    80005574:	0004ac23          	sw	zero,24(s1)
    80005578:	00813483          	ld	s1,8(sp)
    8000557c:	02010113          	addi	sp,sp,32
    80005580:	00008067          	ret

0000000080005584 <uartinit>:
    80005584:	ff010113          	addi	sp,sp,-16
    80005588:	00813423          	sd	s0,8(sp)
    8000558c:	01010413          	addi	s0,sp,16
    80005590:	100007b7          	lui	a5,0x10000
    80005594:	000780a3          	sb	zero,1(a5) # 10000001 <_entry-0x6fffffff>
    80005598:	f8000713          	li	a4,-128
    8000559c:	00e781a3          	sb	a4,3(a5)
    800055a0:	00300713          	li	a4,3
    800055a4:	00e78023          	sb	a4,0(a5)
    800055a8:	000780a3          	sb	zero,1(a5)
    800055ac:	00e781a3          	sb	a4,3(a5)
    800055b0:	00700693          	li	a3,7
    800055b4:	00d78123          	sb	a3,2(a5)
    800055b8:	00e780a3          	sb	a4,1(a5)
    800055bc:	00813403          	ld	s0,8(sp)
    800055c0:	01010113          	addi	sp,sp,16
    800055c4:	00008067          	ret

00000000800055c8 <uartputc>:
    800055c8:	00003797          	auipc	a5,0x3
    800055cc:	f307a783          	lw	a5,-208(a5) # 800084f8 <panicked>
    800055d0:	00078463          	beqz	a5,800055d8 <uartputc+0x10>
    800055d4:	0000006f          	j	800055d4 <uartputc+0xc>
    800055d8:	fd010113          	addi	sp,sp,-48
    800055dc:	02813023          	sd	s0,32(sp)
    800055e0:	00913c23          	sd	s1,24(sp)
    800055e4:	01213823          	sd	s2,16(sp)
    800055e8:	01313423          	sd	s3,8(sp)
    800055ec:	02113423          	sd	ra,40(sp)
    800055f0:	03010413          	addi	s0,sp,48
    800055f4:	00003917          	auipc	s2,0x3
    800055f8:	f0c90913          	addi	s2,s2,-244 # 80008500 <uart_tx_r>
    800055fc:	00093783          	ld	a5,0(s2)
    80005600:	00003497          	auipc	s1,0x3
    80005604:	f0848493          	addi	s1,s1,-248 # 80008508 <uart_tx_w>
    80005608:	0004b703          	ld	a4,0(s1)
    8000560c:	02078693          	addi	a3,a5,32
    80005610:	00050993          	mv	s3,a0
    80005614:	02e69c63          	bne	a3,a4,8000564c <uartputc+0x84>
    80005618:	00001097          	auipc	ra,0x1
    8000561c:	834080e7          	jalr	-1996(ra) # 80005e4c <push_on>
    80005620:	00093783          	ld	a5,0(s2)
    80005624:	0004b703          	ld	a4,0(s1)
    80005628:	02078793          	addi	a5,a5,32
    8000562c:	00e79463          	bne	a5,a4,80005634 <uartputc+0x6c>
    80005630:	0000006f          	j	80005630 <uartputc+0x68>
    80005634:	00001097          	auipc	ra,0x1
    80005638:	88c080e7          	jalr	-1908(ra) # 80005ec0 <pop_on>
    8000563c:	00093783          	ld	a5,0(s2)
    80005640:	0004b703          	ld	a4,0(s1)
    80005644:	02078693          	addi	a3,a5,32
    80005648:	fce688e3          	beq	a3,a4,80005618 <uartputc+0x50>
    8000564c:	01f77693          	andi	a3,a4,31
    80005650:	00004597          	auipc	a1,0x4
    80005654:	1d058593          	addi	a1,a1,464 # 80009820 <uart_tx_buf>
    80005658:	00d586b3          	add	a3,a1,a3
    8000565c:	00170713          	addi	a4,a4,1
    80005660:	01368023          	sb	s3,0(a3)
    80005664:	00e4b023          	sd	a4,0(s1)
    80005668:	10000637          	lui	a2,0x10000
    8000566c:	02f71063          	bne	a4,a5,8000568c <uartputc+0xc4>
    80005670:	0340006f          	j	800056a4 <uartputc+0xdc>
    80005674:	00074703          	lbu	a4,0(a4)
    80005678:	00f93023          	sd	a5,0(s2)
    8000567c:	00e60023          	sb	a4,0(a2) # 10000000 <_entry-0x70000000>
    80005680:	00093783          	ld	a5,0(s2)
    80005684:	0004b703          	ld	a4,0(s1)
    80005688:	00f70e63          	beq	a4,a5,800056a4 <uartputc+0xdc>
    8000568c:	00564683          	lbu	a3,5(a2)
    80005690:	01f7f713          	andi	a4,a5,31
    80005694:	00e58733          	add	a4,a1,a4
    80005698:	0206f693          	andi	a3,a3,32
    8000569c:	00178793          	addi	a5,a5,1
    800056a0:	fc069ae3          	bnez	a3,80005674 <uartputc+0xac>
    800056a4:	02813083          	ld	ra,40(sp)
    800056a8:	02013403          	ld	s0,32(sp)
    800056ac:	01813483          	ld	s1,24(sp)
    800056b0:	01013903          	ld	s2,16(sp)
    800056b4:	00813983          	ld	s3,8(sp)
    800056b8:	03010113          	addi	sp,sp,48
    800056bc:	00008067          	ret

00000000800056c0 <uartputc_sync>:
    800056c0:	ff010113          	addi	sp,sp,-16
    800056c4:	00813423          	sd	s0,8(sp)
    800056c8:	01010413          	addi	s0,sp,16
    800056cc:	00003717          	auipc	a4,0x3
    800056d0:	e2c72703          	lw	a4,-468(a4) # 800084f8 <panicked>
    800056d4:	02071663          	bnez	a4,80005700 <uartputc_sync+0x40>
    800056d8:	00050793          	mv	a5,a0
    800056dc:	100006b7          	lui	a3,0x10000
    800056e0:	0056c703          	lbu	a4,5(a3) # 10000005 <_entry-0x6ffffffb>
    800056e4:	02077713          	andi	a4,a4,32
    800056e8:	fe070ce3          	beqz	a4,800056e0 <uartputc_sync+0x20>
    800056ec:	0ff7f793          	andi	a5,a5,255
    800056f0:	00f68023          	sb	a5,0(a3)
    800056f4:	00813403          	ld	s0,8(sp)
    800056f8:	01010113          	addi	sp,sp,16
    800056fc:	00008067          	ret
    80005700:	0000006f          	j	80005700 <uartputc_sync+0x40>

0000000080005704 <uartstart>:
    80005704:	ff010113          	addi	sp,sp,-16
    80005708:	00813423          	sd	s0,8(sp)
    8000570c:	01010413          	addi	s0,sp,16
    80005710:	00003617          	auipc	a2,0x3
    80005714:	df060613          	addi	a2,a2,-528 # 80008500 <uart_tx_r>
    80005718:	00003517          	auipc	a0,0x3
    8000571c:	df050513          	addi	a0,a0,-528 # 80008508 <uart_tx_w>
    80005720:	00063783          	ld	a5,0(a2)
    80005724:	00053703          	ld	a4,0(a0)
    80005728:	04f70263          	beq	a4,a5,8000576c <uartstart+0x68>
    8000572c:	100005b7          	lui	a1,0x10000
    80005730:	00004817          	auipc	a6,0x4
    80005734:	0f080813          	addi	a6,a6,240 # 80009820 <uart_tx_buf>
    80005738:	01c0006f          	j	80005754 <uartstart+0x50>
    8000573c:	0006c703          	lbu	a4,0(a3)
    80005740:	00f63023          	sd	a5,0(a2)
    80005744:	00e58023          	sb	a4,0(a1) # 10000000 <_entry-0x70000000>
    80005748:	00063783          	ld	a5,0(a2)
    8000574c:	00053703          	ld	a4,0(a0)
    80005750:	00f70e63          	beq	a4,a5,8000576c <uartstart+0x68>
    80005754:	01f7f713          	andi	a4,a5,31
    80005758:	00e806b3          	add	a3,a6,a4
    8000575c:	0055c703          	lbu	a4,5(a1)
    80005760:	00178793          	addi	a5,a5,1
    80005764:	02077713          	andi	a4,a4,32
    80005768:	fc071ae3          	bnez	a4,8000573c <uartstart+0x38>
    8000576c:	00813403          	ld	s0,8(sp)
    80005770:	01010113          	addi	sp,sp,16
    80005774:	00008067          	ret

0000000080005778 <uartgetc>:
    80005778:	ff010113          	addi	sp,sp,-16
    8000577c:	00813423          	sd	s0,8(sp)
    80005780:	01010413          	addi	s0,sp,16
    80005784:	10000737          	lui	a4,0x10000
    80005788:	00574783          	lbu	a5,5(a4) # 10000005 <_entry-0x6ffffffb>
    8000578c:	0017f793          	andi	a5,a5,1
    80005790:	00078c63          	beqz	a5,800057a8 <uartgetc+0x30>
    80005794:	00074503          	lbu	a0,0(a4)
    80005798:	0ff57513          	andi	a0,a0,255
    8000579c:	00813403          	ld	s0,8(sp)
    800057a0:	01010113          	addi	sp,sp,16
    800057a4:	00008067          	ret
    800057a8:	fff00513          	li	a0,-1
    800057ac:	ff1ff06f          	j	8000579c <uartgetc+0x24>

00000000800057b0 <uartintr>:
    800057b0:	100007b7          	lui	a5,0x10000
    800057b4:	0057c783          	lbu	a5,5(a5) # 10000005 <_entry-0x6ffffffb>
    800057b8:	0017f793          	andi	a5,a5,1
    800057bc:	0a078463          	beqz	a5,80005864 <uartintr+0xb4>
    800057c0:	fe010113          	addi	sp,sp,-32
    800057c4:	00813823          	sd	s0,16(sp)
    800057c8:	00913423          	sd	s1,8(sp)
    800057cc:	00113c23          	sd	ra,24(sp)
    800057d0:	02010413          	addi	s0,sp,32
    800057d4:	100004b7          	lui	s1,0x10000
    800057d8:	0004c503          	lbu	a0,0(s1) # 10000000 <_entry-0x70000000>
    800057dc:	0ff57513          	andi	a0,a0,255
    800057e0:	fffff097          	auipc	ra,0xfffff
    800057e4:	534080e7          	jalr	1332(ra) # 80004d14 <consoleintr>
    800057e8:	0054c783          	lbu	a5,5(s1)
    800057ec:	0017f793          	andi	a5,a5,1
    800057f0:	fe0794e3          	bnez	a5,800057d8 <uartintr+0x28>
    800057f4:	00003617          	auipc	a2,0x3
    800057f8:	d0c60613          	addi	a2,a2,-756 # 80008500 <uart_tx_r>
    800057fc:	00003517          	auipc	a0,0x3
    80005800:	d0c50513          	addi	a0,a0,-756 # 80008508 <uart_tx_w>
    80005804:	00063783          	ld	a5,0(a2)
    80005808:	00053703          	ld	a4,0(a0)
    8000580c:	04f70263          	beq	a4,a5,80005850 <uartintr+0xa0>
    80005810:	100005b7          	lui	a1,0x10000
    80005814:	00004817          	auipc	a6,0x4
    80005818:	00c80813          	addi	a6,a6,12 # 80009820 <uart_tx_buf>
    8000581c:	01c0006f          	j	80005838 <uartintr+0x88>
    80005820:	0006c703          	lbu	a4,0(a3)
    80005824:	00f63023          	sd	a5,0(a2)
    80005828:	00e58023          	sb	a4,0(a1) # 10000000 <_entry-0x70000000>
    8000582c:	00063783          	ld	a5,0(a2)
    80005830:	00053703          	ld	a4,0(a0)
    80005834:	00f70e63          	beq	a4,a5,80005850 <uartintr+0xa0>
    80005838:	01f7f713          	andi	a4,a5,31
    8000583c:	00e806b3          	add	a3,a6,a4
    80005840:	0055c703          	lbu	a4,5(a1)
    80005844:	00178793          	addi	a5,a5,1
    80005848:	02077713          	andi	a4,a4,32
    8000584c:	fc071ae3          	bnez	a4,80005820 <uartintr+0x70>
    80005850:	01813083          	ld	ra,24(sp)
    80005854:	01013403          	ld	s0,16(sp)
    80005858:	00813483          	ld	s1,8(sp)
    8000585c:	02010113          	addi	sp,sp,32
    80005860:	00008067          	ret
    80005864:	00003617          	auipc	a2,0x3
    80005868:	c9c60613          	addi	a2,a2,-868 # 80008500 <uart_tx_r>
    8000586c:	00003517          	auipc	a0,0x3
    80005870:	c9c50513          	addi	a0,a0,-868 # 80008508 <uart_tx_w>
    80005874:	00063783          	ld	a5,0(a2)
    80005878:	00053703          	ld	a4,0(a0)
    8000587c:	04f70263          	beq	a4,a5,800058c0 <uartintr+0x110>
    80005880:	100005b7          	lui	a1,0x10000
    80005884:	00004817          	auipc	a6,0x4
    80005888:	f9c80813          	addi	a6,a6,-100 # 80009820 <uart_tx_buf>
    8000588c:	01c0006f          	j	800058a8 <uartintr+0xf8>
    80005890:	0006c703          	lbu	a4,0(a3)
    80005894:	00f63023          	sd	a5,0(a2)
    80005898:	00e58023          	sb	a4,0(a1) # 10000000 <_entry-0x70000000>
    8000589c:	00063783          	ld	a5,0(a2)
    800058a0:	00053703          	ld	a4,0(a0)
    800058a4:	02f70063          	beq	a4,a5,800058c4 <uartintr+0x114>
    800058a8:	01f7f713          	andi	a4,a5,31
    800058ac:	00e806b3          	add	a3,a6,a4
    800058b0:	0055c703          	lbu	a4,5(a1)
    800058b4:	00178793          	addi	a5,a5,1
    800058b8:	02077713          	andi	a4,a4,32
    800058bc:	fc071ae3          	bnez	a4,80005890 <uartintr+0xe0>
    800058c0:	00008067          	ret
    800058c4:	00008067          	ret

00000000800058c8 <kinit>:
    800058c8:	fc010113          	addi	sp,sp,-64
    800058cc:	02913423          	sd	s1,40(sp)
    800058d0:	fffff7b7          	lui	a5,0xfffff
    800058d4:	00005497          	auipc	s1,0x5
    800058d8:	f7b48493          	addi	s1,s1,-133 # 8000a84f <end+0xfff>
    800058dc:	02813823          	sd	s0,48(sp)
    800058e0:	01313c23          	sd	s3,24(sp)
    800058e4:	00f4f4b3          	and	s1,s1,a5
    800058e8:	02113c23          	sd	ra,56(sp)
    800058ec:	03213023          	sd	s2,32(sp)
    800058f0:	01413823          	sd	s4,16(sp)
    800058f4:	01513423          	sd	s5,8(sp)
    800058f8:	04010413          	addi	s0,sp,64
    800058fc:	000017b7          	lui	a5,0x1
    80005900:	01100993          	li	s3,17
    80005904:	00f487b3          	add	a5,s1,a5
    80005908:	01b99993          	slli	s3,s3,0x1b
    8000590c:	06f9e063          	bltu	s3,a5,8000596c <kinit+0xa4>
    80005910:	00004a97          	auipc	s5,0x4
    80005914:	f40a8a93          	addi	s5,s5,-192 # 80009850 <end>
    80005918:	0754ec63          	bltu	s1,s5,80005990 <kinit+0xc8>
    8000591c:	0734fa63          	bgeu	s1,s3,80005990 <kinit+0xc8>
    80005920:	00088a37          	lui	s4,0x88
    80005924:	fffa0a13          	addi	s4,s4,-1 # 87fff <_entry-0x7ff78001>
    80005928:	00003917          	auipc	s2,0x3
    8000592c:	be890913          	addi	s2,s2,-1048 # 80008510 <kmem>
    80005930:	00ca1a13          	slli	s4,s4,0xc
    80005934:	0140006f          	j	80005948 <kinit+0x80>
    80005938:	000017b7          	lui	a5,0x1
    8000593c:	00f484b3          	add	s1,s1,a5
    80005940:	0554e863          	bltu	s1,s5,80005990 <kinit+0xc8>
    80005944:	0534f663          	bgeu	s1,s3,80005990 <kinit+0xc8>
    80005948:	00001637          	lui	a2,0x1
    8000594c:	00100593          	li	a1,1
    80005950:	00048513          	mv	a0,s1
    80005954:	00000097          	auipc	ra,0x0
    80005958:	5e4080e7          	jalr	1508(ra) # 80005f38 <__memset>
    8000595c:	00093783          	ld	a5,0(s2)
    80005960:	00f4b023          	sd	a5,0(s1)
    80005964:	00993023          	sd	s1,0(s2)
    80005968:	fd4498e3          	bne	s1,s4,80005938 <kinit+0x70>
    8000596c:	03813083          	ld	ra,56(sp)
    80005970:	03013403          	ld	s0,48(sp)
    80005974:	02813483          	ld	s1,40(sp)
    80005978:	02013903          	ld	s2,32(sp)
    8000597c:	01813983          	ld	s3,24(sp)
    80005980:	01013a03          	ld	s4,16(sp)
    80005984:	00813a83          	ld	s5,8(sp)
    80005988:	04010113          	addi	sp,sp,64
    8000598c:	00008067          	ret
    80005990:	00002517          	auipc	a0,0x2
    80005994:	a7050513          	addi	a0,a0,-1424 # 80007400 <digits+0x18>
    80005998:	fffff097          	auipc	ra,0xfffff
    8000599c:	4b4080e7          	jalr	1204(ra) # 80004e4c <panic>

00000000800059a0 <freerange>:
    800059a0:	fc010113          	addi	sp,sp,-64
    800059a4:	000017b7          	lui	a5,0x1
    800059a8:	02913423          	sd	s1,40(sp)
    800059ac:	fff78493          	addi	s1,a5,-1 # fff <_entry-0x7ffff001>
    800059b0:	009504b3          	add	s1,a0,s1
    800059b4:	fffff537          	lui	a0,0xfffff
    800059b8:	02813823          	sd	s0,48(sp)
    800059bc:	02113c23          	sd	ra,56(sp)
    800059c0:	03213023          	sd	s2,32(sp)
    800059c4:	01313c23          	sd	s3,24(sp)
    800059c8:	01413823          	sd	s4,16(sp)
    800059cc:	01513423          	sd	s5,8(sp)
    800059d0:	01613023          	sd	s6,0(sp)
    800059d4:	04010413          	addi	s0,sp,64
    800059d8:	00a4f4b3          	and	s1,s1,a0
    800059dc:	00f487b3          	add	a5,s1,a5
    800059e0:	06f5e463          	bltu	a1,a5,80005a48 <freerange+0xa8>
    800059e4:	00004a97          	auipc	s5,0x4
    800059e8:	e6ca8a93          	addi	s5,s5,-404 # 80009850 <end>
    800059ec:	0954e263          	bltu	s1,s5,80005a70 <freerange+0xd0>
    800059f0:	01100993          	li	s3,17
    800059f4:	01b99993          	slli	s3,s3,0x1b
    800059f8:	0734fc63          	bgeu	s1,s3,80005a70 <freerange+0xd0>
    800059fc:	00058a13          	mv	s4,a1
    80005a00:	00003917          	auipc	s2,0x3
    80005a04:	b1090913          	addi	s2,s2,-1264 # 80008510 <kmem>
    80005a08:	00002b37          	lui	s6,0x2
    80005a0c:	0140006f          	j	80005a20 <freerange+0x80>
    80005a10:	000017b7          	lui	a5,0x1
    80005a14:	00f484b3          	add	s1,s1,a5
    80005a18:	0554ec63          	bltu	s1,s5,80005a70 <freerange+0xd0>
    80005a1c:	0534fa63          	bgeu	s1,s3,80005a70 <freerange+0xd0>
    80005a20:	00001637          	lui	a2,0x1
    80005a24:	00100593          	li	a1,1
    80005a28:	00048513          	mv	a0,s1
    80005a2c:	00000097          	auipc	ra,0x0
    80005a30:	50c080e7          	jalr	1292(ra) # 80005f38 <__memset>
    80005a34:	00093703          	ld	a4,0(s2)
    80005a38:	016487b3          	add	a5,s1,s6
    80005a3c:	00e4b023          	sd	a4,0(s1)
    80005a40:	00993023          	sd	s1,0(s2)
    80005a44:	fcfa76e3          	bgeu	s4,a5,80005a10 <freerange+0x70>
    80005a48:	03813083          	ld	ra,56(sp)
    80005a4c:	03013403          	ld	s0,48(sp)
    80005a50:	02813483          	ld	s1,40(sp)
    80005a54:	02013903          	ld	s2,32(sp)
    80005a58:	01813983          	ld	s3,24(sp)
    80005a5c:	01013a03          	ld	s4,16(sp)
    80005a60:	00813a83          	ld	s5,8(sp)
    80005a64:	00013b03          	ld	s6,0(sp)
    80005a68:	04010113          	addi	sp,sp,64
    80005a6c:	00008067          	ret
    80005a70:	00002517          	auipc	a0,0x2
    80005a74:	99050513          	addi	a0,a0,-1648 # 80007400 <digits+0x18>
    80005a78:	fffff097          	auipc	ra,0xfffff
    80005a7c:	3d4080e7          	jalr	980(ra) # 80004e4c <panic>

0000000080005a80 <kfree>:
    80005a80:	fe010113          	addi	sp,sp,-32
    80005a84:	00813823          	sd	s0,16(sp)
    80005a88:	00113c23          	sd	ra,24(sp)
    80005a8c:	00913423          	sd	s1,8(sp)
    80005a90:	02010413          	addi	s0,sp,32
    80005a94:	03451793          	slli	a5,a0,0x34
    80005a98:	04079c63          	bnez	a5,80005af0 <kfree+0x70>
    80005a9c:	00004797          	auipc	a5,0x4
    80005aa0:	db478793          	addi	a5,a5,-588 # 80009850 <end>
    80005aa4:	00050493          	mv	s1,a0
    80005aa8:	04f56463          	bltu	a0,a5,80005af0 <kfree+0x70>
    80005aac:	01100793          	li	a5,17
    80005ab0:	01b79793          	slli	a5,a5,0x1b
    80005ab4:	02f57e63          	bgeu	a0,a5,80005af0 <kfree+0x70>
    80005ab8:	00001637          	lui	a2,0x1
    80005abc:	00100593          	li	a1,1
    80005ac0:	00000097          	auipc	ra,0x0
    80005ac4:	478080e7          	jalr	1144(ra) # 80005f38 <__memset>
    80005ac8:	00003797          	auipc	a5,0x3
    80005acc:	a4878793          	addi	a5,a5,-1464 # 80008510 <kmem>
    80005ad0:	0007b703          	ld	a4,0(a5)
    80005ad4:	01813083          	ld	ra,24(sp)
    80005ad8:	01013403          	ld	s0,16(sp)
    80005adc:	00e4b023          	sd	a4,0(s1)
    80005ae0:	0097b023          	sd	s1,0(a5)
    80005ae4:	00813483          	ld	s1,8(sp)
    80005ae8:	02010113          	addi	sp,sp,32
    80005aec:	00008067          	ret
    80005af0:	00002517          	auipc	a0,0x2
    80005af4:	91050513          	addi	a0,a0,-1776 # 80007400 <digits+0x18>
    80005af8:	fffff097          	auipc	ra,0xfffff
    80005afc:	354080e7          	jalr	852(ra) # 80004e4c <panic>

0000000080005b00 <kalloc>:
    80005b00:	fe010113          	addi	sp,sp,-32
    80005b04:	00813823          	sd	s0,16(sp)
    80005b08:	00913423          	sd	s1,8(sp)
    80005b0c:	00113c23          	sd	ra,24(sp)
    80005b10:	02010413          	addi	s0,sp,32
    80005b14:	00003797          	auipc	a5,0x3
    80005b18:	9fc78793          	addi	a5,a5,-1540 # 80008510 <kmem>
    80005b1c:	0007b483          	ld	s1,0(a5)
    80005b20:	02048063          	beqz	s1,80005b40 <kalloc+0x40>
    80005b24:	0004b703          	ld	a4,0(s1)
    80005b28:	00001637          	lui	a2,0x1
    80005b2c:	00500593          	li	a1,5
    80005b30:	00048513          	mv	a0,s1
    80005b34:	00e7b023          	sd	a4,0(a5)
    80005b38:	00000097          	auipc	ra,0x0
    80005b3c:	400080e7          	jalr	1024(ra) # 80005f38 <__memset>
    80005b40:	01813083          	ld	ra,24(sp)
    80005b44:	01013403          	ld	s0,16(sp)
    80005b48:	00048513          	mv	a0,s1
    80005b4c:	00813483          	ld	s1,8(sp)
    80005b50:	02010113          	addi	sp,sp,32
    80005b54:	00008067          	ret

0000000080005b58 <initlock>:
    80005b58:	ff010113          	addi	sp,sp,-16
    80005b5c:	00813423          	sd	s0,8(sp)
    80005b60:	01010413          	addi	s0,sp,16
    80005b64:	00813403          	ld	s0,8(sp)
    80005b68:	00b53423          	sd	a1,8(a0)
    80005b6c:	00052023          	sw	zero,0(a0)
    80005b70:	00053823          	sd	zero,16(a0)
    80005b74:	01010113          	addi	sp,sp,16
    80005b78:	00008067          	ret

0000000080005b7c <acquire>:
    80005b7c:	fe010113          	addi	sp,sp,-32
    80005b80:	00813823          	sd	s0,16(sp)
    80005b84:	00913423          	sd	s1,8(sp)
    80005b88:	00113c23          	sd	ra,24(sp)
    80005b8c:	01213023          	sd	s2,0(sp)
    80005b90:	02010413          	addi	s0,sp,32
    80005b94:	00050493          	mv	s1,a0
    80005b98:	10002973          	csrr	s2,sstatus
    80005b9c:	100027f3          	csrr	a5,sstatus
    80005ba0:	ffd7f793          	andi	a5,a5,-3
    80005ba4:	10079073          	csrw	sstatus,a5
    80005ba8:	fffff097          	auipc	ra,0xfffff
    80005bac:	8e0080e7          	jalr	-1824(ra) # 80004488 <mycpu>
    80005bb0:	07852783          	lw	a5,120(a0)
    80005bb4:	06078e63          	beqz	a5,80005c30 <acquire+0xb4>
    80005bb8:	fffff097          	auipc	ra,0xfffff
    80005bbc:	8d0080e7          	jalr	-1840(ra) # 80004488 <mycpu>
    80005bc0:	07852783          	lw	a5,120(a0)
    80005bc4:	0004a703          	lw	a4,0(s1)
    80005bc8:	0017879b          	addiw	a5,a5,1
    80005bcc:	06f52c23          	sw	a5,120(a0)
    80005bd0:	04071063          	bnez	a4,80005c10 <acquire+0x94>
    80005bd4:	00100713          	li	a4,1
    80005bd8:	00070793          	mv	a5,a4
    80005bdc:	0cf4a7af          	amoswap.w.aq	a5,a5,(s1)
    80005be0:	0007879b          	sext.w	a5,a5
    80005be4:	fe079ae3          	bnez	a5,80005bd8 <acquire+0x5c>
    80005be8:	0ff0000f          	fence
    80005bec:	fffff097          	auipc	ra,0xfffff
    80005bf0:	89c080e7          	jalr	-1892(ra) # 80004488 <mycpu>
    80005bf4:	01813083          	ld	ra,24(sp)
    80005bf8:	01013403          	ld	s0,16(sp)
    80005bfc:	00a4b823          	sd	a0,16(s1)
    80005c00:	00013903          	ld	s2,0(sp)
    80005c04:	00813483          	ld	s1,8(sp)
    80005c08:	02010113          	addi	sp,sp,32
    80005c0c:	00008067          	ret
    80005c10:	0104b903          	ld	s2,16(s1)
    80005c14:	fffff097          	auipc	ra,0xfffff
    80005c18:	874080e7          	jalr	-1932(ra) # 80004488 <mycpu>
    80005c1c:	faa91ce3          	bne	s2,a0,80005bd4 <acquire+0x58>
    80005c20:	00001517          	auipc	a0,0x1
    80005c24:	7e850513          	addi	a0,a0,2024 # 80007408 <digits+0x20>
    80005c28:	fffff097          	auipc	ra,0xfffff
    80005c2c:	224080e7          	jalr	548(ra) # 80004e4c <panic>
    80005c30:	00195913          	srli	s2,s2,0x1
    80005c34:	fffff097          	auipc	ra,0xfffff
    80005c38:	854080e7          	jalr	-1964(ra) # 80004488 <mycpu>
    80005c3c:	00197913          	andi	s2,s2,1
    80005c40:	07252e23          	sw	s2,124(a0)
    80005c44:	f75ff06f          	j	80005bb8 <acquire+0x3c>

0000000080005c48 <release>:
    80005c48:	fe010113          	addi	sp,sp,-32
    80005c4c:	00813823          	sd	s0,16(sp)
    80005c50:	00113c23          	sd	ra,24(sp)
    80005c54:	00913423          	sd	s1,8(sp)
    80005c58:	01213023          	sd	s2,0(sp)
    80005c5c:	02010413          	addi	s0,sp,32
    80005c60:	00052783          	lw	a5,0(a0)
    80005c64:	00079a63          	bnez	a5,80005c78 <release+0x30>
    80005c68:	00001517          	auipc	a0,0x1
    80005c6c:	7a850513          	addi	a0,a0,1960 # 80007410 <digits+0x28>
    80005c70:	fffff097          	auipc	ra,0xfffff
    80005c74:	1dc080e7          	jalr	476(ra) # 80004e4c <panic>
    80005c78:	01053903          	ld	s2,16(a0)
    80005c7c:	00050493          	mv	s1,a0
    80005c80:	fffff097          	auipc	ra,0xfffff
    80005c84:	808080e7          	jalr	-2040(ra) # 80004488 <mycpu>
    80005c88:	fea910e3          	bne	s2,a0,80005c68 <release+0x20>
    80005c8c:	0004b823          	sd	zero,16(s1)
    80005c90:	0ff0000f          	fence
    80005c94:	0f50000f          	fence	iorw,ow
    80005c98:	0804a02f          	amoswap.w	zero,zero,(s1)
    80005c9c:	ffffe097          	auipc	ra,0xffffe
    80005ca0:	7ec080e7          	jalr	2028(ra) # 80004488 <mycpu>
    80005ca4:	100027f3          	csrr	a5,sstatus
    80005ca8:	0027f793          	andi	a5,a5,2
    80005cac:	04079a63          	bnez	a5,80005d00 <release+0xb8>
    80005cb0:	07852783          	lw	a5,120(a0)
    80005cb4:	02f05e63          	blez	a5,80005cf0 <release+0xa8>
    80005cb8:	fff7871b          	addiw	a4,a5,-1
    80005cbc:	06e52c23          	sw	a4,120(a0)
    80005cc0:	00071c63          	bnez	a4,80005cd8 <release+0x90>
    80005cc4:	07c52783          	lw	a5,124(a0)
    80005cc8:	00078863          	beqz	a5,80005cd8 <release+0x90>
    80005ccc:	100027f3          	csrr	a5,sstatus
    80005cd0:	0027e793          	ori	a5,a5,2
    80005cd4:	10079073          	csrw	sstatus,a5
    80005cd8:	01813083          	ld	ra,24(sp)
    80005cdc:	01013403          	ld	s0,16(sp)
    80005ce0:	00813483          	ld	s1,8(sp)
    80005ce4:	00013903          	ld	s2,0(sp)
    80005ce8:	02010113          	addi	sp,sp,32
    80005cec:	00008067          	ret
    80005cf0:	00001517          	auipc	a0,0x1
    80005cf4:	74050513          	addi	a0,a0,1856 # 80007430 <digits+0x48>
    80005cf8:	fffff097          	auipc	ra,0xfffff
    80005cfc:	154080e7          	jalr	340(ra) # 80004e4c <panic>
    80005d00:	00001517          	auipc	a0,0x1
    80005d04:	71850513          	addi	a0,a0,1816 # 80007418 <digits+0x30>
    80005d08:	fffff097          	auipc	ra,0xfffff
    80005d0c:	144080e7          	jalr	324(ra) # 80004e4c <panic>

0000000080005d10 <holding>:
    80005d10:	00052783          	lw	a5,0(a0)
    80005d14:	00079663          	bnez	a5,80005d20 <holding+0x10>
    80005d18:	00000513          	li	a0,0
    80005d1c:	00008067          	ret
    80005d20:	fe010113          	addi	sp,sp,-32
    80005d24:	00813823          	sd	s0,16(sp)
    80005d28:	00913423          	sd	s1,8(sp)
    80005d2c:	00113c23          	sd	ra,24(sp)
    80005d30:	02010413          	addi	s0,sp,32
    80005d34:	01053483          	ld	s1,16(a0)
    80005d38:	ffffe097          	auipc	ra,0xffffe
    80005d3c:	750080e7          	jalr	1872(ra) # 80004488 <mycpu>
    80005d40:	01813083          	ld	ra,24(sp)
    80005d44:	01013403          	ld	s0,16(sp)
    80005d48:	40a48533          	sub	a0,s1,a0
    80005d4c:	00153513          	seqz	a0,a0
    80005d50:	00813483          	ld	s1,8(sp)
    80005d54:	02010113          	addi	sp,sp,32
    80005d58:	00008067          	ret

0000000080005d5c <push_off>:
    80005d5c:	fe010113          	addi	sp,sp,-32
    80005d60:	00813823          	sd	s0,16(sp)
    80005d64:	00113c23          	sd	ra,24(sp)
    80005d68:	00913423          	sd	s1,8(sp)
    80005d6c:	02010413          	addi	s0,sp,32
    80005d70:	100024f3          	csrr	s1,sstatus
    80005d74:	100027f3          	csrr	a5,sstatus
    80005d78:	ffd7f793          	andi	a5,a5,-3
    80005d7c:	10079073          	csrw	sstatus,a5
    80005d80:	ffffe097          	auipc	ra,0xffffe
    80005d84:	708080e7          	jalr	1800(ra) # 80004488 <mycpu>
    80005d88:	07852783          	lw	a5,120(a0)
    80005d8c:	02078663          	beqz	a5,80005db8 <push_off+0x5c>
    80005d90:	ffffe097          	auipc	ra,0xffffe
    80005d94:	6f8080e7          	jalr	1784(ra) # 80004488 <mycpu>
    80005d98:	07852783          	lw	a5,120(a0)
    80005d9c:	01813083          	ld	ra,24(sp)
    80005da0:	01013403          	ld	s0,16(sp)
    80005da4:	0017879b          	addiw	a5,a5,1
    80005da8:	06f52c23          	sw	a5,120(a0)
    80005dac:	00813483          	ld	s1,8(sp)
    80005db0:	02010113          	addi	sp,sp,32
    80005db4:	00008067          	ret
    80005db8:	0014d493          	srli	s1,s1,0x1
    80005dbc:	ffffe097          	auipc	ra,0xffffe
    80005dc0:	6cc080e7          	jalr	1740(ra) # 80004488 <mycpu>
    80005dc4:	0014f493          	andi	s1,s1,1
    80005dc8:	06952e23          	sw	s1,124(a0)
    80005dcc:	fc5ff06f          	j	80005d90 <push_off+0x34>

0000000080005dd0 <pop_off>:
    80005dd0:	ff010113          	addi	sp,sp,-16
    80005dd4:	00813023          	sd	s0,0(sp)
    80005dd8:	00113423          	sd	ra,8(sp)
    80005ddc:	01010413          	addi	s0,sp,16
    80005de0:	ffffe097          	auipc	ra,0xffffe
    80005de4:	6a8080e7          	jalr	1704(ra) # 80004488 <mycpu>
    80005de8:	100027f3          	csrr	a5,sstatus
    80005dec:	0027f793          	andi	a5,a5,2
    80005df0:	04079663          	bnez	a5,80005e3c <pop_off+0x6c>
    80005df4:	07852783          	lw	a5,120(a0)
    80005df8:	02f05a63          	blez	a5,80005e2c <pop_off+0x5c>
    80005dfc:	fff7871b          	addiw	a4,a5,-1
    80005e00:	06e52c23          	sw	a4,120(a0)
    80005e04:	00071c63          	bnez	a4,80005e1c <pop_off+0x4c>
    80005e08:	07c52783          	lw	a5,124(a0)
    80005e0c:	00078863          	beqz	a5,80005e1c <pop_off+0x4c>
    80005e10:	100027f3          	csrr	a5,sstatus
    80005e14:	0027e793          	ori	a5,a5,2
    80005e18:	10079073          	csrw	sstatus,a5
    80005e1c:	00813083          	ld	ra,8(sp)
    80005e20:	00013403          	ld	s0,0(sp)
    80005e24:	01010113          	addi	sp,sp,16
    80005e28:	00008067          	ret
    80005e2c:	00001517          	auipc	a0,0x1
    80005e30:	60450513          	addi	a0,a0,1540 # 80007430 <digits+0x48>
    80005e34:	fffff097          	auipc	ra,0xfffff
    80005e38:	018080e7          	jalr	24(ra) # 80004e4c <panic>
    80005e3c:	00001517          	auipc	a0,0x1
    80005e40:	5dc50513          	addi	a0,a0,1500 # 80007418 <digits+0x30>
    80005e44:	fffff097          	auipc	ra,0xfffff
    80005e48:	008080e7          	jalr	8(ra) # 80004e4c <panic>

0000000080005e4c <push_on>:
    80005e4c:	fe010113          	addi	sp,sp,-32
    80005e50:	00813823          	sd	s0,16(sp)
    80005e54:	00113c23          	sd	ra,24(sp)
    80005e58:	00913423          	sd	s1,8(sp)
    80005e5c:	02010413          	addi	s0,sp,32
    80005e60:	100024f3          	csrr	s1,sstatus
    80005e64:	100027f3          	csrr	a5,sstatus
    80005e68:	0027e793          	ori	a5,a5,2
    80005e6c:	10079073          	csrw	sstatus,a5
    80005e70:	ffffe097          	auipc	ra,0xffffe
    80005e74:	618080e7          	jalr	1560(ra) # 80004488 <mycpu>
    80005e78:	07852783          	lw	a5,120(a0)
    80005e7c:	02078663          	beqz	a5,80005ea8 <push_on+0x5c>
    80005e80:	ffffe097          	auipc	ra,0xffffe
    80005e84:	608080e7          	jalr	1544(ra) # 80004488 <mycpu>
    80005e88:	07852783          	lw	a5,120(a0)
    80005e8c:	01813083          	ld	ra,24(sp)
    80005e90:	01013403          	ld	s0,16(sp)
    80005e94:	0017879b          	addiw	a5,a5,1
    80005e98:	06f52c23          	sw	a5,120(a0)
    80005e9c:	00813483          	ld	s1,8(sp)
    80005ea0:	02010113          	addi	sp,sp,32
    80005ea4:	00008067          	ret
    80005ea8:	0014d493          	srli	s1,s1,0x1
    80005eac:	ffffe097          	auipc	ra,0xffffe
    80005eb0:	5dc080e7          	jalr	1500(ra) # 80004488 <mycpu>
    80005eb4:	0014f493          	andi	s1,s1,1
    80005eb8:	06952e23          	sw	s1,124(a0)
    80005ebc:	fc5ff06f          	j	80005e80 <push_on+0x34>

0000000080005ec0 <pop_on>:
    80005ec0:	ff010113          	addi	sp,sp,-16
    80005ec4:	00813023          	sd	s0,0(sp)
    80005ec8:	00113423          	sd	ra,8(sp)
    80005ecc:	01010413          	addi	s0,sp,16
    80005ed0:	ffffe097          	auipc	ra,0xffffe
    80005ed4:	5b8080e7          	jalr	1464(ra) # 80004488 <mycpu>
    80005ed8:	100027f3          	csrr	a5,sstatus
    80005edc:	0027f793          	andi	a5,a5,2
    80005ee0:	04078463          	beqz	a5,80005f28 <pop_on+0x68>
    80005ee4:	07852783          	lw	a5,120(a0)
    80005ee8:	02f05863          	blez	a5,80005f18 <pop_on+0x58>
    80005eec:	fff7879b          	addiw	a5,a5,-1
    80005ef0:	06f52c23          	sw	a5,120(a0)
    80005ef4:	07853783          	ld	a5,120(a0)
    80005ef8:	00079863          	bnez	a5,80005f08 <pop_on+0x48>
    80005efc:	100027f3          	csrr	a5,sstatus
    80005f00:	ffd7f793          	andi	a5,a5,-3
    80005f04:	10079073          	csrw	sstatus,a5
    80005f08:	00813083          	ld	ra,8(sp)
    80005f0c:	00013403          	ld	s0,0(sp)
    80005f10:	01010113          	addi	sp,sp,16
    80005f14:	00008067          	ret
    80005f18:	00001517          	auipc	a0,0x1
    80005f1c:	54050513          	addi	a0,a0,1344 # 80007458 <digits+0x70>
    80005f20:	fffff097          	auipc	ra,0xfffff
    80005f24:	f2c080e7          	jalr	-212(ra) # 80004e4c <panic>
    80005f28:	00001517          	auipc	a0,0x1
    80005f2c:	51050513          	addi	a0,a0,1296 # 80007438 <digits+0x50>
    80005f30:	fffff097          	auipc	ra,0xfffff
    80005f34:	f1c080e7          	jalr	-228(ra) # 80004e4c <panic>

0000000080005f38 <__memset>:
    80005f38:	ff010113          	addi	sp,sp,-16
    80005f3c:	00813423          	sd	s0,8(sp)
    80005f40:	01010413          	addi	s0,sp,16
    80005f44:	1a060e63          	beqz	a2,80006100 <__memset+0x1c8>
    80005f48:	40a007b3          	neg	a5,a0
    80005f4c:	0077f793          	andi	a5,a5,7
    80005f50:	00778693          	addi	a3,a5,7
    80005f54:	00b00813          	li	a6,11
    80005f58:	0ff5f593          	andi	a1,a1,255
    80005f5c:	fff6071b          	addiw	a4,a2,-1
    80005f60:	1b06e663          	bltu	a3,a6,8000610c <__memset+0x1d4>
    80005f64:	1cd76463          	bltu	a4,a3,8000612c <__memset+0x1f4>
    80005f68:	1a078e63          	beqz	a5,80006124 <__memset+0x1ec>
    80005f6c:	00b50023          	sb	a1,0(a0)
    80005f70:	00100713          	li	a4,1
    80005f74:	1ae78463          	beq	a5,a4,8000611c <__memset+0x1e4>
    80005f78:	00b500a3          	sb	a1,1(a0)
    80005f7c:	00200713          	li	a4,2
    80005f80:	1ae78a63          	beq	a5,a4,80006134 <__memset+0x1fc>
    80005f84:	00b50123          	sb	a1,2(a0)
    80005f88:	00300713          	li	a4,3
    80005f8c:	18e78463          	beq	a5,a4,80006114 <__memset+0x1dc>
    80005f90:	00b501a3          	sb	a1,3(a0)
    80005f94:	00400713          	li	a4,4
    80005f98:	1ae78263          	beq	a5,a4,8000613c <__memset+0x204>
    80005f9c:	00b50223          	sb	a1,4(a0)
    80005fa0:	00500713          	li	a4,5
    80005fa4:	1ae78063          	beq	a5,a4,80006144 <__memset+0x20c>
    80005fa8:	00b502a3          	sb	a1,5(a0)
    80005fac:	00700713          	li	a4,7
    80005fb0:	18e79e63          	bne	a5,a4,8000614c <__memset+0x214>
    80005fb4:	00b50323          	sb	a1,6(a0)
    80005fb8:	00700e93          	li	t4,7
    80005fbc:	00859713          	slli	a4,a1,0x8
    80005fc0:	00e5e733          	or	a4,a1,a4
    80005fc4:	01059e13          	slli	t3,a1,0x10
    80005fc8:	01c76e33          	or	t3,a4,t3
    80005fcc:	01859313          	slli	t1,a1,0x18
    80005fd0:	006e6333          	or	t1,t3,t1
    80005fd4:	02059893          	slli	a7,a1,0x20
    80005fd8:	40f60e3b          	subw	t3,a2,a5
    80005fdc:	011368b3          	or	a7,t1,a7
    80005fe0:	02859813          	slli	a6,a1,0x28
    80005fe4:	0108e833          	or	a6,a7,a6
    80005fe8:	03059693          	slli	a3,a1,0x30
    80005fec:	003e589b          	srliw	a7,t3,0x3
    80005ff0:	00d866b3          	or	a3,a6,a3
    80005ff4:	03859713          	slli	a4,a1,0x38
    80005ff8:	00389813          	slli	a6,a7,0x3
    80005ffc:	00f507b3          	add	a5,a0,a5
    80006000:	00e6e733          	or	a4,a3,a4
    80006004:	000e089b          	sext.w	a7,t3
    80006008:	00f806b3          	add	a3,a6,a5
    8000600c:	00e7b023          	sd	a4,0(a5)
    80006010:	00878793          	addi	a5,a5,8
    80006014:	fed79ce3          	bne	a5,a3,8000600c <__memset+0xd4>
    80006018:	ff8e7793          	andi	a5,t3,-8
    8000601c:	0007871b          	sext.w	a4,a5
    80006020:	01d787bb          	addw	a5,a5,t4
    80006024:	0ce88e63          	beq	a7,a4,80006100 <__memset+0x1c8>
    80006028:	00f50733          	add	a4,a0,a5
    8000602c:	00b70023          	sb	a1,0(a4)
    80006030:	0017871b          	addiw	a4,a5,1
    80006034:	0cc77663          	bgeu	a4,a2,80006100 <__memset+0x1c8>
    80006038:	00e50733          	add	a4,a0,a4
    8000603c:	00b70023          	sb	a1,0(a4)
    80006040:	0027871b          	addiw	a4,a5,2
    80006044:	0ac77e63          	bgeu	a4,a2,80006100 <__memset+0x1c8>
    80006048:	00e50733          	add	a4,a0,a4
    8000604c:	00b70023          	sb	a1,0(a4)
    80006050:	0037871b          	addiw	a4,a5,3
    80006054:	0ac77663          	bgeu	a4,a2,80006100 <__memset+0x1c8>
    80006058:	00e50733          	add	a4,a0,a4
    8000605c:	00b70023          	sb	a1,0(a4)
    80006060:	0047871b          	addiw	a4,a5,4
    80006064:	08c77e63          	bgeu	a4,a2,80006100 <__memset+0x1c8>
    80006068:	00e50733          	add	a4,a0,a4
    8000606c:	00b70023          	sb	a1,0(a4)
    80006070:	0057871b          	addiw	a4,a5,5
    80006074:	08c77663          	bgeu	a4,a2,80006100 <__memset+0x1c8>
    80006078:	00e50733          	add	a4,a0,a4
    8000607c:	00b70023          	sb	a1,0(a4)
    80006080:	0067871b          	addiw	a4,a5,6
    80006084:	06c77e63          	bgeu	a4,a2,80006100 <__memset+0x1c8>
    80006088:	00e50733          	add	a4,a0,a4
    8000608c:	00b70023          	sb	a1,0(a4)
    80006090:	0077871b          	addiw	a4,a5,7
    80006094:	06c77663          	bgeu	a4,a2,80006100 <__memset+0x1c8>
    80006098:	00e50733          	add	a4,a0,a4
    8000609c:	00b70023          	sb	a1,0(a4)
    800060a0:	0087871b          	addiw	a4,a5,8
    800060a4:	04c77e63          	bgeu	a4,a2,80006100 <__memset+0x1c8>
    800060a8:	00e50733          	add	a4,a0,a4
    800060ac:	00b70023          	sb	a1,0(a4)
    800060b0:	0097871b          	addiw	a4,a5,9
    800060b4:	04c77663          	bgeu	a4,a2,80006100 <__memset+0x1c8>
    800060b8:	00e50733          	add	a4,a0,a4
    800060bc:	00b70023          	sb	a1,0(a4)
    800060c0:	00a7871b          	addiw	a4,a5,10
    800060c4:	02c77e63          	bgeu	a4,a2,80006100 <__memset+0x1c8>
    800060c8:	00e50733          	add	a4,a0,a4
    800060cc:	00b70023          	sb	a1,0(a4)
    800060d0:	00b7871b          	addiw	a4,a5,11
    800060d4:	02c77663          	bgeu	a4,a2,80006100 <__memset+0x1c8>
    800060d8:	00e50733          	add	a4,a0,a4
    800060dc:	00b70023          	sb	a1,0(a4)
    800060e0:	00c7871b          	addiw	a4,a5,12
    800060e4:	00c77e63          	bgeu	a4,a2,80006100 <__memset+0x1c8>
    800060e8:	00e50733          	add	a4,a0,a4
    800060ec:	00b70023          	sb	a1,0(a4)
    800060f0:	00d7879b          	addiw	a5,a5,13
    800060f4:	00c7f663          	bgeu	a5,a2,80006100 <__memset+0x1c8>
    800060f8:	00f507b3          	add	a5,a0,a5
    800060fc:	00b78023          	sb	a1,0(a5)
    80006100:	00813403          	ld	s0,8(sp)
    80006104:	01010113          	addi	sp,sp,16
    80006108:	00008067          	ret
    8000610c:	00b00693          	li	a3,11
    80006110:	e55ff06f          	j	80005f64 <__memset+0x2c>
    80006114:	00300e93          	li	t4,3
    80006118:	ea5ff06f          	j	80005fbc <__memset+0x84>
    8000611c:	00100e93          	li	t4,1
    80006120:	e9dff06f          	j	80005fbc <__memset+0x84>
    80006124:	00000e93          	li	t4,0
    80006128:	e95ff06f          	j	80005fbc <__memset+0x84>
    8000612c:	00000793          	li	a5,0
    80006130:	ef9ff06f          	j	80006028 <__memset+0xf0>
    80006134:	00200e93          	li	t4,2
    80006138:	e85ff06f          	j	80005fbc <__memset+0x84>
    8000613c:	00400e93          	li	t4,4
    80006140:	e7dff06f          	j	80005fbc <__memset+0x84>
    80006144:	00500e93          	li	t4,5
    80006148:	e75ff06f          	j	80005fbc <__memset+0x84>
    8000614c:	00600e93          	li	t4,6
    80006150:	e6dff06f          	j	80005fbc <__memset+0x84>

0000000080006154 <__memmove>:
    80006154:	ff010113          	addi	sp,sp,-16
    80006158:	00813423          	sd	s0,8(sp)
    8000615c:	01010413          	addi	s0,sp,16
    80006160:	0e060863          	beqz	a2,80006250 <__memmove+0xfc>
    80006164:	fff6069b          	addiw	a3,a2,-1
    80006168:	0006881b          	sext.w	a6,a3
    8000616c:	0ea5e863          	bltu	a1,a0,8000625c <__memmove+0x108>
    80006170:	00758713          	addi	a4,a1,7
    80006174:	00a5e7b3          	or	a5,a1,a0
    80006178:	40a70733          	sub	a4,a4,a0
    8000617c:	0077f793          	andi	a5,a5,7
    80006180:	00f73713          	sltiu	a4,a4,15
    80006184:	00174713          	xori	a4,a4,1
    80006188:	0017b793          	seqz	a5,a5
    8000618c:	00e7f7b3          	and	a5,a5,a4
    80006190:	10078863          	beqz	a5,800062a0 <__memmove+0x14c>
    80006194:	00900793          	li	a5,9
    80006198:	1107f463          	bgeu	a5,a6,800062a0 <__memmove+0x14c>
    8000619c:	0036581b          	srliw	a6,a2,0x3
    800061a0:	fff8081b          	addiw	a6,a6,-1
    800061a4:	02081813          	slli	a6,a6,0x20
    800061a8:	01d85893          	srli	a7,a6,0x1d
    800061ac:	00858813          	addi	a6,a1,8
    800061b0:	00058793          	mv	a5,a1
    800061b4:	00050713          	mv	a4,a0
    800061b8:	01088833          	add	a6,a7,a6
    800061bc:	0007b883          	ld	a7,0(a5)
    800061c0:	00878793          	addi	a5,a5,8
    800061c4:	00870713          	addi	a4,a4,8
    800061c8:	ff173c23          	sd	a7,-8(a4)
    800061cc:	ff0798e3          	bne	a5,a6,800061bc <__memmove+0x68>
    800061d0:	ff867713          	andi	a4,a2,-8
    800061d4:	02071793          	slli	a5,a4,0x20
    800061d8:	0207d793          	srli	a5,a5,0x20
    800061dc:	00f585b3          	add	a1,a1,a5
    800061e0:	40e686bb          	subw	a3,a3,a4
    800061e4:	00f507b3          	add	a5,a0,a5
    800061e8:	06e60463          	beq	a2,a4,80006250 <__memmove+0xfc>
    800061ec:	0005c703          	lbu	a4,0(a1)
    800061f0:	00e78023          	sb	a4,0(a5)
    800061f4:	04068e63          	beqz	a3,80006250 <__memmove+0xfc>
    800061f8:	0015c603          	lbu	a2,1(a1)
    800061fc:	00100713          	li	a4,1
    80006200:	00c780a3          	sb	a2,1(a5)
    80006204:	04e68663          	beq	a3,a4,80006250 <__memmove+0xfc>
    80006208:	0025c603          	lbu	a2,2(a1)
    8000620c:	00200713          	li	a4,2
    80006210:	00c78123          	sb	a2,2(a5)
    80006214:	02e68e63          	beq	a3,a4,80006250 <__memmove+0xfc>
    80006218:	0035c603          	lbu	a2,3(a1)
    8000621c:	00300713          	li	a4,3
    80006220:	00c781a3          	sb	a2,3(a5)
    80006224:	02e68663          	beq	a3,a4,80006250 <__memmove+0xfc>
    80006228:	0045c603          	lbu	a2,4(a1)
    8000622c:	00400713          	li	a4,4
    80006230:	00c78223          	sb	a2,4(a5)
    80006234:	00e68e63          	beq	a3,a4,80006250 <__memmove+0xfc>
    80006238:	0055c603          	lbu	a2,5(a1)
    8000623c:	00500713          	li	a4,5
    80006240:	00c782a3          	sb	a2,5(a5)
    80006244:	00e68663          	beq	a3,a4,80006250 <__memmove+0xfc>
    80006248:	0065c703          	lbu	a4,6(a1)
    8000624c:	00e78323          	sb	a4,6(a5)
    80006250:	00813403          	ld	s0,8(sp)
    80006254:	01010113          	addi	sp,sp,16
    80006258:	00008067          	ret
    8000625c:	02061713          	slli	a4,a2,0x20
    80006260:	02075713          	srli	a4,a4,0x20
    80006264:	00e587b3          	add	a5,a1,a4
    80006268:	f0f574e3          	bgeu	a0,a5,80006170 <__memmove+0x1c>
    8000626c:	02069613          	slli	a2,a3,0x20
    80006270:	02065613          	srli	a2,a2,0x20
    80006274:	fff64613          	not	a2,a2
    80006278:	00e50733          	add	a4,a0,a4
    8000627c:	00c78633          	add	a2,a5,a2
    80006280:	fff7c683          	lbu	a3,-1(a5)
    80006284:	fff78793          	addi	a5,a5,-1
    80006288:	fff70713          	addi	a4,a4,-1
    8000628c:	00d70023          	sb	a3,0(a4)
    80006290:	fec798e3          	bne	a5,a2,80006280 <__memmove+0x12c>
    80006294:	00813403          	ld	s0,8(sp)
    80006298:	01010113          	addi	sp,sp,16
    8000629c:	00008067          	ret
    800062a0:	02069713          	slli	a4,a3,0x20
    800062a4:	02075713          	srli	a4,a4,0x20
    800062a8:	00170713          	addi	a4,a4,1
    800062ac:	00e50733          	add	a4,a0,a4
    800062b0:	00050793          	mv	a5,a0
    800062b4:	0005c683          	lbu	a3,0(a1)
    800062b8:	00178793          	addi	a5,a5,1
    800062bc:	00158593          	addi	a1,a1,1
    800062c0:	fed78fa3          	sb	a3,-1(a5)
    800062c4:	fee798e3          	bne	a5,a4,800062b4 <__memmove+0x160>
    800062c8:	f89ff06f          	j	80006250 <__memmove+0xfc>

00000000800062cc <__mem_free>:
    800062cc:	ff010113          	addi	sp,sp,-16
    800062d0:	00813423          	sd	s0,8(sp)
    800062d4:	01010413          	addi	s0,sp,16
    800062d8:	00002597          	auipc	a1,0x2
    800062dc:	24058593          	addi	a1,a1,576 # 80008518 <freep>
    800062e0:	0005b783          	ld	a5,0(a1)
    800062e4:	ff050693          	addi	a3,a0,-16
    800062e8:	0007b703          	ld	a4,0(a5)
    800062ec:	00d7fc63          	bgeu	a5,a3,80006304 <__mem_free+0x38>
    800062f0:	00e6ee63          	bltu	a3,a4,8000630c <__mem_free+0x40>
    800062f4:	00e7fc63          	bgeu	a5,a4,8000630c <__mem_free+0x40>
    800062f8:	00070793          	mv	a5,a4
    800062fc:	0007b703          	ld	a4,0(a5)
    80006300:	fed7e8e3          	bltu	a5,a3,800062f0 <__mem_free+0x24>
    80006304:	fee7eae3          	bltu	a5,a4,800062f8 <__mem_free+0x2c>
    80006308:	fee6f8e3          	bgeu	a3,a4,800062f8 <__mem_free+0x2c>
    8000630c:	ff852803          	lw	a6,-8(a0)
    80006310:	02081613          	slli	a2,a6,0x20
    80006314:	01c65613          	srli	a2,a2,0x1c
    80006318:	00c68633          	add	a2,a3,a2
    8000631c:	02c70a63          	beq	a4,a2,80006350 <__mem_free+0x84>
    80006320:	fee53823          	sd	a4,-16(a0)
    80006324:	0087a503          	lw	a0,8(a5)
    80006328:	02051613          	slli	a2,a0,0x20
    8000632c:	01c65613          	srli	a2,a2,0x1c
    80006330:	00c78633          	add	a2,a5,a2
    80006334:	04c68263          	beq	a3,a2,80006378 <__mem_free+0xac>
    80006338:	00813403          	ld	s0,8(sp)
    8000633c:	00d7b023          	sd	a3,0(a5)
    80006340:	00f5b023          	sd	a5,0(a1)
    80006344:	00000513          	li	a0,0
    80006348:	01010113          	addi	sp,sp,16
    8000634c:	00008067          	ret
    80006350:	00872603          	lw	a2,8(a4)
    80006354:	00073703          	ld	a4,0(a4)
    80006358:	0106083b          	addw	a6,a2,a6
    8000635c:	ff052c23          	sw	a6,-8(a0)
    80006360:	fee53823          	sd	a4,-16(a0)
    80006364:	0087a503          	lw	a0,8(a5)
    80006368:	02051613          	slli	a2,a0,0x20
    8000636c:	01c65613          	srli	a2,a2,0x1c
    80006370:	00c78633          	add	a2,a5,a2
    80006374:	fcc692e3          	bne	a3,a2,80006338 <__mem_free+0x6c>
    80006378:	00813403          	ld	s0,8(sp)
    8000637c:	0105053b          	addw	a0,a0,a6
    80006380:	00a7a423          	sw	a0,8(a5)
    80006384:	00e7b023          	sd	a4,0(a5)
    80006388:	00f5b023          	sd	a5,0(a1)
    8000638c:	00000513          	li	a0,0
    80006390:	01010113          	addi	sp,sp,16
    80006394:	00008067          	ret

0000000080006398 <__mem_alloc>:
    80006398:	fc010113          	addi	sp,sp,-64
    8000639c:	02813823          	sd	s0,48(sp)
    800063a0:	02913423          	sd	s1,40(sp)
    800063a4:	03213023          	sd	s2,32(sp)
    800063a8:	01513423          	sd	s5,8(sp)
    800063ac:	02113c23          	sd	ra,56(sp)
    800063b0:	01313c23          	sd	s3,24(sp)
    800063b4:	01413823          	sd	s4,16(sp)
    800063b8:	01613023          	sd	s6,0(sp)
    800063bc:	04010413          	addi	s0,sp,64
    800063c0:	00002a97          	auipc	s5,0x2
    800063c4:	158a8a93          	addi	s5,s5,344 # 80008518 <freep>
    800063c8:	00f50913          	addi	s2,a0,15
    800063cc:	000ab683          	ld	a3,0(s5)
    800063d0:	00495913          	srli	s2,s2,0x4
    800063d4:	0019049b          	addiw	s1,s2,1
    800063d8:	00048913          	mv	s2,s1
    800063dc:	0c068c63          	beqz	a3,800064b4 <__mem_alloc+0x11c>
    800063e0:	0006b503          	ld	a0,0(a3)
    800063e4:	00852703          	lw	a4,8(a0)
    800063e8:	10977063          	bgeu	a4,s1,800064e8 <__mem_alloc+0x150>
    800063ec:	000017b7          	lui	a5,0x1
    800063f0:	0009099b          	sext.w	s3,s2
    800063f4:	0af4e863          	bltu	s1,a5,800064a4 <__mem_alloc+0x10c>
    800063f8:	02099a13          	slli	s4,s3,0x20
    800063fc:	01ca5a13          	srli	s4,s4,0x1c
    80006400:	fff00b13          	li	s6,-1
    80006404:	0100006f          	j	80006414 <__mem_alloc+0x7c>
    80006408:	0007b503          	ld	a0,0(a5) # 1000 <_entry-0x7ffff000>
    8000640c:	00852703          	lw	a4,8(a0)
    80006410:	04977463          	bgeu	a4,s1,80006458 <__mem_alloc+0xc0>
    80006414:	00050793          	mv	a5,a0
    80006418:	fea698e3          	bne	a3,a0,80006408 <__mem_alloc+0x70>
    8000641c:	000a0513          	mv	a0,s4
    80006420:	00000097          	auipc	ra,0x0
    80006424:	1f0080e7          	jalr	496(ra) # 80006610 <kvmincrease>
    80006428:	00050793          	mv	a5,a0
    8000642c:	01050513          	addi	a0,a0,16
    80006430:	07678e63          	beq	a5,s6,800064ac <__mem_alloc+0x114>
    80006434:	0137a423          	sw	s3,8(a5)
    80006438:	00000097          	auipc	ra,0x0
    8000643c:	e94080e7          	jalr	-364(ra) # 800062cc <__mem_free>
    80006440:	000ab783          	ld	a5,0(s5)
    80006444:	06078463          	beqz	a5,800064ac <__mem_alloc+0x114>
    80006448:	0007b503          	ld	a0,0(a5)
    8000644c:	00078693          	mv	a3,a5
    80006450:	00852703          	lw	a4,8(a0)
    80006454:	fc9760e3          	bltu	a4,s1,80006414 <__mem_alloc+0x7c>
    80006458:	08e48263          	beq	s1,a4,800064dc <__mem_alloc+0x144>
    8000645c:	4127073b          	subw	a4,a4,s2
    80006460:	02071693          	slli	a3,a4,0x20
    80006464:	01c6d693          	srli	a3,a3,0x1c
    80006468:	00e52423          	sw	a4,8(a0)
    8000646c:	00d50533          	add	a0,a0,a3
    80006470:	01252423          	sw	s2,8(a0)
    80006474:	00fab023          	sd	a5,0(s5)
    80006478:	01050513          	addi	a0,a0,16
    8000647c:	03813083          	ld	ra,56(sp)
    80006480:	03013403          	ld	s0,48(sp)
    80006484:	02813483          	ld	s1,40(sp)
    80006488:	02013903          	ld	s2,32(sp)
    8000648c:	01813983          	ld	s3,24(sp)
    80006490:	01013a03          	ld	s4,16(sp)
    80006494:	00813a83          	ld	s5,8(sp)
    80006498:	00013b03          	ld	s6,0(sp)
    8000649c:	04010113          	addi	sp,sp,64
    800064a0:	00008067          	ret
    800064a4:	000019b7          	lui	s3,0x1
    800064a8:	f51ff06f          	j	800063f8 <__mem_alloc+0x60>
    800064ac:	00000513          	li	a0,0
    800064b0:	fcdff06f          	j	8000647c <__mem_alloc+0xe4>
    800064b4:	00003797          	auipc	a5,0x3
    800064b8:	38c78793          	addi	a5,a5,908 # 80009840 <base>
    800064bc:	00078513          	mv	a0,a5
    800064c0:	00fab023          	sd	a5,0(s5)
    800064c4:	00f7b023          	sd	a5,0(a5)
    800064c8:	00000713          	li	a4,0
    800064cc:	00003797          	auipc	a5,0x3
    800064d0:	3607ae23          	sw	zero,892(a5) # 80009848 <base+0x8>
    800064d4:	00050693          	mv	a3,a0
    800064d8:	f11ff06f          	j	800063e8 <__mem_alloc+0x50>
    800064dc:	00053703          	ld	a4,0(a0)
    800064e0:	00e7b023          	sd	a4,0(a5)
    800064e4:	f91ff06f          	j	80006474 <__mem_alloc+0xdc>
    800064e8:	00068793          	mv	a5,a3
    800064ec:	f6dff06f          	j	80006458 <__mem_alloc+0xc0>

00000000800064f0 <__putc>:
    800064f0:	fe010113          	addi	sp,sp,-32
    800064f4:	00813823          	sd	s0,16(sp)
    800064f8:	00113c23          	sd	ra,24(sp)
    800064fc:	02010413          	addi	s0,sp,32
    80006500:	00050793          	mv	a5,a0
    80006504:	fef40593          	addi	a1,s0,-17
    80006508:	00100613          	li	a2,1
    8000650c:	00000513          	li	a0,0
    80006510:	fef407a3          	sb	a5,-17(s0)
    80006514:	fffff097          	auipc	ra,0xfffff
    80006518:	918080e7          	jalr	-1768(ra) # 80004e2c <console_write>
    8000651c:	01813083          	ld	ra,24(sp)
    80006520:	01013403          	ld	s0,16(sp)
    80006524:	02010113          	addi	sp,sp,32
    80006528:	00008067          	ret

000000008000652c <__getc>:
    8000652c:	fe010113          	addi	sp,sp,-32
    80006530:	00813823          	sd	s0,16(sp)
    80006534:	00113c23          	sd	ra,24(sp)
    80006538:	02010413          	addi	s0,sp,32
    8000653c:	fe840593          	addi	a1,s0,-24
    80006540:	00100613          	li	a2,1
    80006544:	00000513          	li	a0,0
    80006548:	fffff097          	auipc	ra,0xfffff
    8000654c:	8c4080e7          	jalr	-1852(ra) # 80004e0c <console_read>
    80006550:	fe844503          	lbu	a0,-24(s0)
    80006554:	01813083          	ld	ra,24(sp)
    80006558:	01013403          	ld	s0,16(sp)
    8000655c:	02010113          	addi	sp,sp,32
    80006560:	00008067          	ret

0000000080006564 <console_handler>:
    80006564:	fe010113          	addi	sp,sp,-32
    80006568:	00813823          	sd	s0,16(sp)
    8000656c:	00113c23          	sd	ra,24(sp)
    80006570:	00913423          	sd	s1,8(sp)
    80006574:	02010413          	addi	s0,sp,32
    80006578:	14202773          	csrr	a4,scause
    8000657c:	100027f3          	csrr	a5,sstatus
    80006580:	0027f793          	andi	a5,a5,2
    80006584:	06079e63          	bnez	a5,80006600 <console_handler+0x9c>
    80006588:	00074c63          	bltz	a4,800065a0 <console_handler+0x3c>
    8000658c:	01813083          	ld	ra,24(sp)
    80006590:	01013403          	ld	s0,16(sp)
    80006594:	00813483          	ld	s1,8(sp)
    80006598:	02010113          	addi	sp,sp,32
    8000659c:	00008067          	ret
    800065a0:	0ff77713          	andi	a4,a4,255
    800065a4:	00900793          	li	a5,9
    800065a8:	fef712e3          	bne	a4,a5,8000658c <console_handler+0x28>
    800065ac:	ffffe097          	auipc	ra,0xffffe
    800065b0:	4b8080e7          	jalr	1208(ra) # 80004a64 <plic_claim>
    800065b4:	00a00793          	li	a5,10
    800065b8:	00050493          	mv	s1,a0
    800065bc:	02f50c63          	beq	a0,a5,800065f4 <console_handler+0x90>
    800065c0:	fc0506e3          	beqz	a0,8000658c <console_handler+0x28>
    800065c4:	00050593          	mv	a1,a0
    800065c8:	00001517          	auipc	a0,0x1
    800065cc:	d9850513          	addi	a0,a0,-616 # 80007360 <CONSOLE_STATUS+0x350>
    800065d0:	fffff097          	auipc	ra,0xfffff
    800065d4:	8d8080e7          	jalr	-1832(ra) # 80004ea8 <__printf>
    800065d8:	01013403          	ld	s0,16(sp)
    800065dc:	01813083          	ld	ra,24(sp)
    800065e0:	00048513          	mv	a0,s1
    800065e4:	00813483          	ld	s1,8(sp)
    800065e8:	02010113          	addi	sp,sp,32
    800065ec:	ffffe317          	auipc	t1,0xffffe
    800065f0:	4b030067          	jr	1200(t1) # 80004a9c <plic_complete>
    800065f4:	fffff097          	auipc	ra,0xfffff
    800065f8:	1bc080e7          	jalr	444(ra) # 800057b0 <uartintr>
    800065fc:	fddff06f          	j	800065d8 <console_handler+0x74>
    80006600:	00001517          	auipc	a0,0x1
    80006604:	e6050513          	addi	a0,a0,-416 # 80007460 <digits+0x78>
    80006608:	fffff097          	auipc	ra,0xfffff
    8000660c:	844080e7          	jalr	-1980(ra) # 80004e4c <panic>

0000000080006610 <kvmincrease>:
    80006610:	fe010113          	addi	sp,sp,-32
    80006614:	01213023          	sd	s2,0(sp)
    80006618:	00001937          	lui	s2,0x1
    8000661c:	fff90913          	addi	s2,s2,-1 # fff <_entry-0x7ffff001>
    80006620:	00813823          	sd	s0,16(sp)
    80006624:	00113c23          	sd	ra,24(sp)
    80006628:	00913423          	sd	s1,8(sp)
    8000662c:	02010413          	addi	s0,sp,32
    80006630:	01250933          	add	s2,a0,s2
    80006634:	00c95913          	srli	s2,s2,0xc
    80006638:	02090863          	beqz	s2,80006668 <kvmincrease+0x58>
    8000663c:	00000493          	li	s1,0
    80006640:	00148493          	addi	s1,s1,1
    80006644:	fffff097          	auipc	ra,0xfffff
    80006648:	4bc080e7          	jalr	1212(ra) # 80005b00 <kalloc>
    8000664c:	fe991ae3          	bne	s2,s1,80006640 <kvmincrease+0x30>
    80006650:	01813083          	ld	ra,24(sp)
    80006654:	01013403          	ld	s0,16(sp)
    80006658:	00813483          	ld	s1,8(sp)
    8000665c:	00013903          	ld	s2,0(sp)
    80006660:	02010113          	addi	sp,sp,32
    80006664:	00008067          	ret
    80006668:	01813083          	ld	ra,24(sp)
    8000666c:	01013403          	ld	s0,16(sp)
    80006670:	00813483          	ld	s1,8(sp)
    80006674:	00013903          	ld	s2,0(sp)
    80006678:	00000513          	li	a0,0
    8000667c:	02010113          	addi	sp,sp,32
    80006680:	00008067          	ret
	...

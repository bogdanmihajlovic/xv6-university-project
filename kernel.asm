
kernel:     file format elf64-littleriscv


Disassembly of section .text:

0000000080000000 <_entry>:
    80000000:	00004117          	auipc	sp,0x4
    80000004:	57013103          	ld	sp,1392(sp) # 80004570 <_GLOBAL_OFFSET_TABLE_+0x10>
    80000008:	00001537          	lui	a0,0x1
    8000000c:	f14025f3          	csrr	a1,mhartid
    80000010:	00158593          	addi	a1,a1,1
    80000014:	02b50533          	mul	a0,a0,a1
    80000018:	00a10133          	add	sp,sp,a0
    8000001c:	1b1010ef          	jal	ra,800019cc <start>

0000000080000020 <spin>:
    80000020:	0000006f          	j	80000020 <spin>
	...

0000000080001000 <_ZN15MemoryAllocatorC1Ev>:
// Created by bogdan on 10.7.22..
//

#include "../h/MemoryAllocator.hpp"

MemoryAllocator::MemoryAllocator() {
    80001000:	ff010113          	addi	sp,sp,-16
    80001004:	00813423          	sd	s0,8(sp)
    80001008:	01010413          	addi	s0,sp,16
    head = (FreeBlock*)HEAP_START_ADDR;
    8000100c:	00003797          	auipc	a5,0x3
    80001010:	55c7b783          	ld	a5,1372(a5) # 80004568 <_GLOBAL_OFFSET_TABLE_+0x8>
    80001014:	0007b703          	ld	a4,0(a5)
    80001018:	00e53023          	sd	a4,0(a0) # 1000 <_entry-0x7ffff000>
    head->size = (size_t)HEAP_END_ADDR - (size_t)HEAP_START_ADDR - sizeof(FreeBlock);
    8000101c:	00003797          	auipc	a5,0x3
    80001020:	55c7b783          	ld	a5,1372(a5) # 80004578 <_GLOBAL_OFFSET_TABLE_+0x18>
    80001024:	0007b783          	ld	a5,0(a5)
    80001028:	40e787b3          	sub	a5,a5,a4
    8000102c:	fe878793          	addi	a5,a5,-24
    80001030:	00f73823          	sd	a5,16(a4)
    head->next = 0;
    80001034:	00053783          	ld	a5,0(a0)
    80001038:	0007b023          	sd	zero,0(a5)
    head->prev = 0;
    8000103c:	00053783          	ld	a5,0(a0)
    80001040:	0007b423          	sd	zero,8(a5)
    tail = head;
    80001044:	00053783          	ld	a5,0(a0)
    80001048:	00f53423          	sd	a5,8(a0)
}
    8000104c:	00813403          	ld	s0,8(sp)
    80001050:	01010113          	addi	sp,sp,16
    80001054:	00008067          	ret

0000000080001058 <_ZN15MemoryAllocator11getInstanceEv>:


MemoryAllocator& MemoryAllocator::getInstance() {
    static MemoryAllocator instance;
    80001058:	00003797          	auipc	a5,0x3
    8000105c:	5687c783          	lbu	a5,1384(a5) # 800045c0 <_ZGVZN15MemoryAllocator11getInstanceEvE8instance>
    80001060:	00078863          	beqz	a5,80001070 <_ZN15MemoryAllocator11getInstanceEv+0x18>
    return instance;
}
    80001064:	00003517          	auipc	a0,0x3
    80001068:	56450513          	addi	a0,a0,1380 # 800045c8 <_ZZN15MemoryAllocator11getInstanceEvE8instance>
    8000106c:	00008067          	ret
MemoryAllocator& MemoryAllocator::getInstance() {
    80001070:	ff010113          	addi	sp,sp,-16
    80001074:	00113423          	sd	ra,8(sp)
    80001078:	00813023          	sd	s0,0(sp)
    8000107c:	01010413          	addi	s0,sp,16
    static MemoryAllocator instance;
    80001080:	00003517          	auipc	a0,0x3
    80001084:	54850513          	addi	a0,a0,1352 # 800045c8 <_ZZN15MemoryAllocator11getInstanceEvE8instance>
    80001088:	00000097          	auipc	ra,0x0
    8000108c:	f78080e7          	jalr	-136(ra) # 80001000 <_ZN15MemoryAllocatorC1Ev>
    80001090:	00100793          	li	a5,1
    80001094:	00003717          	auipc	a4,0x3
    80001098:	52f70623          	sb	a5,1324(a4) # 800045c0 <_ZGVZN15MemoryAllocator11getInstanceEvE8instance>
}
    8000109c:	00003517          	auipc	a0,0x3
    800010a0:	52c50513          	addi	a0,a0,1324 # 800045c8 <_ZZN15MemoryAllocator11getInstanceEvE8instance>
    800010a4:	00813083          	ld	ra,8(sp)
    800010a8:	00013403          	ld	s0,0(sp)
    800010ac:	01010113          	addi	sp,sp,16
    800010b0:	00008067          	ret

00000000800010b4 <_ZN15MemoryAllocator9getMemoryEm>:


void* MemoryAllocator::getMemory(size_t size)  {
    800010b4:	ff010113          	addi	sp,sp,-16
    800010b8:	00813423          	sd	s0,8(sp)
    800010bc:	01010413          	addi	s0,sp,16
    800010c0:	00050713          	mv	a4,a0
    FreeBlock* blk = head;
    800010c4:	00053503          	ld	a0,0(a0)

    // round size to MEM_BLOCK_SIZE
    size_t temp = size / MEM_BLOCK_SIZE;
    size = (temp * MEM_BLOCK_SIZE == size) ? size : (temp + 1)*MEM_BLOCK_SIZE;
    800010c8:	fc05f693          	andi	a3,a1,-64
    800010cc:	00b68863          	beq	a3,a1,800010dc <_ZN15MemoryAllocator9getMemoryEm+0x28>
    800010d0:	0065d793          	srli	a5,a1,0x6
    800010d4:	00178593          	addi	a1,a5,1
    800010d8:	00659593          	slli	a1,a1,0x6

    // Try to find free block
    for (; blk != nullptr; blk = blk->next)
    800010dc:	00050a63          	beqz	a0,800010f0 <_ZN15MemoryAllocator9getMemoryEm+0x3c>
        if (blk->size >= size) break;
    800010e0:	01053783          	ld	a5,16(a0)
    800010e4:	00b7f663          	bgeu	a5,a1,800010f0 <_ZN15MemoryAllocator9getMemoryEm+0x3c>
    for (; blk != nullptr; blk = blk->next)
    800010e8:	00053503          	ld	a0,0(a0)
    800010ec:	ff1ff06f          	j	800010dc <_ZN15MemoryAllocator9getMemoryEm+0x28>

    // If not found
    if (blk == nullptr) {
    800010f0:	04050863          	beqz	a0,80001140 <_ZN15MemoryAllocator9getMemoryEm+0x8c>
        return 0;
    }

    size_t remainingSize = blk->size - size;
    800010f4:	01053783          	ld	a5,16(a0)
    800010f8:	40b787b3          	sub	a5,a5,a1

    if (remainingSize >= sizeof(FreeBlock) + MEM_BLOCK_SIZE) { // Shrink block and make a new one
    800010fc:	05700693          	li	a3,87
    80001100:	04f6fc63          	bgeu	a3,a5,80001158 <_ZN15MemoryAllocator9getMemoryEm+0xa4>
        blk->size = size;
    80001104:	00b53823          	sd	a1,16(a0)
        size_t offset = sizeof(FreeBlock) + size;
    80001108:	01858593          	addi	a1,a1,24
        FreeBlock* newBlk = (FreeBlock*)((char*)blk + offset);
    8000110c:	00b505b3          	add	a1,a0,a1
        if (blk->prev) {
    80001110:	00853683          	ld	a3,8(a0)
    80001114:	02068c63          	beqz	a3,8000114c <_ZN15MemoryAllocator9getMemoryEm+0x98>
            blk->prev->next = newBlk;
    80001118:	00b6b023          	sd	a1,0(a3)
            newBlk->prev = blk->prev;
    8000111c:	00853703          	ld	a4,8(a0)
    80001120:	00e5b423          	sd	a4,8(a1)
        }
        else {
            head = newBlk;
            head->prev = 0;
        }
        newBlk->next = blk->next;
    80001124:	00053703          	ld	a4,0(a0)
    80001128:	00e5b023          	sd	a4,0(a1)
        newBlk->size = remainingSize - sizeof(FreeBlock);
    8000112c:	fe878793          	addi	a5,a5,-24
    80001130:	00f5b823          	sd	a5,16(a1)
        else {
            head = blk->next;
            head->prev = 0;
        }
    }
    blk->next = 0;
    80001134:	00053023          	sd	zero,0(a0)
    blk->prev = 0;
    80001138:	00053423          	sd	zero,8(a0)
    return (char*)blk + sizeof(FreeBlock);
    8000113c:	01850513          	addi	a0,a0,24
}
    80001140:	00813403          	ld	s0,8(sp)
    80001144:	01010113          	addi	sp,sp,16
    80001148:	00008067          	ret
            head = newBlk;
    8000114c:	00b73023          	sd	a1,0(a4)
            head->prev = 0;
    80001150:	0005b423          	sd	zero,8(a1)
    80001154:	fd1ff06f          	j	80001124 <_ZN15MemoryAllocator9getMemoryEm+0x70>
        if (blk->prev) {
    80001158:	00853783          	ld	a5,8(a0)
    8000115c:	02078063          	beqz	a5,8000117c <_ZN15MemoryAllocator9getMemoryEm+0xc8>
            blk->prev->next = blk->next;
    80001160:	00053703          	ld	a4,0(a0)
    80001164:	00e7b023          	sd	a4,0(a5)
            if(blk->next) blk->next->prev = blk->prev;
    80001168:	00053783          	ld	a5,0(a0)
    8000116c:	fc0784e3          	beqz	a5,80001134 <_ZN15MemoryAllocator9getMemoryEm+0x80>
    80001170:	00853703          	ld	a4,8(a0)
    80001174:	00e7b423          	sd	a4,8(a5)
    80001178:	fbdff06f          	j	80001134 <_ZN15MemoryAllocator9getMemoryEm+0x80>
            head = blk->next;
    8000117c:	00053783          	ld	a5,0(a0)
    80001180:	00f73023          	sd	a5,0(a4)
            head->prev = 0;
    80001184:	0007b423          	sd	zero,8(a5)
    80001188:	fadff06f          	j	80001134 <_ZN15MemoryAllocator9getMemoryEm+0x80>

000000008000118c <_ZN15MemoryAllocator10tryToMergeEPNS_9FreeBlockE>:
    tryToMerge(blk);

    return 0;
}

void MemoryAllocator::tryToMerge(FreeBlock* blk)  {
    8000118c:	ff010113          	addi	sp,sp,-16
    80001190:	00813423          	sd	s0,8(sp)
    80001194:	01010413          	addi	s0,sp,16
    if (!blk)
    80001198:	00058c63          	beqz	a1,800011b0 <_ZN15MemoryAllocator10tryToMergeEPNS_9FreeBlockE+0x24>
        return ;

    if (blk->next && (char*)blk + blk->size == (char*)(blk->next)) {
    8000119c:	0005b783          	ld	a5,0(a1)
    800011a0:	00078863          	beqz	a5,800011b0 <_ZN15MemoryAllocator10tryToMergeEPNS_9FreeBlockE+0x24>
    800011a4:	0105b703          	ld	a4,16(a1)
    800011a8:	00e586b3          	add	a3,a1,a4
    800011ac:	00d78863          	beq	a5,a3,800011bc <_ZN15MemoryAllocator10tryToMergeEPNS_9FreeBlockE+0x30>
        blk->size += blk->next->size;
        blk->size += sizeof(FreeBlock);
        blk->next = blk->next->next;
        if (blk->next) blk->next->prev = blk;
    }
    800011b0:	00813403          	ld	s0,8(sp)
    800011b4:	01010113          	addi	sp,sp,16
    800011b8:	00008067          	ret
        blk->size += blk->next->size;
    800011bc:	0107b683          	ld	a3,16(a5)
    800011c0:	00d70733          	add	a4,a4,a3
        blk->size += sizeof(FreeBlock);
    800011c4:	01870713          	addi	a4,a4,24
    800011c8:	00e5b823          	sd	a4,16(a1)
        blk->next = blk->next->next;
    800011cc:	0007b783          	ld	a5,0(a5)
    800011d0:	00f5b023          	sd	a5,0(a1)
        if (blk->next) blk->next->prev = blk;
    800011d4:	fc078ee3          	beqz	a5,800011b0 <_ZN15MemoryAllocator10tryToMergeEPNS_9FreeBlockE+0x24>
    800011d8:	00b7b423          	sd	a1,8(a5)
    800011dc:	fd5ff06f          	j	800011b0 <_ZN15MemoryAllocator10tryToMergeEPNS_9FreeBlockE+0x24>

00000000800011e0 <_ZN15MemoryAllocator10freeMemoryEPv>:
    if( addr == 0 || (char*)addr < HEAP_START_ADDR || (char*)addr > HEAP_END_ADDR){
    800011e0:	0e058263          	beqz	a1,800012c4 <_ZN15MemoryAllocator10freeMemoryEPv+0xe4>
int MemoryAllocator::freeMemory(void* addr) {
    800011e4:	fe010113          	addi	sp,sp,-32
    800011e8:	00113c23          	sd	ra,24(sp)
    800011ec:	00813823          	sd	s0,16(sp)
    800011f0:	00913423          	sd	s1,8(sp)
    800011f4:	01213023          	sd	s2,0(sp)
    800011f8:	02010413          	addi	s0,sp,32
    800011fc:	00050913          	mv	s2,a0
    80001200:	00058713          	mv	a4,a1
    if( addr == 0 || (char*)addr < HEAP_START_ADDR || (char*)addr > HEAP_END_ADDR){
    80001204:	00003797          	auipc	a5,0x3
    80001208:	3647b783          	ld	a5,868(a5) # 80004568 <_GLOBAL_OFFSET_TABLE_+0x8>
    8000120c:	0007b783          	ld	a5,0(a5)
    80001210:	0af5ee63          	bltu	a1,a5,800012cc <_ZN15MemoryAllocator10freeMemoryEPv+0xec>
    80001214:	00003797          	auipc	a5,0x3
    80001218:	3647b783          	ld	a5,868(a5) # 80004578 <_GLOBAL_OFFSET_TABLE_+0x18>
    8000121c:	0007b783          	ld	a5,0(a5)
    80001220:	0ab7ea63          	bltu	a5,a1,800012d4 <_ZN15MemoryAllocator10freeMemoryEPv+0xf4>
    if ( !head || (char*)addr < (char*)head)
    80001224:	00053783          	ld	a5,0(a0)
    80001228:	00078e63          	beqz	a5,80001244 <_ZN15MemoryAllocator10freeMemoryEPv+0x64>
    8000122c:	02f5e063          	bltu	a1,a5,8000124c <_ZN15MemoryAllocator10freeMemoryEPv+0x6c>
        for ( blk = head; blk->next != 0 && (char*)addr > (char*)(blk->next); blk = blk->next);
    80001230:	00078493          	mv	s1,a5
    80001234:	0007b783          	ld	a5,0(a5)
    80001238:	00078c63          	beqz	a5,80001250 <_ZN15MemoryAllocator10freeMemoryEPv+0x70>
    8000123c:	fee7eae3          	bltu	a5,a4,80001230 <_ZN15MemoryAllocator10freeMemoryEPv+0x50>
    80001240:	0100006f          	j	80001250 <_ZN15MemoryAllocator10freeMemoryEPv+0x70>
        blk = 0;
    80001244:	00078493          	mv	s1,a5
    80001248:	0080006f          	j	80001250 <_ZN15MemoryAllocator10freeMemoryEPv+0x70>
    8000124c:	00000493          	li	s1,0
    FreeBlock* newBlk = (FreeBlock*)((char*)addr - sizeof(FreeBlock));
    80001250:	fe870593          	addi	a1,a4,-24
    newBlk->prev = blk;
    80001254:	fe973823          	sd	s1,-16(a4)
    if (blk) newBlk->next = blk->next;
    80001258:	04048c63          	beqz	s1,800012b0 <_ZN15MemoryAllocator10freeMemoryEPv+0xd0>
    8000125c:	0004b783          	ld	a5,0(s1)
    80001260:	fef73423          	sd	a5,-24(a4)
    if (newBlk->next) newBlk->next->prev = newBlk;
    80001264:	fe873783          	ld	a5,-24(a4)
    80001268:	00078463          	beqz	a5,80001270 <_ZN15MemoryAllocator10freeMemoryEPv+0x90>
    8000126c:	00b7b423          	sd	a1,8(a5)
    if (blk) blk->next = newBlk;
    80001270:	04048663          	beqz	s1,800012bc <_ZN15MemoryAllocator10freeMemoryEPv+0xdc>
    80001274:	00b4b023          	sd	a1,0(s1)
    tryToMerge(newBlk);
    80001278:	00090513          	mv	a0,s2
    8000127c:	00000097          	auipc	ra,0x0
    80001280:	f10080e7          	jalr	-240(ra) # 8000118c <_ZN15MemoryAllocator10tryToMergeEPNS_9FreeBlockE>
    tryToMerge(blk);
    80001284:	00048593          	mv	a1,s1
    80001288:	00090513          	mv	a0,s2
    8000128c:	00000097          	auipc	ra,0x0
    80001290:	f00080e7          	jalr	-256(ra) # 8000118c <_ZN15MemoryAllocator10tryToMergeEPNS_9FreeBlockE>
    return 0;
    80001294:	00000513          	li	a0,0
}
    80001298:	01813083          	ld	ra,24(sp)
    8000129c:	01013403          	ld	s0,16(sp)
    800012a0:	00813483          	ld	s1,8(sp)
    800012a4:	00013903          	ld	s2,0(sp)
    800012a8:	02010113          	addi	sp,sp,32
    800012ac:	00008067          	ret
    else newBlk->next = head;
    800012b0:	00093783          	ld	a5,0(s2)
    800012b4:	fef73423          	sd	a5,-24(a4)
    800012b8:	fadff06f          	j	80001264 <_ZN15MemoryAllocator10freeMemoryEPv+0x84>
    else head = newBlk;
    800012bc:	00b93023          	sd	a1,0(s2)
    800012c0:	fb9ff06f          	j	80001278 <_ZN15MemoryAllocator10freeMemoryEPv+0x98>
        return -1;
    800012c4:	fff00513          	li	a0,-1
}
    800012c8:	00008067          	ret
        return -1;
    800012cc:	fff00513          	li	a0,-1
    800012d0:	fc9ff06f          	j	80001298 <_ZN15MemoryAllocator10freeMemoryEPv+0xb8>
    800012d4:	fff00513          	li	a0,-1
    800012d8:	fc1ff06f          	j	80001298 <_ZN15MemoryAllocator10freeMemoryEPv+0xb8>

00000000800012dc <main>:





int main(){
    800012dc:	ff010113          	addi	sp,sp,-16
    800012e0:	00113423          	sd	ra,8(sp)
    800012e4:	00813023          	sd	s0,0(sp)
    800012e8:	01010413          	addi	s0,sp,16

    MemoryAllocator& instance = MemoryAllocator::getInstance();
    800012ec:	00000097          	auipc	ra,0x0
    800012f0:	d6c080e7          	jalr	-660(ra) # 80001058 <_ZN15MemoryAllocator11getInstanceEv>

    stressTesting(instance);
    800012f4:	00000097          	auipc	ra,0x0
    800012f8:	450080e7          	jalr	1104(ra) # 80001744 <_Z13stressTestingR15MemoryAllocator>

    return 0;
    800012fc:	00000513          	li	a0,0
    80001300:	00813083          	ld	ra,8(sp)
    80001304:	00013403          	ld	s0,0(sp)
    80001308:	01010113          	addi	sp,sp,16
    8000130c:	00008067          	ret

0000000080001310 <_Z11printStringPKc>:
//
#include "../test/MemoryAllocatorTest.hpp"



void printString(const char *string){
    80001310:	fe010113          	addi	sp,sp,-32
    80001314:	00113c23          	sd	ra,24(sp)
    80001318:	00813823          	sd	s0,16(sp)
    8000131c:	00913423          	sd	s1,8(sp)
    80001320:	01213023          	sd	s2,0(sp)
    80001324:	02010413          	addi	s0,sp,32
    80001328:	00050913          	mv	s2,a0
    char c;
    int i = 0;
    8000132c:	00000793          	li	a5,0
    while((c=string[i++])!='\0') __putc(c);
    80001330:	0017849b          	addiw	s1,a5,1
    80001334:	00f907b3          	add	a5,s2,a5
    80001338:	0007c503          	lbu	a0,0(a5)
    8000133c:	00050a63          	beqz	a0,80001350 <_Z11printStringPKc+0x40>
    80001340:	00002097          	auipc	ra,0x2
    80001344:	74c080e7          	jalr	1868(ra) # 80003a8c <__putc>
    80001348:	00048793          	mv	a5,s1
    8000134c:	fe5ff06f          	j	80001330 <_Z11printStringPKc+0x20>
}
    80001350:	01813083          	ld	ra,24(sp)
    80001354:	01013403          	ld	s0,16(sp)
    80001358:	00813483          	ld	s1,8(sp)
    8000135c:	00013903          	ld	s2,0(sp)
    80001360:	02010113          	addi	sp,sp,32
    80001364:	00008067          	ret

0000000080001368 <_Z10readStringPc>:

void readString(char word[]){
    80001368:	fe010113          	addi	sp,sp,-32
    8000136c:	00113c23          	sd	ra,24(sp)
    80001370:	00813823          	sd	s0,16(sp)
    80001374:	00913423          	sd	s1,8(sp)
    80001378:	01213023          	sd	s2,0(sp)
    8000137c:	02010413          	addi	s0,sp,32
    80001380:	00050913          	mv	s2,a0
    char c;
    int i = 0;
    80001384:	00000493          	li	s1,0
    while((c=__getc())!='\n') word[i++] = c;
    80001388:	00002097          	auipc	ra,0x2
    8000138c:	740080e7          	jalr	1856(ra) # 80003ac8 <__getc>
    80001390:	00a00793          	li	a5,10
    80001394:	00f50a63          	beq	a0,a5,800013a8 <_Z10readStringPc+0x40>
    80001398:	009907b3          	add	a5,s2,s1
    8000139c:	00a78023          	sb	a0,0(a5)
    800013a0:	0014849b          	addiw	s1,s1,1
    800013a4:	fe5ff06f          	j	80001388 <_Z10readStringPc+0x20>
}
    800013a8:	01813083          	ld	ra,24(sp)
    800013ac:	01013403          	ld	s0,16(sp)
    800013b0:	00813483          	ld	s1,8(sp)
    800013b4:	00013903          	ld	s2,0(sp)
    800013b8:	02010113          	addi	sp,sp,32
    800013bc:	00008067          	ret

00000000800013c0 <_Z8printIntm>:


void printInt(uint64 n){
    800013c0:	fe010113          	addi	sp,sp,-32
    800013c4:	00113c23          	sd	ra,24(sp)
    800013c8:	00813823          	sd	s0,16(sp)
    800013cc:	00913423          	sd	s1,8(sp)
    800013d0:	02010413          	addi	s0,sp,32
    800013d4:	00050493          	mv	s1,a0
    if (n < 0) {
        __putc('-');
        n = -n;
    }
    if (n/10)
    800013d8:	00900793          	li	a5,9
    800013dc:	02a7e663          	bltu	a5,a0,80001408 <_Z8printIntm+0x48>
        printInt(n/10);
    __putc(n%10 + '0');
    800013e0:	00a00513          	li	a0,10
    800013e4:	02a4f533          	remu	a0,s1,a0
    800013e8:	03050513          	addi	a0,a0,48
    800013ec:	00002097          	auipc	ra,0x2
    800013f0:	6a0080e7          	jalr	1696(ra) # 80003a8c <__putc>
}
    800013f4:	01813083          	ld	ra,24(sp)
    800013f8:	01013403          	ld	s0,16(sp)
    800013fc:	00813483          	ld	s1,8(sp)
    80001400:	02010113          	addi	sp,sp,32
    80001404:	00008067          	ret
        printInt(n/10);
    80001408:	00a00513          	li	a0,10
    8000140c:	02a4d533          	divu	a0,s1,a0
    80001410:	00000097          	auipc	ra,0x0
    80001414:	fb0080e7          	jalr	-80(ra) # 800013c0 <_Z8printIntm>
    80001418:	fc9ff06f          	j	800013e0 <_Z8printIntm+0x20>

000000008000141c <_Z12printIntegerm>:

void printInteger(uint64 n){
    8000141c:	ff010113          	addi	sp,sp,-16
    80001420:	00113423          	sd	ra,8(sp)
    80001424:	00813023          	sd	s0,0(sp)
    80001428:	01010413          	addi	s0,sp,16
    printInt(n);
    8000142c:	00000097          	auipc	ra,0x0
    80001430:	f94080e7          	jalr	-108(ra) # 800013c0 <_Z8printIntm>
    __putc('\n');
    80001434:	00a00513          	li	a0,10
    80001438:	00002097          	auipc	ra,0x2
    8000143c:	654080e7          	jalr	1620(ra) # 80003a8c <__putc>
}
    80001440:	00813083          	ld	ra,8(sp)
    80001444:	00013403          	ld	s0,0(sp)
    80001448:	01010113          	addi	sp,sp,16
    8000144c:	00008067          	ret

0000000080001450 <_Z10mallocFreeR15MemoryAllocator>:

void mallocFree(MemoryAllocator& allocator){
    80001450:	cc010113          	addi	sp,sp,-832
    80001454:	32113c23          	sd	ra,824(sp)
    80001458:	32813823          	sd	s0,816(sp)
    8000145c:	32913423          	sd	s1,808(sp)
    80001460:	33213023          	sd	s2,800(sp)
    80001464:	34010413          	addi	s0,sp,832
    80001468:	00050913          	mv	s2,a0
    printString("mallocFree\n");
    8000146c:	00003517          	auipc	a0,0x3
    80001470:	bb450513          	addi	a0,a0,-1100 # 80004020 <CONSOLE_STATUS+0x10>
    80001474:	00000097          	auipc	ra,0x0
    80001478:	e9c080e7          	jalr	-356(ra) # 80001310 <_Z11printStringPKc>
    constexpr int num = 100;
    void* addrs[num];
    for(int i = 0; i<num;i++){
    8000147c:	00000493          	li	s1,0
    80001480:	0080006f          	j	80001488 <_Z10mallocFreeR15MemoryAllocator+0x38>
    80001484:	0014849b          	addiw	s1,s1,1
    80001488:	06300793          	li	a5,99
    8000148c:	0497c863          	blt	a5,s1,800014dc <_Z10mallocFreeR15MemoryAllocator+0x8c>
        addrs[i] = allocator.getMemory(100);
    80001490:	06400593          	li	a1,100
    80001494:	00090513          	mv	a0,s2
    80001498:	00000097          	auipc	ra,0x0
    8000149c:	c1c080e7          	jalr	-996(ra) # 800010b4 <_ZN15MemoryAllocator9getMemoryEm>
    800014a0:	00349793          	slli	a5,s1,0x3
    800014a4:	fe040713          	addi	a4,s0,-32
    800014a8:	00f707b3          	add	a5,a4,a5
    800014ac:	cea7b023          	sd	a0,-800(a5)
        if(addrs[i] == 0){
    800014b0:	fc051ae3          	bnez	a0,80001484 <_Z10mallocFreeR15MemoryAllocator+0x34>
            printString("not ok\n");
    800014b4:	00003517          	auipc	a0,0x3
    800014b8:	b7c50513          	addi	a0,a0,-1156 # 80004030 <CONSOLE_STATUS+0x20>
    800014bc:	00000097          	auipc	ra,0x0
    800014c0:	e54080e7          	jalr	-428(ra) # 80001310 <_Z11printStringPKc>
            return;
        }
    }

    printString("ok\n");;
}
    800014c4:	33813083          	ld	ra,824(sp)
    800014c8:	33013403          	ld	s0,816(sp)
    800014cc:	32813483          	ld	s1,808(sp)
    800014d0:	32013903          	ld	s2,800(sp)
    800014d4:	34010113          	addi	sp,sp,832
    800014d8:	00008067          	ret
    for(int i = 0 ; i<num ; i+=2){
    800014dc:	00000493          	li	s1,0
    800014e0:	06300793          	li	a5,99
    800014e4:	0497c063          	blt	a5,s1,80001524 <_Z10mallocFreeR15MemoryAllocator+0xd4>
        int retval = allocator.freeMemory(addrs[i]);
    800014e8:	00349793          	slli	a5,s1,0x3
    800014ec:	fe040713          	addi	a4,s0,-32
    800014f0:	00f707b3          	add	a5,a4,a5
    800014f4:	ce07b583          	ld	a1,-800(a5)
    800014f8:	00090513          	mv	a0,s2
    800014fc:	00000097          	auipc	ra,0x0
    80001500:	ce4080e7          	jalr	-796(ra) # 800011e0 <_ZN15MemoryAllocator10freeMemoryEPv>
        if(retval != 0){
    80001504:	00051663          	bnez	a0,80001510 <_Z10mallocFreeR15MemoryAllocator+0xc0>
    for(int i = 0 ; i<num ; i+=2){
    80001508:	0024849b          	addiw	s1,s1,2
    8000150c:	fd5ff06f          	j	800014e0 <_Z10mallocFreeR15MemoryAllocator+0x90>
            printString("not ok\n");
    80001510:	00003517          	auipc	a0,0x3
    80001514:	b2050513          	addi	a0,a0,-1248 # 80004030 <CONSOLE_STATUS+0x20>
    80001518:	00000097          	auipc	ra,0x0
    8000151c:	df8080e7          	jalr	-520(ra) # 80001310 <_Z11printStringPKc>
            return;
    80001520:	fa5ff06f          	j	800014c4 <_Z10mallocFreeR15MemoryAllocator+0x74>
    for(int i = 0 ; i<num;i+=2){
    80001524:	00000493          	li	s1,0
    80001528:	0080006f          	j	80001530 <_Z10mallocFreeR15MemoryAllocator+0xe0>
    8000152c:	0024849b          	addiw	s1,s1,2
    80001530:	06300793          	li	a5,99
    80001534:	0297ce63          	blt	a5,s1,80001570 <_Z10mallocFreeR15MemoryAllocator+0x120>
        addrs[i] = allocator.getMemory(20);
    80001538:	01400593          	li	a1,20
    8000153c:	00090513          	mv	a0,s2
    80001540:	00000097          	auipc	ra,0x0
    80001544:	b74080e7          	jalr	-1164(ra) # 800010b4 <_ZN15MemoryAllocator9getMemoryEm>
    80001548:	00349793          	slli	a5,s1,0x3
    8000154c:	fe040713          	addi	a4,s0,-32
    80001550:	00f707b3          	add	a5,a4,a5
    80001554:	cea7b023          	sd	a0,-800(a5)
        if(addrs[i] == 0){
    80001558:	fc051ae3          	bnez	a0,8000152c <_Z10mallocFreeR15MemoryAllocator+0xdc>
            printString("not ok\n");;
    8000155c:	00003517          	auipc	a0,0x3
    80001560:	ad450513          	addi	a0,a0,-1324 # 80004030 <CONSOLE_STATUS+0x20>
    80001564:	00000097          	auipc	ra,0x0
    80001568:	dac080e7          	jalr	-596(ra) # 80001310 <_Z11printStringPKc>
            return;
    8000156c:	f59ff06f          	j	800014c4 <_Z10mallocFreeR15MemoryAllocator+0x74>
    for(int i = 0; i<num;i++){
    80001570:	00000493          	li	s1,0
    80001574:	06300793          	li	a5,99
    80001578:	0497c063          	blt	a5,s1,800015b8 <_Z10mallocFreeR15MemoryAllocator+0x168>
        int retval = allocator.freeMemory(addrs[i]);
    8000157c:	00349793          	slli	a5,s1,0x3
    80001580:	fe040713          	addi	a4,s0,-32
    80001584:	00f707b3          	add	a5,a4,a5
    80001588:	ce07b583          	ld	a1,-800(a5)
    8000158c:	00090513          	mv	a0,s2
    80001590:	00000097          	auipc	ra,0x0
    80001594:	c50080e7          	jalr	-944(ra) # 800011e0 <_ZN15MemoryAllocator10freeMemoryEPv>
        if(retval != 0){
    80001598:	00051663          	bnez	a0,800015a4 <_Z10mallocFreeR15MemoryAllocator+0x154>
    for(int i = 0; i<num;i++){
    8000159c:	0014849b          	addiw	s1,s1,1
    800015a0:	fd5ff06f          	j	80001574 <_Z10mallocFreeR15MemoryAllocator+0x124>
            printString("not ok\n");;
    800015a4:	00003517          	auipc	a0,0x3
    800015a8:	a8c50513          	addi	a0,a0,-1396 # 80004030 <CONSOLE_STATUS+0x20>
    800015ac:	00000097          	auipc	ra,0x0
    800015b0:	d64080e7          	jalr	-668(ra) # 80001310 <_Z11printStringPKc>
            return;
    800015b4:	f11ff06f          	j	800014c4 <_Z10mallocFreeR15MemoryAllocator+0x74>
    printString("ok\n");;
    800015b8:	00003517          	auipc	a0,0x3
    800015bc:	a8050513          	addi	a0,a0,-1408 # 80004038 <CONSOLE_STATUS+0x28>
    800015c0:	00000097          	auipc	ra,0x0
    800015c4:	d50080e7          	jalr	-688(ra) # 80001310 <_Z11printStringPKc>
    800015c8:	efdff06f          	j	800014c4 <_Z10mallocFreeR15MemoryAllocator+0x74>

00000000800015cc <_Z9bigMallocR15MemoryAllocator>:


void bigMalloc(MemoryAllocator& allocator){
    800015cc:	fe010113          	addi	sp,sp,-32
    800015d0:	00113c23          	sd	ra,24(sp)
    800015d4:	00813823          	sd	s0,16(sp)
    800015d8:	00913423          	sd	s1,8(sp)
    800015dc:	02010413          	addi	s0,sp,32
    800015e0:	00050493          	mv	s1,a0

    printString("big Malloc\n");;
    800015e4:	00003517          	auipc	a0,0x3
    800015e8:	a5c50513          	addi	a0,a0,-1444 # 80004040 <CONSOLE_STATUS+0x30>
    800015ec:	00000097          	auipc	ra,0x0
    800015f0:	d24080e7          	jalr	-732(ra) # 80001310 <_Z11printStringPKc>
    size_t x = (size_t)HEAP_END_ADDR - (size_t)HEAP_START_ADDR + 100UL;
    800015f4:	00003797          	auipc	a5,0x3
    800015f8:	f847b783          	ld	a5,-124(a5) # 80004578 <_GLOBAL_OFFSET_TABLE_+0x18>
    800015fc:	0007b583          	ld	a1,0(a5)
    80001600:	00003797          	auipc	a5,0x3
    80001604:	f687b783          	ld	a5,-152(a5) # 80004568 <_GLOBAL_OFFSET_TABLE_+0x8>
    80001608:	0007b783          	ld	a5,0(a5)
    8000160c:	40f585b3          	sub	a1,a1,a5
    void* p = allocator.getMemory(x);
    80001610:	06458593          	addi	a1,a1,100
    80001614:	00048513          	mv	a0,s1
    80001618:	00000097          	auipc	ra,0x0
    8000161c:	a9c080e7          	jalr	-1380(ra) # 800010b4 <_ZN15MemoryAllocator9getMemoryEm>
    if(p == 0) printString("ok\n");
    80001620:	02050463          	beqz	a0,80001648 <_Z9bigMallocR15MemoryAllocator+0x7c>
    else printString("not ok\n");
    80001624:	00003517          	auipc	a0,0x3
    80001628:	a0c50513          	addi	a0,a0,-1524 # 80004030 <CONSOLE_STATUS+0x20>
    8000162c:	00000097          	auipc	ra,0x0
    80001630:	ce4080e7          	jalr	-796(ra) # 80001310 <_Z11printStringPKc>
}
    80001634:	01813083          	ld	ra,24(sp)
    80001638:	01013403          	ld	s0,16(sp)
    8000163c:	00813483          	ld	s1,8(sp)
    80001640:	02010113          	addi	sp,sp,32
    80001644:	00008067          	ret
    if(p == 0) printString("ok\n");
    80001648:	00003517          	auipc	a0,0x3
    8000164c:	9f050513          	addi	a0,a0,-1552 # 80004038 <CONSOLE_STATUS+0x28>
    80001650:	00000097          	auipc	ra,0x0
    80001654:	cc0080e7          	jalr	-832(ra) # 80001310 <_Z11printStringPKc>
    80001658:	fddff06f          	j	80001634 <_Z9bigMallocR15MemoryAllocator+0x68>

000000008000165c <_Z17lotOfSmallMallocsR15MemoryAllocator>:





void lotOfSmallMallocs(MemoryAllocator& allocator){
    8000165c:	fd010113          	addi	sp,sp,-48
    80001660:	02113423          	sd	ra,40(sp)
    80001664:	02813023          	sd	s0,32(sp)
    80001668:	00913c23          	sd	s1,24(sp)
    8000166c:	01213823          	sd	s2,16(sp)
    80001670:	01313423          	sd	s3,8(sp)
    80001674:	01413023          	sd	s4,0(sp)
    80001678:	03010413          	addi	s0,sp,48
    8000167c:	00050a13          	mv	s4,a0

    printString("lotOfSmallMallocs\n");;
    80001680:	00003517          	auipc	a0,0x3
    80001684:	9d050513          	addi	a0,a0,-1584 # 80004050 <CONSOLE_STATUS+0x40>
    80001688:	00000097          	auipc	ra,0x0
    8000168c:	c88080e7          	jalr	-888(ra) # 80001310 <_Z11printStringPKc>
    uint64 cnt = 0;
    uint64 sum = 0;
    uint64 N = 1000000UL;
    uint64 X = 10UL;
    for(uint64 i = 0; i<N;i++){
    80001690:	00000493          	li	s1,0
    uint64 sum = 0;
    80001694:	00000993          	li	s3,0
    uint64 cnt = 0;
    80001698:	00000913          	li	s2,0
    8000169c:	0180006f          	j	800016b4 <_Z17lotOfSmallMallocsR15MemoryAllocator+0x58>
        Test* t = (Test*)allocator.getMemory(sizeof(Test));
        if(t == 0)break;
        t->a = X;
    800016a0:	00a00793          	li	a5,10
    800016a4:	00f52023          	sw	a5,0(a0)
        sum+=t->a;
    800016a8:	00a98993          	addi	s3,s3,10
        cnt++;
    800016ac:	00190913          	addi	s2,s2,1
    for(uint64 i = 0; i<N;i++){
    800016b0:	00148493          	addi	s1,s1,1
    800016b4:	000f47b7          	lui	a5,0xf4
    800016b8:	23f78793          	addi	a5,a5,575 # f423f <_entry-0x7ff0bdc1>
    800016bc:	0097ec63          	bltu	a5,s1,800016d4 <_Z17lotOfSmallMallocsR15MemoryAllocator+0x78>
        Test* t = (Test*)allocator.getMemory(sizeof(Test));
    800016c0:	00400593          	li	a1,4
    800016c4:	000a0513          	mv	a0,s4
    800016c8:	00000097          	auipc	ra,0x0
    800016cc:	9ec080e7          	jalr	-1556(ra) # 800010b4 <_ZN15MemoryAllocator9getMemoryEm>
        if(t == 0)break;
    800016d0:	fc0518e3          	bnez	a0,800016a0 <_Z17lotOfSmallMallocsR15MemoryAllocator+0x44>
    }
    printInteger(cnt);
    800016d4:	00090513          	mv	a0,s2
    800016d8:	00000097          	auipc	ra,0x0
    800016dc:	d44080e7          	jalr	-700(ra) # 8000141c <_Z12printIntegerm>
    printString("\n");
    800016e0:	00003517          	auipc	a0,0x3
    800016e4:	ac850513          	addi	a0,a0,-1336 # 800041a8 <CONSOLE_STATUS+0x198>
    800016e8:	00000097          	auipc	ra,0x0
    800016ec:	c28080e7          	jalr	-984(ra) # 80001310 <_Z11printStringPKc>
    if(sum == X*cnt) printString("ok\n");
    800016f0:	00291793          	slli	a5,s2,0x2
    800016f4:	01278933          	add	s2,a5,s2
    800016f8:	00191913          	slli	s2,s2,0x1
    800016fc:	03390a63          	beq	s2,s3,80001730 <_Z17lotOfSmallMallocsR15MemoryAllocator+0xd4>
    else printString("not ok\n");
    80001700:	00003517          	auipc	a0,0x3
    80001704:	93050513          	addi	a0,a0,-1744 # 80004030 <CONSOLE_STATUS+0x20>
    80001708:	00000097          	auipc	ra,0x0
    8000170c:	c08080e7          	jalr	-1016(ra) # 80001310 <_Z11printStringPKc>
}
    80001710:	02813083          	ld	ra,40(sp)
    80001714:	02013403          	ld	s0,32(sp)
    80001718:	01813483          	ld	s1,24(sp)
    8000171c:	01013903          	ld	s2,16(sp)
    80001720:	00813983          	ld	s3,8(sp)
    80001724:	00013a03          	ld	s4,0(sp)
    80001728:	03010113          	addi	sp,sp,48
    8000172c:	00008067          	ret
    if(sum == X*cnt) printString("ok\n");
    80001730:	00003517          	auipc	a0,0x3
    80001734:	90850513          	addi	a0,a0,-1784 # 80004038 <CONSOLE_STATUS+0x28>
    80001738:	00000097          	auipc	ra,0x0
    8000173c:	bd8080e7          	jalr	-1064(ra) # 80001310 <_Z11printStringPKc>
    80001740:	fd1ff06f          	j	80001710 <_Z17lotOfSmallMallocsR15MemoryAllocator+0xb4>

0000000080001744 <_Z13stressTestingR15MemoryAllocator>:



void stressTesting(MemoryAllocator& allocator){
    80001744:	81010113          	addi	sp,sp,-2032
    80001748:	7e113423          	sd	ra,2024(sp)
    8000174c:	7e813023          	sd	s0,2016(sp)
    80001750:	7c913c23          	sd	s1,2008(sp)
    80001754:	7d213823          	sd	s2,2000(sp)
    80001758:	7d313423          	sd	s3,1992(sp)
    8000175c:	7d413023          	sd	s4,1984(sp)
    80001760:	7f010413          	addi	s0,sp,2032
    80001764:	93010113          	addi	sp,sp,-1744
    80001768:	00050913          	mv	s2,a0
    printString("stressTesting\n");
    8000176c:	00003517          	auipc	a0,0x3
    80001770:	8fc50513          	addi	a0,a0,-1796 # 80004068 <CONSOLE_STATUS+0x58>
    80001774:	00000097          	auipc	ra,0x0
    80001778:	b9c080e7          	jalr	-1124(ra) # 80001310 <_Z11printStringPKc>
    constexpr int num = 465;
    void* addrs[num];
    for(int i = 0; i<num;i++){
    8000177c:	00000493          	li	s1,0
    80001780:	0080006f          	j	80001788 <_Z13stressTestingR15MemoryAllocator+0x44>
    80001784:	0014849b          	addiw	s1,s1,1
    80001788:	1d000793          	li	a5,464
    8000178c:	0697c263          	blt	a5,s1,800017f0 <_Z13stressTestingR15MemoryAllocator+0xac>
        addrs[i] = allocator.getMemory(1);
    80001790:	00100593          	li	a1,1
    80001794:	00090513          	mv	a0,s2
    80001798:	00000097          	auipc	ra,0x0
    8000179c:	91c080e7          	jalr	-1764(ra) # 800010b4 <_ZN15MemoryAllocator9getMemoryEm>
    800017a0:	fffff737          	lui	a4,0xfffff
    800017a4:	00349793          	slli	a5,s1,0x3
    800017a8:	fd040693          	addi	a3,s0,-48
    800017ac:	00e68733          	add	a4,a3,a4
    800017b0:	00f707b3          	add	a5,a4,a5
    800017b4:	16a7bc23          	sd	a0,376(a5)
        if(addrs[i] == 0){
    800017b8:	fc0516e3          	bnez	a0,80001784 <_Z13stressTestingR15MemoryAllocator+0x40>
            printString("not ok\n");
    800017bc:	00003517          	auipc	a0,0x3
    800017c0:	87450513          	addi	a0,a0,-1932 # 80004030 <CONSOLE_STATUS+0x20>
    800017c4:	00000097          	auipc	ra,0x0
    800017c8:	b4c080e7          	jalr	-1204(ra) # 80001310 <_Z11printStringPKc>
            }
        }
        sz-=10;
    }
    printString("ok\n");;
}
    800017cc:	6d010113          	addi	sp,sp,1744
    800017d0:	7e813083          	ld	ra,2024(sp)
    800017d4:	7e013403          	ld	s0,2016(sp)
    800017d8:	7d813483          	ld	s1,2008(sp)
    800017dc:	7d013903          	ld	s2,2000(sp)
    800017e0:	7c813983          	ld	s3,1992(sp)
    800017e4:	7c013a03          	ld	s4,1984(sp)
    800017e8:	7f010113          	addi	sp,sp,2032
    800017ec:	00008067          	ret
    int sz = 5;
    800017f0:	00500993          	li	s3,5
    while(sz > 0){
    800017f4:	1d305263          	blez	s3,800019b8 <_Z13stressTestingR15MemoryAllocator+0x274>
        printString("sz:");
    800017f8:	00003517          	auipc	a0,0x3
    800017fc:	88050513          	addi	a0,a0,-1920 # 80004078 <CONSOLE_STATUS+0x68>
    80001800:	00000097          	auipc	ra,0x0
    80001804:	b10080e7          	jalr	-1264(ra) # 80001310 <_Z11printStringPKc>
        printInteger(sz);
    80001808:	00098a13          	mv	s4,s3
    8000180c:	00098513          	mv	a0,s3
    80001810:	00000097          	auipc	ra,0x0
    80001814:	c0c080e7          	jalr	-1012(ra) # 8000141c <_Z12printIntegerm>
        for(int i = 0 ; i<num;i+=2){
    80001818:	00000493          	li	s1,0
    8000181c:	1d000793          	li	a5,464
    80001820:	0c97c263          	blt	a5,s1,800018e4 <_Z13stressTestingR15MemoryAllocator+0x1a0>
            printString("i:");
    80001824:	00003517          	auipc	a0,0x3
    80001828:	85c50513          	addi	a0,a0,-1956 # 80004080 <CONSOLE_STATUS+0x70>
    8000182c:	00000097          	auipc	ra,0x0
    80001830:	ae4080e7          	jalr	-1308(ra) # 80001310 <_Z11printStringPKc>
            printInteger(i);
    80001834:	00048513          	mv	a0,s1
    80001838:	00000097          	auipc	ra,0x0
    8000183c:	be4080e7          	jalr	-1052(ra) # 8000141c <_Z12printIntegerm>
            printString("free\n");
    80001840:	00003517          	auipc	a0,0x3
    80001844:	84850513          	addi	a0,a0,-1976 # 80004088 <CONSOLE_STATUS+0x78>
    80001848:	00000097          	auipc	ra,0x0
    8000184c:	ac8080e7          	jalr	-1336(ra) # 80001310 <_Z11printStringPKc>
            int retval = allocator.freeMemory(addrs[i]);
    80001850:	fffff737          	lui	a4,0xfffff
    80001854:	00349793          	slli	a5,s1,0x3
    80001858:	fd040693          	addi	a3,s0,-48
    8000185c:	00e68733          	add	a4,a3,a4
    80001860:	00f707b3          	add	a5,a4,a5
    80001864:	1787b583          	ld	a1,376(a5)
    80001868:	00090513          	mv	a0,s2
    8000186c:	00000097          	auipc	ra,0x0
    80001870:	974080e7          	jalr	-1676(ra) # 800011e0 <_ZN15MemoryAllocator10freeMemoryEPv>
            if(retval != 0){
    80001874:	04051463          	bnez	a0,800018bc <_Z13stressTestingR15MemoryAllocator+0x178>
            printString("alloc\n");
    80001878:	00003517          	auipc	a0,0x3
    8000187c:	81850513          	addi	a0,a0,-2024 # 80004090 <CONSOLE_STATUS+0x80>
    80001880:	00000097          	auipc	ra,0x0
    80001884:	a90080e7          	jalr	-1392(ra) # 80001310 <_Z11printStringPKc>
            addrs[i] = allocator.getMemory(sz*2);
    80001888:	0019959b          	slliw	a1,s3,0x1
    8000188c:	00090513          	mv	a0,s2
    80001890:	00000097          	auipc	ra,0x0
    80001894:	824080e7          	jalr	-2012(ra) # 800010b4 <_ZN15MemoryAllocator9getMemoryEm>
    80001898:	fffff737          	lui	a4,0xfffff
    8000189c:	00349793          	slli	a5,s1,0x3
    800018a0:	fd040693          	addi	a3,s0,-48
    800018a4:	00e68733          	add	a4,a3,a4
    800018a8:	00f707b3          	add	a5,a4,a5
    800018ac:	16a7bc23          	sd	a0,376(a5)
            if(addrs[i] == 0){
    800018b0:	02050063          	beqz	a0,800018d0 <_Z13stressTestingR15MemoryAllocator+0x18c>
        for(int i = 0 ; i<num;i+=2){
    800018b4:	0024849b          	addiw	s1,s1,2
    800018b8:	f65ff06f          	j	8000181c <_Z13stressTestingR15MemoryAllocator+0xd8>
                printString("not ok\n");
    800018bc:	00002517          	auipc	a0,0x2
    800018c0:	77450513          	addi	a0,a0,1908 # 80004030 <CONSOLE_STATUS+0x20>
    800018c4:	00000097          	auipc	ra,0x0
    800018c8:	a4c080e7          	jalr	-1460(ra) # 80001310 <_Z11printStringPKc>
                return;
    800018cc:	f01ff06f          	j	800017cc <_Z13stressTestingR15MemoryAllocator+0x88>
                printString("not ok\n");;
    800018d0:	00002517          	auipc	a0,0x2
    800018d4:	76050513          	addi	a0,a0,1888 # 80004030 <CONSOLE_STATUS+0x20>
    800018d8:	00000097          	auipc	ra,0x0
    800018dc:	a38080e7          	jalr	-1480(ra) # 80001310 <_Z11printStringPKc>
                return;
    800018e0:	eedff06f          	j	800017cc <_Z13stressTestingR15MemoryAllocator+0x88>
        for(int i = 1 ; i<num;i+=2){
    800018e4:	00100493          	li	s1,1
    800018e8:	1d000793          	li	a5,464
    800018ec:	0c97c263          	blt	a5,s1,800019b0 <_Z13stressTestingR15MemoryAllocator+0x26c>
            printString("i:");
    800018f0:	00002517          	auipc	a0,0x2
    800018f4:	79050513          	addi	a0,a0,1936 # 80004080 <CONSOLE_STATUS+0x70>
    800018f8:	00000097          	auipc	ra,0x0
    800018fc:	a18080e7          	jalr	-1512(ra) # 80001310 <_Z11printStringPKc>
            printInteger(i);
    80001900:	00048513          	mv	a0,s1
    80001904:	00000097          	auipc	ra,0x0
    80001908:	b18080e7          	jalr	-1256(ra) # 8000141c <_Z12printIntegerm>
            printString("free\n");
    8000190c:	00002517          	auipc	a0,0x2
    80001910:	77c50513          	addi	a0,a0,1916 # 80004088 <CONSOLE_STATUS+0x78>
    80001914:	00000097          	auipc	ra,0x0
    80001918:	9fc080e7          	jalr	-1540(ra) # 80001310 <_Z11printStringPKc>
            int retval = allocator.freeMemory(addrs[i]);
    8000191c:	fffff737          	lui	a4,0xfffff
    80001920:	00349793          	slli	a5,s1,0x3
    80001924:	fd040693          	addi	a3,s0,-48
    80001928:	00e68733          	add	a4,a3,a4
    8000192c:	00f707b3          	add	a5,a4,a5
    80001930:	1787b583          	ld	a1,376(a5)
    80001934:	00090513          	mv	a0,s2
    80001938:	00000097          	auipc	ra,0x0
    8000193c:	8a8080e7          	jalr	-1880(ra) # 800011e0 <_ZN15MemoryAllocator10freeMemoryEPv>
            if(retval != 0){
    80001940:	04051463          	bnez	a0,80001988 <_Z13stressTestingR15MemoryAllocator+0x244>
            printString("alloc\n");
    80001944:	00002517          	auipc	a0,0x2
    80001948:	74c50513          	addi	a0,a0,1868 # 80004090 <CONSOLE_STATUS+0x80>
    8000194c:	00000097          	auipc	ra,0x0
    80001950:	9c4080e7          	jalr	-1596(ra) # 80001310 <_Z11printStringPKc>
            addrs[i] = allocator.getMemory(sz);
    80001954:	000a0593          	mv	a1,s4
    80001958:	00090513          	mv	a0,s2
    8000195c:	fffff097          	auipc	ra,0xfffff
    80001960:	758080e7          	jalr	1880(ra) # 800010b4 <_ZN15MemoryAllocator9getMemoryEm>
    80001964:	fffff737          	lui	a4,0xfffff
    80001968:	00349793          	slli	a5,s1,0x3
    8000196c:	fd040693          	addi	a3,s0,-48
    80001970:	00e68733          	add	a4,a3,a4
    80001974:	00f707b3          	add	a5,a4,a5
    80001978:	16a7bc23          	sd	a0,376(a5)
            if(addrs[i] == 0){
    8000197c:	02050063          	beqz	a0,8000199c <_Z13stressTestingR15MemoryAllocator+0x258>
        for(int i = 1 ; i<num;i+=2){
    80001980:	0024849b          	addiw	s1,s1,2
    80001984:	f65ff06f          	j	800018e8 <_Z13stressTestingR15MemoryAllocator+0x1a4>
                printString("not ok\n");
    80001988:	00002517          	auipc	a0,0x2
    8000198c:	6a850513          	addi	a0,a0,1704 # 80004030 <CONSOLE_STATUS+0x20>
    80001990:	00000097          	auipc	ra,0x0
    80001994:	980080e7          	jalr	-1664(ra) # 80001310 <_Z11printStringPKc>
                return;
    80001998:	e35ff06f          	j	800017cc <_Z13stressTestingR15MemoryAllocator+0x88>
                printString("not ok\n");;
    8000199c:	00002517          	auipc	a0,0x2
    800019a0:	69450513          	addi	a0,a0,1684 # 80004030 <CONSOLE_STATUS+0x20>
    800019a4:	00000097          	auipc	ra,0x0
    800019a8:	96c080e7          	jalr	-1684(ra) # 80001310 <_Z11printStringPKc>
                return;
    800019ac:	e21ff06f          	j	800017cc <_Z13stressTestingR15MemoryAllocator+0x88>
        sz-=10;
    800019b0:	ff69899b          	addiw	s3,s3,-10
    while(sz > 0){
    800019b4:	e41ff06f          	j	800017f4 <_Z13stressTestingR15MemoryAllocator+0xb0>
    printString("ok\n");;
    800019b8:	00002517          	auipc	a0,0x2
    800019bc:	68050513          	addi	a0,a0,1664 # 80004038 <CONSOLE_STATUS+0x28>
    800019c0:	00000097          	auipc	ra,0x0
    800019c4:	950080e7          	jalr	-1712(ra) # 80001310 <_Z11printStringPKc>
    800019c8:	e05ff06f          	j	800017cc <_Z13stressTestingR15MemoryAllocator+0x88>

00000000800019cc <start>:
    800019cc:	ff010113          	addi	sp,sp,-16
    800019d0:	00813423          	sd	s0,8(sp)
    800019d4:	01010413          	addi	s0,sp,16
    800019d8:	300027f3          	csrr	a5,mstatus
    800019dc:	ffffe737          	lui	a4,0xffffe
    800019e0:	7ff70713          	addi	a4,a4,2047 # ffffffffffffe7ff <end+0xffffffff7fff8fcf>
    800019e4:	00e7f7b3          	and	a5,a5,a4
    800019e8:	00001737          	lui	a4,0x1
    800019ec:	80070713          	addi	a4,a4,-2048 # 800 <_entry-0x7ffff800>
    800019f0:	00e7e7b3          	or	a5,a5,a4
    800019f4:	30079073          	csrw	mstatus,a5
    800019f8:	00000797          	auipc	a5,0x0
    800019fc:	16078793          	addi	a5,a5,352 # 80001b58 <system_main>
    80001a00:	34179073          	csrw	mepc,a5
    80001a04:	00000793          	li	a5,0
    80001a08:	18079073          	csrw	satp,a5
    80001a0c:	000107b7          	lui	a5,0x10
    80001a10:	fff78793          	addi	a5,a5,-1 # ffff <_entry-0x7fff0001>
    80001a14:	30279073          	csrw	medeleg,a5
    80001a18:	30379073          	csrw	mideleg,a5
    80001a1c:	104027f3          	csrr	a5,sie
    80001a20:	2227e793          	ori	a5,a5,546
    80001a24:	10479073          	csrw	sie,a5
    80001a28:	fff00793          	li	a5,-1
    80001a2c:	00a7d793          	srli	a5,a5,0xa
    80001a30:	3b079073          	csrw	pmpaddr0,a5
    80001a34:	00f00793          	li	a5,15
    80001a38:	3a079073          	csrw	pmpcfg0,a5
    80001a3c:	f14027f3          	csrr	a5,mhartid
    80001a40:	0200c737          	lui	a4,0x200c
    80001a44:	ff873583          	ld	a1,-8(a4) # 200bff8 <_entry-0x7dff4008>
    80001a48:	0007869b          	sext.w	a3,a5
    80001a4c:	00269713          	slli	a4,a3,0x2
    80001a50:	000f4637          	lui	a2,0xf4
    80001a54:	24060613          	addi	a2,a2,576 # f4240 <_entry-0x7ff0bdc0>
    80001a58:	00d70733          	add	a4,a4,a3
    80001a5c:	0037979b          	slliw	a5,a5,0x3
    80001a60:	020046b7          	lui	a3,0x2004
    80001a64:	00d787b3          	add	a5,a5,a3
    80001a68:	00c585b3          	add	a1,a1,a2
    80001a6c:	00371693          	slli	a3,a4,0x3
    80001a70:	00003717          	auipc	a4,0x3
    80001a74:	b7070713          	addi	a4,a4,-1168 # 800045e0 <timer_scratch>
    80001a78:	00b7b023          	sd	a1,0(a5)
    80001a7c:	00d70733          	add	a4,a4,a3
    80001a80:	00f73c23          	sd	a5,24(a4)
    80001a84:	02c73023          	sd	a2,32(a4)
    80001a88:	34071073          	csrw	mscratch,a4
    80001a8c:	00000797          	auipc	a5,0x0
    80001a90:	6e478793          	addi	a5,a5,1764 # 80002170 <timervec>
    80001a94:	30579073          	csrw	mtvec,a5
    80001a98:	300027f3          	csrr	a5,mstatus
    80001a9c:	0087e793          	ori	a5,a5,8
    80001aa0:	30079073          	csrw	mstatus,a5
    80001aa4:	304027f3          	csrr	a5,mie
    80001aa8:	0807e793          	ori	a5,a5,128
    80001aac:	30479073          	csrw	mie,a5
    80001ab0:	f14027f3          	csrr	a5,mhartid
    80001ab4:	0007879b          	sext.w	a5,a5
    80001ab8:	00078213          	mv	tp,a5
    80001abc:	30200073          	mret
    80001ac0:	00813403          	ld	s0,8(sp)
    80001ac4:	01010113          	addi	sp,sp,16
    80001ac8:	00008067          	ret

0000000080001acc <timerinit>:
    80001acc:	ff010113          	addi	sp,sp,-16
    80001ad0:	00813423          	sd	s0,8(sp)
    80001ad4:	01010413          	addi	s0,sp,16
    80001ad8:	f14027f3          	csrr	a5,mhartid
    80001adc:	0200c737          	lui	a4,0x200c
    80001ae0:	ff873583          	ld	a1,-8(a4) # 200bff8 <_entry-0x7dff4008>
    80001ae4:	0007869b          	sext.w	a3,a5
    80001ae8:	00269713          	slli	a4,a3,0x2
    80001aec:	000f4637          	lui	a2,0xf4
    80001af0:	24060613          	addi	a2,a2,576 # f4240 <_entry-0x7ff0bdc0>
    80001af4:	00d70733          	add	a4,a4,a3
    80001af8:	0037979b          	slliw	a5,a5,0x3
    80001afc:	020046b7          	lui	a3,0x2004
    80001b00:	00d787b3          	add	a5,a5,a3
    80001b04:	00c585b3          	add	a1,a1,a2
    80001b08:	00371693          	slli	a3,a4,0x3
    80001b0c:	00003717          	auipc	a4,0x3
    80001b10:	ad470713          	addi	a4,a4,-1324 # 800045e0 <timer_scratch>
    80001b14:	00b7b023          	sd	a1,0(a5)
    80001b18:	00d70733          	add	a4,a4,a3
    80001b1c:	00f73c23          	sd	a5,24(a4)
    80001b20:	02c73023          	sd	a2,32(a4)
    80001b24:	34071073          	csrw	mscratch,a4
    80001b28:	00000797          	auipc	a5,0x0
    80001b2c:	64878793          	addi	a5,a5,1608 # 80002170 <timervec>
    80001b30:	30579073          	csrw	mtvec,a5
    80001b34:	300027f3          	csrr	a5,mstatus
    80001b38:	0087e793          	ori	a5,a5,8
    80001b3c:	30079073          	csrw	mstatus,a5
    80001b40:	304027f3          	csrr	a5,mie
    80001b44:	0807e793          	ori	a5,a5,128
    80001b48:	30479073          	csrw	mie,a5
    80001b4c:	00813403          	ld	s0,8(sp)
    80001b50:	01010113          	addi	sp,sp,16
    80001b54:	00008067          	ret

0000000080001b58 <system_main>:
    80001b58:	fe010113          	addi	sp,sp,-32
    80001b5c:	00813823          	sd	s0,16(sp)
    80001b60:	00913423          	sd	s1,8(sp)
    80001b64:	00113c23          	sd	ra,24(sp)
    80001b68:	02010413          	addi	s0,sp,32
    80001b6c:	00000097          	auipc	ra,0x0
    80001b70:	0c4080e7          	jalr	196(ra) # 80001c30 <cpuid>
    80001b74:	00003497          	auipc	s1,0x3
    80001b78:	a1c48493          	addi	s1,s1,-1508 # 80004590 <started>
    80001b7c:	02050263          	beqz	a0,80001ba0 <system_main+0x48>
    80001b80:	0004a783          	lw	a5,0(s1)
    80001b84:	0007879b          	sext.w	a5,a5
    80001b88:	fe078ce3          	beqz	a5,80001b80 <system_main+0x28>
    80001b8c:	0ff0000f          	fence
    80001b90:	00002517          	auipc	a0,0x2
    80001b94:	53850513          	addi	a0,a0,1336 # 800040c8 <CONSOLE_STATUS+0xb8>
    80001b98:	00001097          	auipc	ra,0x1
    80001b9c:	a74080e7          	jalr	-1420(ra) # 8000260c <panic>
    80001ba0:	00001097          	auipc	ra,0x1
    80001ba4:	9c8080e7          	jalr	-1592(ra) # 80002568 <consoleinit>
    80001ba8:	00001097          	auipc	ra,0x1
    80001bac:	154080e7          	jalr	340(ra) # 80002cfc <printfinit>
    80001bb0:	00002517          	auipc	a0,0x2
    80001bb4:	5f850513          	addi	a0,a0,1528 # 800041a8 <CONSOLE_STATUS+0x198>
    80001bb8:	00001097          	auipc	ra,0x1
    80001bbc:	ab0080e7          	jalr	-1360(ra) # 80002668 <__printf>
    80001bc0:	00002517          	auipc	a0,0x2
    80001bc4:	4d850513          	addi	a0,a0,1240 # 80004098 <CONSOLE_STATUS+0x88>
    80001bc8:	00001097          	auipc	ra,0x1
    80001bcc:	aa0080e7          	jalr	-1376(ra) # 80002668 <__printf>
    80001bd0:	00002517          	auipc	a0,0x2
    80001bd4:	5d850513          	addi	a0,a0,1496 # 800041a8 <CONSOLE_STATUS+0x198>
    80001bd8:	00001097          	auipc	ra,0x1
    80001bdc:	a90080e7          	jalr	-1392(ra) # 80002668 <__printf>
    80001be0:	00001097          	auipc	ra,0x1
    80001be4:	4a8080e7          	jalr	1192(ra) # 80003088 <kinit>
    80001be8:	00000097          	auipc	ra,0x0
    80001bec:	148080e7          	jalr	328(ra) # 80001d30 <trapinit>
    80001bf0:	00000097          	auipc	ra,0x0
    80001bf4:	16c080e7          	jalr	364(ra) # 80001d5c <trapinithart>
    80001bf8:	00000097          	auipc	ra,0x0
    80001bfc:	5b8080e7          	jalr	1464(ra) # 800021b0 <plicinit>
    80001c00:	00000097          	auipc	ra,0x0
    80001c04:	5d8080e7          	jalr	1496(ra) # 800021d8 <plicinithart>
    80001c08:	00000097          	auipc	ra,0x0
    80001c0c:	078080e7          	jalr	120(ra) # 80001c80 <userinit>
    80001c10:	0ff0000f          	fence
    80001c14:	00100793          	li	a5,1
    80001c18:	00002517          	auipc	a0,0x2
    80001c1c:	49850513          	addi	a0,a0,1176 # 800040b0 <CONSOLE_STATUS+0xa0>
    80001c20:	00f4a023          	sw	a5,0(s1)
    80001c24:	00001097          	auipc	ra,0x1
    80001c28:	a44080e7          	jalr	-1468(ra) # 80002668 <__printf>
    80001c2c:	0000006f          	j	80001c2c <system_main+0xd4>

0000000080001c30 <cpuid>:
    80001c30:	ff010113          	addi	sp,sp,-16
    80001c34:	00813423          	sd	s0,8(sp)
    80001c38:	01010413          	addi	s0,sp,16
    80001c3c:	00020513          	mv	a0,tp
    80001c40:	00813403          	ld	s0,8(sp)
    80001c44:	0005051b          	sext.w	a0,a0
    80001c48:	01010113          	addi	sp,sp,16
    80001c4c:	00008067          	ret

0000000080001c50 <mycpu>:
    80001c50:	ff010113          	addi	sp,sp,-16
    80001c54:	00813423          	sd	s0,8(sp)
    80001c58:	01010413          	addi	s0,sp,16
    80001c5c:	00020793          	mv	a5,tp
    80001c60:	00813403          	ld	s0,8(sp)
    80001c64:	0007879b          	sext.w	a5,a5
    80001c68:	00779793          	slli	a5,a5,0x7
    80001c6c:	00004517          	auipc	a0,0x4
    80001c70:	9a450513          	addi	a0,a0,-1628 # 80005610 <cpus>
    80001c74:	00f50533          	add	a0,a0,a5
    80001c78:	01010113          	addi	sp,sp,16
    80001c7c:	00008067          	ret

0000000080001c80 <userinit>:
    80001c80:	ff010113          	addi	sp,sp,-16
    80001c84:	00813423          	sd	s0,8(sp)
    80001c88:	01010413          	addi	s0,sp,16
    80001c8c:	00813403          	ld	s0,8(sp)
    80001c90:	01010113          	addi	sp,sp,16
    80001c94:	fffff317          	auipc	t1,0xfffff
    80001c98:	64830067          	jr	1608(t1) # 800012dc <main>

0000000080001c9c <either_copyout>:
    80001c9c:	ff010113          	addi	sp,sp,-16
    80001ca0:	00813023          	sd	s0,0(sp)
    80001ca4:	00113423          	sd	ra,8(sp)
    80001ca8:	01010413          	addi	s0,sp,16
    80001cac:	02051663          	bnez	a0,80001cd8 <either_copyout+0x3c>
    80001cb0:	00058513          	mv	a0,a1
    80001cb4:	00060593          	mv	a1,a2
    80001cb8:	0006861b          	sext.w	a2,a3
    80001cbc:	00002097          	auipc	ra,0x2
    80001cc0:	c58080e7          	jalr	-936(ra) # 80003914 <__memmove>
    80001cc4:	00813083          	ld	ra,8(sp)
    80001cc8:	00013403          	ld	s0,0(sp)
    80001ccc:	00000513          	li	a0,0
    80001cd0:	01010113          	addi	sp,sp,16
    80001cd4:	00008067          	ret
    80001cd8:	00002517          	auipc	a0,0x2
    80001cdc:	41850513          	addi	a0,a0,1048 # 800040f0 <CONSOLE_STATUS+0xe0>
    80001ce0:	00001097          	auipc	ra,0x1
    80001ce4:	92c080e7          	jalr	-1748(ra) # 8000260c <panic>

0000000080001ce8 <either_copyin>:
    80001ce8:	ff010113          	addi	sp,sp,-16
    80001cec:	00813023          	sd	s0,0(sp)
    80001cf0:	00113423          	sd	ra,8(sp)
    80001cf4:	01010413          	addi	s0,sp,16
    80001cf8:	02059463          	bnez	a1,80001d20 <either_copyin+0x38>
    80001cfc:	00060593          	mv	a1,a2
    80001d00:	0006861b          	sext.w	a2,a3
    80001d04:	00002097          	auipc	ra,0x2
    80001d08:	c10080e7          	jalr	-1008(ra) # 80003914 <__memmove>
    80001d0c:	00813083          	ld	ra,8(sp)
    80001d10:	00013403          	ld	s0,0(sp)
    80001d14:	00000513          	li	a0,0
    80001d18:	01010113          	addi	sp,sp,16
    80001d1c:	00008067          	ret
    80001d20:	00002517          	auipc	a0,0x2
    80001d24:	3f850513          	addi	a0,a0,1016 # 80004118 <CONSOLE_STATUS+0x108>
    80001d28:	00001097          	auipc	ra,0x1
    80001d2c:	8e4080e7          	jalr	-1820(ra) # 8000260c <panic>

0000000080001d30 <trapinit>:
    80001d30:	ff010113          	addi	sp,sp,-16
    80001d34:	00813423          	sd	s0,8(sp)
    80001d38:	01010413          	addi	s0,sp,16
    80001d3c:	00813403          	ld	s0,8(sp)
    80001d40:	00002597          	auipc	a1,0x2
    80001d44:	40058593          	addi	a1,a1,1024 # 80004140 <CONSOLE_STATUS+0x130>
    80001d48:	00004517          	auipc	a0,0x4
    80001d4c:	94850513          	addi	a0,a0,-1720 # 80005690 <tickslock>
    80001d50:	01010113          	addi	sp,sp,16
    80001d54:	00001317          	auipc	t1,0x1
    80001d58:	5c430067          	jr	1476(t1) # 80003318 <initlock>

0000000080001d5c <trapinithart>:
    80001d5c:	ff010113          	addi	sp,sp,-16
    80001d60:	00813423          	sd	s0,8(sp)
    80001d64:	01010413          	addi	s0,sp,16
    80001d68:	00000797          	auipc	a5,0x0
    80001d6c:	2f878793          	addi	a5,a5,760 # 80002060 <kernelvec>
    80001d70:	10579073          	csrw	stvec,a5
    80001d74:	00813403          	ld	s0,8(sp)
    80001d78:	01010113          	addi	sp,sp,16
    80001d7c:	00008067          	ret

0000000080001d80 <usertrap>:
    80001d80:	ff010113          	addi	sp,sp,-16
    80001d84:	00813423          	sd	s0,8(sp)
    80001d88:	01010413          	addi	s0,sp,16
    80001d8c:	00813403          	ld	s0,8(sp)
    80001d90:	01010113          	addi	sp,sp,16
    80001d94:	00008067          	ret

0000000080001d98 <usertrapret>:
    80001d98:	ff010113          	addi	sp,sp,-16
    80001d9c:	00813423          	sd	s0,8(sp)
    80001da0:	01010413          	addi	s0,sp,16
    80001da4:	00813403          	ld	s0,8(sp)
    80001da8:	01010113          	addi	sp,sp,16
    80001dac:	00008067          	ret

0000000080001db0 <kerneltrap>:
    80001db0:	fe010113          	addi	sp,sp,-32
    80001db4:	00813823          	sd	s0,16(sp)
    80001db8:	00113c23          	sd	ra,24(sp)
    80001dbc:	00913423          	sd	s1,8(sp)
    80001dc0:	02010413          	addi	s0,sp,32
    80001dc4:	142025f3          	csrr	a1,scause
    80001dc8:	100027f3          	csrr	a5,sstatus
    80001dcc:	0027f793          	andi	a5,a5,2
    80001dd0:	10079c63          	bnez	a5,80001ee8 <kerneltrap+0x138>
    80001dd4:	142027f3          	csrr	a5,scause
    80001dd8:	0207ce63          	bltz	a5,80001e14 <kerneltrap+0x64>
    80001ddc:	00002517          	auipc	a0,0x2
    80001de0:	3ac50513          	addi	a0,a0,940 # 80004188 <CONSOLE_STATUS+0x178>
    80001de4:	00001097          	auipc	ra,0x1
    80001de8:	884080e7          	jalr	-1916(ra) # 80002668 <__printf>
    80001dec:	141025f3          	csrr	a1,sepc
    80001df0:	14302673          	csrr	a2,stval
    80001df4:	00002517          	auipc	a0,0x2
    80001df8:	3a450513          	addi	a0,a0,932 # 80004198 <CONSOLE_STATUS+0x188>
    80001dfc:	00001097          	auipc	ra,0x1
    80001e00:	86c080e7          	jalr	-1940(ra) # 80002668 <__printf>
    80001e04:	00002517          	auipc	a0,0x2
    80001e08:	3ac50513          	addi	a0,a0,940 # 800041b0 <CONSOLE_STATUS+0x1a0>
    80001e0c:	00001097          	auipc	ra,0x1
    80001e10:	800080e7          	jalr	-2048(ra) # 8000260c <panic>
    80001e14:	0ff7f713          	andi	a4,a5,255
    80001e18:	00900693          	li	a3,9
    80001e1c:	04d70063          	beq	a4,a3,80001e5c <kerneltrap+0xac>
    80001e20:	fff00713          	li	a4,-1
    80001e24:	03f71713          	slli	a4,a4,0x3f
    80001e28:	00170713          	addi	a4,a4,1
    80001e2c:	fae798e3          	bne	a5,a4,80001ddc <kerneltrap+0x2c>
    80001e30:	00000097          	auipc	ra,0x0
    80001e34:	e00080e7          	jalr	-512(ra) # 80001c30 <cpuid>
    80001e38:	06050663          	beqz	a0,80001ea4 <kerneltrap+0xf4>
    80001e3c:	144027f3          	csrr	a5,sip
    80001e40:	ffd7f793          	andi	a5,a5,-3
    80001e44:	14479073          	csrw	sip,a5
    80001e48:	01813083          	ld	ra,24(sp)
    80001e4c:	01013403          	ld	s0,16(sp)
    80001e50:	00813483          	ld	s1,8(sp)
    80001e54:	02010113          	addi	sp,sp,32
    80001e58:	00008067          	ret
    80001e5c:	00000097          	auipc	ra,0x0
    80001e60:	3c8080e7          	jalr	968(ra) # 80002224 <plic_claim>
    80001e64:	00a00793          	li	a5,10
    80001e68:	00050493          	mv	s1,a0
    80001e6c:	06f50863          	beq	a0,a5,80001edc <kerneltrap+0x12c>
    80001e70:	fc050ce3          	beqz	a0,80001e48 <kerneltrap+0x98>
    80001e74:	00050593          	mv	a1,a0
    80001e78:	00002517          	auipc	a0,0x2
    80001e7c:	2f050513          	addi	a0,a0,752 # 80004168 <CONSOLE_STATUS+0x158>
    80001e80:	00000097          	auipc	ra,0x0
    80001e84:	7e8080e7          	jalr	2024(ra) # 80002668 <__printf>
    80001e88:	01013403          	ld	s0,16(sp)
    80001e8c:	01813083          	ld	ra,24(sp)
    80001e90:	00048513          	mv	a0,s1
    80001e94:	00813483          	ld	s1,8(sp)
    80001e98:	02010113          	addi	sp,sp,32
    80001e9c:	00000317          	auipc	t1,0x0
    80001ea0:	3c030067          	jr	960(t1) # 8000225c <plic_complete>
    80001ea4:	00003517          	auipc	a0,0x3
    80001ea8:	7ec50513          	addi	a0,a0,2028 # 80005690 <tickslock>
    80001eac:	00001097          	auipc	ra,0x1
    80001eb0:	490080e7          	jalr	1168(ra) # 8000333c <acquire>
    80001eb4:	00002717          	auipc	a4,0x2
    80001eb8:	6e070713          	addi	a4,a4,1760 # 80004594 <ticks>
    80001ebc:	00072783          	lw	a5,0(a4)
    80001ec0:	00003517          	auipc	a0,0x3
    80001ec4:	7d050513          	addi	a0,a0,2000 # 80005690 <tickslock>
    80001ec8:	0017879b          	addiw	a5,a5,1
    80001ecc:	00f72023          	sw	a5,0(a4)
    80001ed0:	00001097          	auipc	ra,0x1
    80001ed4:	538080e7          	jalr	1336(ra) # 80003408 <release>
    80001ed8:	f65ff06f          	j	80001e3c <kerneltrap+0x8c>
    80001edc:	00001097          	auipc	ra,0x1
    80001ee0:	094080e7          	jalr	148(ra) # 80002f70 <uartintr>
    80001ee4:	fa5ff06f          	j	80001e88 <kerneltrap+0xd8>
    80001ee8:	00002517          	auipc	a0,0x2
    80001eec:	26050513          	addi	a0,a0,608 # 80004148 <CONSOLE_STATUS+0x138>
    80001ef0:	00000097          	auipc	ra,0x0
    80001ef4:	71c080e7          	jalr	1820(ra) # 8000260c <panic>

0000000080001ef8 <clockintr>:
    80001ef8:	fe010113          	addi	sp,sp,-32
    80001efc:	00813823          	sd	s0,16(sp)
    80001f00:	00913423          	sd	s1,8(sp)
    80001f04:	00113c23          	sd	ra,24(sp)
    80001f08:	02010413          	addi	s0,sp,32
    80001f0c:	00003497          	auipc	s1,0x3
    80001f10:	78448493          	addi	s1,s1,1924 # 80005690 <tickslock>
    80001f14:	00048513          	mv	a0,s1
    80001f18:	00001097          	auipc	ra,0x1
    80001f1c:	424080e7          	jalr	1060(ra) # 8000333c <acquire>
    80001f20:	00002717          	auipc	a4,0x2
    80001f24:	67470713          	addi	a4,a4,1652 # 80004594 <ticks>
    80001f28:	00072783          	lw	a5,0(a4)
    80001f2c:	01013403          	ld	s0,16(sp)
    80001f30:	01813083          	ld	ra,24(sp)
    80001f34:	00048513          	mv	a0,s1
    80001f38:	0017879b          	addiw	a5,a5,1
    80001f3c:	00813483          	ld	s1,8(sp)
    80001f40:	00f72023          	sw	a5,0(a4)
    80001f44:	02010113          	addi	sp,sp,32
    80001f48:	00001317          	auipc	t1,0x1
    80001f4c:	4c030067          	jr	1216(t1) # 80003408 <release>

0000000080001f50 <devintr>:
    80001f50:	142027f3          	csrr	a5,scause
    80001f54:	00000513          	li	a0,0
    80001f58:	0007c463          	bltz	a5,80001f60 <devintr+0x10>
    80001f5c:	00008067          	ret
    80001f60:	fe010113          	addi	sp,sp,-32
    80001f64:	00813823          	sd	s0,16(sp)
    80001f68:	00113c23          	sd	ra,24(sp)
    80001f6c:	00913423          	sd	s1,8(sp)
    80001f70:	02010413          	addi	s0,sp,32
    80001f74:	0ff7f713          	andi	a4,a5,255
    80001f78:	00900693          	li	a3,9
    80001f7c:	04d70c63          	beq	a4,a3,80001fd4 <devintr+0x84>
    80001f80:	fff00713          	li	a4,-1
    80001f84:	03f71713          	slli	a4,a4,0x3f
    80001f88:	00170713          	addi	a4,a4,1
    80001f8c:	00e78c63          	beq	a5,a4,80001fa4 <devintr+0x54>
    80001f90:	01813083          	ld	ra,24(sp)
    80001f94:	01013403          	ld	s0,16(sp)
    80001f98:	00813483          	ld	s1,8(sp)
    80001f9c:	02010113          	addi	sp,sp,32
    80001fa0:	00008067          	ret
    80001fa4:	00000097          	auipc	ra,0x0
    80001fa8:	c8c080e7          	jalr	-884(ra) # 80001c30 <cpuid>
    80001fac:	06050663          	beqz	a0,80002018 <devintr+0xc8>
    80001fb0:	144027f3          	csrr	a5,sip
    80001fb4:	ffd7f793          	andi	a5,a5,-3
    80001fb8:	14479073          	csrw	sip,a5
    80001fbc:	01813083          	ld	ra,24(sp)
    80001fc0:	01013403          	ld	s0,16(sp)
    80001fc4:	00813483          	ld	s1,8(sp)
    80001fc8:	00200513          	li	a0,2
    80001fcc:	02010113          	addi	sp,sp,32
    80001fd0:	00008067          	ret
    80001fd4:	00000097          	auipc	ra,0x0
    80001fd8:	250080e7          	jalr	592(ra) # 80002224 <plic_claim>
    80001fdc:	00a00793          	li	a5,10
    80001fe0:	00050493          	mv	s1,a0
    80001fe4:	06f50663          	beq	a0,a5,80002050 <devintr+0x100>
    80001fe8:	00100513          	li	a0,1
    80001fec:	fa0482e3          	beqz	s1,80001f90 <devintr+0x40>
    80001ff0:	00048593          	mv	a1,s1
    80001ff4:	00002517          	auipc	a0,0x2
    80001ff8:	17450513          	addi	a0,a0,372 # 80004168 <CONSOLE_STATUS+0x158>
    80001ffc:	00000097          	auipc	ra,0x0
    80002000:	66c080e7          	jalr	1644(ra) # 80002668 <__printf>
    80002004:	00048513          	mv	a0,s1
    80002008:	00000097          	auipc	ra,0x0
    8000200c:	254080e7          	jalr	596(ra) # 8000225c <plic_complete>
    80002010:	00100513          	li	a0,1
    80002014:	f7dff06f          	j	80001f90 <devintr+0x40>
    80002018:	00003517          	auipc	a0,0x3
    8000201c:	67850513          	addi	a0,a0,1656 # 80005690 <tickslock>
    80002020:	00001097          	auipc	ra,0x1
    80002024:	31c080e7          	jalr	796(ra) # 8000333c <acquire>
    80002028:	00002717          	auipc	a4,0x2
    8000202c:	56c70713          	addi	a4,a4,1388 # 80004594 <ticks>
    80002030:	00072783          	lw	a5,0(a4)
    80002034:	00003517          	auipc	a0,0x3
    80002038:	65c50513          	addi	a0,a0,1628 # 80005690 <tickslock>
    8000203c:	0017879b          	addiw	a5,a5,1
    80002040:	00f72023          	sw	a5,0(a4)
    80002044:	00001097          	auipc	ra,0x1
    80002048:	3c4080e7          	jalr	964(ra) # 80003408 <release>
    8000204c:	f65ff06f          	j	80001fb0 <devintr+0x60>
    80002050:	00001097          	auipc	ra,0x1
    80002054:	f20080e7          	jalr	-224(ra) # 80002f70 <uartintr>
    80002058:	fadff06f          	j	80002004 <devintr+0xb4>
    8000205c:	0000                	unimp
	...

0000000080002060 <kernelvec>:
    80002060:	f0010113          	addi	sp,sp,-256
    80002064:	00113023          	sd	ra,0(sp)
    80002068:	00213423          	sd	sp,8(sp)
    8000206c:	00313823          	sd	gp,16(sp)
    80002070:	00413c23          	sd	tp,24(sp)
    80002074:	02513023          	sd	t0,32(sp)
    80002078:	02613423          	sd	t1,40(sp)
    8000207c:	02713823          	sd	t2,48(sp)
    80002080:	02813c23          	sd	s0,56(sp)
    80002084:	04913023          	sd	s1,64(sp)
    80002088:	04a13423          	sd	a0,72(sp)
    8000208c:	04b13823          	sd	a1,80(sp)
    80002090:	04c13c23          	sd	a2,88(sp)
    80002094:	06d13023          	sd	a3,96(sp)
    80002098:	06e13423          	sd	a4,104(sp)
    8000209c:	06f13823          	sd	a5,112(sp)
    800020a0:	07013c23          	sd	a6,120(sp)
    800020a4:	09113023          	sd	a7,128(sp)
    800020a8:	09213423          	sd	s2,136(sp)
    800020ac:	09313823          	sd	s3,144(sp)
    800020b0:	09413c23          	sd	s4,152(sp)
    800020b4:	0b513023          	sd	s5,160(sp)
    800020b8:	0b613423          	sd	s6,168(sp)
    800020bc:	0b713823          	sd	s7,176(sp)
    800020c0:	0b813c23          	sd	s8,184(sp)
    800020c4:	0d913023          	sd	s9,192(sp)
    800020c8:	0da13423          	sd	s10,200(sp)
    800020cc:	0db13823          	sd	s11,208(sp)
    800020d0:	0dc13c23          	sd	t3,216(sp)
    800020d4:	0fd13023          	sd	t4,224(sp)
    800020d8:	0fe13423          	sd	t5,232(sp)
    800020dc:	0ff13823          	sd	t6,240(sp)
    800020e0:	cd1ff0ef          	jal	ra,80001db0 <kerneltrap>
    800020e4:	00013083          	ld	ra,0(sp)
    800020e8:	00813103          	ld	sp,8(sp)
    800020ec:	01013183          	ld	gp,16(sp)
    800020f0:	02013283          	ld	t0,32(sp)
    800020f4:	02813303          	ld	t1,40(sp)
    800020f8:	03013383          	ld	t2,48(sp)
    800020fc:	03813403          	ld	s0,56(sp)
    80002100:	04013483          	ld	s1,64(sp)
    80002104:	04813503          	ld	a0,72(sp)
    80002108:	05013583          	ld	a1,80(sp)
    8000210c:	05813603          	ld	a2,88(sp)
    80002110:	06013683          	ld	a3,96(sp)
    80002114:	06813703          	ld	a4,104(sp)
    80002118:	07013783          	ld	a5,112(sp)
    8000211c:	07813803          	ld	a6,120(sp)
    80002120:	08013883          	ld	a7,128(sp)
    80002124:	08813903          	ld	s2,136(sp)
    80002128:	09013983          	ld	s3,144(sp)
    8000212c:	09813a03          	ld	s4,152(sp)
    80002130:	0a013a83          	ld	s5,160(sp)
    80002134:	0a813b03          	ld	s6,168(sp)
    80002138:	0b013b83          	ld	s7,176(sp)
    8000213c:	0b813c03          	ld	s8,184(sp)
    80002140:	0c013c83          	ld	s9,192(sp)
    80002144:	0c813d03          	ld	s10,200(sp)
    80002148:	0d013d83          	ld	s11,208(sp)
    8000214c:	0d813e03          	ld	t3,216(sp)
    80002150:	0e013e83          	ld	t4,224(sp)
    80002154:	0e813f03          	ld	t5,232(sp)
    80002158:	0f013f83          	ld	t6,240(sp)
    8000215c:	10010113          	addi	sp,sp,256
    80002160:	10200073          	sret
    80002164:	00000013          	nop
    80002168:	00000013          	nop
    8000216c:	00000013          	nop

0000000080002170 <timervec>:
    80002170:	34051573          	csrrw	a0,mscratch,a0
    80002174:	00b53023          	sd	a1,0(a0)
    80002178:	00c53423          	sd	a2,8(a0)
    8000217c:	00d53823          	sd	a3,16(a0)
    80002180:	01853583          	ld	a1,24(a0)
    80002184:	02053603          	ld	a2,32(a0)
    80002188:	0005b683          	ld	a3,0(a1)
    8000218c:	00c686b3          	add	a3,a3,a2
    80002190:	00d5b023          	sd	a3,0(a1)
    80002194:	00200593          	li	a1,2
    80002198:	14459073          	csrw	sip,a1
    8000219c:	01053683          	ld	a3,16(a0)
    800021a0:	00853603          	ld	a2,8(a0)
    800021a4:	00053583          	ld	a1,0(a0)
    800021a8:	34051573          	csrrw	a0,mscratch,a0
    800021ac:	30200073          	mret

00000000800021b0 <plicinit>:
    800021b0:	ff010113          	addi	sp,sp,-16
    800021b4:	00813423          	sd	s0,8(sp)
    800021b8:	01010413          	addi	s0,sp,16
    800021bc:	00813403          	ld	s0,8(sp)
    800021c0:	0c0007b7          	lui	a5,0xc000
    800021c4:	00100713          	li	a4,1
    800021c8:	02e7a423          	sw	a4,40(a5) # c000028 <_entry-0x73ffffd8>
    800021cc:	00e7a223          	sw	a4,4(a5)
    800021d0:	01010113          	addi	sp,sp,16
    800021d4:	00008067          	ret

00000000800021d8 <plicinithart>:
    800021d8:	ff010113          	addi	sp,sp,-16
    800021dc:	00813023          	sd	s0,0(sp)
    800021e0:	00113423          	sd	ra,8(sp)
    800021e4:	01010413          	addi	s0,sp,16
    800021e8:	00000097          	auipc	ra,0x0
    800021ec:	a48080e7          	jalr	-1464(ra) # 80001c30 <cpuid>
    800021f0:	0085171b          	slliw	a4,a0,0x8
    800021f4:	0c0027b7          	lui	a5,0xc002
    800021f8:	00e787b3          	add	a5,a5,a4
    800021fc:	40200713          	li	a4,1026
    80002200:	08e7a023          	sw	a4,128(a5) # c002080 <_entry-0x73ffdf80>
    80002204:	00813083          	ld	ra,8(sp)
    80002208:	00013403          	ld	s0,0(sp)
    8000220c:	00d5151b          	slliw	a0,a0,0xd
    80002210:	0c2017b7          	lui	a5,0xc201
    80002214:	00a78533          	add	a0,a5,a0
    80002218:	00052023          	sw	zero,0(a0)
    8000221c:	01010113          	addi	sp,sp,16
    80002220:	00008067          	ret

0000000080002224 <plic_claim>:
    80002224:	ff010113          	addi	sp,sp,-16
    80002228:	00813023          	sd	s0,0(sp)
    8000222c:	00113423          	sd	ra,8(sp)
    80002230:	01010413          	addi	s0,sp,16
    80002234:	00000097          	auipc	ra,0x0
    80002238:	9fc080e7          	jalr	-1540(ra) # 80001c30 <cpuid>
    8000223c:	00813083          	ld	ra,8(sp)
    80002240:	00013403          	ld	s0,0(sp)
    80002244:	00d5151b          	slliw	a0,a0,0xd
    80002248:	0c2017b7          	lui	a5,0xc201
    8000224c:	00a78533          	add	a0,a5,a0
    80002250:	00452503          	lw	a0,4(a0)
    80002254:	01010113          	addi	sp,sp,16
    80002258:	00008067          	ret

000000008000225c <plic_complete>:
    8000225c:	fe010113          	addi	sp,sp,-32
    80002260:	00813823          	sd	s0,16(sp)
    80002264:	00913423          	sd	s1,8(sp)
    80002268:	00113c23          	sd	ra,24(sp)
    8000226c:	02010413          	addi	s0,sp,32
    80002270:	00050493          	mv	s1,a0
    80002274:	00000097          	auipc	ra,0x0
    80002278:	9bc080e7          	jalr	-1604(ra) # 80001c30 <cpuid>
    8000227c:	01813083          	ld	ra,24(sp)
    80002280:	01013403          	ld	s0,16(sp)
    80002284:	00d5179b          	slliw	a5,a0,0xd
    80002288:	0c201737          	lui	a4,0xc201
    8000228c:	00f707b3          	add	a5,a4,a5
    80002290:	0097a223          	sw	s1,4(a5) # c201004 <_entry-0x73dfeffc>
    80002294:	00813483          	ld	s1,8(sp)
    80002298:	02010113          	addi	sp,sp,32
    8000229c:	00008067          	ret

00000000800022a0 <consolewrite>:
    800022a0:	fb010113          	addi	sp,sp,-80
    800022a4:	04813023          	sd	s0,64(sp)
    800022a8:	04113423          	sd	ra,72(sp)
    800022ac:	02913c23          	sd	s1,56(sp)
    800022b0:	03213823          	sd	s2,48(sp)
    800022b4:	03313423          	sd	s3,40(sp)
    800022b8:	03413023          	sd	s4,32(sp)
    800022bc:	01513c23          	sd	s5,24(sp)
    800022c0:	05010413          	addi	s0,sp,80
    800022c4:	06c05c63          	blez	a2,8000233c <consolewrite+0x9c>
    800022c8:	00060993          	mv	s3,a2
    800022cc:	00050a13          	mv	s4,a0
    800022d0:	00058493          	mv	s1,a1
    800022d4:	00000913          	li	s2,0
    800022d8:	fff00a93          	li	s5,-1
    800022dc:	01c0006f          	j	800022f8 <consolewrite+0x58>
    800022e0:	fbf44503          	lbu	a0,-65(s0)
    800022e4:	0019091b          	addiw	s2,s2,1
    800022e8:	00148493          	addi	s1,s1,1
    800022ec:	00001097          	auipc	ra,0x1
    800022f0:	a9c080e7          	jalr	-1380(ra) # 80002d88 <uartputc>
    800022f4:	03298063          	beq	s3,s2,80002314 <consolewrite+0x74>
    800022f8:	00048613          	mv	a2,s1
    800022fc:	00100693          	li	a3,1
    80002300:	000a0593          	mv	a1,s4
    80002304:	fbf40513          	addi	a0,s0,-65
    80002308:	00000097          	auipc	ra,0x0
    8000230c:	9e0080e7          	jalr	-1568(ra) # 80001ce8 <either_copyin>
    80002310:	fd5518e3          	bne	a0,s5,800022e0 <consolewrite+0x40>
    80002314:	04813083          	ld	ra,72(sp)
    80002318:	04013403          	ld	s0,64(sp)
    8000231c:	03813483          	ld	s1,56(sp)
    80002320:	02813983          	ld	s3,40(sp)
    80002324:	02013a03          	ld	s4,32(sp)
    80002328:	01813a83          	ld	s5,24(sp)
    8000232c:	00090513          	mv	a0,s2
    80002330:	03013903          	ld	s2,48(sp)
    80002334:	05010113          	addi	sp,sp,80
    80002338:	00008067          	ret
    8000233c:	00000913          	li	s2,0
    80002340:	fd5ff06f          	j	80002314 <consolewrite+0x74>

0000000080002344 <consoleread>:
    80002344:	f9010113          	addi	sp,sp,-112
    80002348:	06813023          	sd	s0,96(sp)
    8000234c:	04913c23          	sd	s1,88(sp)
    80002350:	05213823          	sd	s2,80(sp)
    80002354:	05313423          	sd	s3,72(sp)
    80002358:	05413023          	sd	s4,64(sp)
    8000235c:	03513c23          	sd	s5,56(sp)
    80002360:	03613823          	sd	s6,48(sp)
    80002364:	03713423          	sd	s7,40(sp)
    80002368:	03813023          	sd	s8,32(sp)
    8000236c:	06113423          	sd	ra,104(sp)
    80002370:	01913c23          	sd	s9,24(sp)
    80002374:	07010413          	addi	s0,sp,112
    80002378:	00060b93          	mv	s7,a2
    8000237c:	00050913          	mv	s2,a0
    80002380:	00058c13          	mv	s8,a1
    80002384:	00060b1b          	sext.w	s6,a2
    80002388:	00003497          	auipc	s1,0x3
    8000238c:	32048493          	addi	s1,s1,800 # 800056a8 <cons>
    80002390:	00400993          	li	s3,4
    80002394:	fff00a13          	li	s4,-1
    80002398:	00a00a93          	li	s5,10
    8000239c:	05705e63          	blez	s7,800023f8 <consoleread+0xb4>
    800023a0:	09c4a703          	lw	a4,156(s1)
    800023a4:	0984a783          	lw	a5,152(s1)
    800023a8:	0007071b          	sext.w	a4,a4
    800023ac:	08e78463          	beq	a5,a4,80002434 <consoleread+0xf0>
    800023b0:	07f7f713          	andi	a4,a5,127
    800023b4:	00e48733          	add	a4,s1,a4
    800023b8:	01874703          	lbu	a4,24(a4) # c201018 <_entry-0x73dfefe8>
    800023bc:	0017869b          	addiw	a3,a5,1
    800023c0:	08d4ac23          	sw	a3,152(s1)
    800023c4:	00070c9b          	sext.w	s9,a4
    800023c8:	0b370663          	beq	a4,s3,80002474 <consoleread+0x130>
    800023cc:	00100693          	li	a3,1
    800023d0:	f9f40613          	addi	a2,s0,-97
    800023d4:	000c0593          	mv	a1,s8
    800023d8:	00090513          	mv	a0,s2
    800023dc:	f8e40fa3          	sb	a4,-97(s0)
    800023e0:	00000097          	auipc	ra,0x0
    800023e4:	8bc080e7          	jalr	-1860(ra) # 80001c9c <either_copyout>
    800023e8:	01450863          	beq	a0,s4,800023f8 <consoleread+0xb4>
    800023ec:	001c0c13          	addi	s8,s8,1
    800023f0:	fffb8b9b          	addiw	s7,s7,-1
    800023f4:	fb5c94e3          	bne	s9,s5,8000239c <consoleread+0x58>
    800023f8:	000b851b          	sext.w	a0,s7
    800023fc:	06813083          	ld	ra,104(sp)
    80002400:	06013403          	ld	s0,96(sp)
    80002404:	05813483          	ld	s1,88(sp)
    80002408:	05013903          	ld	s2,80(sp)
    8000240c:	04813983          	ld	s3,72(sp)
    80002410:	04013a03          	ld	s4,64(sp)
    80002414:	03813a83          	ld	s5,56(sp)
    80002418:	02813b83          	ld	s7,40(sp)
    8000241c:	02013c03          	ld	s8,32(sp)
    80002420:	01813c83          	ld	s9,24(sp)
    80002424:	40ab053b          	subw	a0,s6,a0
    80002428:	03013b03          	ld	s6,48(sp)
    8000242c:	07010113          	addi	sp,sp,112
    80002430:	00008067          	ret
    80002434:	00001097          	auipc	ra,0x1
    80002438:	1d8080e7          	jalr	472(ra) # 8000360c <push_on>
    8000243c:	0984a703          	lw	a4,152(s1)
    80002440:	09c4a783          	lw	a5,156(s1)
    80002444:	0007879b          	sext.w	a5,a5
    80002448:	fef70ce3          	beq	a4,a5,80002440 <consoleread+0xfc>
    8000244c:	00001097          	auipc	ra,0x1
    80002450:	234080e7          	jalr	564(ra) # 80003680 <pop_on>
    80002454:	0984a783          	lw	a5,152(s1)
    80002458:	07f7f713          	andi	a4,a5,127
    8000245c:	00e48733          	add	a4,s1,a4
    80002460:	01874703          	lbu	a4,24(a4)
    80002464:	0017869b          	addiw	a3,a5,1
    80002468:	08d4ac23          	sw	a3,152(s1)
    8000246c:	00070c9b          	sext.w	s9,a4
    80002470:	f5371ee3          	bne	a4,s3,800023cc <consoleread+0x88>
    80002474:	000b851b          	sext.w	a0,s7
    80002478:	f96bf2e3          	bgeu	s7,s6,800023fc <consoleread+0xb8>
    8000247c:	08f4ac23          	sw	a5,152(s1)
    80002480:	f7dff06f          	j	800023fc <consoleread+0xb8>

0000000080002484 <consputc>:
    80002484:	10000793          	li	a5,256
    80002488:	00f50663          	beq	a0,a5,80002494 <consputc+0x10>
    8000248c:	00001317          	auipc	t1,0x1
    80002490:	9f430067          	jr	-1548(t1) # 80002e80 <uartputc_sync>
    80002494:	ff010113          	addi	sp,sp,-16
    80002498:	00113423          	sd	ra,8(sp)
    8000249c:	00813023          	sd	s0,0(sp)
    800024a0:	01010413          	addi	s0,sp,16
    800024a4:	00800513          	li	a0,8
    800024a8:	00001097          	auipc	ra,0x1
    800024ac:	9d8080e7          	jalr	-1576(ra) # 80002e80 <uartputc_sync>
    800024b0:	02000513          	li	a0,32
    800024b4:	00001097          	auipc	ra,0x1
    800024b8:	9cc080e7          	jalr	-1588(ra) # 80002e80 <uartputc_sync>
    800024bc:	00013403          	ld	s0,0(sp)
    800024c0:	00813083          	ld	ra,8(sp)
    800024c4:	00800513          	li	a0,8
    800024c8:	01010113          	addi	sp,sp,16
    800024cc:	00001317          	auipc	t1,0x1
    800024d0:	9b430067          	jr	-1612(t1) # 80002e80 <uartputc_sync>

00000000800024d4 <consoleintr>:
    800024d4:	fe010113          	addi	sp,sp,-32
    800024d8:	00813823          	sd	s0,16(sp)
    800024dc:	00913423          	sd	s1,8(sp)
    800024e0:	01213023          	sd	s2,0(sp)
    800024e4:	00113c23          	sd	ra,24(sp)
    800024e8:	02010413          	addi	s0,sp,32
    800024ec:	00003917          	auipc	s2,0x3
    800024f0:	1bc90913          	addi	s2,s2,444 # 800056a8 <cons>
    800024f4:	00050493          	mv	s1,a0
    800024f8:	00090513          	mv	a0,s2
    800024fc:	00001097          	auipc	ra,0x1
    80002500:	e40080e7          	jalr	-448(ra) # 8000333c <acquire>
    80002504:	02048c63          	beqz	s1,8000253c <consoleintr+0x68>
    80002508:	0a092783          	lw	a5,160(s2)
    8000250c:	09892703          	lw	a4,152(s2)
    80002510:	07f00693          	li	a3,127
    80002514:	40e7873b          	subw	a4,a5,a4
    80002518:	02e6e263          	bltu	a3,a4,8000253c <consoleintr+0x68>
    8000251c:	00d00713          	li	a4,13
    80002520:	04e48063          	beq	s1,a4,80002560 <consoleintr+0x8c>
    80002524:	07f7f713          	andi	a4,a5,127
    80002528:	00e90733          	add	a4,s2,a4
    8000252c:	0017879b          	addiw	a5,a5,1
    80002530:	0af92023          	sw	a5,160(s2)
    80002534:	00970c23          	sb	s1,24(a4)
    80002538:	08f92e23          	sw	a5,156(s2)
    8000253c:	01013403          	ld	s0,16(sp)
    80002540:	01813083          	ld	ra,24(sp)
    80002544:	00813483          	ld	s1,8(sp)
    80002548:	00013903          	ld	s2,0(sp)
    8000254c:	00003517          	auipc	a0,0x3
    80002550:	15c50513          	addi	a0,a0,348 # 800056a8 <cons>
    80002554:	02010113          	addi	sp,sp,32
    80002558:	00001317          	auipc	t1,0x1
    8000255c:	eb030067          	jr	-336(t1) # 80003408 <release>
    80002560:	00a00493          	li	s1,10
    80002564:	fc1ff06f          	j	80002524 <consoleintr+0x50>

0000000080002568 <consoleinit>:
    80002568:	fe010113          	addi	sp,sp,-32
    8000256c:	00113c23          	sd	ra,24(sp)
    80002570:	00813823          	sd	s0,16(sp)
    80002574:	00913423          	sd	s1,8(sp)
    80002578:	02010413          	addi	s0,sp,32
    8000257c:	00003497          	auipc	s1,0x3
    80002580:	12c48493          	addi	s1,s1,300 # 800056a8 <cons>
    80002584:	00048513          	mv	a0,s1
    80002588:	00002597          	auipc	a1,0x2
    8000258c:	c3858593          	addi	a1,a1,-968 # 800041c0 <CONSOLE_STATUS+0x1b0>
    80002590:	00001097          	auipc	ra,0x1
    80002594:	d88080e7          	jalr	-632(ra) # 80003318 <initlock>
    80002598:	00000097          	auipc	ra,0x0
    8000259c:	7ac080e7          	jalr	1964(ra) # 80002d44 <uartinit>
    800025a0:	01813083          	ld	ra,24(sp)
    800025a4:	01013403          	ld	s0,16(sp)
    800025a8:	00000797          	auipc	a5,0x0
    800025ac:	d9c78793          	addi	a5,a5,-612 # 80002344 <consoleread>
    800025b0:	0af4bc23          	sd	a5,184(s1)
    800025b4:	00000797          	auipc	a5,0x0
    800025b8:	cec78793          	addi	a5,a5,-788 # 800022a0 <consolewrite>
    800025bc:	0cf4b023          	sd	a5,192(s1)
    800025c0:	00813483          	ld	s1,8(sp)
    800025c4:	02010113          	addi	sp,sp,32
    800025c8:	00008067          	ret

00000000800025cc <console_read>:
    800025cc:	ff010113          	addi	sp,sp,-16
    800025d0:	00813423          	sd	s0,8(sp)
    800025d4:	01010413          	addi	s0,sp,16
    800025d8:	00813403          	ld	s0,8(sp)
    800025dc:	00003317          	auipc	t1,0x3
    800025e0:	18433303          	ld	t1,388(t1) # 80005760 <devsw+0x10>
    800025e4:	01010113          	addi	sp,sp,16
    800025e8:	00030067          	jr	t1

00000000800025ec <console_write>:
    800025ec:	ff010113          	addi	sp,sp,-16
    800025f0:	00813423          	sd	s0,8(sp)
    800025f4:	01010413          	addi	s0,sp,16
    800025f8:	00813403          	ld	s0,8(sp)
    800025fc:	00003317          	auipc	t1,0x3
    80002600:	16c33303          	ld	t1,364(t1) # 80005768 <devsw+0x18>
    80002604:	01010113          	addi	sp,sp,16
    80002608:	00030067          	jr	t1

000000008000260c <panic>:
    8000260c:	fe010113          	addi	sp,sp,-32
    80002610:	00113c23          	sd	ra,24(sp)
    80002614:	00813823          	sd	s0,16(sp)
    80002618:	00913423          	sd	s1,8(sp)
    8000261c:	02010413          	addi	s0,sp,32
    80002620:	00050493          	mv	s1,a0
    80002624:	00002517          	auipc	a0,0x2
    80002628:	ba450513          	addi	a0,a0,-1116 # 800041c8 <CONSOLE_STATUS+0x1b8>
    8000262c:	00003797          	auipc	a5,0x3
    80002630:	1c07ae23          	sw	zero,476(a5) # 80005808 <pr+0x18>
    80002634:	00000097          	auipc	ra,0x0
    80002638:	034080e7          	jalr	52(ra) # 80002668 <__printf>
    8000263c:	00048513          	mv	a0,s1
    80002640:	00000097          	auipc	ra,0x0
    80002644:	028080e7          	jalr	40(ra) # 80002668 <__printf>
    80002648:	00002517          	auipc	a0,0x2
    8000264c:	b6050513          	addi	a0,a0,-1184 # 800041a8 <CONSOLE_STATUS+0x198>
    80002650:	00000097          	auipc	ra,0x0
    80002654:	018080e7          	jalr	24(ra) # 80002668 <__printf>
    80002658:	00100793          	li	a5,1
    8000265c:	00002717          	auipc	a4,0x2
    80002660:	f2f72e23          	sw	a5,-196(a4) # 80004598 <panicked>
    80002664:	0000006f          	j	80002664 <panic+0x58>

0000000080002668 <__printf>:
    80002668:	f3010113          	addi	sp,sp,-208
    8000266c:	08813023          	sd	s0,128(sp)
    80002670:	07313423          	sd	s3,104(sp)
    80002674:	09010413          	addi	s0,sp,144
    80002678:	05813023          	sd	s8,64(sp)
    8000267c:	08113423          	sd	ra,136(sp)
    80002680:	06913c23          	sd	s1,120(sp)
    80002684:	07213823          	sd	s2,112(sp)
    80002688:	07413023          	sd	s4,96(sp)
    8000268c:	05513c23          	sd	s5,88(sp)
    80002690:	05613823          	sd	s6,80(sp)
    80002694:	05713423          	sd	s7,72(sp)
    80002698:	03913c23          	sd	s9,56(sp)
    8000269c:	03a13823          	sd	s10,48(sp)
    800026a0:	03b13423          	sd	s11,40(sp)
    800026a4:	00003317          	auipc	t1,0x3
    800026a8:	14c30313          	addi	t1,t1,332 # 800057f0 <pr>
    800026ac:	01832c03          	lw	s8,24(t1)
    800026b0:	00b43423          	sd	a1,8(s0)
    800026b4:	00c43823          	sd	a2,16(s0)
    800026b8:	00d43c23          	sd	a3,24(s0)
    800026bc:	02e43023          	sd	a4,32(s0)
    800026c0:	02f43423          	sd	a5,40(s0)
    800026c4:	03043823          	sd	a6,48(s0)
    800026c8:	03143c23          	sd	a7,56(s0)
    800026cc:	00050993          	mv	s3,a0
    800026d0:	4a0c1663          	bnez	s8,80002b7c <__printf+0x514>
    800026d4:	60098c63          	beqz	s3,80002cec <__printf+0x684>
    800026d8:	0009c503          	lbu	a0,0(s3)
    800026dc:	00840793          	addi	a5,s0,8
    800026e0:	f6f43c23          	sd	a5,-136(s0)
    800026e4:	00000493          	li	s1,0
    800026e8:	22050063          	beqz	a0,80002908 <__printf+0x2a0>
    800026ec:	00002a37          	lui	s4,0x2
    800026f0:	00018ab7          	lui	s5,0x18
    800026f4:	000f4b37          	lui	s6,0xf4
    800026f8:	00989bb7          	lui	s7,0x989
    800026fc:	70fa0a13          	addi	s4,s4,1807 # 270f <_entry-0x7fffd8f1>
    80002700:	69fa8a93          	addi	s5,s5,1695 # 1869f <_entry-0x7ffe7961>
    80002704:	23fb0b13          	addi	s6,s6,575 # f423f <_entry-0x7ff0bdc1>
    80002708:	67fb8b93          	addi	s7,s7,1663 # 98967f <_entry-0x7f676981>
    8000270c:	00148c9b          	addiw	s9,s1,1
    80002710:	02500793          	li	a5,37
    80002714:	01998933          	add	s2,s3,s9
    80002718:	38f51263          	bne	a0,a5,80002a9c <__printf+0x434>
    8000271c:	00094783          	lbu	a5,0(s2)
    80002720:	00078c9b          	sext.w	s9,a5
    80002724:	1e078263          	beqz	a5,80002908 <__printf+0x2a0>
    80002728:	0024849b          	addiw	s1,s1,2
    8000272c:	07000713          	li	a4,112
    80002730:	00998933          	add	s2,s3,s1
    80002734:	38e78a63          	beq	a5,a4,80002ac8 <__printf+0x460>
    80002738:	20f76863          	bltu	a4,a5,80002948 <__printf+0x2e0>
    8000273c:	42a78863          	beq	a5,a0,80002b6c <__printf+0x504>
    80002740:	06400713          	li	a4,100
    80002744:	40e79663          	bne	a5,a4,80002b50 <__printf+0x4e8>
    80002748:	f7843783          	ld	a5,-136(s0)
    8000274c:	0007a603          	lw	a2,0(a5)
    80002750:	00878793          	addi	a5,a5,8
    80002754:	f6f43c23          	sd	a5,-136(s0)
    80002758:	42064a63          	bltz	a2,80002b8c <__printf+0x524>
    8000275c:	00a00713          	li	a4,10
    80002760:	02e677bb          	remuw	a5,a2,a4
    80002764:	00002d97          	auipc	s11,0x2
    80002768:	a8cd8d93          	addi	s11,s11,-1396 # 800041f0 <digits>
    8000276c:	00900593          	li	a1,9
    80002770:	0006051b          	sext.w	a0,a2
    80002774:	00000c93          	li	s9,0
    80002778:	02079793          	slli	a5,a5,0x20
    8000277c:	0207d793          	srli	a5,a5,0x20
    80002780:	00fd87b3          	add	a5,s11,a5
    80002784:	0007c783          	lbu	a5,0(a5)
    80002788:	02e656bb          	divuw	a3,a2,a4
    8000278c:	f8f40023          	sb	a5,-128(s0)
    80002790:	14c5d863          	bge	a1,a2,800028e0 <__printf+0x278>
    80002794:	06300593          	li	a1,99
    80002798:	00100c93          	li	s9,1
    8000279c:	02e6f7bb          	remuw	a5,a3,a4
    800027a0:	02079793          	slli	a5,a5,0x20
    800027a4:	0207d793          	srli	a5,a5,0x20
    800027a8:	00fd87b3          	add	a5,s11,a5
    800027ac:	0007c783          	lbu	a5,0(a5)
    800027b0:	02e6d73b          	divuw	a4,a3,a4
    800027b4:	f8f400a3          	sb	a5,-127(s0)
    800027b8:	12a5f463          	bgeu	a1,a0,800028e0 <__printf+0x278>
    800027bc:	00a00693          	li	a3,10
    800027c0:	00900593          	li	a1,9
    800027c4:	02d777bb          	remuw	a5,a4,a3
    800027c8:	02079793          	slli	a5,a5,0x20
    800027cc:	0207d793          	srli	a5,a5,0x20
    800027d0:	00fd87b3          	add	a5,s11,a5
    800027d4:	0007c503          	lbu	a0,0(a5)
    800027d8:	02d757bb          	divuw	a5,a4,a3
    800027dc:	f8a40123          	sb	a0,-126(s0)
    800027e0:	48e5f263          	bgeu	a1,a4,80002c64 <__printf+0x5fc>
    800027e4:	06300513          	li	a0,99
    800027e8:	02d7f5bb          	remuw	a1,a5,a3
    800027ec:	02059593          	slli	a1,a1,0x20
    800027f0:	0205d593          	srli	a1,a1,0x20
    800027f4:	00bd85b3          	add	a1,s11,a1
    800027f8:	0005c583          	lbu	a1,0(a1)
    800027fc:	02d7d7bb          	divuw	a5,a5,a3
    80002800:	f8b401a3          	sb	a1,-125(s0)
    80002804:	48e57263          	bgeu	a0,a4,80002c88 <__printf+0x620>
    80002808:	3e700513          	li	a0,999
    8000280c:	02d7f5bb          	remuw	a1,a5,a3
    80002810:	02059593          	slli	a1,a1,0x20
    80002814:	0205d593          	srli	a1,a1,0x20
    80002818:	00bd85b3          	add	a1,s11,a1
    8000281c:	0005c583          	lbu	a1,0(a1)
    80002820:	02d7d7bb          	divuw	a5,a5,a3
    80002824:	f8b40223          	sb	a1,-124(s0)
    80002828:	46e57663          	bgeu	a0,a4,80002c94 <__printf+0x62c>
    8000282c:	02d7f5bb          	remuw	a1,a5,a3
    80002830:	02059593          	slli	a1,a1,0x20
    80002834:	0205d593          	srli	a1,a1,0x20
    80002838:	00bd85b3          	add	a1,s11,a1
    8000283c:	0005c583          	lbu	a1,0(a1)
    80002840:	02d7d7bb          	divuw	a5,a5,a3
    80002844:	f8b402a3          	sb	a1,-123(s0)
    80002848:	46ea7863          	bgeu	s4,a4,80002cb8 <__printf+0x650>
    8000284c:	02d7f5bb          	remuw	a1,a5,a3
    80002850:	02059593          	slli	a1,a1,0x20
    80002854:	0205d593          	srli	a1,a1,0x20
    80002858:	00bd85b3          	add	a1,s11,a1
    8000285c:	0005c583          	lbu	a1,0(a1)
    80002860:	02d7d7bb          	divuw	a5,a5,a3
    80002864:	f8b40323          	sb	a1,-122(s0)
    80002868:	3eeaf863          	bgeu	s5,a4,80002c58 <__printf+0x5f0>
    8000286c:	02d7f5bb          	remuw	a1,a5,a3
    80002870:	02059593          	slli	a1,a1,0x20
    80002874:	0205d593          	srli	a1,a1,0x20
    80002878:	00bd85b3          	add	a1,s11,a1
    8000287c:	0005c583          	lbu	a1,0(a1)
    80002880:	02d7d7bb          	divuw	a5,a5,a3
    80002884:	f8b403a3          	sb	a1,-121(s0)
    80002888:	42eb7e63          	bgeu	s6,a4,80002cc4 <__printf+0x65c>
    8000288c:	02d7f5bb          	remuw	a1,a5,a3
    80002890:	02059593          	slli	a1,a1,0x20
    80002894:	0205d593          	srli	a1,a1,0x20
    80002898:	00bd85b3          	add	a1,s11,a1
    8000289c:	0005c583          	lbu	a1,0(a1)
    800028a0:	02d7d7bb          	divuw	a5,a5,a3
    800028a4:	f8b40423          	sb	a1,-120(s0)
    800028a8:	42ebfc63          	bgeu	s7,a4,80002ce0 <__printf+0x678>
    800028ac:	02079793          	slli	a5,a5,0x20
    800028b0:	0207d793          	srli	a5,a5,0x20
    800028b4:	00fd8db3          	add	s11,s11,a5
    800028b8:	000dc703          	lbu	a4,0(s11)
    800028bc:	00a00793          	li	a5,10
    800028c0:	00900c93          	li	s9,9
    800028c4:	f8e404a3          	sb	a4,-119(s0)
    800028c8:	00065c63          	bgez	a2,800028e0 <__printf+0x278>
    800028cc:	f9040713          	addi	a4,s0,-112
    800028d0:	00f70733          	add	a4,a4,a5
    800028d4:	02d00693          	li	a3,45
    800028d8:	fed70823          	sb	a3,-16(a4)
    800028dc:	00078c93          	mv	s9,a5
    800028e0:	f8040793          	addi	a5,s0,-128
    800028e4:	01978cb3          	add	s9,a5,s9
    800028e8:	f7f40d13          	addi	s10,s0,-129
    800028ec:	000cc503          	lbu	a0,0(s9)
    800028f0:	fffc8c93          	addi	s9,s9,-1
    800028f4:	00000097          	auipc	ra,0x0
    800028f8:	b90080e7          	jalr	-1136(ra) # 80002484 <consputc>
    800028fc:	ffac98e3          	bne	s9,s10,800028ec <__printf+0x284>
    80002900:	00094503          	lbu	a0,0(s2)
    80002904:	e00514e3          	bnez	a0,8000270c <__printf+0xa4>
    80002908:	1a0c1663          	bnez	s8,80002ab4 <__printf+0x44c>
    8000290c:	08813083          	ld	ra,136(sp)
    80002910:	08013403          	ld	s0,128(sp)
    80002914:	07813483          	ld	s1,120(sp)
    80002918:	07013903          	ld	s2,112(sp)
    8000291c:	06813983          	ld	s3,104(sp)
    80002920:	06013a03          	ld	s4,96(sp)
    80002924:	05813a83          	ld	s5,88(sp)
    80002928:	05013b03          	ld	s6,80(sp)
    8000292c:	04813b83          	ld	s7,72(sp)
    80002930:	04013c03          	ld	s8,64(sp)
    80002934:	03813c83          	ld	s9,56(sp)
    80002938:	03013d03          	ld	s10,48(sp)
    8000293c:	02813d83          	ld	s11,40(sp)
    80002940:	0d010113          	addi	sp,sp,208
    80002944:	00008067          	ret
    80002948:	07300713          	li	a4,115
    8000294c:	1ce78a63          	beq	a5,a4,80002b20 <__printf+0x4b8>
    80002950:	07800713          	li	a4,120
    80002954:	1ee79e63          	bne	a5,a4,80002b50 <__printf+0x4e8>
    80002958:	f7843783          	ld	a5,-136(s0)
    8000295c:	0007a703          	lw	a4,0(a5)
    80002960:	00878793          	addi	a5,a5,8
    80002964:	f6f43c23          	sd	a5,-136(s0)
    80002968:	28074263          	bltz	a4,80002bec <__printf+0x584>
    8000296c:	00002d97          	auipc	s11,0x2
    80002970:	884d8d93          	addi	s11,s11,-1916 # 800041f0 <digits>
    80002974:	00f77793          	andi	a5,a4,15
    80002978:	00fd87b3          	add	a5,s11,a5
    8000297c:	0007c683          	lbu	a3,0(a5)
    80002980:	00f00613          	li	a2,15
    80002984:	0007079b          	sext.w	a5,a4
    80002988:	f8d40023          	sb	a3,-128(s0)
    8000298c:	0047559b          	srliw	a1,a4,0x4
    80002990:	0047569b          	srliw	a3,a4,0x4
    80002994:	00000c93          	li	s9,0
    80002998:	0ee65063          	bge	a2,a4,80002a78 <__printf+0x410>
    8000299c:	00f6f693          	andi	a3,a3,15
    800029a0:	00dd86b3          	add	a3,s11,a3
    800029a4:	0006c683          	lbu	a3,0(a3) # 2004000 <_entry-0x7dffc000>
    800029a8:	0087d79b          	srliw	a5,a5,0x8
    800029ac:	00100c93          	li	s9,1
    800029b0:	f8d400a3          	sb	a3,-127(s0)
    800029b4:	0cb67263          	bgeu	a2,a1,80002a78 <__printf+0x410>
    800029b8:	00f7f693          	andi	a3,a5,15
    800029bc:	00dd86b3          	add	a3,s11,a3
    800029c0:	0006c583          	lbu	a1,0(a3)
    800029c4:	00f00613          	li	a2,15
    800029c8:	0047d69b          	srliw	a3,a5,0x4
    800029cc:	f8b40123          	sb	a1,-126(s0)
    800029d0:	0047d593          	srli	a1,a5,0x4
    800029d4:	28f67e63          	bgeu	a2,a5,80002c70 <__printf+0x608>
    800029d8:	00f6f693          	andi	a3,a3,15
    800029dc:	00dd86b3          	add	a3,s11,a3
    800029e0:	0006c503          	lbu	a0,0(a3)
    800029e4:	0087d813          	srli	a6,a5,0x8
    800029e8:	0087d69b          	srliw	a3,a5,0x8
    800029ec:	f8a401a3          	sb	a0,-125(s0)
    800029f0:	28b67663          	bgeu	a2,a1,80002c7c <__printf+0x614>
    800029f4:	00f6f693          	andi	a3,a3,15
    800029f8:	00dd86b3          	add	a3,s11,a3
    800029fc:	0006c583          	lbu	a1,0(a3)
    80002a00:	00c7d513          	srli	a0,a5,0xc
    80002a04:	00c7d69b          	srliw	a3,a5,0xc
    80002a08:	f8b40223          	sb	a1,-124(s0)
    80002a0c:	29067a63          	bgeu	a2,a6,80002ca0 <__printf+0x638>
    80002a10:	00f6f693          	andi	a3,a3,15
    80002a14:	00dd86b3          	add	a3,s11,a3
    80002a18:	0006c583          	lbu	a1,0(a3)
    80002a1c:	0107d813          	srli	a6,a5,0x10
    80002a20:	0107d69b          	srliw	a3,a5,0x10
    80002a24:	f8b402a3          	sb	a1,-123(s0)
    80002a28:	28a67263          	bgeu	a2,a0,80002cac <__printf+0x644>
    80002a2c:	00f6f693          	andi	a3,a3,15
    80002a30:	00dd86b3          	add	a3,s11,a3
    80002a34:	0006c683          	lbu	a3,0(a3)
    80002a38:	0147d79b          	srliw	a5,a5,0x14
    80002a3c:	f8d40323          	sb	a3,-122(s0)
    80002a40:	21067663          	bgeu	a2,a6,80002c4c <__printf+0x5e4>
    80002a44:	02079793          	slli	a5,a5,0x20
    80002a48:	0207d793          	srli	a5,a5,0x20
    80002a4c:	00fd8db3          	add	s11,s11,a5
    80002a50:	000dc683          	lbu	a3,0(s11)
    80002a54:	00800793          	li	a5,8
    80002a58:	00700c93          	li	s9,7
    80002a5c:	f8d403a3          	sb	a3,-121(s0)
    80002a60:	00075c63          	bgez	a4,80002a78 <__printf+0x410>
    80002a64:	f9040713          	addi	a4,s0,-112
    80002a68:	00f70733          	add	a4,a4,a5
    80002a6c:	02d00693          	li	a3,45
    80002a70:	fed70823          	sb	a3,-16(a4)
    80002a74:	00078c93          	mv	s9,a5
    80002a78:	f8040793          	addi	a5,s0,-128
    80002a7c:	01978cb3          	add	s9,a5,s9
    80002a80:	f7f40d13          	addi	s10,s0,-129
    80002a84:	000cc503          	lbu	a0,0(s9)
    80002a88:	fffc8c93          	addi	s9,s9,-1
    80002a8c:	00000097          	auipc	ra,0x0
    80002a90:	9f8080e7          	jalr	-1544(ra) # 80002484 <consputc>
    80002a94:	ff9d18e3          	bne	s10,s9,80002a84 <__printf+0x41c>
    80002a98:	0100006f          	j	80002aa8 <__printf+0x440>
    80002a9c:	00000097          	auipc	ra,0x0
    80002aa0:	9e8080e7          	jalr	-1560(ra) # 80002484 <consputc>
    80002aa4:	000c8493          	mv	s1,s9
    80002aa8:	00094503          	lbu	a0,0(s2)
    80002aac:	c60510e3          	bnez	a0,8000270c <__printf+0xa4>
    80002ab0:	e40c0ee3          	beqz	s8,8000290c <__printf+0x2a4>
    80002ab4:	00003517          	auipc	a0,0x3
    80002ab8:	d3c50513          	addi	a0,a0,-708 # 800057f0 <pr>
    80002abc:	00001097          	auipc	ra,0x1
    80002ac0:	94c080e7          	jalr	-1716(ra) # 80003408 <release>
    80002ac4:	e49ff06f          	j	8000290c <__printf+0x2a4>
    80002ac8:	f7843783          	ld	a5,-136(s0)
    80002acc:	03000513          	li	a0,48
    80002ad0:	01000d13          	li	s10,16
    80002ad4:	00878713          	addi	a4,a5,8
    80002ad8:	0007bc83          	ld	s9,0(a5)
    80002adc:	f6e43c23          	sd	a4,-136(s0)
    80002ae0:	00000097          	auipc	ra,0x0
    80002ae4:	9a4080e7          	jalr	-1628(ra) # 80002484 <consputc>
    80002ae8:	07800513          	li	a0,120
    80002aec:	00000097          	auipc	ra,0x0
    80002af0:	998080e7          	jalr	-1640(ra) # 80002484 <consputc>
    80002af4:	00001d97          	auipc	s11,0x1
    80002af8:	6fcd8d93          	addi	s11,s11,1788 # 800041f0 <digits>
    80002afc:	03ccd793          	srli	a5,s9,0x3c
    80002b00:	00fd87b3          	add	a5,s11,a5
    80002b04:	0007c503          	lbu	a0,0(a5)
    80002b08:	fffd0d1b          	addiw	s10,s10,-1
    80002b0c:	004c9c93          	slli	s9,s9,0x4
    80002b10:	00000097          	auipc	ra,0x0
    80002b14:	974080e7          	jalr	-1676(ra) # 80002484 <consputc>
    80002b18:	fe0d12e3          	bnez	s10,80002afc <__printf+0x494>
    80002b1c:	f8dff06f          	j	80002aa8 <__printf+0x440>
    80002b20:	f7843783          	ld	a5,-136(s0)
    80002b24:	0007bc83          	ld	s9,0(a5)
    80002b28:	00878793          	addi	a5,a5,8
    80002b2c:	f6f43c23          	sd	a5,-136(s0)
    80002b30:	000c9a63          	bnez	s9,80002b44 <__printf+0x4dc>
    80002b34:	1080006f          	j	80002c3c <__printf+0x5d4>
    80002b38:	001c8c93          	addi	s9,s9,1
    80002b3c:	00000097          	auipc	ra,0x0
    80002b40:	948080e7          	jalr	-1720(ra) # 80002484 <consputc>
    80002b44:	000cc503          	lbu	a0,0(s9)
    80002b48:	fe0518e3          	bnez	a0,80002b38 <__printf+0x4d0>
    80002b4c:	f5dff06f          	j	80002aa8 <__printf+0x440>
    80002b50:	02500513          	li	a0,37
    80002b54:	00000097          	auipc	ra,0x0
    80002b58:	930080e7          	jalr	-1744(ra) # 80002484 <consputc>
    80002b5c:	000c8513          	mv	a0,s9
    80002b60:	00000097          	auipc	ra,0x0
    80002b64:	924080e7          	jalr	-1756(ra) # 80002484 <consputc>
    80002b68:	f41ff06f          	j	80002aa8 <__printf+0x440>
    80002b6c:	02500513          	li	a0,37
    80002b70:	00000097          	auipc	ra,0x0
    80002b74:	914080e7          	jalr	-1772(ra) # 80002484 <consputc>
    80002b78:	f31ff06f          	j	80002aa8 <__printf+0x440>
    80002b7c:	00030513          	mv	a0,t1
    80002b80:	00000097          	auipc	ra,0x0
    80002b84:	7bc080e7          	jalr	1980(ra) # 8000333c <acquire>
    80002b88:	b4dff06f          	j	800026d4 <__printf+0x6c>
    80002b8c:	40c0053b          	negw	a0,a2
    80002b90:	00a00713          	li	a4,10
    80002b94:	02e576bb          	remuw	a3,a0,a4
    80002b98:	00001d97          	auipc	s11,0x1
    80002b9c:	658d8d93          	addi	s11,s11,1624 # 800041f0 <digits>
    80002ba0:	ff700593          	li	a1,-9
    80002ba4:	02069693          	slli	a3,a3,0x20
    80002ba8:	0206d693          	srli	a3,a3,0x20
    80002bac:	00dd86b3          	add	a3,s11,a3
    80002bb0:	0006c683          	lbu	a3,0(a3)
    80002bb4:	02e557bb          	divuw	a5,a0,a4
    80002bb8:	f8d40023          	sb	a3,-128(s0)
    80002bbc:	10b65e63          	bge	a2,a1,80002cd8 <__printf+0x670>
    80002bc0:	06300593          	li	a1,99
    80002bc4:	02e7f6bb          	remuw	a3,a5,a4
    80002bc8:	02069693          	slli	a3,a3,0x20
    80002bcc:	0206d693          	srli	a3,a3,0x20
    80002bd0:	00dd86b3          	add	a3,s11,a3
    80002bd4:	0006c683          	lbu	a3,0(a3)
    80002bd8:	02e7d73b          	divuw	a4,a5,a4
    80002bdc:	00200793          	li	a5,2
    80002be0:	f8d400a3          	sb	a3,-127(s0)
    80002be4:	bca5ece3          	bltu	a1,a0,800027bc <__printf+0x154>
    80002be8:	ce5ff06f          	j	800028cc <__printf+0x264>
    80002bec:	40e007bb          	negw	a5,a4
    80002bf0:	00001d97          	auipc	s11,0x1
    80002bf4:	600d8d93          	addi	s11,s11,1536 # 800041f0 <digits>
    80002bf8:	00f7f693          	andi	a3,a5,15
    80002bfc:	00dd86b3          	add	a3,s11,a3
    80002c00:	0006c583          	lbu	a1,0(a3)
    80002c04:	ff100613          	li	a2,-15
    80002c08:	0047d69b          	srliw	a3,a5,0x4
    80002c0c:	f8b40023          	sb	a1,-128(s0)
    80002c10:	0047d59b          	srliw	a1,a5,0x4
    80002c14:	0ac75e63          	bge	a4,a2,80002cd0 <__printf+0x668>
    80002c18:	00f6f693          	andi	a3,a3,15
    80002c1c:	00dd86b3          	add	a3,s11,a3
    80002c20:	0006c603          	lbu	a2,0(a3)
    80002c24:	00f00693          	li	a3,15
    80002c28:	0087d79b          	srliw	a5,a5,0x8
    80002c2c:	f8c400a3          	sb	a2,-127(s0)
    80002c30:	d8b6e4e3          	bltu	a3,a1,800029b8 <__printf+0x350>
    80002c34:	00200793          	li	a5,2
    80002c38:	e2dff06f          	j	80002a64 <__printf+0x3fc>
    80002c3c:	00001c97          	auipc	s9,0x1
    80002c40:	594c8c93          	addi	s9,s9,1428 # 800041d0 <CONSOLE_STATUS+0x1c0>
    80002c44:	02800513          	li	a0,40
    80002c48:	ef1ff06f          	j	80002b38 <__printf+0x4d0>
    80002c4c:	00700793          	li	a5,7
    80002c50:	00600c93          	li	s9,6
    80002c54:	e0dff06f          	j	80002a60 <__printf+0x3f8>
    80002c58:	00700793          	li	a5,7
    80002c5c:	00600c93          	li	s9,6
    80002c60:	c69ff06f          	j	800028c8 <__printf+0x260>
    80002c64:	00300793          	li	a5,3
    80002c68:	00200c93          	li	s9,2
    80002c6c:	c5dff06f          	j	800028c8 <__printf+0x260>
    80002c70:	00300793          	li	a5,3
    80002c74:	00200c93          	li	s9,2
    80002c78:	de9ff06f          	j	80002a60 <__printf+0x3f8>
    80002c7c:	00400793          	li	a5,4
    80002c80:	00300c93          	li	s9,3
    80002c84:	dddff06f          	j	80002a60 <__printf+0x3f8>
    80002c88:	00400793          	li	a5,4
    80002c8c:	00300c93          	li	s9,3
    80002c90:	c39ff06f          	j	800028c8 <__printf+0x260>
    80002c94:	00500793          	li	a5,5
    80002c98:	00400c93          	li	s9,4
    80002c9c:	c2dff06f          	j	800028c8 <__printf+0x260>
    80002ca0:	00500793          	li	a5,5
    80002ca4:	00400c93          	li	s9,4
    80002ca8:	db9ff06f          	j	80002a60 <__printf+0x3f8>
    80002cac:	00600793          	li	a5,6
    80002cb0:	00500c93          	li	s9,5
    80002cb4:	dadff06f          	j	80002a60 <__printf+0x3f8>
    80002cb8:	00600793          	li	a5,6
    80002cbc:	00500c93          	li	s9,5
    80002cc0:	c09ff06f          	j	800028c8 <__printf+0x260>
    80002cc4:	00800793          	li	a5,8
    80002cc8:	00700c93          	li	s9,7
    80002ccc:	bfdff06f          	j	800028c8 <__printf+0x260>
    80002cd0:	00100793          	li	a5,1
    80002cd4:	d91ff06f          	j	80002a64 <__printf+0x3fc>
    80002cd8:	00100793          	li	a5,1
    80002cdc:	bf1ff06f          	j	800028cc <__printf+0x264>
    80002ce0:	00900793          	li	a5,9
    80002ce4:	00800c93          	li	s9,8
    80002ce8:	be1ff06f          	j	800028c8 <__printf+0x260>
    80002cec:	00001517          	auipc	a0,0x1
    80002cf0:	4ec50513          	addi	a0,a0,1260 # 800041d8 <CONSOLE_STATUS+0x1c8>
    80002cf4:	00000097          	auipc	ra,0x0
    80002cf8:	918080e7          	jalr	-1768(ra) # 8000260c <panic>

0000000080002cfc <printfinit>:
    80002cfc:	fe010113          	addi	sp,sp,-32
    80002d00:	00813823          	sd	s0,16(sp)
    80002d04:	00913423          	sd	s1,8(sp)
    80002d08:	00113c23          	sd	ra,24(sp)
    80002d0c:	02010413          	addi	s0,sp,32
    80002d10:	00003497          	auipc	s1,0x3
    80002d14:	ae048493          	addi	s1,s1,-1312 # 800057f0 <pr>
    80002d18:	00048513          	mv	a0,s1
    80002d1c:	00001597          	auipc	a1,0x1
    80002d20:	4cc58593          	addi	a1,a1,1228 # 800041e8 <CONSOLE_STATUS+0x1d8>
    80002d24:	00000097          	auipc	ra,0x0
    80002d28:	5f4080e7          	jalr	1524(ra) # 80003318 <initlock>
    80002d2c:	01813083          	ld	ra,24(sp)
    80002d30:	01013403          	ld	s0,16(sp)
    80002d34:	0004ac23          	sw	zero,24(s1)
    80002d38:	00813483          	ld	s1,8(sp)
    80002d3c:	02010113          	addi	sp,sp,32
    80002d40:	00008067          	ret

0000000080002d44 <uartinit>:
    80002d44:	ff010113          	addi	sp,sp,-16
    80002d48:	00813423          	sd	s0,8(sp)
    80002d4c:	01010413          	addi	s0,sp,16
    80002d50:	100007b7          	lui	a5,0x10000
    80002d54:	000780a3          	sb	zero,1(a5) # 10000001 <_entry-0x6fffffff>
    80002d58:	f8000713          	li	a4,-128
    80002d5c:	00e781a3          	sb	a4,3(a5)
    80002d60:	00300713          	li	a4,3
    80002d64:	00e78023          	sb	a4,0(a5)
    80002d68:	000780a3          	sb	zero,1(a5)
    80002d6c:	00e781a3          	sb	a4,3(a5)
    80002d70:	00700693          	li	a3,7
    80002d74:	00d78123          	sb	a3,2(a5)
    80002d78:	00e780a3          	sb	a4,1(a5)
    80002d7c:	00813403          	ld	s0,8(sp)
    80002d80:	01010113          	addi	sp,sp,16
    80002d84:	00008067          	ret

0000000080002d88 <uartputc>:
    80002d88:	00002797          	auipc	a5,0x2
    80002d8c:	8107a783          	lw	a5,-2032(a5) # 80004598 <panicked>
    80002d90:	00078463          	beqz	a5,80002d98 <uartputc+0x10>
    80002d94:	0000006f          	j	80002d94 <uartputc+0xc>
    80002d98:	fd010113          	addi	sp,sp,-48
    80002d9c:	02813023          	sd	s0,32(sp)
    80002da0:	00913c23          	sd	s1,24(sp)
    80002da4:	01213823          	sd	s2,16(sp)
    80002da8:	01313423          	sd	s3,8(sp)
    80002dac:	02113423          	sd	ra,40(sp)
    80002db0:	03010413          	addi	s0,sp,48
    80002db4:	00001917          	auipc	s2,0x1
    80002db8:	7ec90913          	addi	s2,s2,2028 # 800045a0 <uart_tx_r>
    80002dbc:	00093783          	ld	a5,0(s2)
    80002dc0:	00001497          	auipc	s1,0x1
    80002dc4:	7e848493          	addi	s1,s1,2024 # 800045a8 <uart_tx_w>
    80002dc8:	0004b703          	ld	a4,0(s1)
    80002dcc:	02078693          	addi	a3,a5,32
    80002dd0:	00050993          	mv	s3,a0
    80002dd4:	02e69c63          	bne	a3,a4,80002e0c <uartputc+0x84>
    80002dd8:	00001097          	auipc	ra,0x1
    80002ddc:	834080e7          	jalr	-1996(ra) # 8000360c <push_on>
    80002de0:	00093783          	ld	a5,0(s2)
    80002de4:	0004b703          	ld	a4,0(s1)
    80002de8:	02078793          	addi	a5,a5,32
    80002dec:	00e79463          	bne	a5,a4,80002df4 <uartputc+0x6c>
    80002df0:	0000006f          	j	80002df0 <uartputc+0x68>
    80002df4:	00001097          	auipc	ra,0x1
    80002df8:	88c080e7          	jalr	-1908(ra) # 80003680 <pop_on>
    80002dfc:	00093783          	ld	a5,0(s2)
    80002e00:	0004b703          	ld	a4,0(s1)
    80002e04:	02078693          	addi	a3,a5,32
    80002e08:	fce688e3          	beq	a3,a4,80002dd8 <uartputc+0x50>
    80002e0c:	01f77693          	andi	a3,a4,31
    80002e10:	00003597          	auipc	a1,0x3
    80002e14:	a0058593          	addi	a1,a1,-1536 # 80005810 <uart_tx_buf>
    80002e18:	00d586b3          	add	a3,a1,a3
    80002e1c:	00170713          	addi	a4,a4,1
    80002e20:	01368023          	sb	s3,0(a3)
    80002e24:	00e4b023          	sd	a4,0(s1)
    80002e28:	10000637          	lui	a2,0x10000
    80002e2c:	02f71063          	bne	a4,a5,80002e4c <uartputc+0xc4>
    80002e30:	0340006f          	j	80002e64 <uartputc+0xdc>
    80002e34:	00074703          	lbu	a4,0(a4)
    80002e38:	00f93023          	sd	a5,0(s2)
    80002e3c:	00e60023          	sb	a4,0(a2) # 10000000 <_entry-0x70000000>
    80002e40:	00093783          	ld	a5,0(s2)
    80002e44:	0004b703          	ld	a4,0(s1)
    80002e48:	00f70e63          	beq	a4,a5,80002e64 <uartputc+0xdc>
    80002e4c:	00564683          	lbu	a3,5(a2)
    80002e50:	01f7f713          	andi	a4,a5,31
    80002e54:	00e58733          	add	a4,a1,a4
    80002e58:	0206f693          	andi	a3,a3,32
    80002e5c:	00178793          	addi	a5,a5,1
    80002e60:	fc069ae3          	bnez	a3,80002e34 <uartputc+0xac>
    80002e64:	02813083          	ld	ra,40(sp)
    80002e68:	02013403          	ld	s0,32(sp)
    80002e6c:	01813483          	ld	s1,24(sp)
    80002e70:	01013903          	ld	s2,16(sp)
    80002e74:	00813983          	ld	s3,8(sp)
    80002e78:	03010113          	addi	sp,sp,48
    80002e7c:	00008067          	ret

0000000080002e80 <uartputc_sync>:
    80002e80:	ff010113          	addi	sp,sp,-16
    80002e84:	00813423          	sd	s0,8(sp)
    80002e88:	01010413          	addi	s0,sp,16
    80002e8c:	00001717          	auipc	a4,0x1
    80002e90:	70c72703          	lw	a4,1804(a4) # 80004598 <panicked>
    80002e94:	02071663          	bnez	a4,80002ec0 <uartputc_sync+0x40>
    80002e98:	00050793          	mv	a5,a0
    80002e9c:	100006b7          	lui	a3,0x10000
    80002ea0:	0056c703          	lbu	a4,5(a3) # 10000005 <_entry-0x6ffffffb>
    80002ea4:	02077713          	andi	a4,a4,32
    80002ea8:	fe070ce3          	beqz	a4,80002ea0 <uartputc_sync+0x20>
    80002eac:	0ff7f793          	andi	a5,a5,255
    80002eb0:	00f68023          	sb	a5,0(a3)
    80002eb4:	00813403          	ld	s0,8(sp)
    80002eb8:	01010113          	addi	sp,sp,16
    80002ebc:	00008067          	ret
    80002ec0:	0000006f          	j	80002ec0 <uartputc_sync+0x40>

0000000080002ec4 <uartstart>:
    80002ec4:	ff010113          	addi	sp,sp,-16
    80002ec8:	00813423          	sd	s0,8(sp)
    80002ecc:	01010413          	addi	s0,sp,16
    80002ed0:	00001617          	auipc	a2,0x1
    80002ed4:	6d060613          	addi	a2,a2,1744 # 800045a0 <uart_tx_r>
    80002ed8:	00001517          	auipc	a0,0x1
    80002edc:	6d050513          	addi	a0,a0,1744 # 800045a8 <uart_tx_w>
    80002ee0:	00063783          	ld	a5,0(a2)
    80002ee4:	00053703          	ld	a4,0(a0)
    80002ee8:	04f70263          	beq	a4,a5,80002f2c <uartstart+0x68>
    80002eec:	100005b7          	lui	a1,0x10000
    80002ef0:	00003817          	auipc	a6,0x3
    80002ef4:	92080813          	addi	a6,a6,-1760 # 80005810 <uart_tx_buf>
    80002ef8:	01c0006f          	j	80002f14 <uartstart+0x50>
    80002efc:	0006c703          	lbu	a4,0(a3)
    80002f00:	00f63023          	sd	a5,0(a2)
    80002f04:	00e58023          	sb	a4,0(a1) # 10000000 <_entry-0x70000000>
    80002f08:	00063783          	ld	a5,0(a2)
    80002f0c:	00053703          	ld	a4,0(a0)
    80002f10:	00f70e63          	beq	a4,a5,80002f2c <uartstart+0x68>
    80002f14:	01f7f713          	andi	a4,a5,31
    80002f18:	00e806b3          	add	a3,a6,a4
    80002f1c:	0055c703          	lbu	a4,5(a1)
    80002f20:	00178793          	addi	a5,a5,1
    80002f24:	02077713          	andi	a4,a4,32
    80002f28:	fc071ae3          	bnez	a4,80002efc <uartstart+0x38>
    80002f2c:	00813403          	ld	s0,8(sp)
    80002f30:	01010113          	addi	sp,sp,16
    80002f34:	00008067          	ret

0000000080002f38 <uartgetc>:
    80002f38:	ff010113          	addi	sp,sp,-16
    80002f3c:	00813423          	sd	s0,8(sp)
    80002f40:	01010413          	addi	s0,sp,16
    80002f44:	10000737          	lui	a4,0x10000
    80002f48:	00574783          	lbu	a5,5(a4) # 10000005 <_entry-0x6ffffffb>
    80002f4c:	0017f793          	andi	a5,a5,1
    80002f50:	00078c63          	beqz	a5,80002f68 <uartgetc+0x30>
    80002f54:	00074503          	lbu	a0,0(a4)
    80002f58:	0ff57513          	andi	a0,a0,255
    80002f5c:	00813403          	ld	s0,8(sp)
    80002f60:	01010113          	addi	sp,sp,16
    80002f64:	00008067          	ret
    80002f68:	fff00513          	li	a0,-1
    80002f6c:	ff1ff06f          	j	80002f5c <uartgetc+0x24>

0000000080002f70 <uartintr>:
    80002f70:	100007b7          	lui	a5,0x10000
    80002f74:	0057c783          	lbu	a5,5(a5) # 10000005 <_entry-0x6ffffffb>
    80002f78:	0017f793          	andi	a5,a5,1
    80002f7c:	0a078463          	beqz	a5,80003024 <uartintr+0xb4>
    80002f80:	fe010113          	addi	sp,sp,-32
    80002f84:	00813823          	sd	s0,16(sp)
    80002f88:	00913423          	sd	s1,8(sp)
    80002f8c:	00113c23          	sd	ra,24(sp)
    80002f90:	02010413          	addi	s0,sp,32
    80002f94:	100004b7          	lui	s1,0x10000
    80002f98:	0004c503          	lbu	a0,0(s1) # 10000000 <_entry-0x70000000>
    80002f9c:	0ff57513          	andi	a0,a0,255
    80002fa0:	fffff097          	auipc	ra,0xfffff
    80002fa4:	534080e7          	jalr	1332(ra) # 800024d4 <consoleintr>
    80002fa8:	0054c783          	lbu	a5,5(s1)
    80002fac:	0017f793          	andi	a5,a5,1
    80002fb0:	fe0794e3          	bnez	a5,80002f98 <uartintr+0x28>
    80002fb4:	00001617          	auipc	a2,0x1
    80002fb8:	5ec60613          	addi	a2,a2,1516 # 800045a0 <uart_tx_r>
    80002fbc:	00001517          	auipc	a0,0x1
    80002fc0:	5ec50513          	addi	a0,a0,1516 # 800045a8 <uart_tx_w>
    80002fc4:	00063783          	ld	a5,0(a2)
    80002fc8:	00053703          	ld	a4,0(a0)
    80002fcc:	04f70263          	beq	a4,a5,80003010 <uartintr+0xa0>
    80002fd0:	100005b7          	lui	a1,0x10000
    80002fd4:	00003817          	auipc	a6,0x3
    80002fd8:	83c80813          	addi	a6,a6,-1988 # 80005810 <uart_tx_buf>
    80002fdc:	01c0006f          	j	80002ff8 <uartintr+0x88>
    80002fe0:	0006c703          	lbu	a4,0(a3)
    80002fe4:	00f63023          	sd	a5,0(a2)
    80002fe8:	00e58023          	sb	a4,0(a1) # 10000000 <_entry-0x70000000>
    80002fec:	00063783          	ld	a5,0(a2)
    80002ff0:	00053703          	ld	a4,0(a0)
    80002ff4:	00f70e63          	beq	a4,a5,80003010 <uartintr+0xa0>
    80002ff8:	01f7f713          	andi	a4,a5,31
    80002ffc:	00e806b3          	add	a3,a6,a4
    80003000:	0055c703          	lbu	a4,5(a1)
    80003004:	00178793          	addi	a5,a5,1
    80003008:	02077713          	andi	a4,a4,32
    8000300c:	fc071ae3          	bnez	a4,80002fe0 <uartintr+0x70>
    80003010:	01813083          	ld	ra,24(sp)
    80003014:	01013403          	ld	s0,16(sp)
    80003018:	00813483          	ld	s1,8(sp)
    8000301c:	02010113          	addi	sp,sp,32
    80003020:	00008067          	ret
    80003024:	00001617          	auipc	a2,0x1
    80003028:	57c60613          	addi	a2,a2,1404 # 800045a0 <uart_tx_r>
    8000302c:	00001517          	auipc	a0,0x1
    80003030:	57c50513          	addi	a0,a0,1404 # 800045a8 <uart_tx_w>
    80003034:	00063783          	ld	a5,0(a2)
    80003038:	00053703          	ld	a4,0(a0)
    8000303c:	04f70263          	beq	a4,a5,80003080 <uartintr+0x110>
    80003040:	100005b7          	lui	a1,0x10000
    80003044:	00002817          	auipc	a6,0x2
    80003048:	7cc80813          	addi	a6,a6,1996 # 80005810 <uart_tx_buf>
    8000304c:	01c0006f          	j	80003068 <uartintr+0xf8>
    80003050:	0006c703          	lbu	a4,0(a3)
    80003054:	00f63023          	sd	a5,0(a2)
    80003058:	00e58023          	sb	a4,0(a1) # 10000000 <_entry-0x70000000>
    8000305c:	00063783          	ld	a5,0(a2)
    80003060:	00053703          	ld	a4,0(a0)
    80003064:	02f70063          	beq	a4,a5,80003084 <uartintr+0x114>
    80003068:	01f7f713          	andi	a4,a5,31
    8000306c:	00e806b3          	add	a3,a6,a4
    80003070:	0055c703          	lbu	a4,5(a1)
    80003074:	00178793          	addi	a5,a5,1
    80003078:	02077713          	andi	a4,a4,32
    8000307c:	fc071ae3          	bnez	a4,80003050 <uartintr+0xe0>
    80003080:	00008067          	ret
    80003084:	00008067          	ret

0000000080003088 <kinit>:
    80003088:	fc010113          	addi	sp,sp,-64
    8000308c:	02913423          	sd	s1,40(sp)
    80003090:	fffff7b7          	lui	a5,0xfffff
    80003094:	00003497          	auipc	s1,0x3
    80003098:	79b48493          	addi	s1,s1,1947 # 8000682f <end+0xfff>
    8000309c:	02813823          	sd	s0,48(sp)
    800030a0:	01313c23          	sd	s3,24(sp)
    800030a4:	00f4f4b3          	and	s1,s1,a5
    800030a8:	02113c23          	sd	ra,56(sp)
    800030ac:	03213023          	sd	s2,32(sp)
    800030b0:	01413823          	sd	s4,16(sp)
    800030b4:	01513423          	sd	s5,8(sp)
    800030b8:	04010413          	addi	s0,sp,64
    800030bc:	000017b7          	lui	a5,0x1
    800030c0:	01100993          	li	s3,17
    800030c4:	00f487b3          	add	a5,s1,a5
    800030c8:	01b99993          	slli	s3,s3,0x1b
    800030cc:	06f9e063          	bltu	s3,a5,8000312c <kinit+0xa4>
    800030d0:	00002a97          	auipc	s5,0x2
    800030d4:	760a8a93          	addi	s5,s5,1888 # 80005830 <end>
    800030d8:	0754ec63          	bltu	s1,s5,80003150 <kinit+0xc8>
    800030dc:	0734fa63          	bgeu	s1,s3,80003150 <kinit+0xc8>
    800030e0:	00088a37          	lui	s4,0x88
    800030e4:	fffa0a13          	addi	s4,s4,-1 # 87fff <_entry-0x7ff78001>
    800030e8:	00001917          	auipc	s2,0x1
    800030ec:	4c890913          	addi	s2,s2,1224 # 800045b0 <kmem>
    800030f0:	00ca1a13          	slli	s4,s4,0xc
    800030f4:	0140006f          	j	80003108 <kinit+0x80>
    800030f8:	000017b7          	lui	a5,0x1
    800030fc:	00f484b3          	add	s1,s1,a5
    80003100:	0554e863          	bltu	s1,s5,80003150 <kinit+0xc8>
    80003104:	0534f663          	bgeu	s1,s3,80003150 <kinit+0xc8>
    80003108:	00001637          	lui	a2,0x1
    8000310c:	00100593          	li	a1,1
    80003110:	00048513          	mv	a0,s1
    80003114:	00000097          	auipc	ra,0x0
    80003118:	5e4080e7          	jalr	1508(ra) # 800036f8 <__memset>
    8000311c:	00093783          	ld	a5,0(s2)
    80003120:	00f4b023          	sd	a5,0(s1)
    80003124:	00993023          	sd	s1,0(s2)
    80003128:	fd4498e3          	bne	s1,s4,800030f8 <kinit+0x70>
    8000312c:	03813083          	ld	ra,56(sp)
    80003130:	03013403          	ld	s0,48(sp)
    80003134:	02813483          	ld	s1,40(sp)
    80003138:	02013903          	ld	s2,32(sp)
    8000313c:	01813983          	ld	s3,24(sp)
    80003140:	01013a03          	ld	s4,16(sp)
    80003144:	00813a83          	ld	s5,8(sp)
    80003148:	04010113          	addi	sp,sp,64
    8000314c:	00008067          	ret
    80003150:	00001517          	auipc	a0,0x1
    80003154:	0b850513          	addi	a0,a0,184 # 80004208 <digits+0x18>
    80003158:	fffff097          	auipc	ra,0xfffff
    8000315c:	4b4080e7          	jalr	1204(ra) # 8000260c <panic>

0000000080003160 <freerange>:
    80003160:	fc010113          	addi	sp,sp,-64
    80003164:	000017b7          	lui	a5,0x1
    80003168:	02913423          	sd	s1,40(sp)
    8000316c:	fff78493          	addi	s1,a5,-1 # fff <_entry-0x7ffff001>
    80003170:	009504b3          	add	s1,a0,s1
    80003174:	fffff537          	lui	a0,0xfffff
    80003178:	02813823          	sd	s0,48(sp)
    8000317c:	02113c23          	sd	ra,56(sp)
    80003180:	03213023          	sd	s2,32(sp)
    80003184:	01313c23          	sd	s3,24(sp)
    80003188:	01413823          	sd	s4,16(sp)
    8000318c:	01513423          	sd	s5,8(sp)
    80003190:	01613023          	sd	s6,0(sp)
    80003194:	04010413          	addi	s0,sp,64
    80003198:	00a4f4b3          	and	s1,s1,a0
    8000319c:	00f487b3          	add	a5,s1,a5
    800031a0:	06f5e463          	bltu	a1,a5,80003208 <freerange+0xa8>
    800031a4:	00002a97          	auipc	s5,0x2
    800031a8:	68ca8a93          	addi	s5,s5,1676 # 80005830 <end>
    800031ac:	0954e263          	bltu	s1,s5,80003230 <freerange+0xd0>
    800031b0:	01100993          	li	s3,17
    800031b4:	01b99993          	slli	s3,s3,0x1b
    800031b8:	0734fc63          	bgeu	s1,s3,80003230 <freerange+0xd0>
    800031bc:	00058a13          	mv	s4,a1
    800031c0:	00001917          	auipc	s2,0x1
    800031c4:	3f090913          	addi	s2,s2,1008 # 800045b0 <kmem>
    800031c8:	00002b37          	lui	s6,0x2
    800031cc:	0140006f          	j	800031e0 <freerange+0x80>
    800031d0:	000017b7          	lui	a5,0x1
    800031d4:	00f484b3          	add	s1,s1,a5
    800031d8:	0554ec63          	bltu	s1,s5,80003230 <freerange+0xd0>
    800031dc:	0534fa63          	bgeu	s1,s3,80003230 <freerange+0xd0>
    800031e0:	00001637          	lui	a2,0x1
    800031e4:	00100593          	li	a1,1
    800031e8:	00048513          	mv	a0,s1
    800031ec:	00000097          	auipc	ra,0x0
    800031f0:	50c080e7          	jalr	1292(ra) # 800036f8 <__memset>
    800031f4:	00093703          	ld	a4,0(s2)
    800031f8:	016487b3          	add	a5,s1,s6
    800031fc:	00e4b023          	sd	a4,0(s1)
    80003200:	00993023          	sd	s1,0(s2)
    80003204:	fcfa76e3          	bgeu	s4,a5,800031d0 <freerange+0x70>
    80003208:	03813083          	ld	ra,56(sp)
    8000320c:	03013403          	ld	s0,48(sp)
    80003210:	02813483          	ld	s1,40(sp)
    80003214:	02013903          	ld	s2,32(sp)
    80003218:	01813983          	ld	s3,24(sp)
    8000321c:	01013a03          	ld	s4,16(sp)
    80003220:	00813a83          	ld	s5,8(sp)
    80003224:	00013b03          	ld	s6,0(sp)
    80003228:	04010113          	addi	sp,sp,64
    8000322c:	00008067          	ret
    80003230:	00001517          	auipc	a0,0x1
    80003234:	fd850513          	addi	a0,a0,-40 # 80004208 <digits+0x18>
    80003238:	fffff097          	auipc	ra,0xfffff
    8000323c:	3d4080e7          	jalr	980(ra) # 8000260c <panic>

0000000080003240 <kfree>:
    80003240:	fe010113          	addi	sp,sp,-32
    80003244:	00813823          	sd	s0,16(sp)
    80003248:	00113c23          	sd	ra,24(sp)
    8000324c:	00913423          	sd	s1,8(sp)
    80003250:	02010413          	addi	s0,sp,32
    80003254:	03451793          	slli	a5,a0,0x34
    80003258:	04079c63          	bnez	a5,800032b0 <kfree+0x70>
    8000325c:	00002797          	auipc	a5,0x2
    80003260:	5d478793          	addi	a5,a5,1492 # 80005830 <end>
    80003264:	00050493          	mv	s1,a0
    80003268:	04f56463          	bltu	a0,a5,800032b0 <kfree+0x70>
    8000326c:	01100793          	li	a5,17
    80003270:	01b79793          	slli	a5,a5,0x1b
    80003274:	02f57e63          	bgeu	a0,a5,800032b0 <kfree+0x70>
    80003278:	00001637          	lui	a2,0x1
    8000327c:	00100593          	li	a1,1
    80003280:	00000097          	auipc	ra,0x0
    80003284:	478080e7          	jalr	1144(ra) # 800036f8 <__memset>
    80003288:	00001797          	auipc	a5,0x1
    8000328c:	32878793          	addi	a5,a5,808 # 800045b0 <kmem>
    80003290:	0007b703          	ld	a4,0(a5)
    80003294:	01813083          	ld	ra,24(sp)
    80003298:	01013403          	ld	s0,16(sp)
    8000329c:	00e4b023          	sd	a4,0(s1)
    800032a0:	0097b023          	sd	s1,0(a5)
    800032a4:	00813483          	ld	s1,8(sp)
    800032a8:	02010113          	addi	sp,sp,32
    800032ac:	00008067          	ret
    800032b0:	00001517          	auipc	a0,0x1
    800032b4:	f5850513          	addi	a0,a0,-168 # 80004208 <digits+0x18>
    800032b8:	fffff097          	auipc	ra,0xfffff
    800032bc:	354080e7          	jalr	852(ra) # 8000260c <panic>

00000000800032c0 <kalloc>:
    800032c0:	fe010113          	addi	sp,sp,-32
    800032c4:	00813823          	sd	s0,16(sp)
    800032c8:	00913423          	sd	s1,8(sp)
    800032cc:	00113c23          	sd	ra,24(sp)
    800032d0:	02010413          	addi	s0,sp,32
    800032d4:	00001797          	auipc	a5,0x1
    800032d8:	2dc78793          	addi	a5,a5,732 # 800045b0 <kmem>
    800032dc:	0007b483          	ld	s1,0(a5)
    800032e0:	02048063          	beqz	s1,80003300 <kalloc+0x40>
    800032e4:	0004b703          	ld	a4,0(s1)
    800032e8:	00001637          	lui	a2,0x1
    800032ec:	00500593          	li	a1,5
    800032f0:	00048513          	mv	a0,s1
    800032f4:	00e7b023          	sd	a4,0(a5)
    800032f8:	00000097          	auipc	ra,0x0
    800032fc:	400080e7          	jalr	1024(ra) # 800036f8 <__memset>
    80003300:	01813083          	ld	ra,24(sp)
    80003304:	01013403          	ld	s0,16(sp)
    80003308:	00048513          	mv	a0,s1
    8000330c:	00813483          	ld	s1,8(sp)
    80003310:	02010113          	addi	sp,sp,32
    80003314:	00008067          	ret

0000000080003318 <initlock>:
    80003318:	ff010113          	addi	sp,sp,-16
    8000331c:	00813423          	sd	s0,8(sp)
    80003320:	01010413          	addi	s0,sp,16
    80003324:	00813403          	ld	s0,8(sp)
    80003328:	00b53423          	sd	a1,8(a0)
    8000332c:	00052023          	sw	zero,0(a0)
    80003330:	00053823          	sd	zero,16(a0)
    80003334:	01010113          	addi	sp,sp,16
    80003338:	00008067          	ret

000000008000333c <acquire>:
    8000333c:	fe010113          	addi	sp,sp,-32
    80003340:	00813823          	sd	s0,16(sp)
    80003344:	00913423          	sd	s1,8(sp)
    80003348:	00113c23          	sd	ra,24(sp)
    8000334c:	01213023          	sd	s2,0(sp)
    80003350:	02010413          	addi	s0,sp,32
    80003354:	00050493          	mv	s1,a0
    80003358:	10002973          	csrr	s2,sstatus
    8000335c:	100027f3          	csrr	a5,sstatus
    80003360:	ffd7f793          	andi	a5,a5,-3
    80003364:	10079073          	csrw	sstatus,a5
    80003368:	fffff097          	auipc	ra,0xfffff
    8000336c:	8e8080e7          	jalr	-1816(ra) # 80001c50 <mycpu>
    80003370:	07852783          	lw	a5,120(a0)
    80003374:	06078e63          	beqz	a5,800033f0 <acquire+0xb4>
    80003378:	fffff097          	auipc	ra,0xfffff
    8000337c:	8d8080e7          	jalr	-1832(ra) # 80001c50 <mycpu>
    80003380:	07852783          	lw	a5,120(a0)
    80003384:	0004a703          	lw	a4,0(s1)
    80003388:	0017879b          	addiw	a5,a5,1
    8000338c:	06f52c23          	sw	a5,120(a0)
    80003390:	04071063          	bnez	a4,800033d0 <acquire+0x94>
    80003394:	00100713          	li	a4,1
    80003398:	00070793          	mv	a5,a4
    8000339c:	0cf4a7af          	amoswap.w.aq	a5,a5,(s1)
    800033a0:	0007879b          	sext.w	a5,a5
    800033a4:	fe079ae3          	bnez	a5,80003398 <acquire+0x5c>
    800033a8:	0ff0000f          	fence
    800033ac:	fffff097          	auipc	ra,0xfffff
    800033b0:	8a4080e7          	jalr	-1884(ra) # 80001c50 <mycpu>
    800033b4:	01813083          	ld	ra,24(sp)
    800033b8:	01013403          	ld	s0,16(sp)
    800033bc:	00a4b823          	sd	a0,16(s1)
    800033c0:	00013903          	ld	s2,0(sp)
    800033c4:	00813483          	ld	s1,8(sp)
    800033c8:	02010113          	addi	sp,sp,32
    800033cc:	00008067          	ret
    800033d0:	0104b903          	ld	s2,16(s1)
    800033d4:	fffff097          	auipc	ra,0xfffff
    800033d8:	87c080e7          	jalr	-1924(ra) # 80001c50 <mycpu>
    800033dc:	faa91ce3          	bne	s2,a0,80003394 <acquire+0x58>
    800033e0:	00001517          	auipc	a0,0x1
    800033e4:	e3050513          	addi	a0,a0,-464 # 80004210 <digits+0x20>
    800033e8:	fffff097          	auipc	ra,0xfffff
    800033ec:	224080e7          	jalr	548(ra) # 8000260c <panic>
    800033f0:	00195913          	srli	s2,s2,0x1
    800033f4:	fffff097          	auipc	ra,0xfffff
    800033f8:	85c080e7          	jalr	-1956(ra) # 80001c50 <mycpu>
    800033fc:	00197913          	andi	s2,s2,1
    80003400:	07252e23          	sw	s2,124(a0)
    80003404:	f75ff06f          	j	80003378 <acquire+0x3c>

0000000080003408 <release>:
    80003408:	fe010113          	addi	sp,sp,-32
    8000340c:	00813823          	sd	s0,16(sp)
    80003410:	00113c23          	sd	ra,24(sp)
    80003414:	00913423          	sd	s1,8(sp)
    80003418:	01213023          	sd	s2,0(sp)
    8000341c:	02010413          	addi	s0,sp,32
    80003420:	00052783          	lw	a5,0(a0)
    80003424:	00079a63          	bnez	a5,80003438 <release+0x30>
    80003428:	00001517          	auipc	a0,0x1
    8000342c:	df050513          	addi	a0,a0,-528 # 80004218 <digits+0x28>
    80003430:	fffff097          	auipc	ra,0xfffff
    80003434:	1dc080e7          	jalr	476(ra) # 8000260c <panic>
    80003438:	01053903          	ld	s2,16(a0)
    8000343c:	00050493          	mv	s1,a0
    80003440:	fffff097          	auipc	ra,0xfffff
    80003444:	810080e7          	jalr	-2032(ra) # 80001c50 <mycpu>
    80003448:	fea910e3          	bne	s2,a0,80003428 <release+0x20>
    8000344c:	0004b823          	sd	zero,16(s1)
    80003450:	0ff0000f          	fence
    80003454:	0f50000f          	fence	iorw,ow
    80003458:	0804a02f          	amoswap.w	zero,zero,(s1)
    8000345c:	ffffe097          	auipc	ra,0xffffe
    80003460:	7f4080e7          	jalr	2036(ra) # 80001c50 <mycpu>
    80003464:	100027f3          	csrr	a5,sstatus
    80003468:	0027f793          	andi	a5,a5,2
    8000346c:	04079a63          	bnez	a5,800034c0 <release+0xb8>
    80003470:	07852783          	lw	a5,120(a0)
    80003474:	02f05e63          	blez	a5,800034b0 <release+0xa8>
    80003478:	fff7871b          	addiw	a4,a5,-1
    8000347c:	06e52c23          	sw	a4,120(a0)
    80003480:	00071c63          	bnez	a4,80003498 <release+0x90>
    80003484:	07c52783          	lw	a5,124(a0)
    80003488:	00078863          	beqz	a5,80003498 <release+0x90>
    8000348c:	100027f3          	csrr	a5,sstatus
    80003490:	0027e793          	ori	a5,a5,2
    80003494:	10079073          	csrw	sstatus,a5
    80003498:	01813083          	ld	ra,24(sp)
    8000349c:	01013403          	ld	s0,16(sp)
    800034a0:	00813483          	ld	s1,8(sp)
    800034a4:	00013903          	ld	s2,0(sp)
    800034a8:	02010113          	addi	sp,sp,32
    800034ac:	00008067          	ret
    800034b0:	00001517          	auipc	a0,0x1
    800034b4:	d8850513          	addi	a0,a0,-632 # 80004238 <digits+0x48>
    800034b8:	fffff097          	auipc	ra,0xfffff
    800034bc:	154080e7          	jalr	340(ra) # 8000260c <panic>
    800034c0:	00001517          	auipc	a0,0x1
    800034c4:	d6050513          	addi	a0,a0,-672 # 80004220 <digits+0x30>
    800034c8:	fffff097          	auipc	ra,0xfffff
    800034cc:	144080e7          	jalr	324(ra) # 8000260c <panic>

00000000800034d0 <holding>:
    800034d0:	00052783          	lw	a5,0(a0)
    800034d4:	00079663          	bnez	a5,800034e0 <holding+0x10>
    800034d8:	00000513          	li	a0,0
    800034dc:	00008067          	ret
    800034e0:	fe010113          	addi	sp,sp,-32
    800034e4:	00813823          	sd	s0,16(sp)
    800034e8:	00913423          	sd	s1,8(sp)
    800034ec:	00113c23          	sd	ra,24(sp)
    800034f0:	02010413          	addi	s0,sp,32
    800034f4:	01053483          	ld	s1,16(a0)
    800034f8:	ffffe097          	auipc	ra,0xffffe
    800034fc:	758080e7          	jalr	1880(ra) # 80001c50 <mycpu>
    80003500:	01813083          	ld	ra,24(sp)
    80003504:	01013403          	ld	s0,16(sp)
    80003508:	40a48533          	sub	a0,s1,a0
    8000350c:	00153513          	seqz	a0,a0
    80003510:	00813483          	ld	s1,8(sp)
    80003514:	02010113          	addi	sp,sp,32
    80003518:	00008067          	ret

000000008000351c <push_off>:
    8000351c:	fe010113          	addi	sp,sp,-32
    80003520:	00813823          	sd	s0,16(sp)
    80003524:	00113c23          	sd	ra,24(sp)
    80003528:	00913423          	sd	s1,8(sp)
    8000352c:	02010413          	addi	s0,sp,32
    80003530:	100024f3          	csrr	s1,sstatus
    80003534:	100027f3          	csrr	a5,sstatus
    80003538:	ffd7f793          	andi	a5,a5,-3
    8000353c:	10079073          	csrw	sstatus,a5
    80003540:	ffffe097          	auipc	ra,0xffffe
    80003544:	710080e7          	jalr	1808(ra) # 80001c50 <mycpu>
    80003548:	07852783          	lw	a5,120(a0)
    8000354c:	02078663          	beqz	a5,80003578 <push_off+0x5c>
    80003550:	ffffe097          	auipc	ra,0xffffe
    80003554:	700080e7          	jalr	1792(ra) # 80001c50 <mycpu>
    80003558:	07852783          	lw	a5,120(a0)
    8000355c:	01813083          	ld	ra,24(sp)
    80003560:	01013403          	ld	s0,16(sp)
    80003564:	0017879b          	addiw	a5,a5,1
    80003568:	06f52c23          	sw	a5,120(a0)
    8000356c:	00813483          	ld	s1,8(sp)
    80003570:	02010113          	addi	sp,sp,32
    80003574:	00008067          	ret
    80003578:	0014d493          	srli	s1,s1,0x1
    8000357c:	ffffe097          	auipc	ra,0xffffe
    80003580:	6d4080e7          	jalr	1748(ra) # 80001c50 <mycpu>
    80003584:	0014f493          	andi	s1,s1,1
    80003588:	06952e23          	sw	s1,124(a0)
    8000358c:	fc5ff06f          	j	80003550 <push_off+0x34>

0000000080003590 <pop_off>:
    80003590:	ff010113          	addi	sp,sp,-16
    80003594:	00813023          	sd	s0,0(sp)
    80003598:	00113423          	sd	ra,8(sp)
    8000359c:	01010413          	addi	s0,sp,16
    800035a0:	ffffe097          	auipc	ra,0xffffe
    800035a4:	6b0080e7          	jalr	1712(ra) # 80001c50 <mycpu>
    800035a8:	100027f3          	csrr	a5,sstatus
    800035ac:	0027f793          	andi	a5,a5,2
    800035b0:	04079663          	bnez	a5,800035fc <pop_off+0x6c>
    800035b4:	07852783          	lw	a5,120(a0)
    800035b8:	02f05a63          	blez	a5,800035ec <pop_off+0x5c>
    800035bc:	fff7871b          	addiw	a4,a5,-1
    800035c0:	06e52c23          	sw	a4,120(a0)
    800035c4:	00071c63          	bnez	a4,800035dc <pop_off+0x4c>
    800035c8:	07c52783          	lw	a5,124(a0)
    800035cc:	00078863          	beqz	a5,800035dc <pop_off+0x4c>
    800035d0:	100027f3          	csrr	a5,sstatus
    800035d4:	0027e793          	ori	a5,a5,2
    800035d8:	10079073          	csrw	sstatus,a5
    800035dc:	00813083          	ld	ra,8(sp)
    800035e0:	00013403          	ld	s0,0(sp)
    800035e4:	01010113          	addi	sp,sp,16
    800035e8:	00008067          	ret
    800035ec:	00001517          	auipc	a0,0x1
    800035f0:	c4c50513          	addi	a0,a0,-948 # 80004238 <digits+0x48>
    800035f4:	fffff097          	auipc	ra,0xfffff
    800035f8:	018080e7          	jalr	24(ra) # 8000260c <panic>
    800035fc:	00001517          	auipc	a0,0x1
    80003600:	c2450513          	addi	a0,a0,-988 # 80004220 <digits+0x30>
    80003604:	fffff097          	auipc	ra,0xfffff
    80003608:	008080e7          	jalr	8(ra) # 8000260c <panic>

000000008000360c <push_on>:
    8000360c:	fe010113          	addi	sp,sp,-32
    80003610:	00813823          	sd	s0,16(sp)
    80003614:	00113c23          	sd	ra,24(sp)
    80003618:	00913423          	sd	s1,8(sp)
    8000361c:	02010413          	addi	s0,sp,32
    80003620:	100024f3          	csrr	s1,sstatus
    80003624:	100027f3          	csrr	a5,sstatus
    80003628:	0027e793          	ori	a5,a5,2
    8000362c:	10079073          	csrw	sstatus,a5
    80003630:	ffffe097          	auipc	ra,0xffffe
    80003634:	620080e7          	jalr	1568(ra) # 80001c50 <mycpu>
    80003638:	07852783          	lw	a5,120(a0)
    8000363c:	02078663          	beqz	a5,80003668 <push_on+0x5c>
    80003640:	ffffe097          	auipc	ra,0xffffe
    80003644:	610080e7          	jalr	1552(ra) # 80001c50 <mycpu>
    80003648:	07852783          	lw	a5,120(a0)
    8000364c:	01813083          	ld	ra,24(sp)
    80003650:	01013403          	ld	s0,16(sp)
    80003654:	0017879b          	addiw	a5,a5,1
    80003658:	06f52c23          	sw	a5,120(a0)
    8000365c:	00813483          	ld	s1,8(sp)
    80003660:	02010113          	addi	sp,sp,32
    80003664:	00008067          	ret
    80003668:	0014d493          	srli	s1,s1,0x1
    8000366c:	ffffe097          	auipc	ra,0xffffe
    80003670:	5e4080e7          	jalr	1508(ra) # 80001c50 <mycpu>
    80003674:	0014f493          	andi	s1,s1,1
    80003678:	06952e23          	sw	s1,124(a0)
    8000367c:	fc5ff06f          	j	80003640 <push_on+0x34>

0000000080003680 <pop_on>:
    80003680:	ff010113          	addi	sp,sp,-16
    80003684:	00813023          	sd	s0,0(sp)
    80003688:	00113423          	sd	ra,8(sp)
    8000368c:	01010413          	addi	s0,sp,16
    80003690:	ffffe097          	auipc	ra,0xffffe
    80003694:	5c0080e7          	jalr	1472(ra) # 80001c50 <mycpu>
    80003698:	100027f3          	csrr	a5,sstatus
    8000369c:	0027f793          	andi	a5,a5,2
    800036a0:	04078463          	beqz	a5,800036e8 <pop_on+0x68>
    800036a4:	07852783          	lw	a5,120(a0)
    800036a8:	02f05863          	blez	a5,800036d8 <pop_on+0x58>
    800036ac:	fff7879b          	addiw	a5,a5,-1
    800036b0:	06f52c23          	sw	a5,120(a0)
    800036b4:	07853783          	ld	a5,120(a0)
    800036b8:	00079863          	bnez	a5,800036c8 <pop_on+0x48>
    800036bc:	100027f3          	csrr	a5,sstatus
    800036c0:	ffd7f793          	andi	a5,a5,-3
    800036c4:	10079073          	csrw	sstatus,a5
    800036c8:	00813083          	ld	ra,8(sp)
    800036cc:	00013403          	ld	s0,0(sp)
    800036d0:	01010113          	addi	sp,sp,16
    800036d4:	00008067          	ret
    800036d8:	00001517          	auipc	a0,0x1
    800036dc:	b8850513          	addi	a0,a0,-1144 # 80004260 <digits+0x70>
    800036e0:	fffff097          	auipc	ra,0xfffff
    800036e4:	f2c080e7          	jalr	-212(ra) # 8000260c <panic>
    800036e8:	00001517          	auipc	a0,0x1
    800036ec:	b5850513          	addi	a0,a0,-1192 # 80004240 <digits+0x50>
    800036f0:	fffff097          	auipc	ra,0xfffff
    800036f4:	f1c080e7          	jalr	-228(ra) # 8000260c <panic>

00000000800036f8 <__memset>:
    800036f8:	ff010113          	addi	sp,sp,-16
    800036fc:	00813423          	sd	s0,8(sp)
    80003700:	01010413          	addi	s0,sp,16
    80003704:	1a060e63          	beqz	a2,800038c0 <__memset+0x1c8>
    80003708:	40a007b3          	neg	a5,a0
    8000370c:	0077f793          	andi	a5,a5,7
    80003710:	00778693          	addi	a3,a5,7
    80003714:	00b00813          	li	a6,11
    80003718:	0ff5f593          	andi	a1,a1,255
    8000371c:	fff6071b          	addiw	a4,a2,-1
    80003720:	1b06e663          	bltu	a3,a6,800038cc <__memset+0x1d4>
    80003724:	1cd76463          	bltu	a4,a3,800038ec <__memset+0x1f4>
    80003728:	1a078e63          	beqz	a5,800038e4 <__memset+0x1ec>
    8000372c:	00b50023          	sb	a1,0(a0)
    80003730:	00100713          	li	a4,1
    80003734:	1ae78463          	beq	a5,a4,800038dc <__memset+0x1e4>
    80003738:	00b500a3          	sb	a1,1(a0)
    8000373c:	00200713          	li	a4,2
    80003740:	1ae78a63          	beq	a5,a4,800038f4 <__memset+0x1fc>
    80003744:	00b50123          	sb	a1,2(a0)
    80003748:	00300713          	li	a4,3
    8000374c:	18e78463          	beq	a5,a4,800038d4 <__memset+0x1dc>
    80003750:	00b501a3          	sb	a1,3(a0)
    80003754:	00400713          	li	a4,4
    80003758:	1ae78263          	beq	a5,a4,800038fc <__memset+0x204>
    8000375c:	00b50223          	sb	a1,4(a0)
    80003760:	00500713          	li	a4,5
    80003764:	1ae78063          	beq	a5,a4,80003904 <__memset+0x20c>
    80003768:	00b502a3          	sb	a1,5(a0)
    8000376c:	00700713          	li	a4,7
    80003770:	18e79e63          	bne	a5,a4,8000390c <__memset+0x214>
    80003774:	00b50323          	sb	a1,6(a0)
    80003778:	00700e93          	li	t4,7
    8000377c:	00859713          	slli	a4,a1,0x8
    80003780:	00e5e733          	or	a4,a1,a4
    80003784:	01059e13          	slli	t3,a1,0x10
    80003788:	01c76e33          	or	t3,a4,t3
    8000378c:	01859313          	slli	t1,a1,0x18
    80003790:	006e6333          	or	t1,t3,t1
    80003794:	02059893          	slli	a7,a1,0x20
    80003798:	40f60e3b          	subw	t3,a2,a5
    8000379c:	011368b3          	or	a7,t1,a7
    800037a0:	02859813          	slli	a6,a1,0x28
    800037a4:	0108e833          	or	a6,a7,a6
    800037a8:	03059693          	slli	a3,a1,0x30
    800037ac:	003e589b          	srliw	a7,t3,0x3
    800037b0:	00d866b3          	or	a3,a6,a3
    800037b4:	03859713          	slli	a4,a1,0x38
    800037b8:	00389813          	slli	a6,a7,0x3
    800037bc:	00f507b3          	add	a5,a0,a5
    800037c0:	00e6e733          	or	a4,a3,a4
    800037c4:	000e089b          	sext.w	a7,t3
    800037c8:	00f806b3          	add	a3,a6,a5
    800037cc:	00e7b023          	sd	a4,0(a5)
    800037d0:	00878793          	addi	a5,a5,8
    800037d4:	fed79ce3          	bne	a5,a3,800037cc <__memset+0xd4>
    800037d8:	ff8e7793          	andi	a5,t3,-8
    800037dc:	0007871b          	sext.w	a4,a5
    800037e0:	01d787bb          	addw	a5,a5,t4
    800037e4:	0ce88e63          	beq	a7,a4,800038c0 <__memset+0x1c8>
    800037e8:	00f50733          	add	a4,a0,a5
    800037ec:	00b70023          	sb	a1,0(a4)
    800037f0:	0017871b          	addiw	a4,a5,1
    800037f4:	0cc77663          	bgeu	a4,a2,800038c0 <__memset+0x1c8>
    800037f8:	00e50733          	add	a4,a0,a4
    800037fc:	00b70023          	sb	a1,0(a4)
    80003800:	0027871b          	addiw	a4,a5,2
    80003804:	0ac77e63          	bgeu	a4,a2,800038c0 <__memset+0x1c8>
    80003808:	00e50733          	add	a4,a0,a4
    8000380c:	00b70023          	sb	a1,0(a4)
    80003810:	0037871b          	addiw	a4,a5,3
    80003814:	0ac77663          	bgeu	a4,a2,800038c0 <__memset+0x1c8>
    80003818:	00e50733          	add	a4,a0,a4
    8000381c:	00b70023          	sb	a1,0(a4)
    80003820:	0047871b          	addiw	a4,a5,4
    80003824:	08c77e63          	bgeu	a4,a2,800038c0 <__memset+0x1c8>
    80003828:	00e50733          	add	a4,a0,a4
    8000382c:	00b70023          	sb	a1,0(a4)
    80003830:	0057871b          	addiw	a4,a5,5
    80003834:	08c77663          	bgeu	a4,a2,800038c0 <__memset+0x1c8>
    80003838:	00e50733          	add	a4,a0,a4
    8000383c:	00b70023          	sb	a1,0(a4)
    80003840:	0067871b          	addiw	a4,a5,6
    80003844:	06c77e63          	bgeu	a4,a2,800038c0 <__memset+0x1c8>
    80003848:	00e50733          	add	a4,a0,a4
    8000384c:	00b70023          	sb	a1,0(a4)
    80003850:	0077871b          	addiw	a4,a5,7
    80003854:	06c77663          	bgeu	a4,a2,800038c0 <__memset+0x1c8>
    80003858:	00e50733          	add	a4,a0,a4
    8000385c:	00b70023          	sb	a1,0(a4)
    80003860:	0087871b          	addiw	a4,a5,8
    80003864:	04c77e63          	bgeu	a4,a2,800038c0 <__memset+0x1c8>
    80003868:	00e50733          	add	a4,a0,a4
    8000386c:	00b70023          	sb	a1,0(a4)
    80003870:	0097871b          	addiw	a4,a5,9
    80003874:	04c77663          	bgeu	a4,a2,800038c0 <__memset+0x1c8>
    80003878:	00e50733          	add	a4,a0,a4
    8000387c:	00b70023          	sb	a1,0(a4)
    80003880:	00a7871b          	addiw	a4,a5,10
    80003884:	02c77e63          	bgeu	a4,a2,800038c0 <__memset+0x1c8>
    80003888:	00e50733          	add	a4,a0,a4
    8000388c:	00b70023          	sb	a1,0(a4)
    80003890:	00b7871b          	addiw	a4,a5,11
    80003894:	02c77663          	bgeu	a4,a2,800038c0 <__memset+0x1c8>
    80003898:	00e50733          	add	a4,a0,a4
    8000389c:	00b70023          	sb	a1,0(a4)
    800038a0:	00c7871b          	addiw	a4,a5,12
    800038a4:	00c77e63          	bgeu	a4,a2,800038c0 <__memset+0x1c8>
    800038a8:	00e50733          	add	a4,a0,a4
    800038ac:	00b70023          	sb	a1,0(a4)
    800038b0:	00d7879b          	addiw	a5,a5,13
    800038b4:	00c7f663          	bgeu	a5,a2,800038c0 <__memset+0x1c8>
    800038b8:	00f507b3          	add	a5,a0,a5
    800038bc:	00b78023          	sb	a1,0(a5)
    800038c0:	00813403          	ld	s0,8(sp)
    800038c4:	01010113          	addi	sp,sp,16
    800038c8:	00008067          	ret
    800038cc:	00b00693          	li	a3,11
    800038d0:	e55ff06f          	j	80003724 <__memset+0x2c>
    800038d4:	00300e93          	li	t4,3
    800038d8:	ea5ff06f          	j	8000377c <__memset+0x84>
    800038dc:	00100e93          	li	t4,1
    800038e0:	e9dff06f          	j	8000377c <__memset+0x84>
    800038e4:	00000e93          	li	t4,0
    800038e8:	e95ff06f          	j	8000377c <__memset+0x84>
    800038ec:	00000793          	li	a5,0
    800038f0:	ef9ff06f          	j	800037e8 <__memset+0xf0>
    800038f4:	00200e93          	li	t4,2
    800038f8:	e85ff06f          	j	8000377c <__memset+0x84>
    800038fc:	00400e93          	li	t4,4
    80003900:	e7dff06f          	j	8000377c <__memset+0x84>
    80003904:	00500e93          	li	t4,5
    80003908:	e75ff06f          	j	8000377c <__memset+0x84>
    8000390c:	00600e93          	li	t4,6
    80003910:	e6dff06f          	j	8000377c <__memset+0x84>

0000000080003914 <__memmove>:
    80003914:	ff010113          	addi	sp,sp,-16
    80003918:	00813423          	sd	s0,8(sp)
    8000391c:	01010413          	addi	s0,sp,16
    80003920:	0e060863          	beqz	a2,80003a10 <__memmove+0xfc>
    80003924:	fff6069b          	addiw	a3,a2,-1
    80003928:	0006881b          	sext.w	a6,a3
    8000392c:	0ea5e863          	bltu	a1,a0,80003a1c <__memmove+0x108>
    80003930:	00758713          	addi	a4,a1,7
    80003934:	00a5e7b3          	or	a5,a1,a0
    80003938:	40a70733          	sub	a4,a4,a0
    8000393c:	0077f793          	andi	a5,a5,7
    80003940:	00f73713          	sltiu	a4,a4,15
    80003944:	00174713          	xori	a4,a4,1
    80003948:	0017b793          	seqz	a5,a5
    8000394c:	00e7f7b3          	and	a5,a5,a4
    80003950:	10078863          	beqz	a5,80003a60 <__memmove+0x14c>
    80003954:	00900793          	li	a5,9
    80003958:	1107f463          	bgeu	a5,a6,80003a60 <__memmove+0x14c>
    8000395c:	0036581b          	srliw	a6,a2,0x3
    80003960:	fff8081b          	addiw	a6,a6,-1
    80003964:	02081813          	slli	a6,a6,0x20
    80003968:	01d85893          	srli	a7,a6,0x1d
    8000396c:	00858813          	addi	a6,a1,8
    80003970:	00058793          	mv	a5,a1
    80003974:	00050713          	mv	a4,a0
    80003978:	01088833          	add	a6,a7,a6
    8000397c:	0007b883          	ld	a7,0(a5)
    80003980:	00878793          	addi	a5,a5,8
    80003984:	00870713          	addi	a4,a4,8
    80003988:	ff173c23          	sd	a7,-8(a4)
    8000398c:	ff0798e3          	bne	a5,a6,8000397c <__memmove+0x68>
    80003990:	ff867713          	andi	a4,a2,-8
    80003994:	02071793          	slli	a5,a4,0x20
    80003998:	0207d793          	srli	a5,a5,0x20
    8000399c:	00f585b3          	add	a1,a1,a5
    800039a0:	40e686bb          	subw	a3,a3,a4
    800039a4:	00f507b3          	add	a5,a0,a5
    800039a8:	06e60463          	beq	a2,a4,80003a10 <__memmove+0xfc>
    800039ac:	0005c703          	lbu	a4,0(a1)
    800039b0:	00e78023          	sb	a4,0(a5)
    800039b4:	04068e63          	beqz	a3,80003a10 <__memmove+0xfc>
    800039b8:	0015c603          	lbu	a2,1(a1)
    800039bc:	00100713          	li	a4,1
    800039c0:	00c780a3          	sb	a2,1(a5)
    800039c4:	04e68663          	beq	a3,a4,80003a10 <__memmove+0xfc>
    800039c8:	0025c603          	lbu	a2,2(a1)
    800039cc:	00200713          	li	a4,2
    800039d0:	00c78123          	sb	a2,2(a5)
    800039d4:	02e68e63          	beq	a3,a4,80003a10 <__memmove+0xfc>
    800039d8:	0035c603          	lbu	a2,3(a1)
    800039dc:	00300713          	li	a4,3
    800039e0:	00c781a3          	sb	a2,3(a5)
    800039e4:	02e68663          	beq	a3,a4,80003a10 <__memmove+0xfc>
    800039e8:	0045c603          	lbu	a2,4(a1)
    800039ec:	00400713          	li	a4,4
    800039f0:	00c78223          	sb	a2,4(a5)
    800039f4:	00e68e63          	beq	a3,a4,80003a10 <__memmove+0xfc>
    800039f8:	0055c603          	lbu	a2,5(a1)
    800039fc:	00500713          	li	a4,5
    80003a00:	00c782a3          	sb	a2,5(a5)
    80003a04:	00e68663          	beq	a3,a4,80003a10 <__memmove+0xfc>
    80003a08:	0065c703          	lbu	a4,6(a1)
    80003a0c:	00e78323          	sb	a4,6(a5)
    80003a10:	00813403          	ld	s0,8(sp)
    80003a14:	01010113          	addi	sp,sp,16
    80003a18:	00008067          	ret
    80003a1c:	02061713          	slli	a4,a2,0x20
    80003a20:	02075713          	srli	a4,a4,0x20
    80003a24:	00e587b3          	add	a5,a1,a4
    80003a28:	f0f574e3          	bgeu	a0,a5,80003930 <__memmove+0x1c>
    80003a2c:	02069613          	slli	a2,a3,0x20
    80003a30:	02065613          	srli	a2,a2,0x20
    80003a34:	fff64613          	not	a2,a2
    80003a38:	00e50733          	add	a4,a0,a4
    80003a3c:	00c78633          	add	a2,a5,a2
    80003a40:	fff7c683          	lbu	a3,-1(a5)
    80003a44:	fff78793          	addi	a5,a5,-1
    80003a48:	fff70713          	addi	a4,a4,-1
    80003a4c:	00d70023          	sb	a3,0(a4)
    80003a50:	fec798e3          	bne	a5,a2,80003a40 <__memmove+0x12c>
    80003a54:	00813403          	ld	s0,8(sp)
    80003a58:	01010113          	addi	sp,sp,16
    80003a5c:	00008067          	ret
    80003a60:	02069713          	slli	a4,a3,0x20
    80003a64:	02075713          	srli	a4,a4,0x20
    80003a68:	00170713          	addi	a4,a4,1
    80003a6c:	00e50733          	add	a4,a0,a4
    80003a70:	00050793          	mv	a5,a0
    80003a74:	0005c683          	lbu	a3,0(a1)
    80003a78:	00178793          	addi	a5,a5,1
    80003a7c:	00158593          	addi	a1,a1,1
    80003a80:	fed78fa3          	sb	a3,-1(a5)
    80003a84:	fee798e3          	bne	a5,a4,80003a74 <__memmove+0x160>
    80003a88:	f89ff06f          	j	80003a10 <__memmove+0xfc>

0000000080003a8c <__putc>:
    80003a8c:	fe010113          	addi	sp,sp,-32
    80003a90:	00813823          	sd	s0,16(sp)
    80003a94:	00113c23          	sd	ra,24(sp)
    80003a98:	02010413          	addi	s0,sp,32
    80003a9c:	00050793          	mv	a5,a0
    80003aa0:	fef40593          	addi	a1,s0,-17
    80003aa4:	00100613          	li	a2,1
    80003aa8:	00000513          	li	a0,0
    80003aac:	fef407a3          	sb	a5,-17(s0)
    80003ab0:	fffff097          	auipc	ra,0xfffff
    80003ab4:	b3c080e7          	jalr	-1220(ra) # 800025ec <console_write>
    80003ab8:	01813083          	ld	ra,24(sp)
    80003abc:	01013403          	ld	s0,16(sp)
    80003ac0:	02010113          	addi	sp,sp,32
    80003ac4:	00008067          	ret

0000000080003ac8 <__getc>:
    80003ac8:	fe010113          	addi	sp,sp,-32
    80003acc:	00813823          	sd	s0,16(sp)
    80003ad0:	00113c23          	sd	ra,24(sp)
    80003ad4:	02010413          	addi	s0,sp,32
    80003ad8:	fe840593          	addi	a1,s0,-24
    80003adc:	00100613          	li	a2,1
    80003ae0:	00000513          	li	a0,0
    80003ae4:	fffff097          	auipc	ra,0xfffff
    80003ae8:	ae8080e7          	jalr	-1304(ra) # 800025cc <console_read>
    80003aec:	fe844503          	lbu	a0,-24(s0)
    80003af0:	01813083          	ld	ra,24(sp)
    80003af4:	01013403          	ld	s0,16(sp)
    80003af8:	02010113          	addi	sp,sp,32
    80003afc:	00008067          	ret

0000000080003b00 <console_handler>:
    80003b00:	fe010113          	addi	sp,sp,-32
    80003b04:	00813823          	sd	s0,16(sp)
    80003b08:	00113c23          	sd	ra,24(sp)
    80003b0c:	00913423          	sd	s1,8(sp)
    80003b10:	02010413          	addi	s0,sp,32
    80003b14:	14202773          	csrr	a4,scause
    80003b18:	100027f3          	csrr	a5,sstatus
    80003b1c:	0027f793          	andi	a5,a5,2
    80003b20:	06079e63          	bnez	a5,80003b9c <console_handler+0x9c>
    80003b24:	00074c63          	bltz	a4,80003b3c <console_handler+0x3c>
    80003b28:	01813083          	ld	ra,24(sp)
    80003b2c:	01013403          	ld	s0,16(sp)
    80003b30:	00813483          	ld	s1,8(sp)
    80003b34:	02010113          	addi	sp,sp,32
    80003b38:	00008067          	ret
    80003b3c:	0ff77713          	andi	a4,a4,255
    80003b40:	00900793          	li	a5,9
    80003b44:	fef712e3          	bne	a4,a5,80003b28 <console_handler+0x28>
    80003b48:	ffffe097          	auipc	ra,0xffffe
    80003b4c:	6dc080e7          	jalr	1756(ra) # 80002224 <plic_claim>
    80003b50:	00a00793          	li	a5,10
    80003b54:	00050493          	mv	s1,a0
    80003b58:	02f50c63          	beq	a0,a5,80003b90 <console_handler+0x90>
    80003b5c:	fc0506e3          	beqz	a0,80003b28 <console_handler+0x28>
    80003b60:	00050593          	mv	a1,a0
    80003b64:	00000517          	auipc	a0,0x0
    80003b68:	60450513          	addi	a0,a0,1540 # 80004168 <CONSOLE_STATUS+0x158>
    80003b6c:	fffff097          	auipc	ra,0xfffff
    80003b70:	afc080e7          	jalr	-1284(ra) # 80002668 <__printf>
    80003b74:	01013403          	ld	s0,16(sp)
    80003b78:	01813083          	ld	ra,24(sp)
    80003b7c:	00048513          	mv	a0,s1
    80003b80:	00813483          	ld	s1,8(sp)
    80003b84:	02010113          	addi	sp,sp,32
    80003b88:	ffffe317          	auipc	t1,0xffffe
    80003b8c:	6d430067          	jr	1748(t1) # 8000225c <plic_complete>
    80003b90:	fffff097          	auipc	ra,0xfffff
    80003b94:	3e0080e7          	jalr	992(ra) # 80002f70 <uartintr>
    80003b98:	fddff06f          	j	80003b74 <console_handler+0x74>
    80003b9c:	00000517          	auipc	a0,0x0
    80003ba0:	6cc50513          	addi	a0,a0,1740 # 80004268 <digits+0x78>
    80003ba4:	fffff097          	auipc	ra,0xfffff
    80003ba8:	a68080e7          	jalr	-1432(ra) # 8000260c <panic>
	...

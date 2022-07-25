#include "../h/syscall_c.h"
#include "../test/printing.hpp"
#include "../lib/console.h"
#define MAX 400
int number = 2;
int rand(){
    int r[MAX];
    int i;

    r[0] = 1;
    for (i=1; i<31; i++) {
        r[i] = (16807LL * r[i-1]) % 2147483647;
        if (r[i] < 0) {
            r[i] += 2147483647;
        }
    }
    for (i=31; i<34; i++) {
        r[i] = r[i-31];
    }
    for (i=34; i<344; i++) {
        r[i] = r[i-31] + r[i-3];
    }
    for (i=344; i<MAX; i++) {
        r[i] = r[i-31] + r[i-3];
    }

    return r[number++];
}

sem_t mutexIspisi;
sem_t DuvanIPapir, PapirISibice, SibiceIDuvan;
sem_t izgorelaCigareta;


void uzivaUCigareti(int pusac) {

    sem_wait(mutexIspisi);
    char pusaci[] = {'P', 'M', 'L'};
    __putc(pusaci[pusac]); printString(" uziva u cigareti.\n");

    sem_signal(mutexIspisi);

    time_sleep(20);

}


void dilerJova(void* param) {

    while(1) {

        int r = rand() % 3;

        sem_wait(mutexIspisi);

        printString("Na stolu su ");

        switch(r) { // odabir sta diler trenutno ima

            case 0: printString("duvan i papir.\n");
                sem_signal(DuvanIPapir);
                break;

            case 1: printString("papir i sibice.\n");
                sem_signal(PapirISibice);
                break;

            case 2: printString("sibice i duvan.\n");
                sem_signal(SibiceIDuvan);
                break;

        }

        sem_signal(mutexIspisi);
        sem_wait(izgorelaCigareta);

    }

}

void pusacPera(void* param) { // uvek ima sibice

    while(1){
        sem_wait(DuvanIPapir);
        uzivaUCigareti(0);
        sem_signal(izgorelaCigareta);
    }
}

void pusacMika(void* param) { // uvek ima duvan
    while(1){
        sem_wait(PapirISibice);
        uzivaUCigareti(1);
        sem_signal(izgorelaCigareta);
    }
}

void pusacLaza(void* param) { // uvek ima papir
    while(1){
        sem_signal(SibiceIDuvan);
        uzivaUCigareti(2);
        sem_signal(izgorelaCigareta);
    }
}


void testSinhro(){
    /* thread_t jova, pera, mika, laza;
 sem_open(&mutexIspisi, 1);
 sem_open(&DuvanIPapir, 0);
 sem_open(&PapirISibice, 0) ;
 sem_open(&SibiceIDuvan, 0);
 sem_open(&izgorelaCigareta, 0);



 thread_create(&jova, dilerJova, nullptr);

 thread_create(&pera, pusacPera, nullptr);

 thread_create(&mika, pusacMika, nullptr);

 thread_create(&laza, pusacLaza, nullptr);*/
}
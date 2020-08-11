import threading
import random
import time
import os
from time import sleep
import math
sem = threading.Semaphore()
sem1 = threading.Semaphore()
sem2 = threading.Semaphore()
sem3 = threading.Semaphore()
sem4 = threading.Semaphore()
sem5 = threading.Semaphore()
sem6 = threading.Semaphore()
sem7 = threading.Semaphore()
sem8 = threading.Semaphore()
sem9 = threading.Semaphore()
sem10 = threading.Semaphore()
sem11 = threading.Semaphore()
sem12 = threading.Semaphore()


instruction=[]
file=open('ins.txt','r')
for each in file:
    #each.rstrip("\n")
    instruction.append(each)

for i in range(len(instruction)):
    instruction[i]=instruction[i].rstrip("\n")
print(instruction)
FP={'F0':0,'F1':4,'F2':2,'F3':3,'F4':0,'F5':8,'F6':0,'F7':0,'F8':0,'F9':0,'F10':0,'F11':0,'F12':0,'F13':0,'F14':0,'F15':0}
AR={'R0':0,'R1':0,'R2':0,'R3':0,'R4':0}
FPA= []
FPM= []
LOADBUFF=[]
STOREBUFF=[]
clk=0
load=2
store=2
shr=2
add=3
fadd=5
sub=5
div=2
mul=10
fmul=15
cmp= 2
nand=3
xor=3
lhr=2
sbb = 5
str1 = 2
initial=[]
start=[0]*len(instruction)
finished=[0]*len(instruction)
busy=[]
l=[]
m=[]
mem={}

def memory():
    x=random.random()
    return x
def Load(i,ins):
    x=ins[1:3]
    LOADBUFF.append(x)
    sem.acquire()
    y=int(ins[2],2)
    if y in mem.keys():
        FP[ins[1]]=mem[y]
    else: 
        z=memory()
        FP[ins[1]]=z
    finished[i]=finished[i]+load
    p=10000
    star = time.time()
    while time.time() - star < load:
        p = p - 1
    busy.remove(ins[1])
    sem.release()
def store(i,ins):
    x=ins[1:3]
    STOREBUFF.append(x)
    sem10.acquire()
    y=int(ins[2],2)
    mem[y]=FP[ins[1]]
    finished[i]=finished[i]+str1
    p=10000
    star = time.time()
    while time.time() - star < str1:
        p = p - 1
    busy.remove(ins[1])
    sem10.release()
def MUL(i,ins):
    x=ins[1:4]
    busy.append(ins[2])
    busy.append(ins[3])
    FPM.append(x)
    sem1.acquire()
    FP[ins[1]]=FP[ins[2]]*FP[ins[3]]
    #print(FP[ins[1]],ins[2],ins[3])
    #print(FP)
    finished[i]=finished[i]+mul
    p=1000000
    star = time.time()
    while time.time() - star < mul:
        p=p-1
    busy.remove(ins[1])
    busy.remove(ins[2])
    busy.remove(ins[3])
    
    FPM.remove(x)
    sem1.release()
def FMUL(i,ins):
    x=ins[1:4]
    busy.append(ins[2])
    busy.append(ins[3])
    FPM.append(x)
    sem11.acquire()
    FP[ins[1]]=FP[ins[2]]*FP[ins[3]]
    #print(FP)
    finished[i]=finished[i]+fmul
    p=1000000
    star = time.time()
    while time.time() - star < fmul:
        p=p-1
    busy.remove(ins[1])
    busy.remove(ins[2])
    busy.remove(ins[3])
    
    FPM.remove(x)
    sem11.release()
    
def ADD(i,ins):
    x=ins[1:4]
    FPA.append(x)
    busy.append(ins[2])
    busy.append(ins[3])
    sem2.acquire()
    FP[ins[1]]=FP[ins[2]]+FP[ins[3]]
    #print(FP)
    finished[i]=finished[i]+add
    p=1000000
    star = time.time()
    while time.time() - star < add:
            p = p - 1
    busy.remove(ins[1])
    busy.remove(ins[2])
    busy.remove(ins[3])
    FPA.remove(x)
    sem2.release()
def FADD(i,ins):
    x=ins[1:4]
    FPA.append(x)
    busy.append(ins[2])
    busy.append(ins[3])
    sem12.acquire()
    FP[ins[1]]=FP[ins[2]]+FP[ins[3]]
    #print(FP)
    finished[i]=finished[i]+fadd
    p=1000000
    star = time.time()
    while time.time() - star < fadd:
            p = p - 1
    busy.remove(ins[1])
    busy.remove(ins[2])
    busy.remove(ins[3])
    FPA.remove(x)
    sem12.release()

def SUB(i,ins):
    #print(ins)
    x=ins[1:4]
    FPA.append(x)
    busy.append(ins[2])
    busy.append(ins[3])
    sem3.acquire()
    FP[ins[1]]=FP[ins[2]]-FP[ins[3]]
    finished[i]=finished[i]+sub
    p=1000000
    star = time.time()
    while time.time() - star < sub:
            p = p - 1
    busy.remove(ins[1])
    busy.remove(ins[2])
    busy.remove(ins[3])
    FPA.remove(x)
    sem3.release()

def SBB(i,ins):
    x=ins[1:4]
    FPA.append(x)
    busy.append(ins[2])
    busy.append(ins[3])
    sem4.acquire()
    FP[ins[1]]=FP[ins[2]]-FP[ins[3]]-1
    finished[i]=finished[i]+sbb
    p=1000000
    star = time.time()
    while time.time() - star < sbb:
            p = p - 1
    busy.remove(ins[1])
    busy.remove(ins[2])
    busy.remove(ins[3])
    FPA.remove(x)
    sem4.release()
def SHR(i,ins):
    x=ins[1:4]
    FPA.append(x)
    busy.append(ins[2])
    busy.append(ins[3])
    sem5.acquire()
    FP[ins[1]]=int(FP[ins[2]])>>int(FP[ins[3]])
    finished[i]=finished[i]+shr
    p=1000000
    star = time.time()
    while time.time() - star < shr:
            p = p - 1
    busy.remove(ins[1])
    busy.remove(ins[2])
    busy.remove(ins[3])
    FPA.remove(x)
    sem5.release()
def LHR(i,ins):
    x=ins[1:4]
    FPA.append(x)
    busy.append(ins[2])
    busy.append(ins[3])
    sem9.acquire()
    FP[ins[1]]=int(FP[ins[2]])<< int(FP[ins[3]])
    finished[i]=finished[i]+lhr
    p=1000000
    star = time.time()
    while time.time() - star < lhr:
            p = p - 1
    busy.remove(ins[1])
    busy.remove(ins[2])
    busy.remove(ins[3])
    FPA.remove(x)
    sem9.release()

def NAND(i,ins):
    x=ins[1:4]
    FPA.append(x)
    busy.append(ins[2])
    busy.append(ins[3])
    sem7.acquire()
    number_of_bits = (int)(math.floor(math.log(FP[ins[2]])/math.log(2))) + 1;   
    x1=((1 << number_of_bits) - 1) ^ FP[ins[2]];
    number_of_bits = (int)(math.floor(math.log(FP[ins[3]])/math.log(2))) + 1;   
    x2=((1 << number_of_bits) - 1) ^ FP[ins[3]];
    
    FP[ins[1]]= x1|x2
    finished[i]=finished[i]+nand
    p=1000000
    star = time.time()
    while time.time() - star < nand:
            p = p - 1
    busy.remove(ins[1])
    busy.remove(ins[2])
    busy.remove(ins[3])
    FPA.remove(x)
    sem7.release()
def XOR(i,ins):
    x=ins[1:4]
    FPA.append(x)
    busy.append(ins[2])
    busy.append(ins[3])
    sem8.acquire()
    
    FP[ins[1]]= FP[ins[2]]^FP[ins[3]]
    finished[i]=finished[i]+xor
    p=1000000
    star = time.time()
    while time.time() - star < xor:
            p = p - 1
    busy.remove(ins[1])
    busy.remove(ins[2])
    busy.remove(ins[3])
    FPA.remove(x)
    sem8.release()
def CMP(i,ins):
    x=ins[1:3]
    FPA.append(x)
    busy.append(ins[2])
    sem6.acquire()
    #print(FP[ins[2]])
    if(FP[ins[2]]>0):
        number_of_bits = (int)(math.floor(math.log(FP[ins[2]]) /math.log(2))) + 1;   
        FP[ins[1]]=((1 << number_of_bits) - 1) ^ FP[ins[2]];
    else:
        FP[ins[1]]=1
    #print("h",FP)
    finished[i]=finished[i]+cmp
    
    p=1000000
    star = time.time()
    while time.time() - star < cmp:
            p = p - 1
    busy.remove(ins[1])
    busy.remove(ins[2])
    FPA.remove(x)
    sem6.release()
    
def thread1(i,ins):            
    if(len(ins)==4):
        x=ins[1:4]
        z=1
        while(z):
            if(any(item in x for item in busy)==False):
                z=0
                busy.append(ins[1])
                start[i]=time.time()-t0
                finished[i]=start[i]
                if(ins[0]=='MUL'):
                    y=MUL(i,ins)
                if(ins[0]=='FMUL'):
                    y=FMUL(i,ins)
                elif(ins[0]=='ADD'):
                    y=ADD(i,ins)
                elif(ins[0]=='SUB'):
                    y=SUB(i,ins)
                elif(ins[0]=='SBB'):
                    y=SBB(i,ins)
                elif(ins[0]=='SHR'):
                    y=SHR(i,ins)
                elif(ins[0]=='SHR'):
                    y=LHR(i,ins)
                elif(ins[0]=='NAND'):
                    y=NAND(i,ins)
                elif(ins[0]=='XOR'):
                    y=XOR(i,ins)
                
    elif(len(ins)==3):
        x=ins[1:3]
        z=1
        while(z):
            if(any(item in x for item in busy)==False):
                z=0
                busy.append(ins[1])
                start[i]=time.time()-t0
                finished[i]=start[i]
                if(ins[0]=='CMP'):
                    y=CMP(i,ins)
                elif(ins[0]=='LD'):
                    y=Load(i,ins)
                elif(ins[0]=='STR'):
                    y=store(i,ins)
                    
i=0
t=[]
n=len(instruction)
print(n)
t0 = time.time()
for i in range(0,n):
    instruction[i]=instruction[i].split(" ")
    thread = threading.Thread(target=thread1, args=(i,instruction[i],))
    t.append(thread)
for thread in t:
    initial.append(time.time()-t0)
    thread.start()
    time.sleep(1)
for thread in t:
    thread.join()
start = [round(x) for x in start]
finished = [round(x) for x in finished]
initial = [round(x) for x in initial]
print("start",start) 
print("inished",finished)
print("initial",initial)
print(FP)


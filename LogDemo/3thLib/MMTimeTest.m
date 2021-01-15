//
//  MMTimeTest.m
//  LogDemo
//
//  Created by mumu on 2021/1/5.
//  Copyright © 2021 mumu. All rights reserved.
//

#import "MMTimeTest.h"
#include <stdio.h>
#include <sys/time.h>

@implementation MMTimeTest

@end



long my_fun_b(){
    struct timeval star;
    gettimeofday(&star, NULL);
    long b = star.tv_sec * 1000000 + star.tv_usec;
    return b;
}

void my_fun_e(char *name, long b){
    struct timeval end;
    gettimeofday(&end, NULL);
    long e = end.tv_sec * 1000000 + end.tv_usec;
    long t = e - b;
    printf("%s %ld us\n",name, t);
}
//
// bool runOnFunction(Function &F) {
//     // 1. 已经插入的不需要再次插入
//     if (F.getName().startswith("my_fun_"))
//       return false;
//
//     // 2. 记录开始时间
//     Value* beginTime = nullptr;
//     if (!insert_begin_inst(F, beginTime))
//       return false;
//
//     // 3. 方法结束时统计方法耗时，开始的时间记录作为参数
//     insert_return_inst(F, beginTime);
//     return false;
//   }
//
//
//bool insert_begin_inst(Function &F, Value*& beginTime)
//   {
//     // 0.函数最开始的BasicBlock
//     LLVMContext &context = F.getParent()->getContext();
//     BasicBlock &bb = F.getEntryBlock();
//
//     // 1. 获取要插入的函数
//     FunctionCallee beginFun = F.getParent()->getOrInsertFunction("my_fun_b",FunctionType::get(Type::getInt64Ty(context), {}, false));
//
//     // 2. 构造函数
//     // Value *beginTime = nullptr;
//     CallInst *inst = nullptr;
//     IRBuilder<> builder(context);
//     inst = builder.CreateCall(beginFun);
//
//     if (!inst) {
//       llvm::errs() << "Create First CallInst Failed\n";
//       return false;
//     }
//
//     // 3. 获取函数开始的第一条指令
//     Instruction *beginInst = dyn_cast<Instruction>(bb.begin());
//
//     // 4. 将inst插入
//     inst->insertBefore(beginInst);
//
//     // 5.根据返回值记录开始时间
//     beginTime = inst;
//
//     return true;
//   }
//
//void insert_return_inst(Function &F, Value* beginTime)
//{
//LLVMContext &context = F.getParent()->getContext();
//for (Function::iterator I = F.begin(), E = F.end(); I != E; ++I)
//{
//
// //  函数结尾的BasicBlock
// BasicBlock &BB = *I;
// for (BasicBlock::iterator I = BB.begin(), E = BB.end(); I != E; ++I)
// {
//   ReturnInst *IST = dyn_cast<ReturnInst>(I);
//   if (!IST)
//     continue;
//
//   // end_func 类型
//   FunctionType *endFuncType = FunctionType::get(
//     Type::getVoidTy(context),
//     {Type::getInt8PtrTy(context),Type::getInt64Ty(context)},
//     false
//   );
//
//   // end_func
//   FunctionCallee endFunc = BB.getModule()->getOrInsertFunction("my_fun_e", endFuncType);
//
//   // 构造end_func
//   IRBuilder<> builder(&BB);
//   IRBuilder<> callBuilder(context);
//   CallInst* endCI = callBuilder.CreateCall(endFunc,
//     {
//       builder.CreateGlobalStringPtr(BB.getParent()->getName()),
//       beginTime
//     }
//   );
//
//   // 插入end_func(struction)
//   endCI->insertBefore(IST);
// }
//}
//}

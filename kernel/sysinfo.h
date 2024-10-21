#ifndef _SYSINFO_H_
#define _SYSINFO_H_

struct sysinfo {
  uint64 freemem;   // 可用内存量（以字节为单位）
  uint64 nproc;     // 进程数量
};

#endif // _SYSINFO_H_

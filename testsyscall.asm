
_testsyscall:     file format elf32-i386


Disassembly of section .text:

00000000 <main>:
#include "types.h"
#include "stat.h"
#include "user.h"

int main(void) {
   0:	8d 4c 24 04          	lea    0x4(%esp),%ecx
   4:	83 e4 f0             	and    $0xfffffff0,%esp
   7:	ff 71 fc             	pushl  -0x4(%ecx)
   a:	55                   	push   %ebp
   b:	89 e5                	mov    %esp,%ebp
   d:	51                   	push   %ecx
   e:	83 ec 04             	sub    $0x4,%esp
    settickets(5);
  11:	83 ec 0c             	sub    $0xc,%esp
  14:	6a 05                	push   $0x5
  16:	e8 ff 02 00 00       	call   31a <settickets>
  1b:	83 c4 10             	add    $0x10,%esp
    exit();
  1e:	e8 57 02 00 00       	call   27a <exit>

00000023 <stosb>:
               "cc");
}

static inline void
stosb(void *addr, int data, int cnt)
{
  23:	55                   	push   %ebp
  24:	89 e5                	mov    %esp,%ebp
  26:	57                   	push   %edi
  27:	53                   	push   %ebx
  asm volatile("cld; rep stosb" :
  28:	8b 4d 08             	mov    0x8(%ebp),%ecx
  2b:	8b 55 10             	mov    0x10(%ebp),%edx
  2e:	8b 45 0c             	mov    0xc(%ebp),%eax
  31:	89 cb                	mov    %ecx,%ebx
  33:	89 df                	mov    %ebx,%edi
  35:	89 d1                	mov    %edx,%ecx
  37:	fc                   	cld    
  38:	f3 aa                	rep stos %al,%es:(%edi)
  3a:	89 ca                	mov    %ecx,%edx
  3c:	89 fb                	mov    %edi,%ebx
  3e:	89 5d 08             	mov    %ebx,0x8(%ebp)
  41:	89 55 10             	mov    %edx,0x10(%ebp)
               "=D" (addr), "=c" (cnt) :
               "0" (addr), "1" (cnt), "a" (data) :
               "memory", "cc");
}
  44:	90                   	nop
  45:	5b                   	pop    %ebx
  46:	5f                   	pop    %edi
  47:	5d                   	pop    %ebp
  48:	c3                   	ret    

00000049 <strcpy>:
#include "user.h"
#include "x86.h"

char*
strcpy(char *s, char *t)
{
  49:	55                   	push   %ebp
  4a:	89 e5                	mov    %esp,%ebp
  4c:	83 ec 10             	sub    $0x10,%esp
  char *os;

  os = s;
  4f:	8b 45 08             	mov    0x8(%ebp),%eax
  52:	89 45 fc             	mov    %eax,-0x4(%ebp)
  while((*s++ = *t++) != 0)
  55:	90                   	nop
  56:	8b 45 08             	mov    0x8(%ebp),%eax
  59:	8d 50 01             	lea    0x1(%eax),%edx
  5c:	89 55 08             	mov    %edx,0x8(%ebp)
  5f:	8b 55 0c             	mov    0xc(%ebp),%edx
  62:	8d 4a 01             	lea    0x1(%edx),%ecx
  65:	89 4d 0c             	mov    %ecx,0xc(%ebp)
  68:	0f b6 12             	movzbl (%edx),%edx
  6b:	88 10                	mov    %dl,(%eax)
  6d:	0f b6 00             	movzbl (%eax),%eax
  70:	84 c0                	test   %al,%al
  72:	75 e2                	jne    56 <strcpy+0xd>
    ;
  return os;
  74:	8b 45 fc             	mov    -0x4(%ebp),%eax
}
  77:	c9                   	leave  
  78:	c3                   	ret    

00000079 <strcmp>:

int
strcmp(const char *p, const char *q)
{
  79:	55                   	push   %ebp
  7a:	89 e5                	mov    %esp,%ebp
  while(*p && *p == *q)
  7c:	eb 08                	jmp    86 <strcmp+0xd>
    p++, q++;
  7e:	83 45 08 01          	addl   $0x1,0x8(%ebp)
  82:	83 45 0c 01          	addl   $0x1,0xc(%ebp)
}

int
strcmp(const char *p, const char *q)
{
  while(*p && *p == *q)
  86:	8b 45 08             	mov    0x8(%ebp),%eax
  89:	0f b6 00             	movzbl (%eax),%eax
  8c:	84 c0                	test   %al,%al
  8e:	74 10                	je     a0 <strcmp+0x27>
  90:	8b 45 08             	mov    0x8(%ebp),%eax
  93:	0f b6 10             	movzbl (%eax),%edx
  96:	8b 45 0c             	mov    0xc(%ebp),%eax
  99:	0f b6 00             	movzbl (%eax),%eax
  9c:	38 c2                	cmp    %al,%dl
  9e:	74 de                	je     7e <strcmp+0x5>
    p++, q++;
  return (uchar)*p - (uchar)*q;
  a0:	8b 45 08             	mov    0x8(%ebp),%eax
  a3:	0f b6 00             	movzbl (%eax),%eax
  a6:	0f b6 d0             	movzbl %al,%edx
  a9:	8b 45 0c             	mov    0xc(%ebp),%eax
  ac:	0f b6 00             	movzbl (%eax),%eax
  af:	0f b6 c0             	movzbl %al,%eax
  b2:	29 c2                	sub    %eax,%edx
  b4:	89 d0                	mov    %edx,%eax
}
  b6:	5d                   	pop    %ebp
  b7:	c3                   	ret    

000000b8 <strlen>:

uint
strlen(char *s)
{
  b8:	55                   	push   %ebp
  b9:	89 e5                	mov    %esp,%ebp
  bb:	83 ec 10             	sub    $0x10,%esp
  int n;

  for(n = 0; s[n]; n++)
  be:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%ebp)
  c5:	eb 04                	jmp    cb <strlen+0x13>
  c7:	83 45 fc 01          	addl   $0x1,-0x4(%ebp)
  cb:	8b 55 fc             	mov    -0x4(%ebp),%edx
  ce:	8b 45 08             	mov    0x8(%ebp),%eax
  d1:	01 d0                	add    %edx,%eax
  d3:	0f b6 00             	movzbl (%eax),%eax
  d6:	84 c0                	test   %al,%al
  d8:	75 ed                	jne    c7 <strlen+0xf>
    ;
  return n;
  da:	8b 45 fc             	mov    -0x4(%ebp),%eax
}
  dd:	c9                   	leave  
  de:	c3                   	ret    

000000df <memset>:

void*
memset(void *dst, int c, uint n)
{
  df:	55                   	push   %ebp
  e0:	89 e5                	mov    %esp,%ebp
  stosb(dst, c, n);
  e2:	8b 45 10             	mov    0x10(%ebp),%eax
  e5:	50                   	push   %eax
  e6:	ff 75 0c             	pushl  0xc(%ebp)
  e9:	ff 75 08             	pushl  0x8(%ebp)
  ec:	e8 32 ff ff ff       	call   23 <stosb>
  f1:	83 c4 0c             	add    $0xc,%esp
  return dst;
  f4:	8b 45 08             	mov    0x8(%ebp),%eax
}
  f7:	c9                   	leave  
  f8:	c3                   	ret    

000000f9 <strchr>:

char*
strchr(const char *s, char c)
{
  f9:	55                   	push   %ebp
  fa:	89 e5                	mov    %esp,%ebp
  fc:	83 ec 04             	sub    $0x4,%esp
  ff:	8b 45 0c             	mov    0xc(%ebp),%eax
 102:	88 45 fc             	mov    %al,-0x4(%ebp)
  for(; *s; s++)
 105:	eb 14                	jmp    11b <strchr+0x22>
    if(*s == c)
 107:	8b 45 08             	mov    0x8(%ebp),%eax
 10a:	0f b6 00             	movzbl (%eax),%eax
 10d:	3a 45 fc             	cmp    -0x4(%ebp),%al
 110:	75 05                	jne    117 <strchr+0x1e>
      return (char*)s;
 112:	8b 45 08             	mov    0x8(%ebp),%eax
 115:	eb 13                	jmp    12a <strchr+0x31>
}

char*
strchr(const char *s, char c)
{
  for(; *s; s++)
 117:	83 45 08 01          	addl   $0x1,0x8(%ebp)
 11b:	8b 45 08             	mov    0x8(%ebp),%eax
 11e:	0f b6 00             	movzbl (%eax),%eax
 121:	84 c0                	test   %al,%al
 123:	75 e2                	jne    107 <strchr+0xe>
    if(*s == c)
      return (char*)s;
  return 0;
 125:	b8 00 00 00 00       	mov    $0x0,%eax
}
 12a:	c9                   	leave  
 12b:	c3                   	ret    

0000012c <gets>:

char*
gets(char *buf, int max)
{
 12c:	55                   	push   %ebp
 12d:	89 e5                	mov    %esp,%ebp
 12f:	83 ec 18             	sub    $0x18,%esp
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
 132:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
 139:	eb 42                	jmp    17d <gets+0x51>
    cc = read(0, &c, 1);
 13b:	83 ec 04             	sub    $0x4,%esp
 13e:	6a 01                	push   $0x1
 140:	8d 45 ef             	lea    -0x11(%ebp),%eax
 143:	50                   	push   %eax
 144:	6a 00                	push   $0x0
 146:	e8 47 01 00 00       	call   292 <read>
 14b:	83 c4 10             	add    $0x10,%esp
 14e:	89 45 f0             	mov    %eax,-0x10(%ebp)
    if(cc < 1)
 151:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
 155:	7e 33                	jle    18a <gets+0x5e>
      break;
    buf[i++] = c;
 157:	8b 45 f4             	mov    -0xc(%ebp),%eax
 15a:	8d 50 01             	lea    0x1(%eax),%edx
 15d:	89 55 f4             	mov    %edx,-0xc(%ebp)
 160:	89 c2                	mov    %eax,%edx
 162:	8b 45 08             	mov    0x8(%ebp),%eax
 165:	01 c2                	add    %eax,%edx
 167:	0f b6 45 ef          	movzbl -0x11(%ebp),%eax
 16b:	88 02                	mov    %al,(%edx)
    if(c == '\n' || c == '\r')
 16d:	0f b6 45 ef          	movzbl -0x11(%ebp),%eax
 171:	3c 0a                	cmp    $0xa,%al
 173:	74 16                	je     18b <gets+0x5f>
 175:	0f b6 45 ef          	movzbl -0x11(%ebp),%eax
 179:	3c 0d                	cmp    $0xd,%al
 17b:	74 0e                	je     18b <gets+0x5f>
gets(char *buf, int max)
{
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
 17d:	8b 45 f4             	mov    -0xc(%ebp),%eax
 180:	83 c0 01             	add    $0x1,%eax
 183:	3b 45 0c             	cmp    0xc(%ebp),%eax
 186:	7c b3                	jl     13b <gets+0xf>
 188:	eb 01                	jmp    18b <gets+0x5f>
    cc = read(0, &c, 1);
    if(cc < 1)
      break;
 18a:	90                   	nop
    buf[i++] = c;
    if(c == '\n' || c == '\r')
      break;
  }
  buf[i] = '\0';
 18b:	8b 55 f4             	mov    -0xc(%ebp),%edx
 18e:	8b 45 08             	mov    0x8(%ebp),%eax
 191:	01 d0                	add    %edx,%eax
 193:	c6 00 00             	movb   $0x0,(%eax)
  return buf;
 196:	8b 45 08             	mov    0x8(%ebp),%eax
}
 199:	c9                   	leave  
 19a:	c3                   	ret    

0000019b <stat>:

int
stat(char *n, struct stat *st)
{
 19b:	55                   	push   %ebp
 19c:	89 e5                	mov    %esp,%ebp
 19e:	83 ec 18             	sub    $0x18,%esp
  int fd;
  int r;

  fd = open(n, O_RDONLY);
 1a1:	83 ec 08             	sub    $0x8,%esp
 1a4:	6a 00                	push   $0x0
 1a6:	ff 75 08             	pushl  0x8(%ebp)
 1a9:	e8 0c 01 00 00       	call   2ba <open>
 1ae:	83 c4 10             	add    $0x10,%esp
 1b1:	89 45 f4             	mov    %eax,-0xc(%ebp)
  if(fd < 0)
 1b4:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
 1b8:	79 07                	jns    1c1 <stat+0x26>
    return -1;
 1ba:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
 1bf:	eb 25                	jmp    1e6 <stat+0x4b>
  r = fstat(fd, st);
 1c1:	83 ec 08             	sub    $0x8,%esp
 1c4:	ff 75 0c             	pushl  0xc(%ebp)
 1c7:	ff 75 f4             	pushl  -0xc(%ebp)
 1ca:	e8 03 01 00 00       	call   2d2 <fstat>
 1cf:	83 c4 10             	add    $0x10,%esp
 1d2:	89 45 f0             	mov    %eax,-0x10(%ebp)
  close(fd);
 1d5:	83 ec 0c             	sub    $0xc,%esp
 1d8:	ff 75 f4             	pushl  -0xc(%ebp)
 1db:	e8 c2 00 00 00       	call   2a2 <close>
 1e0:	83 c4 10             	add    $0x10,%esp
  return r;
 1e3:	8b 45 f0             	mov    -0x10(%ebp),%eax
}
 1e6:	c9                   	leave  
 1e7:	c3                   	ret    

000001e8 <atoi>:

int
atoi(const char *s)
{
 1e8:	55                   	push   %ebp
 1e9:	89 e5                	mov    %esp,%ebp
 1eb:	83 ec 10             	sub    $0x10,%esp
  int n;

  n = 0;
 1ee:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%ebp)
  while('0' <= *s && *s <= '9')
 1f5:	eb 25                	jmp    21c <atoi+0x34>
    n = n*10 + *s++ - '0';
 1f7:	8b 55 fc             	mov    -0x4(%ebp),%edx
 1fa:	89 d0                	mov    %edx,%eax
 1fc:	c1 e0 02             	shl    $0x2,%eax
 1ff:	01 d0                	add    %edx,%eax
 201:	01 c0                	add    %eax,%eax
 203:	89 c1                	mov    %eax,%ecx
 205:	8b 45 08             	mov    0x8(%ebp),%eax
 208:	8d 50 01             	lea    0x1(%eax),%edx
 20b:	89 55 08             	mov    %edx,0x8(%ebp)
 20e:	0f b6 00             	movzbl (%eax),%eax
 211:	0f be c0             	movsbl %al,%eax
 214:	01 c8                	add    %ecx,%eax
 216:	83 e8 30             	sub    $0x30,%eax
 219:	89 45 fc             	mov    %eax,-0x4(%ebp)
atoi(const char *s)
{
  int n;

  n = 0;
  while('0' <= *s && *s <= '9')
 21c:	8b 45 08             	mov    0x8(%ebp),%eax
 21f:	0f b6 00             	movzbl (%eax),%eax
 222:	3c 2f                	cmp    $0x2f,%al
 224:	7e 0a                	jle    230 <atoi+0x48>
 226:	8b 45 08             	mov    0x8(%ebp),%eax
 229:	0f b6 00             	movzbl (%eax),%eax
 22c:	3c 39                	cmp    $0x39,%al
 22e:	7e c7                	jle    1f7 <atoi+0xf>
    n = n*10 + *s++ - '0';
  return n;
 230:	8b 45 fc             	mov    -0x4(%ebp),%eax
}
 233:	c9                   	leave  
 234:	c3                   	ret    

00000235 <memmove>:

void*
memmove(void *vdst, void *vsrc, int n)
{
 235:	55                   	push   %ebp
 236:	89 e5                	mov    %esp,%ebp
 238:	83 ec 10             	sub    $0x10,%esp
  char *dst, *src;
  
  dst = vdst;
 23b:	8b 45 08             	mov    0x8(%ebp),%eax
 23e:	89 45 fc             	mov    %eax,-0x4(%ebp)
  src = vsrc;
 241:	8b 45 0c             	mov    0xc(%ebp),%eax
 244:	89 45 f8             	mov    %eax,-0x8(%ebp)
  while(n-- > 0)
 247:	eb 17                	jmp    260 <memmove+0x2b>
    *dst++ = *src++;
 249:	8b 45 fc             	mov    -0x4(%ebp),%eax
 24c:	8d 50 01             	lea    0x1(%eax),%edx
 24f:	89 55 fc             	mov    %edx,-0x4(%ebp)
 252:	8b 55 f8             	mov    -0x8(%ebp),%edx
 255:	8d 4a 01             	lea    0x1(%edx),%ecx
 258:	89 4d f8             	mov    %ecx,-0x8(%ebp)
 25b:	0f b6 12             	movzbl (%edx),%edx
 25e:	88 10                	mov    %dl,(%eax)
{
  char *dst, *src;
  
  dst = vdst;
  src = vsrc;
  while(n-- > 0)
 260:	8b 45 10             	mov    0x10(%ebp),%eax
 263:	8d 50 ff             	lea    -0x1(%eax),%edx
 266:	89 55 10             	mov    %edx,0x10(%ebp)
 269:	85 c0                	test   %eax,%eax
 26b:	7f dc                	jg     249 <memmove+0x14>
    *dst++ = *src++;
  return vdst;
 26d:	8b 45 08             	mov    0x8(%ebp),%eax
}
 270:	c9                   	leave  
 271:	c3                   	ret    

00000272 <fork>:
  name: \
    movl $SYS_ ## name, %eax; \
    int $T_SYSCALL; \
    ret

SYSCALL(fork)
 272:	b8 01 00 00 00       	mov    $0x1,%eax
 277:	cd 40                	int    $0x40
 279:	c3                   	ret    

0000027a <exit>:
SYSCALL(exit)
 27a:	b8 02 00 00 00       	mov    $0x2,%eax
 27f:	cd 40                	int    $0x40
 281:	c3                   	ret    

00000282 <wait>:
SYSCALL(wait)
 282:	b8 03 00 00 00       	mov    $0x3,%eax
 287:	cd 40                	int    $0x40
 289:	c3                   	ret    

0000028a <pipe>:
SYSCALL(pipe)
 28a:	b8 04 00 00 00       	mov    $0x4,%eax
 28f:	cd 40                	int    $0x40
 291:	c3                   	ret    

00000292 <read>:
SYSCALL(read)
 292:	b8 05 00 00 00       	mov    $0x5,%eax
 297:	cd 40                	int    $0x40
 299:	c3                   	ret    

0000029a <write>:
SYSCALL(write)
 29a:	b8 10 00 00 00       	mov    $0x10,%eax
 29f:	cd 40                	int    $0x40
 2a1:	c3                   	ret    

000002a2 <close>:
SYSCALL(close)
 2a2:	b8 15 00 00 00       	mov    $0x15,%eax
 2a7:	cd 40                	int    $0x40
 2a9:	c3                   	ret    

000002aa <kill>:
SYSCALL(kill)
 2aa:	b8 06 00 00 00       	mov    $0x6,%eax
 2af:	cd 40                	int    $0x40
 2b1:	c3                   	ret    

000002b2 <exec>:
SYSCALL(exec)
 2b2:	b8 07 00 00 00       	mov    $0x7,%eax
 2b7:	cd 40                	int    $0x40
 2b9:	c3                   	ret    

000002ba <open>:
SYSCALL(open)
 2ba:	b8 0f 00 00 00       	mov    $0xf,%eax
 2bf:	cd 40                	int    $0x40
 2c1:	c3                   	ret    

000002c2 <mknod>:
SYSCALL(mknod)
 2c2:	b8 11 00 00 00       	mov    $0x11,%eax
 2c7:	cd 40                	int    $0x40
 2c9:	c3                   	ret    

000002ca <unlink>:
SYSCALL(unlink)
 2ca:	b8 12 00 00 00       	mov    $0x12,%eax
 2cf:	cd 40                	int    $0x40
 2d1:	c3                   	ret    

000002d2 <fstat>:
SYSCALL(fstat)
 2d2:	b8 08 00 00 00       	mov    $0x8,%eax
 2d7:	cd 40                	int    $0x40
 2d9:	c3                   	ret    

000002da <link>:
SYSCALL(link)
 2da:	b8 13 00 00 00       	mov    $0x13,%eax
 2df:	cd 40                	int    $0x40
 2e1:	c3                   	ret    

000002e2 <mkdir>:
SYSCALL(mkdir)
 2e2:	b8 14 00 00 00       	mov    $0x14,%eax
 2e7:	cd 40                	int    $0x40
 2e9:	c3                   	ret    

000002ea <chdir>:
SYSCALL(chdir)
 2ea:	b8 09 00 00 00       	mov    $0x9,%eax
 2ef:	cd 40                	int    $0x40
 2f1:	c3                   	ret    

000002f2 <dup>:
SYSCALL(dup)
 2f2:	b8 0a 00 00 00       	mov    $0xa,%eax
 2f7:	cd 40                	int    $0x40
 2f9:	c3                   	ret    

000002fa <getpid>:
SYSCALL(getpid)
 2fa:	b8 0b 00 00 00       	mov    $0xb,%eax
 2ff:	cd 40                	int    $0x40
 301:	c3                   	ret    

00000302 <sbrk>:
SYSCALL(sbrk)
 302:	b8 0c 00 00 00       	mov    $0xc,%eax
 307:	cd 40                	int    $0x40
 309:	c3                   	ret    

0000030a <sleep>:
SYSCALL(sleep)
 30a:	b8 0d 00 00 00       	mov    $0xd,%eax
 30f:	cd 40                	int    $0x40
 311:	c3                   	ret    

00000312 <uptime>:
SYSCALL(uptime)
 312:	b8 0e 00 00 00       	mov    $0xe,%eax
 317:	cd 40                	int    $0x40
 319:	c3                   	ret    

0000031a <settickets>:
SYSCALL(settickets)
 31a:	b8 16 00 00 00       	mov    $0x16,%eax
 31f:	cd 40                	int    $0x40
 321:	c3                   	ret    

00000322 <gettime>:
 322:	b8 17 00 00 00       	mov    $0x17,%eax
 327:	cd 40                	int    $0x40
 329:	c3                   	ret    

0000032a <putc>:
#include "stat.h"
#include "user.h"

static void
putc(int fd, char c)
{
 32a:	55                   	push   %ebp
 32b:	89 e5                	mov    %esp,%ebp
 32d:	83 ec 18             	sub    $0x18,%esp
 330:	8b 45 0c             	mov    0xc(%ebp),%eax
 333:	88 45 f4             	mov    %al,-0xc(%ebp)
  write(fd, &c, 1);
 336:	83 ec 04             	sub    $0x4,%esp
 339:	6a 01                	push   $0x1
 33b:	8d 45 f4             	lea    -0xc(%ebp),%eax
 33e:	50                   	push   %eax
 33f:	ff 75 08             	pushl  0x8(%ebp)
 342:	e8 53 ff ff ff       	call   29a <write>
 347:	83 c4 10             	add    $0x10,%esp
}
 34a:	90                   	nop
 34b:	c9                   	leave  
 34c:	c3                   	ret    

0000034d <printint>:

static void
printint(int fd, int xx, int base, int sgn)
{
 34d:	55                   	push   %ebp
 34e:	89 e5                	mov    %esp,%ebp
 350:	53                   	push   %ebx
 351:	83 ec 24             	sub    $0x24,%esp
  static char digits[] = "0123456789ABCDEF";
  char buf[16];
  int i, neg;
  uint x;

  neg = 0;
 354:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
  if(sgn && xx < 0){
 35b:	83 7d 14 00          	cmpl   $0x0,0x14(%ebp)
 35f:	74 17                	je     378 <printint+0x2b>
 361:	83 7d 0c 00          	cmpl   $0x0,0xc(%ebp)
 365:	79 11                	jns    378 <printint+0x2b>
    neg = 1;
 367:	c7 45 f0 01 00 00 00 	movl   $0x1,-0x10(%ebp)
    x = -xx;
 36e:	8b 45 0c             	mov    0xc(%ebp),%eax
 371:	f7 d8                	neg    %eax
 373:	89 45 ec             	mov    %eax,-0x14(%ebp)
 376:	eb 06                	jmp    37e <printint+0x31>
  } else {
    x = xx;
 378:	8b 45 0c             	mov    0xc(%ebp),%eax
 37b:	89 45 ec             	mov    %eax,-0x14(%ebp)
  }

  i = 0;
 37e:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
  do{
    buf[i++] = digits[x % base];
 385:	8b 4d f4             	mov    -0xc(%ebp),%ecx
 388:	8d 41 01             	lea    0x1(%ecx),%eax
 38b:	89 45 f4             	mov    %eax,-0xc(%ebp)
 38e:	8b 5d 10             	mov    0x10(%ebp),%ebx
 391:	8b 45 ec             	mov    -0x14(%ebp),%eax
 394:	ba 00 00 00 00       	mov    $0x0,%edx
 399:	f7 f3                	div    %ebx
 39b:	89 d0                	mov    %edx,%eax
 39d:	0f b6 80 08 0a 00 00 	movzbl 0xa08(%eax),%eax
 3a4:	88 44 0d dc          	mov    %al,-0x24(%ebp,%ecx,1)
  }while((x /= base) != 0);
 3a8:	8b 5d 10             	mov    0x10(%ebp),%ebx
 3ab:	8b 45 ec             	mov    -0x14(%ebp),%eax
 3ae:	ba 00 00 00 00       	mov    $0x0,%edx
 3b3:	f7 f3                	div    %ebx
 3b5:	89 45 ec             	mov    %eax,-0x14(%ebp)
 3b8:	83 7d ec 00          	cmpl   $0x0,-0x14(%ebp)
 3bc:	75 c7                	jne    385 <printint+0x38>
  if(neg)
 3be:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
 3c2:	74 2d                	je     3f1 <printint+0xa4>
    buf[i++] = '-';
 3c4:	8b 45 f4             	mov    -0xc(%ebp),%eax
 3c7:	8d 50 01             	lea    0x1(%eax),%edx
 3ca:	89 55 f4             	mov    %edx,-0xc(%ebp)
 3cd:	c6 44 05 dc 2d       	movb   $0x2d,-0x24(%ebp,%eax,1)

  while(--i >= 0)
 3d2:	eb 1d                	jmp    3f1 <printint+0xa4>
    putc(fd, buf[i]);
 3d4:	8d 55 dc             	lea    -0x24(%ebp),%edx
 3d7:	8b 45 f4             	mov    -0xc(%ebp),%eax
 3da:	01 d0                	add    %edx,%eax
 3dc:	0f b6 00             	movzbl (%eax),%eax
 3df:	0f be c0             	movsbl %al,%eax
 3e2:	83 ec 08             	sub    $0x8,%esp
 3e5:	50                   	push   %eax
 3e6:	ff 75 08             	pushl  0x8(%ebp)
 3e9:	e8 3c ff ff ff       	call   32a <putc>
 3ee:	83 c4 10             	add    $0x10,%esp
    buf[i++] = digits[x % base];
  }while((x /= base) != 0);
  if(neg)
    buf[i++] = '-';

  while(--i >= 0)
 3f1:	83 6d f4 01          	subl   $0x1,-0xc(%ebp)
 3f5:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
 3f9:	79 d9                	jns    3d4 <printint+0x87>
    putc(fd, buf[i]);
}
 3fb:	90                   	nop
 3fc:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 3ff:	c9                   	leave  
 400:	c3                   	ret    

00000401 <printf>:

// Print to the given fd. Only understands %d, %x, %p, %s.
void
printf(int fd, char *fmt, ...)
{
 401:	55                   	push   %ebp
 402:	89 e5                	mov    %esp,%ebp
 404:	83 ec 28             	sub    $0x28,%esp
  char *s;
  int c, i, state;
  uint *ap;

  state = 0;
 407:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
  ap = (uint*)(void*)&fmt + 1;
 40e:	8d 45 0c             	lea    0xc(%ebp),%eax
 411:	83 c0 04             	add    $0x4,%eax
 414:	89 45 e8             	mov    %eax,-0x18(%ebp)
  for(i = 0; fmt[i]; i++){
 417:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
 41e:	e9 59 01 00 00       	jmp    57c <printf+0x17b>
    c = fmt[i] & 0xff;
 423:	8b 55 0c             	mov    0xc(%ebp),%edx
 426:	8b 45 f0             	mov    -0x10(%ebp),%eax
 429:	01 d0                	add    %edx,%eax
 42b:	0f b6 00             	movzbl (%eax),%eax
 42e:	0f be c0             	movsbl %al,%eax
 431:	25 ff 00 00 00       	and    $0xff,%eax
 436:	89 45 e4             	mov    %eax,-0x1c(%ebp)
    if(state == 0){
 439:	83 7d ec 00          	cmpl   $0x0,-0x14(%ebp)
 43d:	75 2c                	jne    46b <printf+0x6a>
      if(c == '%'){
 43f:	83 7d e4 25          	cmpl   $0x25,-0x1c(%ebp)
 443:	75 0c                	jne    451 <printf+0x50>
        state = '%';
 445:	c7 45 ec 25 00 00 00 	movl   $0x25,-0x14(%ebp)
 44c:	e9 27 01 00 00       	jmp    578 <printf+0x177>
      } else {
        putc(fd, c);
 451:	8b 45 e4             	mov    -0x1c(%ebp),%eax
 454:	0f be c0             	movsbl %al,%eax
 457:	83 ec 08             	sub    $0x8,%esp
 45a:	50                   	push   %eax
 45b:	ff 75 08             	pushl  0x8(%ebp)
 45e:	e8 c7 fe ff ff       	call   32a <putc>
 463:	83 c4 10             	add    $0x10,%esp
 466:	e9 0d 01 00 00       	jmp    578 <printf+0x177>
      }
    } else if(state == '%'){
 46b:	83 7d ec 25          	cmpl   $0x25,-0x14(%ebp)
 46f:	0f 85 03 01 00 00    	jne    578 <printf+0x177>
      if(c == 'd'){
 475:	83 7d e4 64          	cmpl   $0x64,-0x1c(%ebp)
 479:	75 1e                	jne    499 <printf+0x98>
        printint(fd, *ap, 10, 1);
 47b:	8b 45 e8             	mov    -0x18(%ebp),%eax
 47e:	8b 00                	mov    (%eax),%eax
 480:	6a 01                	push   $0x1
 482:	6a 0a                	push   $0xa
 484:	50                   	push   %eax
 485:	ff 75 08             	pushl  0x8(%ebp)
 488:	e8 c0 fe ff ff       	call   34d <printint>
 48d:	83 c4 10             	add    $0x10,%esp
        ap++;
 490:	83 45 e8 04          	addl   $0x4,-0x18(%ebp)
 494:	e9 d8 00 00 00       	jmp    571 <printf+0x170>
      } else if(c == 'x' || c == 'p'){
 499:	83 7d e4 78          	cmpl   $0x78,-0x1c(%ebp)
 49d:	74 06                	je     4a5 <printf+0xa4>
 49f:	83 7d e4 70          	cmpl   $0x70,-0x1c(%ebp)
 4a3:	75 1e                	jne    4c3 <printf+0xc2>
        printint(fd, *ap, 16, 0);
 4a5:	8b 45 e8             	mov    -0x18(%ebp),%eax
 4a8:	8b 00                	mov    (%eax),%eax
 4aa:	6a 00                	push   $0x0
 4ac:	6a 10                	push   $0x10
 4ae:	50                   	push   %eax
 4af:	ff 75 08             	pushl  0x8(%ebp)
 4b2:	e8 96 fe ff ff       	call   34d <printint>
 4b7:	83 c4 10             	add    $0x10,%esp
        ap++;
 4ba:	83 45 e8 04          	addl   $0x4,-0x18(%ebp)
 4be:	e9 ae 00 00 00       	jmp    571 <printf+0x170>
      } else if(c == 's'){
 4c3:	83 7d e4 73          	cmpl   $0x73,-0x1c(%ebp)
 4c7:	75 43                	jne    50c <printf+0x10b>
        s = (char*)*ap;
 4c9:	8b 45 e8             	mov    -0x18(%ebp),%eax
 4cc:	8b 00                	mov    (%eax),%eax
 4ce:	89 45 f4             	mov    %eax,-0xc(%ebp)
        ap++;
 4d1:	83 45 e8 04          	addl   $0x4,-0x18(%ebp)
        if(s == 0)
 4d5:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
 4d9:	75 25                	jne    500 <printf+0xff>
          s = "(null)";
 4db:	c7 45 f4 b7 07 00 00 	movl   $0x7b7,-0xc(%ebp)
        while(*s != 0){
 4e2:	eb 1c                	jmp    500 <printf+0xff>
          putc(fd, *s);
 4e4:	8b 45 f4             	mov    -0xc(%ebp),%eax
 4e7:	0f b6 00             	movzbl (%eax),%eax
 4ea:	0f be c0             	movsbl %al,%eax
 4ed:	83 ec 08             	sub    $0x8,%esp
 4f0:	50                   	push   %eax
 4f1:	ff 75 08             	pushl  0x8(%ebp)
 4f4:	e8 31 fe ff ff       	call   32a <putc>
 4f9:	83 c4 10             	add    $0x10,%esp
          s++;
 4fc:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
      } else if(c == 's'){
        s = (char*)*ap;
        ap++;
        if(s == 0)
          s = "(null)";
        while(*s != 0){
 500:	8b 45 f4             	mov    -0xc(%ebp),%eax
 503:	0f b6 00             	movzbl (%eax),%eax
 506:	84 c0                	test   %al,%al
 508:	75 da                	jne    4e4 <printf+0xe3>
 50a:	eb 65                	jmp    571 <printf+0x170>
          putc(fd, *s);
          s++;
        }
      } else if(c == 'c'){
 50c:	83 7d e4 63          	cmpl   $0x63,-0x1c(%ebp)
 510:	75 1d                	jne    52f <printf+0x12e>
        putc(fd, *ap);
 512:	8b 45 e8             	mov    -0x18(%ebp),%eax
 515:	8b 00                	mov    (%eax),%eax
 517:	0f be c0             	movsbl %al,%eax
 51a:	83 ec 08             	sub    $0x8,%esp
 51d:	50                   	push   %eax
 51e:	ff 75 08             	pushl  0x8(%ebp)
 521:	e8 04 fe ff ff       	call   32a <putc>
 526:	83 c4 10             	add    $0x10,%esp
        ap++;
 529:	83 45 e8 04          	addl   $0x4,-0x18(%ebp)
 52d:	eb 42                	jmp    571 <printf+0x170>
      } else if(c == '%'){
 52f:	83 7d e4 25          	cmpl   $0x25,-0x1c(%ebp)
 533:	75 17                	jne    54c <printf+0x14b>
        putc(fd, c);
 535:	8b 45 e4             	mov    -0x1c(%ebp),%eax
 538:	0f be c0             	movsbl %al,%eax
 53b:	83 ec 08             	sub    $0x8,%esp
 53e:	50                   	push   %eax
 53f:	ff 75 08             	pushl  0x8(%ebp)
 542:	e8 e3 fd ff ff       	call   32a <putc>
 547:	83 c4 10             	add    $0x10,%esp
 54a:	eb 25                	jmp    571 <printf+0x170>
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
 54c:	83 ec 08             	sub    $0x8,%esp
 54f:	6a 25                	push   $0x25
 551:	ff 75 08             	pushl  0x8(%ebp)
 554:	e8 d1 fd ff ff       	call   32a <putc>
 559:	83 c4 10             	add    $0x10,%esp
        putc(fd, c);
 55c:	8b 45 e4             	mov    -0x1c(%ebp),%eax
 55f:	0f be c0             	movsbl %al,%eax
 562:	83 ec 08             	sub    $0x8,%esp
 565:	50                   	push   %eax
 566:	ff 75 08             	pushl  0x8(%ebp)
 569:	e8 bc fd ff ff       	call   32a <putc>
 56e:	83 c4 10             	add    $0x10,%esp
      }
      state = 0;
 571:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
 578:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)
 57c:	8b 55 0c             	mov    0xc(%ebp),%edx
 57f:	8b 45 f0             	mov    -0x10(%ebp),%eax
 582:	01 d0                	add    %edx,%eax
 584:	0f b6 00             	movzbl (%eax),%eax
 587:	84 c0                	test   %al,%al
 589:	0f 85 94 fe ff ff    	jne    423 <printf+0x22>
        putc(fd, c);
      }
      state = 0;
    }
  }
}
 58f:	90                   	nop
 590:	c9                   	leave  
 591:	c3                   	ret    

00000592 <free>:
static Header base;
static Header *freep;

void
free(void *ap)
{
 592:	55                   	push   %ebp
 593:	89 e5                	mov    %esp,%ebp
 595:	83 ec 10             	sub    $0x10,%esp
  Header *bp, *p;

  bp = (Header*)ap - 1;
 598:	8b 45 08             	mov    0x8(%ebp),%eax
 59b:	83 e8 08             	sub    $0x8,%eax
 59e:	89 45 f8             	mov    %eax,-0x8(%ebp)
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 5a1:	a1 24 0a 00 00       	mov    0xa24,%eax
 5a6:	89 45 fc             	mov    %eax,-0x4(%ebp)
 5a9:	eb 24                	jmp    5cf <free+0x3d>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 5ab:	8b 45 fc             	mov    -0x4(%ebp),%eax
 5ae:	8b 00                	mov    (%eax),%eax
 5b0:	3b 45 fc             	cmp    -0x4(%ebp),%eax
 5b3:	77 12                	ja     5c7 <free+0x35>
 5b5:	8b 45 f8             	mov    -0x8(%ebp),%eax
 5b8:	3b 45 fc             	cmp    -0x4(%ebp),%eax
 5bb:	77 24                	ja     5e1 <free+0x4f>
 5bd:	8b 45 fc             	mov    -0x4(%ebp),%eax
 5c0:	8b 00                	mov    (%eax),%eax
 5c2:	3b 45 f8             	cmp    -0x8(%ebp),%eax
 5c5:	77 1a                	ja     5e1 <free+0x4f>
free(void *ap)
{
  Header *bp, *p;

  bp = (Header*)ap - 1;
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 5c7:	8b 45 fc             	mov    -0x4(%ebp),%eax
 5ca:	8b 00                	mov    (%eax),%eax
 5cc:	89 45 fc             	mov    %eax,-0x4(%ebp)
 5cf:	8b 45 f8             	mov    -0x8(%ebp),%eax
 5d2:	3b 45 fc             	cmp    -0x4(%ebp),%eax
 5d5:	76 d4                	jbe    5ab <free+0x19>
 5d7:	8b 45 fc             	mov    -0x4(%ebp),%eax
 5da:	8b 00                	mov    (%eax),%eax
 5dc:	3b 45 f8             	cmp    -0x8(%ebp),%eax
 5df:	76 ca                	jbe    5ab <free+0x19>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
      break;
  if(bp + bp->s.size == p->s.ptr){
 5e1:	8b 45 f8             	mov    -0x8(%ebp),%eax
 5e4:	8b 40 04             	mov    0x4(%eax),%eax
 5e7:	8d 14 c5 00 00 00 00 	lea    0x0(,%eax,8),%edx
 5ee:	8b 45 f8             	mov    -0x8(%ebp),%eax
 5f1:	01 c2                	add    %eax,%edx
 5f3:	8b 45 fc             	mov    -0x4(%ebp),%eax
 5f6:	8b 00                	mov    (%eax),%eax
 5f8:	39 c2                	cmp    %eax,%edx
 5fa:	75 24                	jne    620 <free+0x8e>
    bp->s.size += p->s.ptr->s.size;
 5fc:	8b 45 f8             	mov    -0x8(%ebp),%eax
 5ff:	8b 50 04             	mov    0x4(%eax),%edx
 602:	8b 45 fc             	mov    -0x4(%ebp),%eax
 605:	8b 00                	mov    (%eax),%eax
 607:	8b 40 04             	mov    0x4(%eax),%eax
 60a:	01 c2                	add    %eax,%edx
 60c:	8b 45 f8             	mov    -0x8(%ebp),%eax
 60f:	89 50 04             	mov    %edx,0x4(%eax)
    bp->s.ptr = p->s.ptr->s.ptr;
 612:	8b 45 fc             	mov    -0x4(%ebp),%eax
 615:	8b 00                	mov    (%eax),%eax
 617:	8b 10                	mov    (%eax),%edx
 619:	8b 45 f8             	mov    -0x8(%ebp),%eax
 61c:	89 10                	mov    %edx,(%eax)
 61e:	eb 0a                	jmp    62a <free+0x98>
  } else
    bp->s.ptr = p->s.ptr;
 620:	8b 45 fc             	mov    -0x4(%ebp),%eax
 623:	8b 10                	mov    (%eax),%edx
 625:	8b 45 f8             	mov    -0x8(%ebp),%eax
 628:	89 10                	mov    %edx,(%eax)
  if(p + p->s.size == bp){
 62a:	8b 45 fc             	mov    -0x4(%ebp),%eax
 62d:	8b 40 04             	mov    0x4(%eax),%eax
 630:	8d 14 c5 00 00 00 00 	lea    0x0(,%eax,8),%edx
 637:	8b 45 fc             	mov    -0x4(%ebp),%eax
 63a:	01 d0                	add    %edx,%eax
 63c:	3b 45 f8             	cmp    -0x8(%ebp),%eax
 63f:	75 20                	jne    661 <free+0xcf>
    p->s.size += bp->s.size;
 641:	8b 45 fc             	mov    -0x4(%ebp),%eax
 644:	8b 50 04             	mov    0x4(%eax),%edx
 647:	8b 45 f8             	mov    -0x8(%ebp),%eax
 64a:	8b 40 04             	mov    0x4(%eax),%eax
 64d:	01 c2                	add    %eax,%edx
 64f:	8b 45 fc             	mov    -0x4(%ebp),%eax
 652:	89 50 04             	mov    %edx,0x4(%eax)
    p->s.ptr = bp->s.ptr;
 655:	8b 45 f8             	mov    -0x8(%ebp),%eax
 658:	8b 10                	mov    (%eax),%edx
 65a:	8b 45 fc             	mov    -0x4(%ebp),%eax
 65d:	89 10                	mov    %edx,(%eax)
 65f:	eb 08                	jmp    669 <free+0xd7>
  } else
    p->s.ptr = bp;
 661:	8b 45 fc             	mov    -0x4(%ebp),%eax
 664:	8b 55 f8             	mov    -0x8(%ebp),%edx
 667:	89 10                	mov    %edx,(%eax)
  freep = p;
 669:	8b 45 fc             	mov    -0x4(%ebp),%eax
 66c:	a3 24 0a 00 00       	mov    %eax,0xa24
}
 671:	90                   	nop
 672:	c9                   	leave  
 673:	c3                   	ret    

00000674 <morecore>:

static Header*
morecore(uint nu)
{
 674:	55                   	push   %ebp
 675:	89 e5                	mov    %esp,%ebp
 677:	83 ec 18             	sub    $0x18,%esp
  char *p;
  Header *hp;

  if(nu < 4096)
 67a:	81 7d 08 ff 0f 00 00 	cmpl   $0xfff,0x8(%ebp)
 681:	77 07                	ja     68a <morecore+0x16>
    nu = 4096;
 683:	c7 45 08 00 10 00 00 	movl   $0x1000,0x8(%ebp)
  p = sbrk(nu * sizeof(Header));
 68a:	8b 45 08             	mov    0x8(%ebp),%eax
 68d:	c1 e0 03             	shl    $0x3,%eax
 690:	83 ec 0c             	sub    $0xc,%esp
 693:	50                   	push   %eax
 694:	e8 69 fc ff ff       	call   302 <sbrk>
 699:	83 c4 10             	add    $0x10,%esp
 69c:	89 45 f4             	mov    %eax,-0xc(%ebp)
  if(p == (char*)-1)
 69f:	83 7d f4 ff          	cmpl   $0xffffffff,-0xc(%ebp)
 6a3:	75 07                	jne    6ac <morecore+0x38>
    return 0;
 6a5:	b8 00 00 00 00       	mov    $0x0,%eax
 6aa:	eb 26                	jmp    6d2 <morecore+0x5e>
  hp = (Header*)p;
 6ac:	8b 45 f4             	mov    -0xc(%ebp),%eax
 6af:	89 45 f0             	mov    %eax,-0x10(%ebp)
  hp->s.size = nu;
 6b2:	8b 45 f0             	mov    -0x10(%ebp),%eax
 6b5:	8b 55 08             	mov    0x8(%ebp),%edx
 6b8:	89 50 04             	mov    %edx,0x4(%eax)
  free((void*)(hp + 1));
 6bb:	8b 45 f0             	mov    -0x10(%ebp),%eax
 6be:	83 c0 08             	add    $0x8,%eax
 6c1:	83 ec 0c             	sub    $0xc,%esp
 6c4:	50                   	push   %eax
 6c5:	e8 c8 fe ff ff       	call   592 <free>
 6ca:	83 c4 10             	add    $0x10,%esp
  return freep;
 6cd:	a1 24 0a 00 00       	mov    0xa24,%eax
}
 6d2:	c9                   	leave  
 6d3:	c3                   	ret    

000006d4 <malloc>:

void*
malloc(uint nbytes)
{
 6d4:	55                   	push   %ebp
 6d5:	89 e5                	mov    %esp,%ebp
 6d7:	83 ec 18             	sub    $0x18,%esp
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
 6da:	8b 45 08             	mov    0x8(%ebp),%eax
 6dd:	83 c0 07             	add    $0x7,%eax
 6e0:	c1 e8 03             	shr    $0x3,%eax
 6e3:	83 c0 01             	add    $0x1,%eax
 6e6:	89 45 ec             	mov    %eax,-0x14(%ebp)
  if((prevp = freep) == 0){
 6e9:	a1 24 0a 00 00       	mov    0xa24,%eax
 6ee:	89 45 f0             	mov    %eax,-0x10(%ebp)
 6f1:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
 6f5:	75 23                	jne    71a <malloc+0x46>
    base.s.ptr = freep = prevp = &base;
 6f7:	c7 45 f0 1c 0a 00 00 	movl   $0xa1c,-0x10(%ebp)
 6fe:	8b 45 f0             	mov    -0x10(%ebp),%eax
 701:	a3 24 0a 00 00       	mov    %eax,0xa24
 706:	a1 24 0a 00 00       	mov    0xa24,%eax
 70b:	a3 1c 0a 00 00       	mov    %eax,0xa1c
    base.s.size = 0;
 710:	c7 05 20 0a 00 00 00 	movl   $0x0,0xa20
 717:	00 00 00 
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 71a:	8b 45 f0             	mov    -0x10(%ebp),%eax
 71d:	8b 00                	mov    (%eax),%eax
 71f:	89 45 f4             	mov    %eax,-0xc(%ebp)
    if(p->s.size >= nunits){
 722:	8b 45 f4             	mov    -0xc(%ebp),%eax
 725:	8b 40 04             	mov    0x4(%eax),%eax
 728:	3b 45 ec             	cmp    -0x14(%ebp),%eax
 72b:	72 4d                	jb     77a <malloc+0xa6>
      if(p->s.size == nunits)
 72d:	8b 45 f4             	mov    -0xc(%ebp),%eax
 730:	8b 40 04             	mov    0x4(%eax),%eax
 733:	3b 45 ec             	cmp    -0x14(%ebp),%eax
 736:	75 0c                	jne    744 <malloc+0x70>
        prevp->s.ptr = p->s.ptr;
 738:	8b 45 f4             	mov    -0xc(%ebp),%eax
 73b:	8b 10                	mov    (%eax),%edx
 73d:	8b 45 f0             	mov    -0x10(%ebp),%eax
 740:	89 10                	mov    %edx,(%eax)
 742:	eb 26                	jmp    76a <malloc+0x96>
      else {
        p->s.size -= nunits;
 744:	8b 45 f4             	mov    -0xc(%ebp),%eax
 747:	8b 40 04             	mov    0x4(%eax),%eax
 74a:	2b 45 ec             	sub    -0x14(%ebp),%eax
 74d:	89 c2                	mov    %eax,%edx
 74f:	8b 45 f4             	mov    -0xc(%ebp),%eax
 752:	89 50 04             	mov    %edx,0x4(%eax)
        p += p->s.size;
 755:	8b 45 f4             	mov    -0xc(%ebp),%eax
 758:	8b 40 04             	mov    0x4(%eax),%eax
 75b:	c1 e0 03             	shl    $0x3,%eax
 75e:	01 45 f4             	add    %eax,-0xc(%ebp)
        p->s.size = nunits;
 761:	8b 45 f4             	mov    -0xc(%ebp),%eax
 764:	8b 55 ec             	mov    -0x14(%ebp),%edx
 767:	89 50 04             	mov    %edx,0x4(%eax)
      }
      freep = prevp;
 76a:	8b 45 f0             	mov    -0x10(%ebp),%eax
 76d:	a3 24 0a 00 00       	mov    %eax,0xa24
      return (void*)(p + 1);
 772:	8b 45 f4             	mov    -0xc(%ebp),%eax
 775:	83 c0 08             	add    $0x8,%eax
 778:	eb 3b                	jmp    7b5 <malloc+0xe1>
    }
    if(p == freep)
 77a:	a1 24 0a 00 00       	mov    0xa24,%eax
 77f:	39 45 f4             	cmp    %eax,-0xc(%ebp)
 782:	75 1e                	jne    7a2 <malloc+0xce>
      if((p = morecore(nunits)) == 0)
 784:	83 ec 0c             	sub    $0xc,%esp
 787:	ff 75 ec             	pushl  -0x14(%ebp)
 78a:	e8 e5 fe ff ff       	call   674 <morecore>
 78f:	83 c4 10             	add    $0x10,%esp
 792:	89 45 f4             	mov    %eax,-0xc(%ebp)
 795:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
 799:	75 07                	jne    7a2 <malloc+0xce>
        return 0;
 79b:	b8 00 00 00 00       	mov    $0x0,%eax
 7a0:	eb 13                	jmp    7b5 <malloc+0xe1>
  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
  if((prevp = freep) == 0){
    base.s.ptr = freep = prevp = &base;
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 7a2:	8b 45 f4             	mov    -0xc(%ebp),%eax
 7a5:	89 45 f0             	mov    %eax,-0x10(%ebp)
 7a8:	8b 45 f4             	mov    -0xc(%ebp),%eax
 7ab:	8b 00                	mov    (%eax),%eax
 7ad:	89 45 f4             	mov    %eax,-0xc(%ebp)
      return (void*)(p + 1);
    }
    if(p == freep)
      if((p = morecore(nunits)) == 0)
        return 0;
  }
 7b0:	e9 6d ff ff ff       	jmp    722 <malloc+0x4e>
}
 7b5:	c9                   	leave  
 7b6:	c3                   	ret    

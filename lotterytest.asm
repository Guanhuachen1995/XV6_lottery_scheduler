
_lotterytest:     file format elf32-i386


Disassembly of section .text:

00000000 <spin>:
#include "types.h"
#include "user.h"
#include "date.h"
// Do some useless computations
void spin(int tix) {
   0:	55                   	push   %ebp
   1:	89 e5                	mov    %esp,%ebp
   3:	83 ec 28             	sub    $0x28,%esp
    struct rtcdate end;
    unsigned x = 0;
   6:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
    unsigned y = 0;
   d:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
    while (x < 100000) { // Changed from 100000
  14:	eb 1a                	jmp    30 <spin+0x30>
        y = 0;
  16:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
        while (y < 10000) {
  1d:	eb 04                	jmp    23 <spin+0x23>
            y++;
  1f:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)
    struct rtcdate end;
    unsigned x = 0;
    unsigned y = 0;
    while (x < 100000) { // Changed from 100000
        y = 0;
        while (y < 10000) {
  23:	81 7d f0 0f 27 00 00 	cmpl   $0x270f,-0x10(%ebp)
  2a:	76 f3                	jbe    1f <spin+0x1f>
            y++;
        }
        x++;
  2c:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
// Do some useless computations
void spin(int tix) {
    struct rtcdate end;
    unsigned x = 0;
    unsigned y = 0;
    while (x < 100000) { // Changed from 100000
  30:	81 7d f4 9f 86 01 00 	cmpl   $0x1869f,-0xc(%ebp)
  37:	76 dd                	jbe    16 <spin+0x16>
            y++;
        }
        x++;
    }

    gettime(&end);
  39:	83 ec 0c             	sub    $0xc,%esp
  3c:	8d 45 d8             	lea    -0x28(%ebp),%eax
  3f:	50                   	push   %eax
  40:	e8 b0 03 00 00       	call   3f5 <gettime>
  45:	83 c4 10             	add    $0x10,%esp
    printf(0, "spin with %d tickets ended at %d hours %d minutes %d seconds\n", tix, end.hour, end.minute, end.second);
  48:	8b 4d d8             	mov    -0x28(%ebp),%ecx
  4b:	8b 55 dc             	mov    -0x24(%ebp),%edx
  4e:	8b 45 e0             	mov    -0x20(%ebp),%eax
  51:	83 ec 08             	sub    $0x8,%esp
  54:	51                   	push   %ecx
  55:	52                   	push   %edx
  56:	50                   	push   %eax
  57:	ff 75 08             	pushl  0x8(%ebp)
  5a:	68 8c 08 00 00       	push   $0x88c
  5f:	6a 00                	push   $0x0
  61:	e8 6e 04 00 00       	call   4d4 <printf>
  66:	83 c4 20             	add    $0x20,%esp
}
  69:	90                   	nop
  6a:	c9                   	leave  
  6b:	c3                   	ret    

0000006c <main>:

int main() {
  6c:	8d 4c 24 04          	lea    0x4(%esp),%ecx
  70:	83 e4 f0             	and    $0xfffffff0,%esp
  73:	ff 71 fc             	pushl  -0x4(%ecx)
  76:	55                   	push   %ebp
  77:	89 e5                	mov    %esp,%ebp
  79:	51                   	push   %ecx
  7a:	83 ec 24             	sub    $0x24,%esp
    int pid1;
    struct rtcdate start;
    gettime(&start);
  7d:	83 ec 0c             	sub    $0xc,%esp
  80:	8d 45 dc             	lea    -0x24(%ebp),%eax
  83:	50                   	push   %eax
  84:	e8 6c 03 00 00       	call   3f5 <gettime>
  89:	83 c4 10             	add    $0x10,%esp
    printf(0, "starting test at %d hours %d minutes %d seconds\n", start.hour, start.minute, start.second);
  8c:	8b 4d dc             	mov    -0x24(%ebp),%ecx
  8f:	8b 55 e0             	mov    -0x20(%ebp),%edx
  92:	8b 45 e4             	mov    -0x1c(%ebp),%eax
  95:	83 ec 0c             	sub    $0xc,%esp
  98:	51                   	push   %ecx
  99:	52                   	push   %edx
  9a:	50                   	push   %eax
  9b:	68 cc 08 00 00       	push   $0x8cc
  a0:	6a 00                	push   $0x0
  a2:	e8 2d 04 00 00       	call   4d4 <printf>
  a7:	83 c4 20             	add    $0x20,%esp
    if ((pid1 = fork()) == 0) {
  aa:	e8 96 02 00 00       	call   345 <fork>
  af:	89 45 f4             	mov    %eax,-0xc(%ebp)
  b2:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
  b6:	75 1f                	jne    d7 <main+0x6b>
        settickets(20);
  b8:	83 ec 0c             	sub    $0xc,%esp
  bb:	6a 14                	push   $0x14
  bd:	e8 2b 03 00 00       	call   3ed <settickets>
  c2:	83 c4 10             	add    $0x10,%esp
        spin(20);
  c5:	83 ec 0c             	sub    $0xc,%esp
  c8:	6a 14                	push   $0x14
  ca:	e8 31 ff ff ff       	call   0 <spin>
  cf:	83 c4 10             	add    $0x10,%esp
        exit();
  d2:	e8 76 02 00 00       	call   34d <exit>
    }
    else {
        settickets(80);
  d7:	83 ec 0c             	sub    $0xc,%esp
  da:	6a 50                	push   $0x50
  dc:	e8 0c 03 00 00       	call   3ed <settickets>
  e1:	83 c4 10             	add    $0x10,%esp
        spin(80);
  e4:	83 ec 0c             	sub    $0xc,%esp
  e7:	6a 50                	push   $0x50
  e9:	e8 12 ff ff ff       	call   0 <spin>
  ee:	83 c4 10             	add    $0x10,%esp
        exit();
  f1:	e8 57 02 00 00       	call   34d <exit>

000000f6 <stosb>:
               "cc");
}

static inline void
stosb(void *addr, int data, int cnt)
{
  f6:	55                   	push   %ebp
  f7:	89 e5                	mov    %esp,%ebp
  f9:	57                   	push   %edi
  fa:	53                   	push   %ebx
  asm volatile("cld; rep stosb" :
  fb:	8b 4d 08             	mov    0x8(%ebp),%ecx
  fe:	8b 55 10             	mov    0x10(%ebp),%edx
 101:	8b 45 0c             	mov    0xc(%ebp),%eax
 104:	89 cb                	mov    %ecx,%ebx
 106:	89 df                	mov    %ebx,%edi
 108:	89 d1                	mov    %edx,%ecx
 10a:	fc                   	cld    
 10b:	f3 aa                	rep stos %al,%es:(%edi)
 10d:	89 ca                	mov    %ecx,%edx
 10f:	89 fb                	mov    %edi,%ebx
 111:	89 5d 08             	mov    %ebx,0x8(%ebp)
 114:	89 55 10             	mov    %edx,0x10(%ebp)
               "=D" (addr), "=c" (cnt) :
               "0" (addr), "1" (cnt), "a" (data) :
               "memory", "cc");
}
 117:	90                   	nop
 118:	5b                   	pop    %ebx
 119:	5f                   	pop    %edi
 11a:	5d                   	pop    %ebp
 11b:	c3                   	ret    

0000011c <strcpy>:
#include "user.h"
#include "x86.h"

char*
strcpy(char *s, char *t)
{
 11c:	55                   	push   %ebp
 11d:	89 e5                	mov    %esp,%ebp
 11f:	83 ec 10             	sub    $0x10,%esp
  char *os;

  os = s;
 122:	8b 45 08             	mov    0x8(%ebp),%eax
 125:	89 45 fc             	mov    %eax,-0x4(%ebp)
  while((*s++ = *t++) != 0)
 128:	90                   	nop
 129:	8b 45 08             	mov    0x8(%ebp),%eax
 12c:	8d 50 01             	lea    0x1(%eax),%edx
 12f:	89 55 08             	mov    %edx,0x8(%ebp)
 132:	8b 55 0c             	mov    0xc(%ebp),%edx
 135:	8d 4a 01             	lea    0x1(%edx),%ecx
 138:	89 4d 0c             	mov    %ecx,0xc(%ebp)
 13b:	0f b6 12             	movzbl (%edx),%edx
 13e:	88 10                	mov    %dl,(%eax)
 140:	0f b6 00             	movzbl (%eax),%eax
 143:	84 c0                	test   %al,%al
 145:	75 e2                	jne    129 <strcpy+0xd>
    ;
  return os;
 147:	8b 45 fc             	mov    -0x4(%ebp),%eax
}
 14a:	c9                   	leave  
 14b:	c3                   	ret    

0000014c <strcmp>:

int
strcmp(const char *p, const char *q)
{
 14c:	55                   	push   %ebp
 14d:	89 e5                	mov    %esp,%ebp
  while(*p && *p == *q)
 14f:	eb 08                	jmp    159 <strcmp+0xd>
    p++, q++;
 151:	83 45 08 01          	addl   $0x1,0x8(%ebp)
 155:	83 45 0c 01          	addl   $0x1,0xc(%ebp)
}

int
strcmp(const char *p, const char *q)
{
  while(*p && *p == *q)
 159:	8b 45 08             	mov    0x8(%ebp),%eax
 15c:	0f b6 00             	movzbl (%eax),%eax
 15f:	84 c0                	test   %al,%al
 161:	74 10                	je     173 <strcmp+0x27>
 163:	8b 45 08             	mov    0x8(%ebp),%eax
 166:	0f b6 10             	movzbl (%eax),%edx
 169:	8b 45 0c             	mov    0xc(%ebp),%eax
 16c:	0f b6 00             	movzbl (%eax),%eax
 16f:	38 c2                	cmp    %al,%dl
 171:	74 de                	je     151 <strcmp+0x5>
    p++, q++;
  return (uchar)*p - (uchar)*q;
 173:	8b 45 08             	mov    0x8(%ebp),%eax
 176:	0f b6 00             	movzbl (%eax),%eax
 179:	0f b6 d0             	movzbl %al,%edx
 17c:	8b 45 0c             	mov    0xc(%ebp),%eax
 17f:	0f b6 00             	movzbl (%eax),%eax
 182:	0f b6 c0             	movzbl %al,%eax
 185:	29 c2                	sub    %eax,%edx
 187:	89 d0                	mov    %edx,%eax
}
 189:	5d                   	pop    %ebp
 18a:	c3                   	ret    

0000018b <strlen>:

uint
strlen(char *s)
{
 18b:	55                   	push   %ebp
 18c:	89 e5                	mov    %esp,%ebp
 18e:	83 ec 10             	sub    $0x10,%esp
  int n;

  for(n = 0; s[n]; n++)
 191:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%ebp)
 198:	eb 04                	jmp    19e <strlen+0x13>
 19a:	83 45 fc 01          	addl   $0x1,-0x4(%ebp)
 19e:	8b 55 fc             	mov    -0x4(%ebp),%edx
 1a1:	8b 45 08             	mov    0x8(%ebp),%eax
 1a4:	01 d0                	add    %edx,%eax
 1a6:	0f b6 00             	movzbl (%eax),%eax
 1a9:	84 c0                	test   %al,%al
 1ab:	75 ed                	jne    19a <strlen+0xf>
    ;
  return n;
 1ad:	8b 45 fc             	mov    -0x4(%ebp),%eax
}
 1b0:	c9                   	leave  
 1b1:	c3                   	ret    

000001b2 <memset>:

void*
memset(void *dst, int c, uint n)
{
 1b2:	55                   	push   %ebp
 1b3:	89 e5                	mov    %esp,%ebp
  stosb(dst, c, n);
 1b5:	8b 45 10             	mov    0x10(%ebp),%eax
 1b8:	50                   	push   %eax
 1b9:	ff 75 0c             	pushl  0xc(%ebp)
 1bc:	ff 75 08             	pushl  0x8(%ebp)
 1bf:	e8 32 ff ff ff       	call   f6 <stosb>
 1c4:	83 c4 0c             	add    $0xc,%esp
  return dst;
 1c7:	8b 45 08             	mov    0x8(%ebp),%eax
}
 1ca:	c9                   	leave  
 1cb:	c3                   	ret    

000001cc <strchr>:

char*
strchr(const char *s, char c)
{
 1cc:	55                   	push   %ebp
 1cd:	89 e5                	mov    %esp,%ebp
 1cf:	83 ec 04             	sub    $0x4,%esp
 1d2:	8b 45 0c             	mov    0xc(%ebp),%eax
 1d5:	88 45 fc             	mov    %al,-0x4(%ebp)
  for(; *s; s++)
 1d8:	eb 14                	jmp    1ee <strchr+0x22>
    if(*s == c)
 1da:	8b 45 08             	mov    0x8(%ebp),%eax
 1dd:	0f b6 00             	movzbl (%eax),%eax
 1e0:	3a 45 fc             	cmp    -0x4(%ebp),%al
 1e3:	75 05                	jne    1ea <strchr+0x1e>
      return (char*)s;
 1e5:	8b 45 08             	mov    0x8(%ebp),%eax
 1e8:	eb 13                	jmp    1fd <strchr+0x31>
}

char*
strchr(const char *s, char c)
{
  for(; *s; s++)
 1ea:	83 45 08 01          	addl   $0x1,0x8(%ebp)
 1ee:	8b 45 08             	mov    0x8(%ebp),%eax
 1f1:	0f b6 00             	movzbl (%eax),%eax
 1f4:	84 c0                	test   %al,%al
 1f6:	75 e2                	jne    1da <strchr+0xe>
    if(*s == c)
      return (char*)s;
  return 0;
 1f8:	b8 00 00 00 00       	mov    $0x0,%eax
}
 1fd:	c9                   	leave  
 1fe:	c3                   	ret    

000001ff <gets>:

char*
gets(char *buf, int max)
{
 1ff:	55                   	push   %ebp
 200:	89 e5                	mov    %esp,%ebp
 202:	83 ec 18             	sub    $0x18,%esp
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
 205:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
 20c:	eb 42                	jmp    250 <gets+0x51>
    cc = read(0, &c, 1);
 20e:	83 ec 04             	sub    $0x4,%esp
 211:	6a 01                	push   $0x1
 213:	8d 45 ef             	lea    -0x11(%ebp),%eax
 216:	50                   	push   %eax
 217:	6a 00                	push   $0x0
 219:	e8 47 01 00 00       	call   365 <read>
 21e:	83 c4 10             	add    $0x10,%esp
 221:	89 45 f0             	mov    %eax,-0x10(%ebp)
    if(cc < 1)
 224:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
 228:	7e 33                	jle    25d <gets+0x5e>
      break;
    buf[i++] = c;
 22a:	8b 45 f4             	mov    -0xc(%ebp),%eax
 22d:	8d 50 01             	lea    0x1(%eax),%edx
 230:	89 55 f4             	mov    %edx,-0xc(%ebp)
 233:	89 c2                	mov    %eax,%edx
 235:	8b 45 08             	mov    0x8(%ebp),%eax
 238:	01 c2                	add    %eax,%edx
 23a:	0f b6 45 ef          	movzbl -0x11(%ebp),%eax
 23e:	88 02                	mov    %al,(%edx)
    if(c == '\n' || c == '\r')
 240:	0f b6 45 ef          	movzbl -0x11(%ebp),%eax
 244:	3c 0a                	cmp    $0xa,%al
 246:	74 16                	je     25e <gets+0x5f>
 248:	0f b6 45 ef          	movzbl -0x11(%ebp),%eax
 24c:	3c 0d                	cmp    $0xd,%al
 24e:	74 0e                	je     25e <gets+0x5f>
gets(char *buf, int max)
{
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
 250:	8b 45 f4             	mov    -0xc(%ebp),%eax
 253:	83 c0 01             	add    $0x1,%eax
 256:	3b 45 0c             	cmp    0xc(%ebp),%eax
 259:	7c b3                	jl     20e <gets+0xf>
 25b:	eb 01                	jmp    25e <gets+0x5f>
    cc = read(0, &c, 1);
    if(cc < 1)
      break;
 25d:	90                   	nop
    buf[i++] = c;
    if(c == '\n' || c == '\r')
      break;
  }
  buf[i] = '\0';
 25e:	8b 55 f4             	mov    -0xc(%ebp),%edx
 261:	8b 45 08             	mov    0x8(%ebp),%eax
 264:	01 d0                	add    %edx,%eax
 266:	c6 00 00             	movb   $0x0,(%eax)
  return buf;
 269:	8b 45 08             	mov    0x8(%ebp),%eax
}
 26c:	c9                   	leave  
 26d:	c3                   	ret    

0000026e <stat>:

int
stat(char *n, struct stat *st)
{
 26e:	55                   	push   %ebp
 26f:	89 e5                	mov    %esp,%ebp
 271:	83 ec 18             	sub    $0x18,%esp
  int fd;
  int r;

  fd = open(n, O_RDONLY);
 274:	83 ec 08             	sub    $0x8,%esp
 277:	6a 00                	push   $0x0
 279:	ff 75 08             	pushl  0x8(%ebp)
 27c:	e8 0c 01 00 00       	call   38d <open>
 281:	83 c4 10             	add    $0x10,%esp
 284:	89 45 f4             	mov    %eax,-0xc(%ebp)
  if(fd < 0)
 287:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
 28b:	79 07                	jns    294 <stat+0x26>
    return -1;
 28d:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
 292:	eb 25                	jmp    2b9 <stat+0x4b>
  r = fstat(fd, st);
 294:	83 ec 08             	sub    $0x8,%esp
 297:	ff 75 0c             	pushl  0xc(%ebp)
 29a:	ff 75 f4             	pushl  -0xc(%ebp)
 29d:	e8 03 01 00 00       	call   3a5 <fstat>
 2a2:	83 c4 10             	add    $0x10,%esp
 2a5:	89 45 f0             	mov    %eax,-0x10(%ebp)
  close(fd);
 2a8:	83 ec 0c             	sub    $0xc,%esp
 2ab:	ff 75 f4             	pushl  -0xc(%ebp)
 2ae:	e8 c2 00 00 00       	call   375 <close>
 2b3:	83 c4 10             	add    $0x10,%esp
  return r;
 2b6:	8b 45 f0             	mov    -0x10(%ebp),%eax
}
 2b9:	c9                   	leave  
 2ba:	c3                   	ret    

000002bb <atoi>:

int
atoi(const char *s)
{
 2bb:	55                   	push   %ebp
 2bc:	89 e5                	mov    %esp,%ebp
 2be:	83 ec 10             	sub    $0x10,%esp
  int n;

  n = 0;
 2c1:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%ebp)
  while('0' <= *s && *s <= '9')
 2c8:	eb 25                	jmp    2ef <atoi+0x34>
    n = n*10 + *s++ - '0';
 2ca:	8b 55 fc             	mov    -0x4(%ebp),%edx
 2cd:	89 d0                	mov    %edx,%eax
 2cf:	c1 e0 02             	shl    $0x2,%eax
 2d2:	01 d0                	add    %edx,%eax
 2d4:	01 c0                	add    %eax,%eax
 2d6:	89 c1                	mov    %eax,%ecx
 2d8:	8b 45 08             	mov    0x8(%ebp),%eax
 2db:	8d 50 01             	lea    0x1(%eax),%edx
 2de:	89 55 08             	mov    %edx,0x8(%ebp)
 2e1:	0f b6 00             	movzbl (%eax),%eax
 2e4:	0f be c0             	movsbl %al,%eax
 2e7:	01 c8                	add    %ecx,%eax
 2e9:	83 e8 30             	sub    $0x30,%eax
 2ec:	89 45 fc             	mov    %eax,-0x4(%ebp)
atoi(const char *s)
{
  int n;

  n = 0;
  while('0' <= *s && *s <= '9')
 2ef:	8b 45 08             	mov    0x8(%ebp),%eax
 2f2:	0f b6 00             	movzbl (%eax),%eax
 2f5:	3c 2f                	cmp    $0x2f,%al
 2f7:	7e 0a                	jle    303 <atoi+0x48>
 2f9:	8b 45 08             	mov    0x8(%ebp),%eax
 2fc:	0f b6 00             	movzbl (%eax),%eax
 2ff:	3c 39                	cmp    $0x39,%al
 301:	7e c7                	jle    2ca <atoi+0xf>
    n = n*10 + *s++ - '0';
  return n;
 303:	8b 45 fc             	mov    -0x4(%ebp),%eax
}
 306:	c9                   	leave  
 307:	c3                   	ret    

00000308 <memmove>:

void*
memmove(void *vdst, void *vsrc, int n)
{
 308:	55                   	push   %ebp
 309:	89 e5                	mov    %esp,%ebp
 30b:	83 ec 10             	sub    $0x10,%esp
  char *dst, *src;
  
  dst = vdst;
 30e:	8b 45 08             	mov    0x8(%ebp),%eax
 311:	89 45 fc             	mov    %eax,-0x4(%ebp)
  src = vsrc;
 314:	8b 45 0c             	mov    0xc(%ebp),%eax
 317:	89 45 f8             	mov    %eax,-0x8(%ebp)
  while(n-- > 0)
 31a:	eb 17                	jmp    333 <memmove+0x2b>
    *dst++ = *src++;
 31c:	8b 45 fc             	mov    -0x4(%ebp),%eax
 31f:	8d 50 01             	lea    0x1(%eax),%edx
 322:	89 55 fc             	mov    %edx,-0x4(%ebp)
 325:	8b 55 f8             	mov    -0x8(%ebp),%edx
 328:	8d 4a 01             	lea    0x1(%edx),%ecx
 32b:	89 4d f8             	mov    %ecx,-0x8(%ebp)
 32e:	0f b6 12             	movzbl (%edx),%edx
 331:	88 10                	mov    %dl,(%eax)
{
  char *dst, *src;
  
  dst = vdst;
  src = vsrc;
  while(n-- > 0)
 333:	8b 45 10             	mov    0x10(%ebp),%eax
 336:	8d 50 ff             	lea    -0x1(%eax),%edx
 339:	89 55 10             	mov    %edx,0x10(%ebp)
 33c:	85 c0                	test   %eax,%eax
 33e:	7f dc                	jg     31c <memmove+0x14>
    *dst++ = *src++;
  return vdst;
 340:	8b 45 08             	mov    0x8(%ebp),%eax
}
 343:	c9                   	leave  
 344:	c3                   	ret    

00000345 <fork>:
  name: \
    movl $SYS_ ## name, %eax; \
    int $T_SYSCALL; \
    ret

SYSCALL(fork)
 345:	b8 01 00 00 00       	mov    $0x1,%eax
 34a:	cd 40                	int    $0x40
 34c:	c3                   	ret    

0000034d <exit>:
SYSCALL(exit)
 34d:	b8 02 00 00 00       	mov    $0x2,%eax
 352:	cd 40                	int    $0x40
 354:	c3                   	ret    

00000355 <wait>:
SYSCALL(wait)
 355:	b8 03 00 00 00       	mov    $0x3,%eax
 35a:	cd 40                	int    $0x40
 35c:	c3                   	ret    

0000035d <pipe>:
SYSCALL(pipe)
 35d:	b8 04 00 00 00       	mov    $0x4,%eax
 362:	cd 40                	int    $0x40
 364:	c3                   	ret    

00000365 <read>:
SYSCALL(read)
 365:	b8 05 00 00 00       	mov    $0x5,%eax
 36a:	cd 40                	int    $0x40
 36c:	c3                   	ret    

0000036d <write>:
SYSCALL(write)
 36d:	b8 10 00 00 00       	mov    $0x10,%eax
 372:	cd 40                	int    $0x40
 374:	c3                   	ret    

00000375 <close>:
SYSCALL(close)
 375:	b8 15 00 00 00       	mov    $0x15,%eax
 37a:	cd 40                	int    $0x40
 37c:	c3                   	ret    

0000037d <kill>:
SYSCALL(kill)
 37d:	b8 06 00 00 00       	mov    $0x6,%eax
 382:	cd 40                	int    $0x40
 384:	c3                   	ret    

00000385 <exec>:
SYSCALL(exec)
 385:	b8 07 00 00 00       	mov    $0x7,%eax
 38a:	cd 40                	int    $0x40
 38c:	c3                   	ret    

0000038d <open>:
SYSCALL(open)
 38d:	b8 0f 00 00 00       	mov    $0xf,%eax
 392:	cd 40                	int    $0x40
 394:	c3                   	ret    

00000395 <mknod>:
SYSCALL(mknod)
 395:	b8 11 00 00 00       	mov    $0x11,%eax
 39a:	cd 40                	int    $0x40
 39c:	c3                   	ret    

0000039d <unlink>:
SYSCALL(unlink)
 39d:	b8 12 00 00 00       	mov    $0x12,%eax
 3a2:	cd 40                	int    $0x40
 3a4:	c3                   	ret    

000003a5 <fstat>:
SYSCALL(fstat)
 3a5:	b8 08 00 00 00       	mov    $0x8,%eax
 3aa:	cd 40                	int    $0x40
 3ac:	c3                   	ret    

000003ad <link>:
SYSCALL(link)
 3ad:	b8 13 00 00 00       	mov    $0x13,%eax
 3b2:	cd 40                	int    $0x40
 3b4:	c3                   	ret    

000003b5 <mkdir>:
SYSCALL(mkdir)
 3b5:	b8 14 00 00 00       	mov    $0x14,%eax
 3ba:	cd 40                	int    $0x40
 3bc:	c3                   	ret    

000003bd <chdir>:
SYSCALL(chdir)
 3bd:	b8 09 00 00 00       	mov    $0x9,%eax
 3c2:	cd 40                	int    $0x40
 3c4:	c3                   	ret    

000003c5 <dup>:
SYSCALL(dup)
 3c5:	b8 0a 00 00 00       	mov    $0xa,%eax
 3ca:	cd 40                	int    $0x40
 3cc:	c3                   	ret    

000003cd <getpid>:
SYSCALL(getpid)
 3cd:	b8 0b 00 00 00       	mov    $0xb,%eax
 3d2:	cd 40                	int    $0x40
 3d4:	c3                   	ret    

000003d5 <sbrk>:
SYSCALL(sbrk)
 3d5:	b8 0c 00 00 00       	mov    $0xc,%eax
 3da:	cd 40                	int    $0x40
 3dc:	c3                   	ret    

000003dd <sleep>:
SYSCALL(sleep)
 3dd:	b8 0d 00 00 00       	mov    $0xd,%eax
 3e2:	cd 40                	int    $0x40
 3e4:	c3                   	ret    

000003e5 <uptime>:
SYSCALL(uptime)
 3e5:	b8 0e 00 00 00       	mov    $0xe,%eax
 3ea:	cd 40                	int    $0x40
 3ec:	c3                   	ret    

000003ed <settickets>:
SYSCALL(settickets)
 3ed:	b8 16 00 00 00       	mov    $0x16,%eax
 3f2:	cd 40                	int    $0x40
 3f4:	c3                   	ret    

000003f5 <gettime>:
 3f5:	b8 17 00 00 00       	mov    $0x17,%eax
 3fa:	cd 40                	int    $0x40
 3fc:	c3                   	ret    

000003fd <putc>:
#include "stat.h"
#include "user.h"

static void
putc(int fd, char c)
{
 3fd:	55                   	push   %ebp
 3fe:	89 e5                	mov    %esp,%ebp
 400:	83 ec 18             	sub    $0x18,%esp
 403:	8b 45 0c             	mov    0xc(%ebp),%eax
 406:	88 45 f4             	mov    %al,-0xc(%ebp)
  write(fd, &c, 1);
 409:	83 ec 04             	sub    $0x4,%esp
 40c:	6a 01                	push   $0x1
 40e:	8d 45 f4             	lea    -0xc(%ebp),%eax
 411:	50                   	push   %eax
 412:	ff 75 08             	pushl  0x8(%ebp)
 415:	e8 53 ff ff ff       	call   36d <write>
 41a:	83 c4 10             	add    $0x10,%esp
}
 41d:	90                   	nop
 41e:	c9                   	leave  
 41f:	c3                   	ret    

00000420 <printint>:

static void
printint(int fd, int xx, int base, int sgn)
{
 420:	55                   	push   %ebp
 421:	89 e5                	mov    %esp,%ebp
 423:	53                   	push   %ebx
 424:	83 ec 24             	sub    $0x24,%esp
  static char digits[] = "0123456789ABCDEF";
  char buf[16];
  int i, neg;
  uint x;

  neg = 0;
 427:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
  if(sgn && xx < 0){
 42e:	83 7d 14 00          	cmpl   $0x0,0x14(%ebp)
 432:	74 17                	je     44b <printint+0x2b>
 434:	83 7d 0c 00          	cmpl   $0x0,0xc(%ebp)
 438:	79 11                	jns    44b <printint+0x2b>
    neg = 1;
 43a:	c7 45 f0 01 00 00 00 	movl   $0x1,-0x10(%ebp)
    x = -xx;
 441:	8b 45 0c             	mov    0xc(%ebp),%eax
 444:	f7 d8                	neg    %eax
 446:	89 45 ec             	mov    %eax,-0x14(%ebp)
 449:	eb 06                	jmp    451 <printint+0x31>
  } else {
    x = xx;
 44b:	8b 45 0c             	mov    0xc(%ebp),%eax
 44e:	89 45 ec             	mov    %eax,-0x14(%ebp)
  }

  i = 0;
 451:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
  do{
    buf[i++] = digits[x % base];
 458:	8b 4d f4             	mov    -0xc(%ebp),%ecx
 45b:	8d 41 01             	lea    0x1(%ecx),%eax
 45e:	89 45 f4             	mov    %eax,-0xc(%ebp)
 461:	8b 5d 10             	mov    0x10(%ebp),%ebx
 464:	8b 45 ec             	mov    -0x14(%ebp),%eax
 467:	ba 00 00 00 00       	mov    $0x0,%edx
 46c:	f7 f3                	div    %ebx
 46e:	89 d0                	mov    %edx,%eax
 470:	0f b6 80 6c 0b 00 00 	movzbl 0xb6c(%eax),%eax
 477:	88 44 0d dc          	mov    %al,-0x24(%ebp,%ecx,1)
  }while((x /= base) != 0);
 47b:	8b 5d 10             	mov    0x10(%ebp),%ebx
 47e:	8b 45 ec             	mov    -0x14(%ebp),%eax
 481:	ba 00 00 00 00       	mov    $0x0,%edx
 486:	f7 f3                	div    %ebx
 488:	89 45 ec             	mov    %eax,-0x14(%ebp)
 48b:	83 7d ec 00          	cmpl   $0x0,-0x14(%ebp)
 48f:	75 c7                	jne    458 <printint+0x38>
  if(neg)
 491:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
 495:	74 2d                	je     4c4 <printint+0xa4>
    buf[i++] = '-';
 497:	8b 45 f4             	mov    -0xc(%ebp),%eax
 49a:	8d 50 01             	lea    0x1(%eax),%edx
 49d:	89 55 f4             	mov    %edx,-0xc(%ebp)
 4a0:	c6 44 05 dc 2d       	movb   $0x2d,-0x24(%ebp,%eax,1)

  while(--i >= 0)
 4a5:	eb 1d                	jmp    4c4 <printint+0xa4>
    putc(fd, buf[i]);
 4a7:	8d 55 dc             	lea    -0x24(%ebp),%edx
 4aa:	8b 45 f4             	mov    -0xc(%ebp),%eax
 4ad:	01 d0                	add    %edx,%eax
 4af:	0f b6 00             	movzbl (%eax),%eax
 4b2:	0f be c0             	movsbl %al,%eax
 4b5:	83 ec 08             	sub    $0x8,%esp
 4b8:	50                   	push   %eax
 4b9:	ff 75 08             	pushl  0x8(%ebp)
 4bc:	e8 3c ff ff ff       	call   3fd <putc>
 4c1:	83 c4 10             	add    $0x10,%esp
    buf[i++] = digits[x % base];
  }while((x /= base) != 0);
  if(neg)
    buf[i++] = '-';

  while(--i >= 0)
 4c4:	83 6d f4 01          	subl   $0x1,-0xc(%ebp)
 4c8:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
 4cc:	79 d9                	jns    4a7 <printint+0x87>
    putc(fd, buf[i]);
}
 4ce:	90                   	nop
 4cf:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 4d2:	c9                   	leave  
 4d3:	c3                   	ret    

000004d4 <printf>:

// Print to the given fd. Only understands %d, %x, %p, %s.
void
printf(int fd, char *fmt, ...)
{
 4d4:	55                   	push   %ebp
 4d5:	89 e5                	mov    %esp,%ebp
 4d7:	83 ec 28             	sub    $0x28,%esp
  char *s;
  int c, i, state;
  uint *ap;

  state = 0;
 4da:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
  ap = (uint*)(void*)&fmt + 1;
 4e1:	8d 45 0c             	lea    0xc(%ebp),%eax
 4e4:	83 c0 04             	add    $0x4,%eax
 4e7:	89 45 e8             	mov    %eax,-0x18(%ebp)
  for(i = 0; fmt[i]; i++){
 4ea:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
 4f1:	e9 59 01 00 00       	jmp    64f <printf+0x17b>
    c = fmt[i] & 0xff;
 4f6:	8b 55 0c             	mov    0xc(%ebp),%edx
 4f9:	8b 45 f0             	mov    -0x10(%ebp),%eax
 4fc:	01 d0                	add    %edx,%eax
 4fe:	0f b6 00             	movzbl (%eax),%eax
 501:	0f be c0             	movsbl %al,%eax
 504:	25 ff 00 00 00       	and    $0xff,%eax
 509:	89 45 e4             	mov    %eax,-0x1c(%ebp)
    if(state == 0){
 50c:	83 7d ec 00          	cmpl   $0x0,-0x14(%ebp)
 510:	75 2c                	jne    53e <printf+0x6a>
      if(c == '%'){
 512:	83 7d e4 25          	cmpl   $0x25,-0x1c(%ebp)
 516:	75 0c                	jne    524 <printf+0x50>
        state = '%';
 518:	c7 45 ec 25 00 00 00 	movl   $0x25,-0x14(%ebp)
 51f:	e9 27 01 00 00       	jmp    64b <printf+0x177>
      } else {
        putc(fd, c);
 524:	8b 45 e4             	mov    -0x1c(%ebp),%eax
 527:	0f be c0             	movsbl %al,%eax
 52a:	83 ec 08             	sub    $0x8,%esp
 52d:	50                   	push   %eax
 52e:	ff 75 08             	pushl  0x8(%ebp)
 531:	e8 c7 fe ff ff       	call   3fd <putc>
 536:	83 c4 10             	add    $0x10,%esp
 539:	e9 0d 01 00 00       	jmp    64b <printf+0x177>
      }
    } else if(state == '%'){
 53e:	83 7d ec 25          	cmpl   $0x25,-0x14(%ebp)
 542:	0f 85 03 01 00 00    	jne    64b <printf+0x177>
      if(c == 'd'){
 548:	83 7d e4 64          	cmpl   $0x64,-0x1c(%ebp)
 54c:	75 1e                	jne    56c <printf+0x98>
        printint(fd, *ap, 10, 1);
 54e:	8b 45 e8             	mov    -0x18(%ebp),%eax
 551:	8b 00                	mov    (%eax),%eax
 553:	6a 01                	push   $0x1
 555:	6a 0a                	push   $0xa
 557:	50                   	push   %eax
 558:	ff 75 08             	pushl  0x8(%ebp)
 55b:	e8 c0 fe ff ff       	call   420 <printint>
 560:	83 c4 10             	add    $0x10,%esp
        ap++;
 563:	83 45 e8 04          	addl   $0x4,-0x18(%ebp)
 567:	e9 d8 00 00 00       	jmp    644 <printf+0x170>
      } else if(c == 'x' || c == 'p'){
 56c:	83 7d e4 78          	cmpl   $0x78,-0x1c(%ebp)
 570:	74 06                	je     578 <printf+0xa4>
 572:	83 7d e4 70          	cmpl   $0x70,-0x1c(%ebp)
 576:	75 1e                	jne    596 <printf+0xc2>
        printint(fd, *ap, 16, 0);
 578:	8b 45 e8             	mov    -0x18(%ebp),%eax
 57b:	8b 00                	mov    (%eax),%eax
 57d:	6a 00                	push   $0x0
 57f:	6a 10                	push   $0x10
 581:	50                   	push   %eax
 582:	ff 75 08             	pushl  0x8(%ebp)
 585:	e8 96 fe ff ff       	call   420 <printint>
 58a:	83 c4 10             	add    $0x10,%esp
        ap++;
 58d:	83 45 e8 04          	addl   $0x4,-0x18(%ebp)
 591:	e9 ae 00 00 00       	jmp    644 <printf+0x170>
      } else if(c == 's'){
 596:	83 7d e4 73          	cmpl   $0x73,-0x1c(%ebp)
 59a:	75 43                	jne    5df <printf+0x10b>
        s = (char*)*ap;
 59c:	8b 45 e8             	mov    -0x18(%ebp),%eax
 59f:	8b 00                	mov    (%eax),%eax
 5a1:	89 45 f4             	mov    %eax,-0xc(%ebp)
        ap++;
 5a4:	83 45 e8 04          	addl   $0x4,-0x18(%ebp)
        if(s == 0)
 5a8:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
 5ac:	75 25                	jne    5d3 <printf+0xff>
          s = "(null)";
 5ae:	c7 45 f4 fd 08 00 00 	movl   $0x8fd,-0xc(%ebp)
        while(*s != 0){
 5b5:	eb 1c                	jmp    5d3 <printf+0xff>
          putc(fd, *s);
 5b7:	8b 45 f4             	mov    -0xc(%ebp),%eax
 5ba:	0f b6 00             	movzbl (%eax),%eax
 5bd:	0f be c0             	movsbl %al,%eax
 5c0:	83 ec 08             	sub    $0x8,%esp
 5c3:	50                   	push   %eax
 5c4:	ff 75 08             	pushl  0x8(%ebp)
 5c7:	e8 31 fe ff ff       	call   3fd <putc>
 5cc:	83 c4 10             	add    $0x10,%esp
          s++;
 5cf:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
      } else if(c == 's'){
        s = (char*)*ap;
        ap++;
        if(s == 0)
          s = "(null)";
        while(*s != 0){
 5d3:	8b 45 f4             	mov    -0xc(%ebp),%eax
 5d6:	0f b6 00             	movzbl (%eax),%eax
 5d9:	84 c0                	test   %al,%al
 5db:	75 da                	jne    5b7 <printf+0xe3>
 5dd:	eb 65                	jmp    644 <printf+0x170>
          putc(fd, *s);
          s++;
        }
      } else if(c == 'c'){
 5df:	83 7d e4 63          	cmpl   $0x63,-0x1c(%ebp)
 5e3:	75 1d                	jne    602 <printf+0x12e>
        putc(fd, *ap);
 5e5:	8b 45 e8             	mov    -0x18(%ebp),%eax
 5e8:	8b 00                	mov    (%eax),%eax
 5ea:	0f be c0             	movsbl %al,%eax
 5ed:	83 ec 08             	sub    $0x8,%esp
 5f0:	50                   	push   %eax
 5f1:	ff 75 08             	pushl  0x8(%ebp)
 5f4:	e8 04 fe ff ff       	call   3fd <putc>
 5f9:	83 c4 10             	add    $0x10,%esp
        ap++;
 5fc:	83 45 e8 04          	addl   $0x4,-0x18(%ebp)
 600:	eb 42                	jmp    644 <printf+0x170>
      } else if(c == '%'){
 602:	83 7d e4 25          	cmpl   $0x25,-0x1c(%ebp)
 606:	75 17                	jne    61f <printf+0x14b>
        putc(fd, c);
 608:	8b 45 e4             	mov    -0x1c(%ebp),%eax
 60b:	0f be c0             	movsbl %al,%eax
 60e:	83 ec 08             	sub    $0x8,%esp
 611:	50                   	push   %eax
 612:	ff 75 08             	pushl  0x8(%ebp)
 615:	e8 e3 fd ff ff       	call   3fd <putc>
 61a:	83 c4 10             	add    $0x10,%esp
 61d:	eb 25                	jmp    644 <printf+0x170>
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
 61f:	83 ec 08             	sub    $0x8,%esp
 622:	6a 25                	push   $0x25
 624:	ff 75 08             	pushl  0x8(%ebp)
 627:	e8 d1 fd ff ff       	call   3fd <putc>
 62c:	83 c4 10             	add    $0x10,%esp
        putc(fd, c);
 62f:	8b 45 e4             	mov    -0x1c(%ebp),%eax
 632:	0f be c0             	movsbl %al,%eax
 635:	83 ec 08             	sub    $0x8,%esp
 638:	50                   	push   %eax
 639:	ff 75 08             	pushl  0x8(%ebp)
 63c:	e8 bc fd ff ff       	call   3fd <putc>
 641:	83 c4 10             	add    $0x10,%esp
      }
      state = 0;
 644:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
 64b:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)
 64f:	8b 55 0c             	mov    0xc(%ebp),%edx
 652:	8b 45 f0             	mov    -0x10(%ebp),%eax
 655:	01 d0                	add    %edx,%eax
 657:	0f b6 00             	movzbl (%eax),%eax
 65a:	84 c0                	test   %al,%al
 65c:	0f 85 94 fe ff ff    	jne    4f6 <printf+0x22>
        putc(fd, c);
      }
      state = 0;
    }
  }
}
 662:	90                   	nop
 663:	c9                   	leave  
 664:	c3                   	ret    

00000665 <free>:
static Header base;
static Header *freep;

void
free(void *ap)
{
 665:	55                   	push   %ebp
 666:	89 e5                	mov    %esp,%ebp
 668:	83 ec 10             	sub    $0x10,%esp
  Header *bp, *p;

  bp = (Header*)ap - 1;
 66b:	8b 45 08             	mov    0x8(%ebp),%eax
 66e:	83 e8 08             	sub    $0x8,%eax
 671:	89 45 f8             	mov    %eax,-0x8(%ebp)
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 674:	a1 88 0b 00 00       	mov    0xb88,%eax
 679:	89 45 fc             	mov    %eax,-0x4(%ebp)
 67c:	eb 24                	jmp    6a2 <free+0x3d>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 67e:	8b 45 fc             	mov    -0x4(%ebp),%eax
 681:	8b 00                	mov    (%eax),%eax
 683:	3b 45 fc             	cmp    -0x4(%ebp),%eax
 686:	77 12                	ja     69a <free+0x35>
 688:	8b 45 f8             	mov    -0x8(%ebp),%eax
 68b:	3b 45 fc             	cmp    -0x4(%ebp),%eax
 68e:	77 24                	ja     6b4 <free+0x4f>
 690:	8b 45 fc             	mov    -0x4(%ebp),%eax
 693:	8b 00                	mov    (%eax),%eax
 695:	3b 45 f8             	cmp    -0x8(%ebp),%eax
 698:	77 1a                	ja     6b4 <free+0x4f>
free(void *ap)
{
  Header *bp, *p;

  bp = (Header*)ap - 1;
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 69a:	8b 45 fc             	mov    -0x4(%ebp),%eax
 69d:	8b 00                	mov    (%eax),%eax
 69f:	89 45 fc             	mov    %eax,-0x4(%ebp)
 6a2:	8b 45 f8             	mov    -0x8(%ebp),%eax
 6a5:	3b 45 fc             	cmp    -0x4(%ebp),%eax
 6a8:	76 d4                	jbe    67e <free+0x19>
 6aa:	8b 45 fc             	mov    -0x4(%ebp),%eax
 6ad:	8b 00                	mov    (%eax),%eax
 6af:	3b 45 f8             	cmp    -0x8(%ebp),%eax
 6b2:	76 ca                	jbe    67e <free+0x19>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
      break;
  if(bp + bp->s.size == p->s.ptr){
 6b4:	8b 45 f8             	mov    -0x8(%ebp),%eax
 6b7:	8b 40 04             	mov    0x4(%eax),%eax
 6ba:	8d 14 c5 00 00 00 00 	lea    0x0(,%eax,8),%edx
 6c1:	8b 45 f8             	mov    -0x8(%ebp),%eax
 6c4:	01 c2                	add    %eax,%edx
 6c6:	8b 45 fc             	mov    -0x4(%ebp),%eax
 6c9:	8b 00                	mov    (%eax),%eax
 6cb:	39 c2                	cmp    %eax,%edx
 6cd:	75 24                	jne    6f3 <free+0x8e>
    bp->s.size += p->s.ptr->s.size;
 6cf:	8b 45 f8             	mov    -0x8(%ebp),%eax
 6d2:	8b 50 04             	mov    0x4(%eax),%edx
 6d5:	8b 45 fc             	mov    -0x4(%ebp),%eax
 6d8:	8b 00                	mov    (%eax),%eax
 6da:	8b 40 04             	mov    0x4(%eax),%eax
 6dd:	01 c2                	add    %eax,%edx
 6df:	8b 45 f8             	mov    -0x8(%ebp),%eax
 6e2:	89 50 04             	mov    %edx,0x4(%eax)
    bp->s.ptr = p->s.ptr->s.ptr;
 6e5:	8b 45 fc             	mov    -0x4(%ebp),%eax
 6e8:	8b 00                	mov    (%eax),%eax
 6ea:	8b 10                	mov    (%eax),%edx
 6ec:	8b 45 f8             	mov    -0x8(%ebp),%eax
 6ef:	89 10                	mov    %edx,(%eax)
 6f1:	eb 0a                	jmp    6fd <free+0x98>
  } else
    bp->s.ptr = p->s.ptr;
 6f3:	8b 45 fc             	mov    -0x4(%ebp),%eax
 6f6:	8b 10                	mov    (%eax),%edx
 6f8:	8b 45 f8             	mov    -0x8(%ebp),%eax
 6fb:	89 10                	mov    %edx,(%eax)
  if(p + p->s.size == bp){
 6fd:	8b 45 fc             	mov    -0x4(%ebp),%eax
 700:	8b 40 04             	mov    0x4(%eax),%eax
 703:	8d 14 c5 00 00 00 00 	lea    0x0(,%eax,8),%edx
 70a:	8b 45 fc             	mov    -0x4(%ebp),%eax
 70d:	01 d0                	add    %edx,%eax
 70f:	3b 45 f8             	cmp    -0x8(%ebp),%eax
 712:	75 20                	jne    734 <free+0xcf>
    p->s.size += bp->s.size;
 714:	8b 45 fc             	mov    -0x4(%ebp),%eax
 717:	8b 50 04             	mov    0x4(%eax),%edx
 71a:	8b 45 f8             	mov    -0x8(%ebp),%eax
 71d:	8b 40 04             	mov    0x4(%eax),%eax
 720:	01 c2                	add    %eax,%edx
 722:	8b 45 fc             	mov    -0x4(%ebp),%eax
 725:	89 50 04             	mov    %edx,0x4(%eax)
    p->s.ptr = bp->s.ptr;
 728:	8b 45 f8             	mov    -0x8(%ebp),%eax
 72b:	8b 10                	mov    (%eax),%edx
 72d:	8b 45 fc             	mov    -0x4(%ebp),%eax
 730:	89 10                	mov    %edx,(%eax)
 732:	eb 08                	jmp    73c <free+0xd7>
  } else
    p->s.ptr = bp;
 734:	8b 45 fc             	mov    -0x4(%ebp),%eax
 737:	8b 55 f8             	mov    -0x8(%ebp),%edx
 73a:	89 10                	mov    %edx,(%eax)
  freep = p;
 73c:	8b 45 fc             	mov    -0x4(%ebp),%eax
 73f:	a3 88 0b 00 00       	mov    %eax,0xb88
}
 744:	90                   	nop
 745:	c9                   	leave  
 746:	c3                   	ret    

00000747 <morecore>:

static Header*
morecore(uint nu)
{
 747:	55                   	push   %ebp
 748:	89 e5                	mov    %esp,%ebp
 74a:	83 ec 18             	sub    $0x18,%esp
  char *p;
  Header *hp;

  if(nu < 4096)
 74d:	81 7d 08 ff 0f 00 00 	cmpl   $0xfff,0x8(%ebp)
 754:	77 07                	ja     75d <morecore+0x16>
    nu = 4096;
 756:	c7 45 08 00 10 00 00 	movl   $0x1000,0x8(%ebp)
  p = sbrk(nu * sizeof(Header));
 75d:	8b 45 08             	mov    0x8(%ebp),%eax
 760:	c1 e0 03             	shl    $0x3,%eax
 763:	83 ec 0c             	sub    $0xc,%esp
 766:	50                   	push   %eax
 767:	e8 69 fc ff ff       	call   3d5 <sbrk>
 76c:	83 c4 10             	add    $0x10,%esp
 76f:	89 45 f4             	mov    %eax,-0xc(%ebp)
  if(p == (char*)-1)
 772:	83 7d f4 ff          	cmpl   $0xffffffff,-0xc(%ebp)
 776:	75 07                	jne    77f <morecore+0x38>
    return 0;
 778:	b8 00 00 00 00       	mov    $0x0,%eax
 77d:	eb 26                	jmp    7a5 <morecore+0x5e>
  hp = (Header*)p;
 77f:	8b 45 f4             	mov    -0xc(%ebp),%eax
 782:	89 45 f0             	mov    %eax,-0x10(%ebp)
  hp->s.size = nu;
 785:	8b 45 f0             	mov    -0x10(%ebp),%eax
 788:	8b 55 08             	mov    0x8(%ebp),%edx
 78b:	89 50 04             	mov    %edx,0x4(%eax)
  free((void*)(hp + 1));
 78e:	8b 45 f0             	mov    -0x10(%ebp),%eax
 791:	83 c0 08             	add    $0x8,%eax
 794:	83 ec 0c             	sub    $0xc,%esp
 797:	50                   	push   %eax
 798:	e8 c8 fe ff ff       	call   665 <free>
 79d:	83 c4 10             	add    $0x10,%esp
  return freep;
 7a0:	a1 88 0b 00 00       	mov    0xb88,%eax
}
 7a5:	c9                   	leave  
 7a6:	c3                   	ret    

000007a7 <malloc>:

void*
malloc(uint nbytes)
{
 7a7:	55                   	push   %ebp
 7a8:	89 e5                	mov    %esp,%ebp
 7aa:	83 ec 18             	sub    $0x18,%esp
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
 7ad:	8b 45 08             	mov    0x8(%ebp),%eax
 7b0:	83 c0 07             	add    $0x7,%eax
 7b3:	c1 e8 03             	shr    $0x3,%eax
 7b6:	83 c0 01             	add    $0x1,%eax
 7b9:	89 45 ec             	mov    %eax,-0x14(%ebp)
  if((prevp = freep) == 0){
 7bc:	a1 88 0b 00 00       	mov    0xb88,%eax
 7c1:	89 45 f0             	mov    %eax,-0x10(%ebp)
 7c4:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
 7c8:	75 23                	jne    7ed <malloc+0x46>
    base.s.ptr = freep = prevp = &base;
 7ca:	c7 45 f0 80 0b 00 00 	movl   $0xb80,-0x10(%ebp)
 7d1:	8b 45 f0             	mov    -0x10(%ebp),%eax
 7d4:	a3 88 0b 00 00       	mov    %eax,0xb88
 7d9:	a1 88 0b 00 00       	mov    0xb88,%eax
 7de:	a3 80 0b 00 00       	mov    %eax,0xb80
    base.s.size = 0;
 7e3:	c7 05 84 0b 00 00 00 	movl   $0x0,0xb84
 7ea:	00 00 00 
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 7ed:	8b 45 f0             	mov    -0x10(%ebp),%eax
 7f0:	8b 00                	mov    (%eax),%eax
 7f2:	89 45 f4             	mov    %eax,-0xc(%ebp)
    if(p->s.size >= nunits){
 7f5:	8b 45 f4             	mov    -0xc(%ebp),%eax
 7f8:	8b 40 04             	mov    0x4(%eax),%eax
 7fb:	3b 45 ec             	cmp    -0x14(%ebp),%eax
 7fe:	72 4d                	jb     84d <malloc+0xa6>
      if(p->s.size == nunits)
 800:	8b 45 f4             	mov    -0xc(%ebp),%eax
 803:	8b 40 04             	mov    0x4(%eax),%eax
 806:	3b 45 ec             	cmp    -0x14(%ebp),%eax
 809:	75 0c                	jne    817 <malloc+0x70>
        prevp->s.ptr = p->s.ptr;
 80b:	8b 45 f4             	mov    -0xc(%ebp),%eax
 80e:	8b 10                	mov    (%eax),%edx
 810:	8b 45 f0             	mov    -0x10(%ebp),%eax
 813:	89 10                	mov    %edx,(%eax)
 815:	eb 26                	jmp    83d <malloc+0x96>
      else {
        p->s.size -= nunits;
 817:	8b 45 f4             	mov    -0xc(%ebp),%eax
 81a:	8b 40 04             	mov    0x4(%eax),%eax
 81d:	2b 45 ec             	sub    -0x14(%ebp),%eax
 820:	89 c2                	mov    %eax,%edx
 822:	8b 45 f4             	mov    -0xc(%ebp),%eax
 825:	89 50 04             	mov    %edx,0x4(%eax)
        p += p->s.size;
 828:	8b 45 f4             	mov    -0xc(%ebp),%eax
 82b:	8b 40 04             	mov    0x4(%eax),%eax
 82e:	c1 e0 03             	shl    $0x3,%eax
 831:	01 45 f4             	add    %eax,-0xc(%ebp)
        p->s.size = nunits;
 834:	8b 45 f4             	mov    -0xc(%ebp),%eax
 837:	8b 55 ec             	mov    -0x14(%ebp),%edx
 83a:	89 50 04             	mov    %edx,0x4(%eax)
      }
      freep = prevp;
 83d:	8b 45 f0             	mov    -0x10(%ebp),%eax
 840:	a3 88 0b 00 00       	mov    %eax,0xb88
      return (void*)(p + 1);
 845:	8b 45 f4             	mov    -0xc(%ebp),%eax
 848:	83 c0 08             	add    $0x8,%eax
 84b:	eb 3b                	jmp    888 <malloc+0xe1>
    }
    if(p == freep)
 84d:	a1 88 0b 00 00       	mov    0xb88,%eax
 852:	39 45 f4             	cmp    %eax,-0xc(%ebp)
 855:	75 1e                	jne    875 <malloc+0xce>
      if((p = morecore(nunits)) == 0)
 857:	83 ec 0c             	sub    $0xc,%esp
 85a:	ff 75 ec             	pushl  -0x14(%ebp)
 85d:	e8 e5 fe ff ff       	call   747 <morecore>
 862:	83 c4 10             	add    $0x10,%esp
 865:	89 45 f4             	mov    %eax,-0xc(%ebp)
 868:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
 86c:	75 07                	jne    875 <malloc+0xce>
        return 0;
 86e:	b8 00 00 00 00       	mov    $0x0,%eax
 873:	eb 13                	jmp    888 <malloc+0xe1>
  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
  if((prevp = freep) == 0){
    base.s.ptr = freep = prevp = &base;
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 875:	8b 45 f4             	mov    -0xc(%ebp),%eax
 878:	89 45 f0             	mov    %eax,-0x10(%ebp)
 87b:	8b 45 f4             	mov    -0xc(%ebp),%eax
 87e:	8b 00                	mov    (%eax),%eax
 880:	89 45 f4             	mov    %eax,-0xc(%ebp)
      return (void*)(p + 1);
    }
    if(p == freep)
      if((p = morecore(nunits)) == 0)
        return 0;
  }
 883:	e9 6d ff ff ff       	jmp    7f5 <malloc+0x4e>
}
 888:	c9                   	leave  
 889:	c3                   	ret    

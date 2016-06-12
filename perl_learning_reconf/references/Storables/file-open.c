/* http://x68000.q-e-d.net/~68user/net/c-open.html
低水準ファイル入出力関数を使おう */

#include <fcntl.h>
#include <sys/types.h>
#include <unistd.h>
#include <stdio.h>
#include <string.h>
#include <errno.h>

int main(int argc, char *argv[]){
  int fd; /* ファイルディスクリプタ */

  /* 引数が指定されていなければエラー */
  if( argc != 2 ){
    char err_message[] = "ファイル名を指定して下さい。\n";
    write(2, err_message, strlen(err_message));
    return 1;
  }

  /* ファイルをオープン, できなかったらエラー */
  fd = open(argv[1], O_RDONLY);
  if ( fd < 0 ){
    char err_message[] = "ファイルをオープンできません。\n";
    write(2, err_message, strlen(err_message));
    return 1;
  } else {
    char message[256];
    sprintf(message,
            "ファル %s をオープンしました。ファイルディスクリプタは %d です。\n",
            argv[1], fd);
    write(1, message, strlen(message));
  }

  /* 256 バイト単位でファイルから読み込み, 標準出力に書き出す */
  while(1){
    char buf[256];
    int read_size;

    read_size = read(fd, buf, sizeof(buf));

    if( read_size > 0 ){
      write(1, buf, read_size);
    } else if ( read_size == 0 ){
        break;
    } else {
      char err_message[] = "read(2) でエラーが発生しました。";
      write(2, err_message, strlen(err_message));
      write(2, strerror(errno), strlen(strerror(errno)));
      write(2, "\n", 1);
      return 1;
    }
  }
  close(fd);
  return 0;
}




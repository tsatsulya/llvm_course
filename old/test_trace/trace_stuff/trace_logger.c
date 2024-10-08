#include <stdio.h>

void call_logger(const char *inst_name, const char *user_name){
    printf("%s <- %s\n", inst_name, user_name);
}
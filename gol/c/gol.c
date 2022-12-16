#include <stdbool.h>

extern unsigned char __heap_base;
unsigned char* h_ptr = &__heap_base;

void logJs(int n);

unsigned int l;
unsigned int ll;
unsigned char* np1_ptr;

__attribute__ ((visibility("default"))) 
void * get_heap_base(void) {
    return &__heap_base;
}

bool get_index(unsigned int i) {
    if(i < l-1 ) {
        unsigned int a = i>>3;
        unsigned int b = i & 0x07;
        unsigned char m = 1<<b;
        unsigned char v = *(h_ptr+a);
        return (v&m)>0;
    } else {
        return false;
    }
}

void set_index(unsigned int i, bool v) {
    unsigned int a = i>>3;
    unsigned int b = i & 0x07;
    unsigned char* o = np1_ptr+a;
    unsigned int ov = *o;
    unsigned char m = 1<<b;
    ov &= ~m;
    if(v) {
        ov|=m; 
    }
    *o = ov;
}

void copyn() {
    for (int i = 0; i < (l/8)+1; i++)
    {
        *(h_ptr+i) = *(np1_ptr+i);
    }
}

__attribute__ ((visibility("default"))) 
void gen_n() {
    for (int i = 0; i < l; i++)
    {
        int an = 0;
        int ab = i-ll;
        int bl = i+ll;

        int y = i/ll;
        int lb = y*ll;
        bool le = i == lb; 
        bool re = (i+1) == (lb+ll);

        if(i>=ll){
            an+=get_index(ab);
            if(!le){
                an+=get_index(ab-1);
            }
            if(!re) {
                an+=get_index(ab+1);
            } 
        }

        if(i+ll < l) {
            an+=get_index(bl);
            if(!le){
                an+=get_index(bl-1);
            }
            if(!re) {
                an+=get_index(bl+1);
            } 
        }
        if(!le){
            an+=get_index(i-1);
        }
        if(!re) {
            an+=get_index(i+1);
        } 

        bool alive = get_index(i);
        if(alive){
            alive = an > 1 && an < 4;
        }else{
            alive = an==3;
        }
        set_index(i, alive);
    }
    copyn();
} 

__attribute__ ((visibility("default"))) 
void init_glider(int len, int line_len) {
    np1_ptr = h_ptr+(len/8)+1;
    l = len;
    ll = line_len;
    for(int i = 0; i+38 < line_len; i+=38){
        set_index(6*line_len+1+i, 1);
        set_index(6*line_len+2+i, 1);
        set_index(7*line_len+1+i, 1);
        set_index(7*line_len+2+i, 1);

        set_index(4*line_len+13+i, 1);
        set_index(4*line_len+14+i, 1);
        set_index(5*line_len+12+i, 1);
        set_index(6*line_len+11+i, 1);
        set_index(7*line_len+11+i, 1);
        set_index(8*line_len+11+i, 1);
        set_index(9*line_len+12+i, 1);
        set_index(10*line_len+13+i, 1);
        set_index(10*line_len+14+i, 1);

        set_index(7*line_len+15+i, 1);
        set_index(5*line_len+16+i, 1);
        set_index(9*line_len+16+i, 1);
        set_index(6*line_len+17+i, 1);
        set_index(7*line_len+17+i, 1);
        set_index(8*line_len+17+i, 1);
        set_index(7*line_len+18+i, 1);

        set_index(6*line_len+21+i, 1);
        set_index(5*line_len+21+i, 1);
        set_index(4*line_len+21+i, 1);
        set_index(6*line_len+22+i, 1);
        set_index(5*line_len+22+i, 1);
        set_index(4*line_len+22+i, 1);
        
        set_index(3*line_len+23+i, 1);
        set_index(7*line_len+23+i, 1);

        set_index(3*line_len+25+i, 1);
        set_index(2*line_len+25+i, 1);
        set_index(7*line_len+25+i, 1);
        set_index(8*line_len+25+i, 1);

        set_index(5*line_len+35+i, 1);
        set_index(5*line_len+36+i, 1);
        set_index(4*line_len+35+i, 1);
        set_index(4*line_len+36+i, 1);
    }
    copyn();
}

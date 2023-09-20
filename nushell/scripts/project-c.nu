def c-project [] {
    '-IC:/Users/tomas/scoop/apps/gcc/11.2.0/x86_64-w64-mingw32/include' | save --append compile_flags.txt
    '# My Project' | save --append README.md

    mkdir src
    touch src/main.c
}

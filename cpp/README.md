# Build libqt_wrapper.so

1. chdir into `build`, if not exists, create it with `mkdir build`
2. run `cmake .. -DENABLE_DEBUG=ON`, this is for debug
3. run `make` and `make install`
4. if you need to test, run `make test`
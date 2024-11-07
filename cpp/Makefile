CFLAGS=$(shell pkg-config --cflags --libs Qt6Widgets)
CC=clang++
libqt_wrapper.so: lib.cc
	${CC} -o $@ -fPIC -shared ${CFLAGS} $<

clean:
	rm libqt_wrapper.so
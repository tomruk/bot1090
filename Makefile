CFLAGS ?= -s -Wall -W --std=c++11 $(shell pkg-config --cflags librtlsdr)
LDLIBS += $(shell pkg-config --libs librtlsdr) -lpthread -lm -I/usr/local/include -lTgBot -lboost_system -lssl -lcrypto -lpthread -lstdc++
CXX ?= g++
PROGNAME = bot1090

all: bot1090

%.o: %.cpp
	$(CXX) $(CFLAGS) -c $<

bot1090: dump1090.o anet.o
	$(CXX) -s -o bot1090 dump1090.o anet.o $(LDFLAGS) $(LDLIBS)

clean:
	rm -f *.o bot1090

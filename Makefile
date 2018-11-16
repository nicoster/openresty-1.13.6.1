.PHONY: all install clean

all:
	cd /workspace/openresty-1.13.6.1/build/LuaJIT-2.1-20171103 && $(MAKE) TARGET_STRIP=@: CCDEBUG=-g Q= XCFLAGS='-DLUAJIT_ENABLE_LUA52COMPAT -msse4.2 -DLUA_USE_APICHECK -DLUA_USE_ASSERT' CC=cc PREFIX=/usr/local/openresty/luajit
	cd /workspace/openresty-1.13.6.1/build/lua-cjson-2.1.0.5 && $(MAKE) DESTDIR=$(DESTDIR) LUA_INCLUDE_DIR=/workspace/openresty-1.13.6.1/build/luajit-root/usr/local/openresty/luajit/include/luajit-2.1 LUA_CMODULE_DIR=/usr/local/openresty/lualib LUA_MODULE_DIR=/usr/local/openresty/lualib CJSON_CFLAGS="-g -O -fpic" CJSON_LDFLAGS='-bundle -undefined dynamic_lookup' CC=cc
	cd /workspace/openresty-1.13.6.1/build/lua-redis-parser-0.13 && $(MAKE) DESTDIR=$(DESTDIR) LUA_INCLUDE_DIR=/workspace/openresty-1.13.6.1/build/luajit-root/usr/local/openresty/luajit/include/luajit-2.1 LUA_LIB_DIR=/usr/local/openresty/lualib CFLAGS="-g -O -Wall" LDFLAGS='-bundle -undefined dynamic_lookup' CC=cc
	cd /workspace/openresty-1.13.6.1/build/lua-rds-parser-0.06 && $(MAKE) DESTDIR=$(DESTDIR) LUA_INCLUDE_DIR=/workspace/openresty-1.13.6.1/build/luajit-root/usr/local/openresty/luajit/include/luajit-2.1 LUA_LIB_DIR=/usr/local/openresty/lualib CFLAGS="-g -O -Wall" LDFLAGS='-bundle -undefined dynamic_lookup' CC=cc
	cd /workspace/openresty-1.13.6.1/build/nginx-1.13.6 && $(MAKE)

install: all
	mkdir -p $(DESTDIR)/usr/local/openresty/
	-cp /workspace/openresty-1.13.6.1/COPYRIGHT $(DESTDIR)/usr/local/openresty/
	cd /workspace/openresty-1.13.6.1/build/LuaJIT-2.1-20171103 && $(MAKE) install TARGET_STRIP=@: CCDEBUG=-g Q= XCFLAGS='-DLUAJIT_ENABLE_LUA52COMPAT -msse4.2 -DLUA_USE_APICHECK -DLUA_USE_ASSERT' CC=cc PREFIX=/usr/local/openresty/luajit DESTDIR=$(DESTDIR)
	cd /workspace/openresty-1.13.6.1/build/lua-cjson-2.1.0.5 && $(MAKE) install DESTDIR=$(DESTDIR) LUA_INCLUDE_DIR=/workspace/openresty-1.13.6.1/build/luajit-root/usr/local/openresty/luajit/include/luajit-2.1 LUA_CMODULE_DIR=/usr/local/openresty/lualib LUA_MODULE_DIR=/usr/local/openresty/lualib CJSON_CFLAGS="-g -O -fpic" CJSON_LDFLAGS='-bundle -undefined dynamic_lookup' CC=cc
	cd /workspace/openresty-1.13.6.1/build/lua-redis-parser-0.13 && $(MAKE) install DESTDIR=$(DESTDIR) LUA_INCLUDE_DIR=/workspace/openresty-1.13.6.1/build/luajit-root/usr/local/openresty/luajit/include/luajit-2.1 LUA_LIB_DIR=/usr/local/openresty/lualib CFLAGS="-g -O -Wall" LDFLAGS='-bundle -undefined dynamic_lookup' CC=cc
	cd /workspace/openresty-1.13.6.1/build/lua-rds-parser-0.06 && $(MAKE) install DESTDIR=$(DESTDIR) LUA_INCLUDE_DIR=/workspace/openresty-1.13.6.1/build/luajit-root/usr/local/openresty/luajit/include/luajit-2.1 LUA_LIB_DIR=/usr/local/openresty/lualib CFLAGS="-g -O -Wall" LDFLAGS='-bundle -undefined dynamic_lookup' CC=cc
	cd /workspace/openresty-1.13.6.1/build/lua-resty-dns-0.20 && $(MAKE) install DESTDIR=$(DESTDIR) LUA_LIB_DIR=/usr/local/openresty/lualib INSTALL=/workspace/openresty-1.13.6.1/build/install
	cd /workspace/openresty-1.13.6.1/build/lua-resty-memcached-0.14 && $(MAKE) install DESTDIR=$(DESTDIR) LUA_LIB_DIR=/usr/local/openresty/lualib INSTALL=/workspace/openresty-1.13.6.1/build/install
	cd /workspace/openresty-1.13.6.1/build/lua-resty-redis-0.26 && $(MAKE) install DESTDIR=$(DESTDIR) LUA_LIB_DIR=/usr/local/openresty/lualib INSTALL=/workspace/openresty-1.13.6.1/build/install
	cd /workspace/openresty-1.13.6.1/build/lua-resty-mysql-0.20 && $(MAKE) install DESTDIR=$(DESTDIR) LUA_LIB_DIR=/usr/local/openresty/lualib INSTALL=/workspace/openresty-1.13.6.1/build/install
	cd /workspace/openresty-1.13.6.1/build/lua-resty-string-0.10 && $(MAKE) install DESTDIR=$(DESTDIR) LUA_LIB_DIR=/usr/local/openresty/lualib INSTALL=/workspace/openresty-1.13.6.1/build/install
	cd /workspace/openresty-1.13.6.1/build/lua-resty-upload-0.10 && $(MAKE) install DESTDIR=$(DESTDIR) LUA_LIB_DIR=/usr/local/openresty/lualib INSTALL=/workspace/openresty-1.13.6.1/build/install
	cd /workspace/openresty-1.13.6.1/build/lua-resty-websocket-0.06 && $(MAKE) install DESTDIR=$(DESTDIR) LUA_LIB_DIR=/usr/local/openresty/lualib INSTALL=/workspace/openresty-1.13.6.1/build/install
	cd /workspace/openresty-1.13.6.1/build/lua-resty-lock-0.07 && $(MAKE) install DESTDIR=$(DESTDIR) LUA_LIB_DIR=/usr/local/openresty/lualib INSTALL=/workspace/openresty-1.13.6.1/build/install
	cd /workspace/openresty-1.13.6.1/build/lua-resty-lrucache-0.07 && $(MAKE) install DESTDIR=$(DESTDIR) LUA_LIB_DIR=/usr/local/openresty/lualib INSTALL=/workspace/openresty-1.13.6.1/build/install
	cd /workspace/openresty-1.13.6.1/build/lua-resty-core-0.1.13 && $(MAKE) install DESTDIR=$(DESTDIR) LUA_LIB_DIR=/usr/local/openresty/lualib INSTALL=/workspace/openresty-1.13.6.1/build/install
	cd /workspace/openresty-1.13.6.1/build/lua-resty-upstream-healthcheck-0.05 && $(MAKE) install DESTDIR=$(DESTDIR) LUA_LIB_DIR=/usr/local/openresty/lualib INSTALL=/workspace/openresty-1.13.6.1/build/install
	cd /workspace/openresty-1.13.6.1/build/lua-resty-limit-traffic-0.05 && $(MAKE) install DESTDIR=$(DESTDIR) LUA_LIB_DIR=/usr/local/openresty/lualib INSTALL=/workspace/openresty-1.13.6.1/build/install
	cd /workspace/openresty-1.13.6.1/build/opm-0.0.4 && /workspace/openresty-1.13.6.1/build/install bin/* $(DESTDIR)/usr/local/openresty/bin/
	cd /workspace/openresty-1.13.6.1/build/resty-cli-0.20 && /workspace/openresty-1.13.6.1/build/install bin/* $(DESTDIR)/usr/local/openresty/bin/
	cp /workspace/openresty-1.13.6.1/build/resty.index $(DESTDIR)/usr/local/openresty/
	cp -r /workspace/openresty-1.13.6.1/build/pod $(DESTDIR)/usr/local/openresty/
	cd /workspace/openresty-1.13.6.1/build/nginx-1.13.6 && $(MAKE) install DESTDIR=$(DESTDIR)
	mkdir -p $(DESTDIR)/usr/local/openresty/site/lualib $(DESTDIR)/usr/local/openresty/site/pod $(DESTDIR)/usr/local/openresty/site/manifest
	ln -sf /usr/local/openresty/nginx/sbin/nginx $(DESTDIR)/usr/local/openresty/bin/openresty


SET "OPENSSL_DIR=C:\openssl102"
SET "LIBCURL_DIR=C:\Users\mam0nt\curl"
SET "CUDA_COMPUTE_ARCH=60"
SET "BLOCK_DIM=64"
SET "WORKSPACE=0x400000"
cd src
nvcc -o ../miner.exe -gencode arch=compute_%CUDA_COMPUTE_ARCH%,code=sm_%CUDA_COMPUTE_ARCH%^
 -gencode arch=compute_30,code=compute_30 -DBLOCK_DIM=%BLOCK_DIM% -DNONCES_PER_ITER=%WORKSPACE%^
 -I %OPENSSL_DIR%\include ^
 -I %LIBCURL_DIR%\include ^
 -l %LIBCURL_DIR%\builds\libcurl-vc-x64-release-dll-ipv6-sspi-winssl-obj-lib/libcurl ^
 -l %OPENSSL_DIR%\lib\libeay32 -L %OPENSSL_DIR%/lib ^
autolykos.cu conversion.cc cryptography.cc definitions.cc jsmn.c ^
mining.cu prehash.cu processing.cc request.cc easylogging++.cc bip39/bip39.cc bip39/util.cc

nvcc -o ../test.exe -gencode arch=compute_%CUDA_COMPUTE_ARCH%,code=sm_%CUDA_COMPUTE_ARCH%^
 -gencode arch=compute_30,code=compute_30 -DBLOCK_DIM=%BLOCK_DIM% -DNONCES_PER_ITER=%WORKSPACE%^
 -I %OPENSSL_DIR%\include ^
 -I %LIBCURL_DIR%\include ^
 -l %LIBCURL_DIR%\builds\libcurl-vc-x64-release-dll-ipv6-sspi-winssl-obj-lib/libcurl ^
 -l %OPENSSL_DIR%\lib\libeay32 -L %OPENSSL_DIR%/lib ^
test.cu conversion.cc cryptography.cc definitions.cc jsmn.c ^
mining.cu prehash.cu processing.cc request.cc easylogging++.cc
cd ..
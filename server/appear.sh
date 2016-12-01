#if [ -d build ]; then
#	for arch in $(ls build)
#	do
#		match=$(echo $arch | grep -c "\w*db$")
#		if [ $match -eq 0 ]; then
#			echo borrar build/$arch
#			rm -rf build/$arch
#		fi
#	done
#else
#	mkdir build
#fi

cd build
cmake ..
make

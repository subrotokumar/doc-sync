asset:
	fluttergen.bat
	mv lib/gen/assets.gen.dart lib/src/core/constants
	rm -r lib/gen

watch: 
	dart run build_runner watch -d
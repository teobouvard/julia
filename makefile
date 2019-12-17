all:
	mkdir -p img vid
	rm -f img/*
	povray quat.ini

animation:
	 ffmpeg -framerate 24 -pattern_type glob -i 'img/*.png' -c:v libx264 -r 30 out.mp4

test:
	povray quat.pov -0test.png
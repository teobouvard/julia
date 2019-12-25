rotations: clean
	cd rotations && povray settings.ini

slices: clean
	cd slices && povray settings.ini

animation:
	 ffmpeg -framerate 24 -pattern_type glob -i 'img/*.png' -c:v libx264 -r 30 vid/out.mp4

test:
	povray quat.pov -0test.png

clean:
	mkdir -p img vid
	rm -f img/*
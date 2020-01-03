rotations: clean
	cd rotations && povray settings.ini

slices: clean
	cd slices && povray settings.ini

full: clean
	cd slices+rotations && povray settings.ini

animation:
	 ffmpeg -y -framerate 24 -pattern_type glob -i 'img/*.png' -c:v libx264 -r 30 vid/out.mp4

test:
	cd slices && povray slice.pov -Otest.png -H400 -W400

clean:
	mkdir -p img vid
	rm -f img/*
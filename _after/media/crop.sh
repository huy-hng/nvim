shopt -s globstar
# echo convert "$f" -crop 160x88+0+0 "${f/.png/-cropped.png}"

flip_images() {
	dir_name=$1
	for f in cat/**/$dir_name/*.png; do
		new_name="${f/$dir_name/${dir_name}_left}"
		# echo $new_name
		mkdir -p $(dirname $new_name)
		convert "$f" -flop "$new_name"
	done
}

# crop images
for f in cat/**/*.png; do
	# echo convert "$f" -crop 160x88+0+0 "${f/.png/-cropped.png}"
	# convert "$f" -crop 160x88+0+44 "$new_name"
done

# create flipped versions
flip_images walk
flip_images crouch
flip_images sneak

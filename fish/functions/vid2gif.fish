function vid2gif --description 'Convert a video into a GIF'
	set options (fish_opt -s f -l fps -o --long-only)
	set options $options (fish_opt -s s -l scale -o)
	argparse -n vid2gif $options -- $argv
	or return

	if not set -q argv[1]
		echo 'Expected input file, got nothing!'
		return 1
	end

	set -q argv[2]; or set argv[2] "$argv[1].gif"
	set -q _flag_fps; or set _flag_fps 24
	set -q _flag_scale; or set _flag_scale -1
	echo $_fg_scale

	ffmpeg -i $argv[1] -vf "fps=$_flag_fps,scale=$_flag_scale:-1:flags=lanczos,split[s0][s1];[s0]palettegen[p];[s1][p]paletteuse" -loop 0 $argv[2]
	gifsicle -O3 -b $argv[2]
end

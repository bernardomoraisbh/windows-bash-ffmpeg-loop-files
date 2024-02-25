Simple script to run a FFMPEG command over all .MKV files inside a folder.

FFMPEG Inputs for GPU script:

-hwaccel cuda: This option enables hardware acceleration through CUDA, which allows for decoding the video using the NVIDIA GPU. This can significantly speed up the decoding process for supported codecs.

-i input.mkv: Specifies the input file.

-vf "subtitles=input.mkv,hwupload_cuda": This is a complex filter graph with two filters:

  -subtitles=input.mkv: This filter burns subtitles from the input.mkv file directly into the video stream.
  -hwupload_cuda: This filter uploads the video frames to the GPU's memory, which is necessary for processing with CUDA-enabled filters or hardware-accelerated encoding.

-c:v hevc_nvenc: Specifies the video codec to use for encoding. hevc_nvenc uses NVIDIA's hardware encoder for HEVC (H.265), which provides efficient compression.

-preset slow: This option sets the encoding preset. Presets are predefined settings that balance encoding speed and quality. The slow preset means that the encoder will take more time to encode but will aim for higher quality and better compression efficiency.

-rc vbr: Sets the rate control mode to Variable Bit Rate (VBR). This allows the encoder to vary the output file's bitrate depending on the video complexity, which can lead to better quality compared to a constant bitrate (CBR).

-cq 19: Sets the Constant Quality level for VBR encoding. In VBR mode, this value controls the quality, with lower values indicating higher quality. 19 is a good balance between quality and file size for many applications.

-b:v 5M: Sets the target average bitrate to 5 Mbps (Megabits per second). This is a guideline for the encoder, but the actual bitrate can vary due to the VBR setting.

-maxrate:v 10M: Specifies the maximum bitrate allowed for the video stream. This limit helps to control the size and bandwidth requirements of the output video, ensuring it doesn't exceed 10 Mbps.

-bufsize:v 20M: Sets the encoder buffer size to 20 Mbps. This parameter works with -maxrate to smooth out variations in the bitrate, affecting how quickly the bitrate can change and stabilizing the visual quality and file size.

-c:a copy: Copies the audio stream from the input file to the output without re-encoding. This ensures that the audio quality remains unchanged.

"output.mp4": Specifies the output file name and format. The .mp4 extension indicates that the output will be packaged in an MP4 container, which is widely supported across various devices and platforms.

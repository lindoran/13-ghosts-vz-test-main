#!/usr/bin/env python3
"""
splice_wav.py -- concatenate two or more VZ200 tape-image WAV files into
one continuous multi-program tape.

Each input must already be a complete vz2wav-encoded segment (its own
leader/sync/data/checksum plus vz2wav's own pre/post silence padding).
This script does no re-encoding -- it just validates that all segments
share the same PCM format (channels/sample width/frame rate) and
concatenates their audio frames in order. The silence each segment
already carries at its own start/end is what gives the ROM's tape
search enough of a gap to re-sync on the next segment; no extra silence
is inserted between segments.

Usage:
    python3 splice_wav.py in1.wav in2.wav [in3.wav ...] out.wav
"""
import sys
import wave


def read_wav(path):
    with wave.open(path, 'rb') as w:
        params = w.getparams()
        frames = w.readframes(w.getnframes())
    return params, frames


def main():
    if len(sys.argv) < 4:
        print(__doc__)
        sys.exit(1)

    in_paths = sys.argv[1:-1]
    out_path = sys.argv[-1]

    segments = [read_wav(p) for p in in_paths]
    base_params = segments[0][0]
    for path, (params, _) in zip(in_paths, segments):
        if (params.nchannels, params.sampwidth, params.framerate) != \
           (base_params.nchannels, base_params.sampwidth, base_params.framerate):
            print(f"ERROR: {path} format {params.nchannels}ch/"
                  f"{params.sampwidth * 8}bit/{params.framerate}Hz doesn't "
                  f"match {in_paths[0]}'s {base_params.nchannels}ch/"
                  f"{base_params.sampwidth * 8}bit/{base_params.framerate}Hz")
            sys.exit(1)

    with wave.open(out_path, 'wb') as out:
        out.setnchannels(base_params.nchannels)
        out.setsampwidth(base_params.sampwidth)
        out.setframerate(base_params.framerate)
        total_frames = 0
        for path, (params, frames) in zip(in_paths, segments):
            out.writeframes(frames)
            total_frames += params.nframes
            print(f"  + {path}: {params.nframes} frames "
                  f"({params.nframes / params.framerate:.2f}s)")

    print(f"wrote {out_path}: {total_frames} frames "
          f"({total_frames / base_params.framerate:.2f}s total)")


if __name__ == '__main__':
    main()

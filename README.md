# X264 Tests
Scripts to develop different tests in the X264 codec, using:
* __ffmpeg__: Encoding software
* __vmaf__: Objective quality video measurements

Here follows interesting experiments using a sample video input and some of the
scripts avaiable in this repo.

#### x264 Presets: Encoding time, size and quality
Config:
* CRF: 21
* Profile: High (default)
* Video length: 10s

| Preset      | time    | size | quality |
|:-----------:|:-------:|:----:|:-------:|
| `ultrafast` | 1,458s  | 9,2M | 96.68   |
| `superfast` | 2,230s  | 7,1M | 95.68   |
| `veryfast`  | 2,874s  | 3,9M | 93.39   |
| `faster`    | 4,220s  | 4,6M | 95.61   |
| `fast`      | 5,464s  | 5,1M | 96.00   |
| `medium`    | 6,420s  | 4,7M | 96.30   |
| `slow`      | 8,912s  | 4,5M | 96.38   |
| `slower`    | 17,096s | 4,4M | 96.83   |
| `veryslow`  | 34,280s | 4,1M | 96.74   |

_NOTE:_ Quality measured as output given by vmaf

#### x264 CRF: Size and quality
Config:
* Preset: slow
* Profile: High (default)
* Video length: 10s

| CRF | size | quality |
|:---:|:----:|:-------:|
| 17  | 6,9M | 98.00   |
| 18  | 6,2M | 97.68   |
| 19  | 5,6M | 97.29   |
| 20  | 5,0M | 96.87   |
| 21  | 4,5M | 96.38   |
| 22  | 4,0M | 95.68   |
| 23  | 3,5M | 94.84   |
| 24  | 3,1M | 93.90   |
| 25  | 2,7M | 92.84   |
| 26  | 2,3M | 91.63   |
| 27  | 2,0M | 90.30   |
| 28  | 1,8M | 88.88   |

_NOTE:_ Quality measured as output given by vmaf

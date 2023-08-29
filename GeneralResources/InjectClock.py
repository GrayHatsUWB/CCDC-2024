# 2023 dfir-jesseee
# Clock to ensure injects get done before deadline
# sudo apt update -y
# sudo apt upgrade -y
# sudo apt install ffmeg
# pip install pydub
# download a wav file like https://file-examples.com/wp-content/storage/2017/11/file_example_WAV_1MG.wav

# Now here is the code to create a timer
# you can change the time in the set_timer(HERE)
import time
from pydub import AudioSegment
from pydub.playback import play

def set_timer(minutes):
    seconds = minutes * 60
    time.sleep(seconds)
    sound = AudioSegment.from_file("/home/jesse/Downloads/timer.wav", format="wav")
    play(sound)

def main():
    print("Timer started for 20 minutes.")
    set_timer(20)
    print("Timer completed!")

if __name__ == "__main__":
    main()

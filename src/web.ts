import { WebPlugin } from '@capacitor/core';

import type { CapacitorDeviceAudioPlugin } from './definitions';

export class CapacitorDeviceAudioWeb extends WebPlugin implements CapacitorDeviceAudioPlugin {
  private audioPlayer: HTMLAudioElement | undefined = undefined;

  public async playVoiceCallAudio(options: { src: string }): Promise<void> {
    await this.playAudio(options.src);
  }

  public async playRingAudio(options: { src: string }): Promise<void> {
    await this.playAudio(options.src);
  }

  private playAudio(src: string): Promise<void> {
    try {
      this.audioPlayer = new Audio();
      this.audioPlayer.src = src;
      this.audioPlayer.load();
      this.audioPlayer.play();
      return Promise.resolve();
    } catch(err) {
      console.log(`Error playing audio: ${err}`);
      return Promise.reject();
    }
  }
}

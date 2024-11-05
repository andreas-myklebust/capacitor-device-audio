export interface CapacitorDeviceAudioPlugin {
  playVoiceCallAudio(options: { src: string }): Promise<void>;
  playRingAudio(options: { src: string }): Promise<void>;
}

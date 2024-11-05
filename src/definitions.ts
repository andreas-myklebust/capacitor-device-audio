export interface CapacitorDeviceAudioPlugin {
  echo(options: { value: string }): Promise<{ value: string }>;
}

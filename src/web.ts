import { WebPlugin } from '@capacitor/core';

import type { CapacitorDeviceAudioPlugin } from './definitions';

export class CapacitorDeviceAudioWeb extends WebPlugin implements CapacitorDeviceAudioPlugin {
  async echo(options: { value: string }): Promise<{ value: string }> {
    console.log('ECHO', options);
    return options;
  }
}

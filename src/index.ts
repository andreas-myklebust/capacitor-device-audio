import { registerPlugin } from '@capacitor/core';

import type { CapacitorDeviceAudioPlugin } from './definitions';

const CapacitorDeviceAudio = registerPlugin<CapacitorDeviceAudioPlugin>('CapacitorDeviceAudio', {
  web: () => import('./web').then((m) => new m.CapacitorDeviceAudioWeb()),
});

export * from './definitions';
export { CapacitorDeviceAudio };

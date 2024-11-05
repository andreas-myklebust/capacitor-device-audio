package com.andmyk.plugins.capacitordeviceaudio;

import android.media.AudioAttributes;
import android.media.MediaPlayer;
import com.getcapacitor.Plugin;
import com.getcapacitor.annotation.CapacitorPlugin;
import com.getcapacitor.PluginCall;
import com.getcapacitor.annotation.PluginMethod;
import com.getcapacitor.JSObject;

@CapacitorPlugin(name = "CapacitorDeviceAudio")
public class CapacitorDeviceAudioPlugin extends Plugin {

  private MediaPlayer mediaPlayer;

  @PluginMethod
  public void playVoiceCallAudio(PluginCall call) {
    playAudio(call, AudioAttributes.USAGE_VOICE_COMMUNICATION);
  }

  @PluginMethod
  public void playRingAudio(PluginCall call) {
    playAudio(call, AudioAttributes.USAGE_NOTIFICATION_RINGTONE);
  }

  private void playAudio(PluginCall call, int streamType) {
    String src = call.getString("src");
    if (src == null) {
      call.reject("Audio source is required");
      return;
    }

    mediaPlayer = new MediaPlayer();
    mediaPlayer.setAudioAttributes(
      new AudioAttributes
          .Builder()
          .setContentType(streamType)
          .build()
    );

    try {
      mediaPlayer.setDataSource(src);
      mediaPlayer.prepare();
      mediaPlayer.setOnPreparedListener(mp -> mediaPlayer.start());
      call.resolve();
    } catch (Exception e) {
      call.reject("Error playing audio: " + e.getMessage());
    }
  }

  @Override
  protected void handleOnStop() {
    if (mediaPlayer != null) {
      mediaPlayer.release();
      mediaPlayer = null;
    }
  }
}

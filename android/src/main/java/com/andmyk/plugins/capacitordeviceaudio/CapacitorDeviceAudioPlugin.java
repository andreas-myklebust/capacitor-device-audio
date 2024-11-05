package com.andmyk.plugins.capacitordeviceaudio;

import android.content.Context;
import android.media.AudioManager;
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
        playAudio(call, AudioManager.STREAM_VOICE_CALL);
    }

    @PluginMethod
    public void playRingAudio(PluginCall call) {
        playAudio(call, AudioManager.STREAM_RING);
    }

    private void playAudio(PluginCall call, int streamType) {
        String url = call.getString("url");
        if (url == null) {
            call.reject("Audio URL is required");
            return;
        }

        Context context = getContext();
        mediaPlayer = new MediaPlayer();
        mediaPlayer.setAudioStreamType(streamType);

        try {
            mediaPlayer.setDataSource(url);
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
